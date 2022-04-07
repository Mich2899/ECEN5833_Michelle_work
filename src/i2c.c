/*
 * i2c.c
 *
 *  Created on: Sep 14, 2021
 *      Author: Dhruv
 *      Brief : Contains the I2C initialization and communication functions to
 *              get Temperature data from the Si7021 on-board sensor.
 */


#include "i2c.h"
#define INCLUDE_LOG_DEBUG 1
#include "src/log.h"


#define TMP117_I2CADDR    0x48
#define TMP117_EEPROM_UL  0x04
#define TMP117_TEMP       0x00
#define TMP117_CONFIG     0x01

#define TMP117_SD         0x620
#define TMP117_SD_MSB     ((TMP117_SD & 0xFF00) >> 8)
#define TMP117_SD_LSB     (TMP117_SD & 0xFF)

#define TMP117_OS         0xE20
#define TMP117_OS_MSB     ((TMP117_OS & 0xFF00) >> 8)
#define TMP117_OS_LSB     (TMP117_OS & 0xFF)

I2CSPM_Init_TypeDef init;
I2C_TransferSeq_TypeDef TransferSeq;

/* Transfer Data for TMP117*/
uint8_t SD_DataBuffer[3] = {TMP117_CONFIG, TMP117_SD_MSB, TMP117_SD_LSB};
uint8_t OS_DataBuffer[3] = {TMP117_CONFIG, TMP117_OS_MSB, TMP117_OS_LSB};
uint8_t TP_DataBuffer[3] = {TMP117_TEMP, 0, 0};
uint8_t rx_Temp[2];

void I2CInit()
{

  init.port       = I2C0;
  init.sclPort    = gpioPortC;
  init.sclPin     = 10;
  init.sdaPort    = gpioPortC;
  init.sdaPin     = 11;
  init.portLocationScl = 14;
  init.portLocationSda = 16;
  init.i2cRefFreq = 0;
  init.i2cMaxFreq = I2C_FREQ_STANDARD_MAX;
  init.i2cClhr    = i2cClockHLRStandard;

  I2CSPM_Init(&init);
}

uint8_t I2CTransferInitWrapper(uint8_t address, uint8_t* Data, uint8_t ReadWrite, uint8_t DataLen,
                               uint8_t ReadLen)
{
  I2C_TransferReturn_TypeDef I2CTransferReturn;

  /* Fill the transfer sequence structure */
  TransferSeq.addr    = (address << 1);
  TransferSeq.flags   = ReadWrite;

  TransferSeq.buf[0].data  = Data;
  TransferSeq.buf[0].len   = DataLen;

  if(ReadWrite == I2C_FLAG_WRITE_READ)
    {
      TransferSeq.buf[1].data  = &Data[1];
      TransferSeq.buf[1].len   = ReadLen;
    }

  NVIC_EnableIRQ(I2C0_IRQn);

  /* Initialize a transfer */
  I2CTransferReturn = I2C_TransferInit(I2C0, &TransferSeq);

  /* LOG an error if transfer failed */
  if(I2CTransferReturn < 0)
    {
      LOG_ERROR("I2C_TransferInit Failed. Error = %d\n\r", I2CTransferReturn);
      return 1;
    }

  return 0;
}

void setShutdownModeTMP117()
{
  /* Send the Shutdown mode command and check for error */
  uint8_t ret_status = I2CTransferInitWrapper(TMP117_I2CADDR, &SD_DataBuffer[0], I2C_FLAG_WRITE,
                                              sizeof(SD_DataBuffer)/sizeof(uint8_t), 0);
  if(ret_status)
      return;
}

void setOneShotModeTMP117()
{
  /* Set the One-Shot Mode and wait for 125ms conversion time */
  uint8_t ret_status = I2CTransferInitWrapper(TMP117_I2CADDR, &OS_DataBuffer[0], I2C_FLAG_WRITE,
                                              sizeof(OS_DataBuffer)/sizeof(uint8_t), 0);
  if(ret_status)
      return;
}

void getTemperatureTMP117()
{
  /* Read the Temperature register, 1 byte to write, 2 bytes to read */
  uint8_t ret_status = I2CTransferInitWrapper(TMP117_I2CADDR, &TP_DataBuffer[0], I2C_FLAG_WRITE_READ,
                                              1, 2);
  if(ret_status)
      return;
}

void reportTemperatureTMP117()
{
  int Calc_Temp;
  uint16_t Read_Temp;

  /* Arrange MSB and LSB into Read_Temp variable */
  Read_Temp = ((TP_DataBuffer[1] << 8) | TP_DataBuffer[2]);

  /* Convert received value to degrees Celsius and log */
  /*TODO: Placeholder conversion code, will not work below
          1C or above 255C and is an integer*/

  Calc_Temp = Read_Temp/0x80;
  LOG_INFO("Temperature = %dC\n\r", Calc_Temp);
}
