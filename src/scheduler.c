/*
 * scheduler.c
 *
 *  Created on: Sep 14, 2021
 *      Author: Dhruv
 *      Brief : Contains the scheduler to handle events such as scheduling a temperature
 *              sensor acquisition from the Si7021 sensor every 3 seconds.
 */

#include "scheduler.h"

enum States{CONFIG, WAIT_SD, START_CONV, WAIT_OS_I2C, MEASURE, REPORT,
            CONFIG_ADDR_BNO, DOUBLE_CHECK_BNO055, WAIT_10MS, SET_MODE_BNO055, RESET_BNO055, WAIT_1S, LOOP_CHECK_BNO055, WAIT_10MS_LOOP, WAIT_50MS, BNO055_NPOWER, WAIT_10MS_NPOWER, BNO055_CLEARPAGE, BNO055_TRIG_STATE, WAIT_1S_READXYZ, BNO055_OPRMODE, BNO055_READXYZ, WAIT_500MS_READRPY, BNO055_READRPY, ERROR};
enum Events{evtNone, evtLETIMER0_UF, evtLETIMER0_COMP1, evtI2C0_Complete};

enum Events currentevt = evtNone;
enum States currentste = CONFIG_ADDR_BNO;

/*Transfer Data for BNO055*/
uint8_t BNO055_DEVICE_CHECK[2] = {BNO055_CHIP_ID_ADDR,0};
uint8_t BNO055_SET_MODE[2] = {BNO055_OPR_MODE_ADDR,OPERATION_MODE_CONFIG};
uint8_t BNO055_RESET[2] = {BNO055_SYS_TRIGGER_ADDR, 0x20};
uint8_t BNO055_NORMAL_POWER[2] = {BNO055_PWR_MODE_ADDR, POWER_MODE_NORMAL};
uint8_t BNO055_CLEAR_PAGE[2] = {BNO055_PAGE_ID_ADDR,0};
uint8_t BNO055_TRIG[2] = {BNO055_SYS_TRIGGER_ADDR, 0x0};
uint8_t BNO055_OPR_MODE[2] = {BNO055_OPR_MODE_ADDR ,OPERATION_MODE_NDOF};
uint8_t BNO055_READ_XYZ[7] = {BNO055_EULER_H_LSB_ADDR, 0, 0, 0, 0, 0, 0};
uint8_t BNO055_READ_RPY[2] = {BNO055_CALIB_STAT_ADDR,0};

void getVector();
void getCalibration();
void getfinalValues();

bool check_bno(){
  if(BNO055_DEVICE_CHECK[1] != BNO055_ID)
    return false;
  else
    return true;
}
uint32_t getNextEvent()
{
  uint32_t evt;

  /* Get the current event status */
  evt = currentevt;

  /* Clear the current event */
  CORE_CRITICAL_SECTION(currentevt = evtNone;);

  return evt;
}

void app_process_action()
{
  int boot=0, flag=0;
  uint32_t evt;
  I2C_TransferReturn_TypeDef I2CTransferReturnStatus;
  uint8_t ret_status;

  /* Get the next event */
  evt = getNextEvent();

  /* Event handling */
  switch(currentste)
  {
//    /* CONFIG State, Set the Conversion Mode to Shutdown Mode (SD) */
//    case CONFIG:
//          currentste = WAIT_SD;
//          sl_power_manager_add_em_requirement(SL_POWER_MANAGER_EM1);
//          setShutdownModeTMP117();
//      /* Go to sleep */
//      break;
//
//    /* WAIT State, Wait till I2C Transfer is complete and go back to low-power */
//    case WAIT_SD:
//      if(evt == evtI2C0_Complete)
//        {
//          /* Disable IRQ on successful transfer */
//          I2CTransferReturnStatus = getI2CTransferReturn();
//          if(I2CTransferReturnStatus == i2cTransferDone)
//            NVIC_DisableIRQ(I2C0_IRQn);
//
//          currentste = START_CONV;
//          sl_power_manager_remove_em_requirement(SL_POWER_MANAGER_EM1);
//        }
//      break;
//
//    /* START Conversion State, check if UF event has occurred, Set the Conversion
//     * Mode to One-Shot Mode (OS) */
//    case START_CONV:
//      if(evt == evtLETIMER0_UF)
//        {
//          currentste = WAIT_OS_I2C;
//          sl_power_manager_add_em_requirement(SL_POWER_MANAGER_EM1);
//          setOneShotModeTMP117();
//        }
//      break;
//
//      /* WAIT State, Wait till I2C Transfer is complete and start timer for conversion */
//      case WAIT_OS_I2C:
//        if(evt == evtI2C0_Complete)
//          {
//            /* Disable IRQ on successful transfer */
//            I2CTransferReturnStatus = getI2CTransferReturn();
//            if(I2CTransferReturnStatus == i2cTransferDone)
//              NVIC_DisableIRQ(I2C0_IRQn);
//
//            currentste = MEASURE;
//            sl_power_manager_remove_em_requirement(SL_POWER_MANAGER_EM1);
//            timerWaitUs_irq(125*1000);
//          }
//        break;
//
//      /* WAIT State, Wait till conversion complete and go back to low-power */
//      case MEASURE:
//        if(evt == evtLETIMER0_COMP1)
//          {
//            currentste = REPORT;
//            sl_power_manager_add_em_requirement(SL_POWER_MANAGER_EM1);
//            getTemperatureTMP117();
//          }
//        break;
//
//      /* REPORT State, Wait till I2C Transfer is complete and log the temperature */
//      case REPORT:
//        if(evt == evtI2C0_Complete)
//          {
//            I2CTransferReturnStatus = getI2CTransferReturn();
//            if(I2CTransferReturnStatus == i2cTransferDone)
//              NVIC_DisableIRQ(I2C0_IRQn);
//
//            sl_power_manager_remove_em_requirement(SL_POWER_MANAGER_EM1);
//
//            currentste = START_CONV;
//            reportTemperatureTMP117();
//          }
//        break;

    /*Set in configuration mode by sending device address*/
      case CONFIG_ADDR_BNO:
              if(evt == evtLETIMER0_UF){
                  currentste = DOUBLE_CHECK_BNO055;
                  //printf("CONFIG_ADDR_BNO\n\r");
                  //sl_power_manager_add_em_requirement(SL_POWER_MANAGER_EM1);

                  /********************************Make sure you have right device***********************************/
                    ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_DEVICE_CHECK[0], I2C_FLAG_WRITE_READ,
                                                                1, 1);
                    if(ret_status)
                        return;
              }
        break;

     /*Keep checking until the device responds to the correct address*/
      case DOUBLE_CHECK_BNO055:
              if(evt == evtI2C0_Complete){
                  //printf("DOUBLE_CHECK_BNO055\n\r");
                  /* Disable IRQ on successful transfer */
                  I2CTransferReturnStatus = getI2CTransferReturn();
                  if(I2CTransferReturnStatus == i2cTransferDone)
                    NVIC_DisableIRQ(I2C0_IRQn);

                  bool check=check_bno();
                  if(check==false && boot==1){
                    currentste = ERROR;
                  }
                  else if(check==false &&boot==0){
                    boot++;
                    currentste = WAIT_10MS;
                    timerWaitUs_irq(10000);
                  }
                  else{

                      currentste=SET_MODE_BNO055;
                      /*******************************Switch to config mode*********************************************/
                      /* Send the Shutdown mode command and check for error */
                      ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_SET_MODE[0], I2C_FLAG_WRITE,
                                                                  sizeof(BNO055_SET_MODE)/sizeof(uint8_t), 0);
                      if(ret_status)
                          return;
                  }

              }

        break;

      /*10ms wait between each check*/
      case WAIT_10MS:
                  if(evt == evtLETIMER0_COMP1){
                      currentste = DOUBLE_CHECK_BNO055;
                       //printf("WAIT_10MS\n\r");
                       //sl_power_manager_add_em_requirement(SL_POWER_MANAGER_EM1);

                       /********************************Make sure you have right device***********************************/
                         ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_DEVICE_CHECK[0], I2C_FLAG_WRITE_READ,
                                                                     1, 1);
                         if(ret_status)
                             return;
                  }
        break;

      /*set command sent, check for next command*/
      case SET_MODE_BNO055:
              if(evt == evtI2C0_Complete){
                  currentste=RESET_BNO055;
                  //printf("SET_MODE_BNO055\n\r");
                  /* Disable IRQ on successful transfer */
                  I2CTransferReturnStatus = getI2CTransferReturn();
                  if(I2CTransferReturnStatus == i2cTransferDone)
                    NVIC_DisableIRQ(I2C0_IRQn);

                  /* Send the reset cmd*/
                  ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_RESET[0], I2C_FLAG_WRITE,
                                                              sizeof(BNO055_RESET)/sizeof(uint8_t), 0);
                  if(ret_status)
                      return;
              }
        break;

      /*reset command sent, wait for 1.5seconds*/
      case RESET_BNO055:
                if(evt == evtI2C0_Complete){
                    currentste=WAIT_1S;
                    //printf("RESET_BNO055\n\r");
                    /* Disable IRQ on successful transfer */
                    I2CTransferReturnStatus = getI2CTransferReturn();
                    if(I2CTransferReturnStatus == i2cTransferDone)
                      NVIC_DisableIRQ(I2C0_IRQn);

                    timerWaitUs_irq((1500)*1000);
                }

        break;

      /*send a device check*/
      case WAIT_1S:
                  if(evt == evtLETIMER0_COMP1){
                      currentste=LOOP_CHECK_BNO055;
                      //printf("WAIT_1S\n\r");
                  /*******CHECK FOR DEVICE ID***************/
                  ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_DEVICE_CHECK[0], I2C_FLAG_WRITE_READ,
                                                                     1, 1);
                   if(ret_status)
                       return;
                  }
        break;

      /*keep checking in a loop until receive a correct(0x00) response*/
      case LOOP_CHECK_BNO055:
                  if(evt == evtI2C0_Complete){
                      //printf("LOOP_CHECK_BNO055\n\r");
                      /* Disable IRQ on successful transfer */
                      I2CTransferReturnStatus = getI2CTransferReturn();
                      if(I2CTransferReturnStatus == i2cTransferDone)
                        NVIC_DisableIRQ(I2C0_IRQn);

                      if(check_bno()==false){
                          currentste=WAIT_10MS_LOOP;
                          timerWaitUs_irq(10000);
                      }
                      else{
                          currentste=WAIT_50MS;
                          timerWaitUs_irq(50000);
                      }
                  }
        break;

      /*wait 10ms between each check*/
      case WAIT_10MS_LOOP:
                  if(evt == evtLETIMER0_COMP1){
                      currentste=LOOP_CHECK_BNO055;
                      //printf("WAIT_10MS_LOOP\n\r");
                  }
        break;

      /*wait 50ms before sending power setting command*/
      case WAIT_50MS:
                 if(evt == evtLETIMER0_COMP1){
                       currentste=BNO055_NPOWER;
                       //printf("WAIT_50MS\n\r");
                      /* Send the normal power mode command */
                        ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_NORMAL_POWER[0], I2C_FLAG_WRITE,
                                                                    sizeof(BNO055_NORMAL_POWER)/sizeof(uint8_t), 0);
                        if(ret_status)
                            return;
                  }
        break;


      /*power set command sent, wait for 10ms*/
      case BNO055_NPOWER:
                    if(evt == evtI2C0_Complete){

                        currentste = WAIT_10MS_NPOWER;
                        //printf("BNO055_NPOWER\n\r");
                        /* Disable IRQ on successful transfer */
                        I2CTransferReturnStatus = getI2CTransferReturn();
                        if(I2CTransferReturnStatus == i2cTransferDone)
                          NVIC_DisableIRQ(I2C0_IRQn);

                        timerWaitUs_irq(10000);

                    }
        break;

      /*send a clear page command*/
      case WAIT_10MS_NPOWER:
                    if(evt == evtLETIMER0_COMP1){

                        currentste=BNO055_CLEARPAGE;
                        //printf("WAIT_10MS_NPOWER\n\r");
                        /* Send the clear page command*/
                          ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_CLEAR_PAGE[0], I2C_FLAG_WRITE,
                                                                      sizeof(BNO055_CLEAR_PAGE)/sizeof(uint8_t), 0);
                          if(ret_status)
                              return;
                    }
        break;

      /*send a trig command*/
      case BNO055_CLEARPAGE:

                    if(evt == evtI2C0_Complete){

                        currentste=BNO055_TRIG_STATE;
                        //printf("BNO055_CLEARPAGE\n\r");
                        /* Disable IRQ on successful transfer */
                        I2CTransferReturnStatus = getI2CTransferReturn();
                        if(I2CTransferReturnStatus == i2cTransferDone)
                          NVIC_DisableIRQ(I2C0_IRQn);

                        /* Send the trig command*/
                          ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_TRIG[0], I2C_FLAG_WRITE,
                                                                      sizeof(BNO055_TRIG)/sizeof(uint8_t), 0);
                          if(ret_status)
                              return;
                    }
        break;

      /*trig command sent, now send a command to set the operating mode*/
      case BNO055_TRIG_STATE:
                    if(evt == evtI2C0_Complete){

                        currentste=BNO055_OPRMODE;
                        //printf("BNO055_TRIG_STATE\n\r");
                        /* Disable IRQ on successful transfer */
                        I2CTransferReturnStatus = getI2CTransferReturn();
                        if(I2CTransferReturnStatus == i2cTransferDone)
                          NVIC_DisableIRQ(I2C0_IRQn);

                        /* Send the operating command*/
                          ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_OPR_MODE[0], I2C_FLAG_WRITE,
                                                                      sizeof(BNO055_OPR_MODE)/sizeof(uint8_t), 0);
                          if(ret_status)
                              return;
                    }
        break;

      /*wait for 1s for device to set the operating mode*/
      case BNO055_OPRMODE:
                    if(evt == evtI2C0_Complete){

                        currentste=WAIT_1S_READXYZ;
                        //printf("BNO055_OPRMODE\n\r");
                        /* Disable IRQ on successful transfer */
                        I2CTransferReturnStatus = getI2CTransferReturn();
                        if(I2CTransferReturnStatus == i2cTransferDone)
                          NVIC_DisableIRQ(I2C0_IRQn);

                        timerWaitUs_irq((1000)*1000);

                    }
        break;

      /*after waiting for 1 sec now send the read command for xyz data*/
      case WAIT_1S_READXYZ:

                    if(evt == evtLETIMER0_COMP1){
                        //printf("WAIT_1S_READXYZ\n\r");
                        currentste=BNO055_READXYZ;
                        /*read vector data(6 bytes)*/
                        ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_READ_XYZ[0], I2C_FLAG_WRITE_READ,
                                                                      1, 6);
                          if(ret_status)
                              return;
                    }

        break;

      /*store the xyz data and wait for 1ms before reading RPY data*/
      case BNO055_READXYZ:
                    if(evt == evtI2C0_Complete){

                        currentste=WAIT_500MS_READRPY;

                        //printf("BNO055_READXYZ\n\r");
                        /* Disable IRQ on successful transfer */
                        I2CTransferReturnStatus = getI2CTransferReturn();
                        if(I2CTransferReturnStatus == i2cTransferDone)
                          NVIC_DisableIRQ(I2C0_IRQn);

                        timerWaitUs_irq(1000);

                    }
        break;

      /*send read command for rpy data*/
      case WAIT_500MS_READRPY:
                  if(evt == evtLETIMER0_COMP1){

                      currentste = BNO055_READRPY;
                      //printf("WAIT_500MS_READRPY\n\r");
                      ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_READ_RPY[0], I2C_FLAG_WRITE_READ,
                                                                        1, 1);
                            if(ret_status)
                                return;
                  }

        break;

      /*display values, wait for 70ms before reading another set of values*/
      case BNO055_READRPY:
                    if(evt == evtI2C0_Complete){
                        currentste=WAIT_1S_READXYZ;
                        //printf("BNO055_READRPY\n\r");
                        /* Disable IRQ on successful transfer */
                        I2CTransferReturnStatus = getI2CTransferReturn();
                        if(I2CTransferReturnStatus == i2cTransferDone)
                          NVIC_DisableIRQ(I2C0_IRQn);

                        getfinalValues();
                        timerWaitUs_irq((70)*1000);
                    }
        break;

      case ERROR:
          //printf("Error state!!!\n\r");
        break;
  }

}

void schedulerSetEvent_UF()
{
  CORE_CRITICAL_SECTION(currentevt = evtLETIMER0_UF;);
}

void schedulerSetEvent_COMP1()
{
  CORE_CRITICAL_SECTION(currentevt = evtLETIMER0_COMP1;);
}

void schedulerSetEvent_I2Cdone()
{
  CORE_CRITICAL_SECTION(currentevt = evtI2C0_Complete;);
}

void getVector(){
    double arr[3];

    int16_t x,y,z;
    x=y=z=0;

//    /*read vector data(6 bytes)*/
//    uint8_t ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_READ_XYZ, I2C_FLAG_WRITE_READ,
//                                                  1, 6);
//      if(ret_status)
//          return;

      x = ((int16_t)BNO055_READ_XYZ[1]) | (((int16_t)BNO055_READ_XYZ[2]) << 8);
      y = ((int16_t)BNO055_READ_XYZ[3]) | (((int16_t)BNO055_READ_XYZ[4]) << 8);
      z = ((int16_t)BNO055_READ_XYZ[5]) | (((int16_t)BNO055_READ_XYZ[6]) << 8);

      arr[0] = ((double)x)/16.0;
      arr[1] = ((double)y)/16.0;
      arr[2] = ((double)z)/16.0;

      printf("X=%lf Y=%lf Z=%lf ",arr[0],arr[1],arr[2]);
}

void getCalibration(){
  uint8_t  gyro, accel, mag=0;


//  /*read calibration data(6 bytes)*/
//  uint8_t ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_READ_RPY[0], I2C_FLAG_WRITE_READ,
//                                                1, 1);
//    if(ret_status)
//        return;

    //system = ((BNO055_READ_RPY[1])>>6) & 0x03;
    gyro = ((BNO055_READ_RPY[1])>>4) & 0x03;
    accel = ((BNO055_READ_RPY[1])>>2) & 0x03;
    mag = BNO055_READ_RPY[1] & 0x03;

    printf("gyro=%d accel=%d mag=%d\n\r",gyro,accel,mag);
}

void getfinalValues(){
  double arr[3];

      int16_t x,y,z;
      x=y=z=0;
      uint8_t  gyro=0, accel=0, mag=0;

  //    /*read vector data(6 bytes)*/
  //    uint8_t ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_READ_XYZ, I2C_FLAG_WRITE_READ,
  //                                                  1, 6);
  //      if(ret_status)
  //          return;

        x = ((int16_t)BNO055_READ_XYZ[1]) | (((int16_t)BNO055_READ_XYZ[2]) << 8);
        y = ((int16_t)BNO055_READ_XYZ[3]) | (((int16_t)BNO055_READ_XYZ[4]) << 8);
        z = ((int16_t)BNO055_READ_XYZ[5]) | (((int16_t)BNO055_READ_XYZ[6]) << 8);

        arr[0] = ((double)x)/16.0;
        arr[1] = ((double)y)/16.0;
        arr[2] = ((double)z)/16.0;

  //  /*read calibration data(6 bytes)*/
  //  uint8_t ret_status = I2CTransferInitWrapper(BNO055_DEVICE_ADDRESS, &BNO055_READ_RPY[0], I2C_FLAG_WRITE_READ,
  //                                                1, 1);
  //    if(ret_status)
  //        return;

      //system = ((BNO055_READ_RPY[1])>>6) & 0x03;
      gyro = ((BNO055_READ_RPY[1])>>4) & 0x03;
      accel = ((BNO055_READ_RPY[1])>>2) & 0x03;
      mag = BNO055_READ_RPY[1] & 0x03;

      BNO055_READ_XYZ[1] = 0;
      BNO055_READ_XYZ[2] = 0;
      BNO055_READ_XYZ[3] = 0;
      BNO055_READ_XYZ[4] = 0;
      BNO055_READ_XYZ[5] = 0;
      BNO055_READ_XYZ[6] = 0;
      BNO055_READ_RPY[1] = 0;

      printf("X=%lf Y=%lf Z=%lf gyro=%d accel=%d mag=%d\n\r",arr[0],arr[1],arr[2], gyro,accel,mag);
}
