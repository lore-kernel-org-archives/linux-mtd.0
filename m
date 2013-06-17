Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UoU4w-0007R2-C0
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 07:42:20 +0000
Message-ID: <51BEBDAF.7000201@ti.com>
Date: Mon, 17 Jun 2013 13:11:35 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Jagan Teki <jagannadh.teki@gmail.com>
Subject: Re: [U-Boot] U-boot: Erase/read/write issue with S25fl256S flash
 device
References: <51B82388.2000909@ti.com>	<51BB29A5.3000100@ti.com>	<51BB2AE4.4020109@gmail.com>	<51BB2C2B.1010404@ti.com>	<51BC93AF.5080808@gmail.com>	<51BEA955.9080907@ti.com>	<CAD6G_RTUSPgUf0GMeXDxkmTKmjx-_YaV6TR4_kGz0Zm_2SpxQw@mail.gmail.com>	<51BEB3AB.6020603@ti.com>	<CAD6G_RQPfQrwxkYZvB+hx6YVrMSNNYKSzCEB9_8t0SYCfwKt2g@mail.gmail.com>	<51BEB69B.5010902@ti.com>	<CAD6G_RSXJ-k0ciwc8zdKwimAnLwCv=9YTv4YkmAqrREizEtDUg@mail.gmail.com>	<51BEB89A.3090105@ti.com>
 <CAD6G_RRNT5ukFovS1Spa7uMmX72kLpZ-YycfcdDdESTMHnNU9Q@mail.gmail.com>
In-Reply-To: <CAD6G_RRNT5ukFovS1Spa7uMmX72kLpZ-YycfcdDdESTMHnNU9Q@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------080401090709060101050709"
Cc: Rajendra nayak <rnayak@ti.com>, jagannadha.sutradharudu-teki@xilinx.com,
 Felipe Balbi <balbi@ti.com>, u-boot@lists.denx.de,
 linux-mtd@lists.infradead.org, Tom Rini <trini@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------080401090709060101050709
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jagan,
On Monday 17 June 2013 01:04 PM, Jagan Teki wrote:
> On Mon, Jun 17, 2013 at 12:49 PM, Sourav Poddar<sourav.poddar@ti.com>  wrote:
>> On Monday 17 June 2013 12:44 PM, Jagan Teki wrote:
>>> On Mon, Jun 17, 2013 at 12:41 PM, Sourav Poddar<sourav.poddar@ti.com>
>>> wrote:
>>>> On Monday 17 June 2013 12:35 PM, Jagan Teki wrote:
>>>>> On Mon, Jun 17, 2013 at 12:28 PM, Sourav Poddar<sourav.poddar@ti.com>
>>>>> wrote:
>>>>>> HI Jagan,
>>>>>>
>>>>>> On Monday 17 June 2013 12:17 PM, Jagan Teki wrote:
>>>>>>> Hi Sourav,
>>>>>>>
>>>>>>> On Mon, Jun 17, 2013 at 11:44 AM, Sourav Poddar<sourav.poddar@ti.com>
>>>>>>> wrote:
>>>>>>>> Hi Jagan,
>>>>>>>>
>>>>>>>> On Saturday 15 June 2013 09:47 PM, Jagan Teki wrote:
>>>>>>>>> On 14-06-2013 20:13, Sourav Poddar wrote:
>>>>>>>>>> Hi Jagan,
>>>>>>>>>> On Friday 14 June 2013 08:08 PM, Jagan Teki wrote:
>>>>>>>>>>> On 14-06-2013 20:03, Sourav Poddar wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> On Wednesday 12 June 2013 01:00 PM, Sourav Poddar wrote:
>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>
>>>>>>>>>>>>> I am working on qspi flash device S25FL256S at u-boot level. I
>>>>>>>>>>>>> am
>>>>>>>>>>>>> trying to
>>>>>>>>>>>>> make use of the existing spi_flash.c framework available at
>>>>>>>>>>>>> u-boot
>>>>>>>>>>>>> for
>>>>>>>>>>>>> erasing/reading/writing
>>>>>>>>>>>>> into the flash device.
>>>>>>>>>>>>>
>>>>>>>>>>>>> There are several issues(mentioned below), which I faced while
>>>>>>>>>>>>> using
>>>>>>>>>>>>> S25FL256s flash device
>>>>>>>>>>>>> with my dra7xx board which has a qspi controller to which the
>>>>>>>>>>>>> above
>>>>>>>>>>>>> mentioned flash device is attached.
>>>>>>>>>>>>>
>>>>>>>>>>>>> 1. Erase (spi_flash_cmd_erase)
>>>>>>>>>>>>>
>>>>>>>>>>>>> Issuing a command something like this..
>>>>>>>>>>>>>
>>>>>>>>>>>>> sf erase 0x0 0x50000
>>>>>>>>>>>>>      - erases only first 0x20000 bytes of flash device, anything
>>>>>>>>>>>>> above
>>>>>>>>>>>>> that is not erase. I need to
>>>>>>>>>>>>>        issue separate commands after 0x20000 for every 0x10000
>>>>>>>>>>>>> bytes.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Am i missing anything here?
>>>>>>>>>>>>>
>>>>>>>>>>>>> 2. read
>>>>>>>>>>>>>
>>>>>>>>>>>>> sf read 81000000 0 0x10000
>>>>>>>>>>>>>
>>>>>>>>>>>>> Read is not happening properly. The last few byte along the 4k
>>>>>>>>>>>>> boundary always shows zero.
>>>>>>>>>>>>> Above 4k bytes, read is not happening.
>>>>>>>>>>>>>
>>>>>>>>>>>>> For ex:
>>>>>>>>>>>>>      DRA752 EVM # md 81000f00
>>>>>>>>>>>>> 81000f00: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f10: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f20: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f30: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f40: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f50: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f60: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f70: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f80: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000f90: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000fa0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000fb0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000fc0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000fd0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000fe0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>>> ................
>>>>>>>>>>>>> 81000ff0: ffffffff ffffffff 00ffffff 00000000
>>>>>>>>>>>>> ................
>>>>>>>>>>>>>
>>>>>>>>>>>>> In this dump, if you see 81000ff0 the last column shows 000000
>>>>>>>>>>>>> which
>>>>>>>>>>>>> is
>>>>>>>>>>>>> not expected. and it happens along every 4k bytes.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> So, to get rid of the above issue, I switched to page read with
>>>>>>>>>>>>> the
>>>>>>>>>>>>> below patch[1],
>>>>>>>>>>>>> which is giving me the correct result.
>>>>>>>>>>>>> [1]:
>>>>>>>>>>>>> @@ -147,17 +153,40 @@ int spi_flash_read_common(struct spi_flash
>>>>>>>>>>>>> *flash, const u8 *cmd,
>>>>>>>>>>>>>      int spi_flash_cmd_read_fast(struct spi_flash *flash, u32
>>>>>>>>>>>>> offset,
>>>>>>>>>>>>>                     size_t len, void *data)
>>>>>>>>>>>>>      {
>>>>>>>>>>>>> -       u8 cmd[5];
>>>>>>>>>>>>> +       unsigned long page_addr, byte_addr, page_size;
>>>>>>>>>>>>> +       size_t chunk_len, actual;
>>>>>>>>>>>>> +       int ret = 0;
>>>>>>>>>>>>> +       u8 cmd[4];
>>>>>>>>>>>>>
>>>>>>>>>>>>>             /* Handle memory-mapped SPI */
>>>>>>>>>>>>>             if (flash->memory_map)
>>>>>>>>>>>>>                     memcpy(data, flash->memory_map + offset,
>>>>>>>>>>>>> len);
>>>>>>>>>>>>> +       page_size = flash->page_size;
>>>>>>>>>>>>> +       page_addr = offset / page_size;
>>>>>>>>>>>>> +       byte_addr = offset % page_size;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       cmd[0] = CMD_READ_ARRAY_SLOW;
>>>>>>>>>>>>> +       for (actual = 0; actual<     len; actual += chunk_len) {
>>>>>>>>>>>>> +               chunk_len = min(len - actual, page_size -
>>>>>>>>>>>>> byte_addr);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +               cmd[1] = page_addr>>     8;
>>>>>>>>>>>>> +               cmd[2] = page_addr;
>>>>>>>>>>>>> +               cmd[3] = byte_addr;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +               ret = spi_flash_read_common(flash, cmd,
>>>>>>>>>>>>> sizeof(cmd),
>>>>>>>>>>>>> data + actual, chunk_len);
>>>>>>>>>>>>> +               if (ret<     0) {
>>>>>>>>>>>>> +                       debug("SF: read failed");
>>>>>>>>>>>>> +                       break;
>>>>>>>>>>>>> +               }
>>>>>>>>>>>>>
>>>>>>>>>>>>> -       cmd[0] = CMD_READ_ARRAY_FAST;
>>>>>>>>>>>>> -       spi_flash_addr(offset, cmd);
>>>>>>>>>>>>> -       cmd[4] = 0x00;
>>>>>>>>>>>>> +               byte_addr += chunk_len;
>>>>>>>>>>>>> +               if (byte_addr == page_size) {
>>>>>>>>>>>>> +                       page_addr++;
>>>>>>>>>>>>> +                       byte_addr = 0;
>>>>>>>>>>>>> +               }
>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>
>>>>>>>>>>>>> -       return spi_flash_read_common(flash, cmd, sizeof(cmd),
>>>>>>>>>>>>> data,
>>>>>>>>>>>>> len);
>>>>>>>>>>>>> +       return ret;
>>>>>>>>>>>>>      }
>>>>>>>>>>>>>
>>>>>>>>>>>>> Any idea about this?
>>>>>>>>>>>>>
>>>>>>>>>>>>> 3.  write (spi_flash_cmd_write_multi)
>>>>>>>>>>>>>       write not happening properly.
>>>>>>>>>>>>>
>>>>>>>>>>>>> observations: only able to write single page, anything after a
>>>>>>>>>>>>> page
>>>>>>>>>>>>> is
>>>>>>>>>>>>> not getting
>>>>>>>>>>>>>             written.
>>>>>>>>>>>>> Workaround:
>>>>>>>>>>>>> I did a write disable latch at the end of every write cycle(page
>>>>>>>>>>>>> program) and enable it
>>>>>>>>>>>>> again for the next loop. With this, I see I get rid of the above
>>>>>>>>>>>>> issue.
>>>>>>>>>>>>>
>>>>>>>>>>>>>      @@ -117,6 +117,12 @@ int spi_flash_cmd_write_multi(struct
>>>>>>>>>>>>> spi_flash
>>>>>>>>>>>>> *flash, u32 offset,
>>>>>>>>>>>>>                     if (ret)
>>>>>>>>>>>>>                             break;
>>>>>>>>>>>>>
>>>>>>>>>>>>> +               ret = spi_flash_cmd_write_disable(flash);
>>>>>>>>>>>>> +               if (ret<     0) {
>>>>>>>>>>>>> +                       printf("SF: disabling write failed\n");
>>>>>>>>>>>>> +                       break;
>>>>>>>>>>>>> +               }
>>>>>>>>>>>>> +
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Have anyone seen the above mentioned issues regarding
>>>>>>>>>>>>> read/write/erase? OR is there any
>>>>>>>>>>>>> configurations that I might be missing ?
>>>>>>>>>>>>>
>>>>>>>>>>>> Any Input on this?
>>>>>>>>>>>
>>>>>>>>>>> Please wait, I am pushing some changes tonight or so.
>>>>>>>>>>>
>>>>>>>>>>> We will continue this thread, after testing your part with these
>>>>>>>>>>> new
>>>>>>>>>>> changes.
>>>>>>>>>>>
>>>>>>>>>>> I will intimate you once the push done.
>>>>>>>>>>>
>>>>>>>>>>> --
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Jagan.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>> Thanks a lot for the reply.
>>>>>>>>>> Sure, will wait for your changes to go in.
>>>>>>>>>
>>>>>>>>> Will take some time go these changes on master.
>>>>>>>>>
>>>>>>>>> Please checkout master-work branch in u-boot-spi repo
>>>>>>>>> git://git.denx.de/u-boot-spi.git
>>>>>>>>>
>>>>>>>>> and try to test 256S parts, fyi: I tested the same part got the
>>>>>>>>> +ve result.
>>>>>>>>>
>>>>>>>> Tested the above tree on my board.
>>>>>>>> But, still the issues remain the same for me in all the three
>>>>>>>> cases(erase/read/write).
>>>>>>>>
>>>>>>>> Here is the short log of the read command..
>>>>>>>> DRA752 EVM # sf probe 0
>>>>>>>> SF: Detected S25FL256S_64K with page size 64 KiB, total 32 MiB
>>>>>>>> SF: Warning - Only lower 16MiB accessible, Full access #define
>>>>>>>> CONFIG_SPI_FLASH_BAR
>>>>>>>> DRA752 EVM # sf erase 0x0 0x10000
>>>>>>>> SF: 65536 bytes @ 0x0 Erased: OK
>>>>>>>> DRA752 EVM # mw.b 0x81000100 0xff 0x10000
>>>>>>>> DRA752 EVM # sf read 0x81003000 0x0 0x10000
>>>>>>>> SF: 65536 bytes @ 0x0 Read: OK
>>>>>>>> DRA752 EVM # cmp.b 0x81003000  0x81000100  0x10000
>>>>>>>> byte at 0x81003ffb (0x0) != byte at 0x810010fb (0xff)
>>>>>>>> Total of 4091 byte(s) were the same
>>>>>>>>
>>>>>>>>
>>>>>>>> Erase: not able to do with a single command, need to issue for every
>>>>>>>> 0x10000
>>>>>>>> bytes.
>>>>>>>>
>>>>>>>> Write: Need to disable latch after every write to make it properly
>>>>>>>> work.
>>>>>>>>
>>>>>>>> Is it possible for you to  give me  basic commands which you might
>>>>>>>> have
>>>>>>>> ran
>>>>>>>> to confirm
>>>>>>>> the read/write and erase ??
>>>>>>> I tested the same part - for me i couldn't see the issues with SL256S
>>>>>>>
>>>>>>> OK! can enable the log on poll function, spi_flash_cmd_wait_ready()
>>>>>>> make debug ->     printf.
>>>>>>> Do the same test.! and send the log file.
>>>>>>>
>>>>>>> --
>>>>>>> Thanks,
>>>>>>> Jagan.
>>>>>> Here is the output log, no change..
>>>>>>
>>>>>>
>>>>>> DRA752 EVM # sf probe 0
>>>>>> SF: Detected S25FL256S_64K with page size 64 KiB, total 32 MiB
>>>>>> DRA752 EVM # sf erase 0x0 0x10000
>>>>>> SF: 65536 bytes @ 0x0 Erased: OK
>>>>>> DRA752 EVM # mw.b 0x81000100 0xff 0x10000
>>>>>> DRA752 EVM # sf read 0x81003000 0x0 0x10000
>>>>>> SF: 65536 bytes @ 0x0 Read: OK
>>>>>> DRA752 EVM # cmp.b 0x81003000  0x81000100  0x10000
>>>>>> byte at 0x81003ffb (0x0) != byte at 0x810010fb (0xff)
>>>>>> Total of 4091 byte(s) were the same
>>>>>> DRA752 EVM #
>>>>>>
>>>>>>
>>>>>> Code change: for above output.
>>>>>> --- a/drivers/mtd/spi/spi_flash.c
>>>>>> +++ b/drivers/mtd/spi/spi_flash.c
>>>>>> @@ -85,7 +85,7 @@ int spi_flash_cmd_wait_ready(struct spi_flash *flash,
>>>>>> unsigned long timeout)
>>>>>>
>>>>>>            ret = spi_xfer(spi, 8,&cmd, NULL, SPI_XFER_BEGIN);
>>>>>>
>>>>>>            if (ret) {This is still not sent out for review. I can send you the patch 
>>>>>> -               debug("SF: fail to read %s status register\n",
>>>>>> +               printf("SF: fail to read %s status register\n",
>>>>>>                            cmd == CMD_READ_STATUS ? "read" : "flag");
>>>>>>                    return ret;
>>>>>>            }
>>>>>> @@ -109,7 +109,7 @@ int spi_flash_cmd_wait_ready(struct spi_flash
>>>>>> *flash,
>>>>>> unsigned long timeout)
>>>>>>                    return 0;
>>>>>>
>>>>>>            /* Timed out */
>>>>>> -       debug("SF: time out!\n");
>>>>>> +       printf("SF: time out!\n");
>>>>>>            return -1;
>>>>>>     }
>>>>>>
>>>>> Ohh..
>>>>>
>>>>> - What if you erase the entire flash and read back, same result is it?
>>>> Yes.
>>>>
>>>>> - please send the paths for config file for this board?
>>>> include/configs/dra7xx_evm.h
>>> I couldn't find any SPI flash configs on above config file,
>>> Can you point me the relevant configurations.
>>>
>> Following are the configuration details for spi..
>> #define CONFIG_SPI_FLASH_BAR
>> #define CONFIG_TI_QSPI
> Where can i find this?
>
I have attached the required patches in the thread.
Patch 0002 is my ti qspi controller.
Patch 0004 is my workarounds done for the all the issues
mentioned in the $subject patch.
Patch 0001 and 0002 are other configs.
>> #define CONFIG_SPI_FLASH
>> #define CONFIG_SPI_FLASH_SPANSION
>> #define CONFIG_CMD_SF
>> #define CONFIG_CMD_SPI
>> #define CONFIG_SF_DEFAULT_SPEED         12000000
>> #define CONFIG_DEFAULT_SPI_MODE         SPI_MODE_3
>>
>> /* SPI SPL */
>> #define CONFIG_SPL_SPI_SUPPORT
>> #define CONFIG_SPL_SPI_LOAD
>> #define CONFIG_SPL_SPI_FLASH_SUPPORT
>> #define CONFIG_SPL_SPI_BUS              0
>> #define CONFIG_SPL_SPI_CS               0
>> #define CONFIG_SYS_SPI_U_BOOT_OFFS      0x20000
> --
> Thanks,
> Jagan.


--------------080401090709060101050709
Content-Type: text/x-diff; name="0001-omap5-add-qspi-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-omap5-add-qspi-support.patch"

>From 42584552cfe3055abebe4ac8a824fc5d527db9e2 Mon Sep 17 00:00:00 2001
From: Matt Porter <mporter@ti.com>
Date: Mon, 6 May 2013 15:31:45 -0400
Subject: [PATCH 1/5] omap5: add qspi support

Add QSPI definitions and clock configuration support.

Signed-off-by: Matt Porter <mporter@ti.com>
Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 arch/arm/cpu/armv7/omap5/hw_data.c     |    5 ++++-
 arch/arm/cpu/armv7/omap5/prcm-regs.c   |    1 +
 arch/arm/include/asm/arch-omap5/omap.h |    3 +++
 arch/arm/include/asm/arch-omap5/spl.h  |    1 +
 arch/arm/include/asm/omap_common.h     |    1 +
 5 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/arch/arm/cpu/armv7/omap5/hw_data.c b/arch/arm/cpu/armv7/omap5/hw_data.c
index 716b931..c7a27e2 100644
--- a/arch/arm/cpu/armv7/omap5/hw_data.c
+++ b/arch/arm/cpu/armv7/omap5/hw_data.c
@@ -194,7 +194,7 @@ static const struct dpll_params per_dpll_params_768mhz_dra7xx[NUM_SYS_CLKS] = {
 	{192, 12, 4, 1, 3, 4, 10, 2, -1, -1, -1, -1},		/* 26 MHz   */
 	{-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},	/* 27 MHz   */
 	{10, 0, 4, 1, 3, 4, 10, 2, -1, -1, -1, -1},		/* 38.4 MHz */
-	{96, 4, 4, 1, 3, 4, 10, 2, -1, -1, -1, -1}		/* 20 MHz   */
+	{96, 4, 4, 1, 3, 4, 4, 2, -1, -1, -1, -1}		/* 20 MHz   */
 };
 
 static const struct dpll_params iva_dpll_params_2330mhz[NUM_SYS_CLKS] = {
@@ -488,6 +488,7 @@ void enable_basic_clocks(void)
 		(*prcm)->cm_wkup_wdtimer2_clkctrl,
 		(*prcm)->cm_l4per_uart3_clkctrl,
 		(*prcm)->cm_l4per_i2c1_clkctrl,
+		(*prcm)->cm_l4per_qspi_clkctrl,
 		0
 	};
 
@@ -516,6 +517,8 @@ void enable_basic_clocks(void)
 			 clk_modules_explicit_en_essential,
 			 1);
 
+	setbits_le32((*prcm)->cm_l4per_qspi_clkctrl, (1<<24));
+
 	/* Enable SCRM OPT clocks for PER and CORE dpll */
 	setbits_le32((*prcm)->cm_wkupaon_scrm_clkctrl,
 			OPTFCLKEN_SCRM_PER_MASK);
diff --git a/arch/arm/cpu/armv7/omap5/prcm-regs.c b/arch/arm/cpu/armv7/omap5/prcm-regs.c
index 426b50f..a7aa922 100644
--- a/arch/arm/cpu/armv7/omap5/prcm-regs.c
+++ b/arch/arm/cpu/armv7/omap5/prcm-regs.c
@@ -933,6 +933,7 @@ struct prcm_regs const dra7xx_prcm = {
 	.cm_l4per_gpio8_clkctrl			= 0x4a009818,
 	.cm_l4per_mmcsd3_clkctrl		= 0x4a009820,
 	.cm_l4per_mmcsd4_clkctrl		= 0x4a009828,
+	.cm_l4per_qspi_clkctrl			= 0x4a009838,
 	.cm_l4per_uart1_clkctrl			= 0x4a009840,
 	.cm_l4per_uart2_clkctrl			= 0x4a009848,
 	.cm_l4per_uart3_clkctrl			= 0x4a009850,
diff --git a/arch/arm/include/asm/arch-omap5/omap.h b/arch/arm/include/asm/arch-omap5/omap.h
index 9ecc096..ab526ae 100644
--- a/arch/arm/include/asm/arch-omap5/omap.h
+++ b/arch/arm/include/asm/arch-omap5/omap.h
@@ -67,6 +67,9 @@
 /* GPMC */
 #define OMAP54XX_GPMC_BASE	0x50000000
 
+/* QSPI */
+#define QSPI_BASE		0x4B300000
+
 /*
  * Hardware Register Details
  */
diff --git a/arch/arm/include/asm/arch-omap5/spl.h b/arch/arm/include/asm/arch-omap5/spl.h
index d4d353c..8905cb8 100644
--- a/arch/arm/include/asm/arch-omap5/spl.h
+++ b/arch/arm/include/asm/arch-omap5/spl.h
@@ -31,6 +31,7 @@
 #define BOOT_DEVICE_MMC1        5
 #define BOOT_DEVICE_MMC2        6
 #define BOOT_DEVICE_MMC2_2	7
+#define BOOT_DEVICE_SPI		10
 
 #define MMC_BOOT_DEVICES_START	BOOT_DEVICE_MMC1
 #define MMC_BOOT_DEVICES_END	BOOT_DEVICE_MMC2_2
diff --git a/arch/arm/include/asm/omap_common.h b/arch/arm/include/asm/omap_common.h
index a678bc0..55deacb 100644
--- a/arch/arm/include/asm/omap_common.h
+++ b/arch/arm/include/asm/omap_common.h
@@ -280,6 +280,7 @@ struct prcm_regs {
 	u32 cm_l4per_mmcsd4_clkctrl;
 	u32 cm_l4per_msprohg_clkctrl;
 	u32 cm_l4per_slimbus2_clkctrl;
+	u32 cm_l4per_qspi_clkctrl;
 	u32 cm_l4per_uart1_clkctrl;
 	u32 cm_l4per_uart2_clkctrl;
 	u32 cm_l4per_uart3_clkctrl;
-- 
1.7.1


--------------080401090709060101050709
Content-Type: text/x-diff; name="0002-spi-add-TI-QSPI-driver.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0002-spi-add-TI-QSPI-driver.patch"

>From 47b503ff2d3f331010a19874a4d3e8f4bb88c604 Mon Sep 17 00:00:00 2001
From: Matt Porter <mporter@ti.com>
Date: Mon, 6 May 2013 15:32:15 -0400
Subject: [PATCH 2/5] spi: add TI QSPI driver

Adds a SPI master driver for the TI QSPI peripheral.

Signed-off-by: Matt Porter <mporter@ti.com>
Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/spi/Makefile  |    1 +
 drivers/spi/ti_qspi.c |  262 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 263 insertions(+), 0 deletions(-)
 create mode 100644 drivers/spi/ti_qspi.c

diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index d08609e..f51033d 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -54,6 +54,7 @@ COBJS-$(CONFIG_FDT_SPI) += fdt_spi.o
 COBJS-$(CONFIG_TEGRA20_SFLASH) += tegra20_sflash.o
 COBJS-$(CONFIG_TEGRA20_SLINK) += tegra20_slink.o
 COBJS-$(CONFIG_TEGRA114_SPI) += tegra114_spi.o
+COBJS-$(CONFIG_TI_QSPI) += ti_qspi.o
 COBJS-$(CONFIG_XILINX_SPI) += xilinx_spi.o
 
 COBJS	:= $(COBJS-y)
diff --git a/drivers/spi/ti_qspi.c b/drivers/spi/ti_qspi.c
new file mode 100644
index 0000000..1973b85
--- /dev/null
+++ b/drivers/spi/ti_qspi.c
@@ -0,0 +1,262 @@
+/*
+ * TI QSPI driver
+ *
+ * Copyright (C) 2013, Texas Instruments, Incorporated
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR /PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <common.h>
+#include <asm/io.h>
+#include <asm/arch/omap.h>
+#include <malloc.h>
+#include <spi.h>
+
+struct qspi_slave {
+	struct spi_slave slave;
+	unsigned int mode;
+	u32 cmd;
+	u32 dc;
+};
+
+#define to_qspi_slave(s) container_of(s, struct qspi_slave, slave)
+
+struct qspi_regs {
+	u32 pid;
+	u32 pad0[3];
+	u32 sysconfig;
+	u32 pad1[3];
+	u32 intr_status_raw_set;
+	u32 intr_status_enabled_clear;
+	u32 intr_enable_set;
+	u32 intr_enable_clear;
+	u32 intc_eoi;
+	u32 pad2[3];
+	u32 spi_clock_cntrl;
+	u32 spi_dc;
+	u32 spi_cmd;
+	u32 spi_status;
+	u32 spi_data;
+	u32 spi_setup0;
+	u32 spi_setup1;
+	u32 spi_setup2;
+	u32 spi_setup3;
+	u32 spi_switch;
+	u32 spi_data1;
+	u32 spi_data2;
+	u32 spi_data3;
+};
+
+static struct qspi_regs *qspi = (struct qspi_regs *)QSPI_BASE;
+
+#define QSPI_TIMEOUT			2000000
+
+#define QSPI_FCLK			192000000
+
+/* Clock Control */
+#define QSPI_CLK_EN			(1 << 31)
+#define QSPI_CLK_DIV_MAX		0xffff
+
+/* Command */
+#define QSPI_EN_CS(n)			(n << 28)
+#define QSPI_WLEN(n)			((n-1) << 19)
+#define QSPI_3_PIN			(1 << 18)
+#define QSPI_RD_SNGL			(1 << 16)
+#define QSPI_WR_SNGL			(2 << 16)
+#define QSPI_INVAL			(4 << 16)
+
+/* Device Control */
+#define QSPI_DD(m, n)			(m << (3 + n*8))
+#define QSPI_CKPHA(n)			(1 << (2 + n*8))
+#define QSPI_CSPOL(n)			(1 << (1 + n*8))
+#define QSPI_CKPOL(n)			(1 << (n*8))
+
+/* Status */
+#define QSPI_WC				(1 << 1)
+#define QSPI_BUSY			(1 << 0)
+#define QSPI_WC_BUSY			(QSPI_WC | QSPI_BUSY)
+#define QSPI_XFER_DONE			QSPI_WC
+
+int spi_cs_is_valid(unsigned int bus, unsigned int cs)
+{
+	return 1;
+}
+
+void spi_cs_activate(struct spi_slave *slave)
+{
+	/* CS handled in xfer */
+	return;
+}
+
+void spi_cs_deactivate(struct spi_slave *slave)
+{
+	/* CS handled in xfer */
+	return;
+}
+
+void spi_init(void)
+{
+	/* nothing to do */
+}
+
+void spi_set_speed(struct spi_slave *slave, uint hz)
+{
+	uint clk_div;
+
+	if (!hz)
+		clk_div = 0;
+	else
+		clk_div = (QSPI_FCLK / hz) - 1;
+
+	debug("%s: hz: %d, clock divider %d\n", __func__, hz, clk_div);
+
+	/* disable SCLK */
+	writel(readl(&qspi->spi_clock_cntrl) & ~QSPI_CLK_EN, &qspi->spi_clock_cntrl);
+
+	if (clk_div < 0) {
+		debug("%s: clock divider < 0, using /1 divider\n", __func__);
+		clk_div = 0;
+	}
+
+	if (clk_div > QSPI_CLK_DIV_MAX) {
+		debug("%s: clock divider >%d , using /%d divider\n",
+			__func__, QSPI_CLK_DIV_MAX, QSPI_CLK_DIV_MAX + 1);
+		clk_div = QSPI_CLK_DIV_MAX;
+	}
+
+	/* enable SCLK */
+	writel(QSPI_CLK_EN | clk_div, &qspi->spi_clock_cntrl);
+	debug("%s: spi_clock_cntrl %08x\n", __func__, readl(&qspi->spi_clock_cntrl));
+}
+
+struct spi_slave *spi_setup_slave(unsigned int bus, unsigned int cs,
+				  unsigned int max_hz, unsigned int mode)
+{
+	struct qspi_slave *qslave;
+
+	qslave = spi_alloc_slave(struct qspi_slave, bus, cs);
+	if (!qslave)
+		return NULL;
+
+	spi_set_speed(&qslave->slave, max_hz);
+	qslave->mode = mode;
+	debug("%s: bus:%i cs:%i mode:%i\n", __func__, bus, cs, mode);
+
+	return &qslave->slave;
+}
+
+void spi_free_slave(struct spi_slave *slave)
+{
+	struct qspi_slave *qslave = to_qspi_slave(slave);
+	free(qslave);
+}
+
+int spi_claim_bus(struct spi_slave *slave)
+{
+	debug("%s: bus:%i cs:%i\n", __func__, slave->bus, slave->cs);
+
+	writel(0, &qspi->spi_dc);
+	writel(0, &qspi->spi_cmd);
+	writel(0, &qspi->spi_data);
+
+	return 0;
+}
+
+void spi_release_bus(struct spi_slave *slave)
+{
+	debug("%s: bus:%i cs:%i\n", __func__, slave->bus, slave->cs);
+
+	writel(0, &qspi->spi_dc);
+	writel(0, &qspi->spi_cmd);
+	writel(0, &qspi->spi_data);
+}
+
+int spi_xfer(struct spi_slave *slave, unsigned int bitlen, const void *dout,
+	     void *din, unsigned long flags)
+{
+	struct qspi_slave *qslave = to_qspi_slave(slave);
+	uint words = bitlen >> 3; /* fixed 8-bit word length */
+	const uchar *txp = dout;
+	uchar *rxp = din;
+	uint status;
+	int timeout;
+
+	debug("%s: bus:%i cs:%i bitlen:%i words:%i flags:%lx\n", __func__,
+		slave->bus, slave->cs, bitlen, words, flags);
+	if (bitlen == 0)
+		return -1;
+
+	if (bitlen % 8) {
+		flags |= SPI_XFER_END;
+		return -1;
+	}
+
+	/* setup command reg */
+	qslave->cmd = 0;
+	qslave->cmd |= QSPI_WLEN(8);
+	qslave->cmd |= QSPI_EN_CS(slave->cs);
+	if (flags & SPI_3WIRE)
+		qslave->cmd |= QSPI_3_PIN;
+	qslave->cmd |= 0xfff;
+
+	/* setup device control reg */
+	qslave->dc = 0;
+	if (qslave->mode & SPI_CPHA)
+		qslave->dc |= QSPI_CKPHA(slave->cs);
+	if (qslave->mode & SPI_CPOL)
+		qslave->dc |= QSPI_CKPOL(slave->cs);
+	if (qslave->mode & SPI_CS_HIGH)
+		qslave->dc |= QSPI_CSPOL(slave->cs);
+
+	while (words--) {
+		if (txp) {
+			debug("tx cmd %08x dc %08x data %02x\n",
+			      qslave->cmd | QSPI_WR_SNGL, qslave->dc, *txp);
+			writel(*txp++, &qspi->spi_data);
+			writel(qslave->dc, &qspi->spi_dc);
+			writel(qslave->cmd | QSPI_WR_SNGL, &qspi->spi_cmd);
+			status = readl(&qspi->spi_status);
+			timeout = QSPI_TIMEOUT;
+			while ((status & QSPI_WC_BUSY) != QSPI_XFER_DONE) {
+				if (--timeout < 0) {
+					printf("QSPI tx timed out\n");
+					return -1;
+				}
+				status = readl(&qspi->spi_status);
+			}
+			debug("tx done, status %08x\n", status);
+		}
+		if (rxp) {
+			debug("rx cmd %08x dc %08x\n",
+			      qslave->cmd | QSPI_RD_SNGL, qslave->dc);
+			writel(qslave->dc, &qspi->spi_dc);
+			writel(qslave->cmd | QSPI_RD_SNGL, &qspi->spi_cmd);
+			status = readl(&qspi->spi_status);
+			timeout = QSPI_TIMEOUT;
+			while ((status & QSPI_WC_BUSY) != QSPI_XFER_DONE) {
+				if (--timeout < 0) {
+					printf("QSPI rx timed out\n");
+					return -1;
+				}
+				status = readl(&qspi->spi_status);
+			}
+			*rxp++ = readl(&qspi->spi_data);
+			debug("rx done, status %08x, read %02x\n",
+			      status, *(rxp-1));
+		}
+	}
+
+	/* Terminate frame */
+	if (flags & SPI_XFER_END)
+		writel(qslave->cmd | QSPI_INVAL, &qspi->spi_cmd);
+
+	return 0;
+}
-- 
1.7.1


--------------080401090709060101050709
Content-Type: text/x-diff;
	name="0003-dra7xx_evm-add-SPL-API-QSPI-and-serial-flash-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0003-dra7xx_evm-add-SPL-API-QSPI-and-serial-flash-support.pa";
	filename*1="tch"

>From 89b1ad9848df89817dc8bac7ea12a71d811921ce Mon Sep 17 00:00:00 2001
From: Matt Porter <mporter@ti.com>
Date: Mon, 6 May 2013 15:33:19 -0400
Subject: [PATCH 3/5] dra7xx_evm: add SPL API, QSPI, and serial flash support

Enables support for SPI SPL, QSPI and Spansion serial flash device
on the EVM. Configures pin muxes for QSPI mode.

Signed-off-by: Matt Porter <mporter@ti.com>
Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 board/ti/dra7xx/mux_data.h   |   10 ++++++++++
 include/configs/dra7xx_evm.h |   17 +++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/board/ti/dra7xx/mux_data.h b/board/ti/dra7xx/mux_data.h
index 5a91966..b26a9be 100644
--- a/board/ti/dra7xx/mux_data.h
+++ b/board/ti/dra7xx/mux_data.h
@@ -53,6 +53,16 @@ const struct pad_conf_entry core_padconf_array_essential[] = {
 	{UART1_RTSN, (IEN | PTU | PDIS | M3)},
 	{I2C1_SDA, (IEN | PTU | PDIS | M0)},
 	{I2C1_SCL, (IEN | PTU | PDIS | M0)},
+	{GPMC_A13, (PTU | IEN | M1)},	/* QSPI1_RTCLK */
+	{GPMC_A18, (PTU | IEN | M1)},	/* QSPI1_SCLK */
+	{GPMC_A17, (PTU | IEN | M1)},	/* QSPI1_D[0] */
+	{GPMC_A16, (PTU | IEN | M1)},	/* QSPI1_D[1] */
+	{GPMC_A15, (PTU | IEN | M1)},	/* QSPI1_D[2] */
+	{GPMC_A14, (PTU | IEN | M1)},	/* QSPI1_D[3] */
+	{GPMC_CS2, (PTU | M1)},		/* QSPI1_CS[0] */
+	{GPMC_CS3, (PTU | M1)},		/* QSPI1_CS[1] */
+	{GPMC_A3, (PTU | M1)},		/* QSPI1_CS[2] */
+	{GPMC_A4, (PTU | M1)},		/* QSPI1_CS[3] */
 };
 
 const struct pad_conf_entry core_padconf_array_non_essential[] = {
diff --git a/include/configs/dra7xx_evm.h b/include/configs/dra7xx_evm.h
index 2518352..3671e45 100644
--- a/include/configs/dra7xx_evm.h
+++ b/include/configs/dra7xx_evm.h
@@ -56,4 +56,21 @@
 
 #define EMIF1_EMIF2
 
+/* SPI */
+#define CONFIG_TI_QSPI
+#define CONFIG_SPI_FLASH
+#define CONFIG_SPI_FLASH_SPANSION
+#define CONFIG_CMD_SF
+#define CONFIG_CMD_SPI
+#define CONFIG_SF_DEFAULT_SPEED		12000000
+#define CONFIG_DEFAULT_SPI_MODE		SPI_MODE_3
+
+/* SPI SPL */
+#define CONFIG_SPL_SPI_SUPPORT
+#define CONFIG_SPL_SPI_LOAD
+#define CONFIG_SPL_SPI_FLASH_SUPPORT
+#define CONFIG_SPL_SPI_BUS		0
+#define CONFIG_SPL_SPI_CS		0
+#define CONFIG_SYS_SPI_U_BOOT_OFFS	0x20000
+
 #endif /* __CONFIG_DRA7XX_EVM_H */
-- 
1.7.1


--------------080401090709060101050709
Content-Type: text/x-diff;
	name="0004-drivers-mtd-spi-Modify-read-write-command-for-sfl256.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0004-drivers-mtd-spi-Modify-read-write-command-for-sfl256.pa";
	filename*1="tch"

>From e4139e66b956d17a9157a7b6d055e9f8c585041d Mon Sep 17 00:00:00 2001
From: Sourav Poddar <sourav.poddar@ti.com>
Date: Fri, 7 Jun 2013 17:15:36 +0530
Subject: [PATCH 4/5] drivers: mtd: spi: Modify read/write command for sfl256s flash.

Reading using the already supported read command is causing regression
even while reading 4k bytes, as a result doing a page by page read.

At the end of the write sequence, write enable latch should be disabled and
re enabled while doing the next page programming.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/mtd/spi/spi_flash.c |   39 ++++++++++++++++++++++++++++++++++-----
 1 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi/spi_flash.c b/drivers/mtd/spi/spi_flash.c
index 111185a..8c3a2cf 100644
--- a/drivers/mtd/spi/spi_flash.c
+++ b/drivers/mtd/spi/spi_flash.c
@@ -117,6 +117,12 @@ int spi_flash_cmd_write_multi(struct spi_flash *flash, u32 offset,
 		if (ret)
 			break;
 
+		ret = spi_flash_cmd_write_disable(flash);
+		if (ret < 0) {
+			printf("SF: disabling write failed\n");
+			break;
+		}
+
 		byte_addr += chunk_len;
 		if (byte_addr == page_size) {
 			page_addr++;
@@ -147,17 +153,40 @@ int spi_flash_read_common(struct spi_flash *flash, const u8 *cmd,
 int spi_flash_cmd_read_fast(struct spi_flash *flash, u32 offset,
 		size_t len, void *data)
 {
-	u8 cmd[5];
+	unsigned long page_addr, byte_addr, page_size;
+	size_t chunk_len, actual;
+	int ret = 0;
+	u8 cmd[4];
 
 	/* Handle memory-mapped SPI */
 	if (flash->memory_map)
 		memcpy(data, flash->memory_map + offset, len);
+	page_size = flash->page_size;
+	page_addr = offset / page_size;
+	byte_addr = offset % page_size;
+
+	cmd[0] = CMD_READ_ARRAY_SLOW;
+	for (actual = 0; actual < len; actual += chunk_len) {
+		chunk_len = min(len - actual, page_size - byte_addr);
+
+		cmd[1] = page_addr >> 8;
+		cmd[2] = page_addr;
+		cmd[3] = byte_addr;
+
+		ret = spi_flash_read_common(flash, cmd, sizeof(cmd), data + actual, chunk_len);
+		if (ret < 0) {
+			debug("SF: read failed");
+			break;
+		}
 
-	cmd[0] = CMD_READ_ARRAY_FAST;
-	spi_flash_addr(offset, cmd);
-	cmd[4] = 0x00;
+		byte_addr += chunk_len;
+		if (byte_addr == page_size) {
+			page_addr++;
+			byte_addr = 0;
+		}
+	}
 
-	return spi_flash_read_common(flash, cmd, sizeof(cmd), data, len);
+	return ret;
 }
 
 int spi_flash_cmd_poll_bit(struct spi_flash *flash, unsigned long timeout,
-- 
1.7.1


--------------080401090709060101050709--
