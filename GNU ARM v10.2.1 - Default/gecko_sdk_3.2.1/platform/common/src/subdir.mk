################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../gecko_sdk_3.2.1/platform/common/src/sl_slist.c \
../gecko_sdk_3.2.1/platform/common/src/sl_status.c \
../gecko_sdk_3.2.1/platform/common/src/sl_string.c 

OBJS += \
./gecko_sdk_3.2.1/platform/common/src/sl_slist.o \
./gecko_sdk_3.2.1/platform/common/src/sl_status.o \
./gecko_sdk_3.2.1/platform/common/src/sl_string.o 

C_DEPS += \
./gecko_sdk_3.2.1/platform/common/src/sl_slist.d \
./gecko_sdk_3.2.1/platform/common/src/sl_status.d \
./gecko_sdk_3.2.1/platform/common/src/sl_string.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_3.2.1/platform/common/src/sl_slist.o: ../gecko_sdk_3.2.1/platform/common/src/sl_slist.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG13P632F512GM48=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CLIENT=1' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\Device\SiliconLabs\EFR32BG13P\Include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\common\util\app_assert" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\common\util\app_log" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\common\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\protocol\bluetooth\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\board\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\bootloader" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\bootloader\api" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\CMSIS\Include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\device_init\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib\dmd" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\emlib\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib\glib" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\driver\i2cspm\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\iostream\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\src\ls013b7dh03" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\mbedtls\include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_mbedtls_support\config" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\mbedtls\library" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_alt\include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_mbedtls_support\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\inc\memlcd_usart" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\mpu\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\mx25_flash_shutdown\inc\sl_mx25_flash_shutdown_usart" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\bluetooth\common\ota_dfu" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\power_manager\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_psa_driver\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\common" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\ble" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\zwave" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\mfm" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\pa-conversions" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\pa-conversions\efr32xg1x" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\rail_util_pti" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\silicon_labs\silabs_core\memory_manager" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\common\toolchain\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\system\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\sleeptimer\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_protocol_crypto\src" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\udelay\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\autogen" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\config" -O0 -Wall -Wextra -fno-builtin -fomit-frame-pointer -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_3.2.1/platform/common/src/sl_slist.d" -MT"gecko_sdk_3.2.1/platform/common/src/sl_slist.o" -o "$@" "$<" && "C:/SiliconLabs/SimplicityStudio/v5/configuration/org.eclipse.osgi/446/0/.cp/scripts/path_fixup.sh" "gecko_sdk_3.2.1/platform/common/src/sl_slist.d"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_3.2.1/platform/common/src/sl_status.o: ../gecko_sdk_3.2.1/platform/common/src/sl_status.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG13P632F512GM48=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CLIENT=1' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\Device\SiliconLabs\EFR32BG13P\Include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\common\util\app_assert" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\common\util\app_log" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\common\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\protocol\bluetooth\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\board\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\bootloader" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\bootloader\api" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\CMSIS\Include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\device_init\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib\dmd" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\emlib\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib\glib" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\driver\i2cspm\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\iostream\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\src\ls013b7dh03" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\mbedtls\include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_mbedtls_support\config" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\mbedtls\library" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_alt\include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_mbedtls_support\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\inc\memlcd_usart" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\mpu\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\mx25_flash_shutdown\inc\sl_mx25_flash_shutdown_usart" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\bluetooth\common\ota_dfu" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\power_manager\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_psa_driver\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\common" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\ble" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\zwave" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\mfm" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\pa-conversions" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\pa-conversions\efr32xg1x" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\rail_util_pti" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\silicon_labs\silabs_core\memory_manager" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\common\toolchain\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\system\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\sleeptimer\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_protocol_crypto\src" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\udelay\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\autogen" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\config" -O0 -Wall -Wextra -fno-builtin -fomit-frame-pointer -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_3.2.1/platform/common/src/sl_status.d" -MT"gecko_sdk_3.2.1/platform/common/src/sl_status.o" -o "$@" "$<" && "C:/SiliconLabs/SimplicityStudio/v5/configuration/org.eclipse.osgi/446/0/.cp/scripts/path_fixup.sh" "gecko_sdk_3.2.1/platform/common/src/sl_status.d"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_3.2.1/platform/common/src/sl_string.o: ../gecko_sdk_3.2.1/platform/common/src/sl_string.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG13P632F512GM48=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CLIENT=1' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\Device\SiliconLabs\EFR32BG13P\Include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\common\util\app_assert" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\common\util\app_log" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\common\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\protocol\bluetooth\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\board\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\bootloader" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\bootloader\api" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\CMSIS\Include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\device_init\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib\dmd" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\emlib\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\middleware\glib\glib" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\driver\i2cspm\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\iostream\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\src\ls013b7dh03" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\mbedtls\include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_mbedtls_support\config" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\mbedtls\library" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_alt\include" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_mbedtls_support\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\memlcd\inc\memlcd_usart" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\mpu\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\hardware\driver\mx25_flash_shutdown\inc\sl_mx25_flash_shutdown_usart" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\app\bluetooth\common\ota_dfu" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\power_manager\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_psa_driver\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\common" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\ble" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\zwave" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\protocol\mfm" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\pa-conversions" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\pa-conversions\efr32xg1x" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\radio\rail_lib\plugin\rail_util_pti" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\silicon_labs\silabs_core\memory_manager" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\common\toolchain\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\system\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\sleeptimer\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\util\third_party\crypto\sl_component\sl_protocol_crypto\src" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\gecko_sdk_3.2.1\platform\service\udelay\inc" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\autogen" -I"C:\Users\mich1576\SimplicityStudio\v5_workspace\ecen5833-Smartwatch-workspace\config" -O0 -Wall -Wextra -fno-builtin -fomit-frame-pointer -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_3.2.1/platform/common/src/sl_string.d" -MT"gecko_sdk_3.2.1/platform/common/src/sl_string.o" -o "$@" "$<" && "C:/SiliconLabs/SimplicityStudio/v5/configuration/org.eclipse.osgi/446/0/.cp/scripts/path_fixup.sh" "gecko_sdk_3.2.1/platform/common/src/sl_string.d"
	@echo 'Finished building: $<'
	@echo ' '


