From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Thu, 22 Jul 2010 00:53:35 +0800
Subject: [PATCH 1/2] [MTD] nand/denali.c: fixed checkpatch errors in denali=
Message-ID: <mailman.81.1279733558.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

.c

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  806 +++++++++++++++++++++++------------------=
----
 1 files changed, 409 insertions(+), 397 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ca03428..4e255ff 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -29,15 +29,15 @@

 MODULE_LICENSE("GPL");

-/* We define a module parameter that allows the user to override
+/* We define a module parameter that allows the user to override
  * the hardware and decide what timing mode should be used.
  */
 #define NAND_DEFAULT_TIMINGS   -1

 static int onfi_timing_mode =3D NAND_DEFAULT_TIMINGS;
 module_param(onfi_timing_mode, int, S_IRUGO);
-MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting. -1 ind=
icates"
-                                       " use default timings");
+MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
+                                       "-1 indicates use default timings")=
;

 #define DENALI_NAND_NAME    "denali-nand"

@@ -54,13 +54,13 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default O=
NFI setting. -1 indicates
                        INTR_STATUS0__RST_COMP | \
                        INTR_STATUS0__ERASE_COMP)

-/* indicates whether or not the internal value for the flash bank is
+/* indicates whether or not the internal value for the flash bank is
    valid or not */
-#define CHIP_SELECT_INVALID    -1
+#define CHIP_SELECT_INVALID    -1

 #define SUPPORT_8BITECC                1

-/* This macro divides two integers and rounds fractional values up
+/* This macro divides two integers and rounds fractional values up
  * to the nearest integer value. */
 #define CEIL_DIV(X, Y) (((X)%(Y)) ? ((X)/(Y)+1) : ((X)/(Y)))

@@ -83,7 +83,7 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONF=
I setting. -1 indicates
 #define ADDR_CYCLE     1
 #define STATUS_CYCLE   2

-/* this is a helper macro that allows us to
+/* this is a helper macro that allows us to
  * format the bank into the proper bits for the controller */
 #define BANK(x) ((x) << 24)

@@ -95,59 +95,63 @@ static const struct pci_device_id denali_pci_ids[] =3D =
{
 };


-/* these are static lookup tables that give us easy access to
-   registers in the NAND controller.
+/* these are static lookup tables that give us easy access to
+   registers in the NAND controller.
  */
-static const uint32_t intr_status_addresses[4] =3D {INTR_STATUS0,
-                                                 INTR_STATUS1,
-                                                 INTR_STATUS2,
+static const uint32_t intr_status_addresses[4] =3D {INTR_STATUS0,
+                                                 INTR_STATUS1,
+                                               INTR_STATUS2,
                                                  INTR_STATUS3};

 static const uint32_t device_reset_banks[4] =3D {DEVICE_RESET__BANK0,
-                                               DEVICE_RESET__BANK1,
-                                               DEVICE_RESET__BANK2,
-                                               DEVICE_RESET__BANK3};
+                                                       DEVICE_RESET__BANK1=
,
+                                                       DEVICE_RESET__BANK2=
,
+                                                       DEVICE_RESET__BANK3=
};

 static const uint32_t operation_timeout[4] =3D {INTR_STATUS0__TIME_OUT,
-                                             INTR_STATUS1__TIME_OUT,
-                                             INTR_STATUS2__TIME_OUT,
-                                             INTR_STATUS3__TIME_OUT};
+                                                       INTR_STATUS1__TIME_=
OUT,
+                                                       INTR_STATUS2__TIME_=
OUT,
+                                                       INTR_STATUS3__TIME_=
OUT};

 static const uint32_t reset_complete[4] =3D {INTR_STATUS0__RST_COMP,
-                                          INTR_STATUS1__RST_COMP,
-                                          INTR_STATUS2__RST_COMP,
-                                          INTR_STATUS3__RST_COMP};
+                                                       INTR_STATUS1__RST_C=
OMP,
+                                                       INTR_STATUS2__RST_C=
OMP,
+                                                       INTR_STATUS3__RST_C=
OMP};

 /* specifies the debug level of the driver */
-static int nand_debug_level =3D 0;
+static int nand_debug_level;

 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
-static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq=
_mask);
-static void denali_irq_enable(struct denali_nand_info *denali, uint32_t in=
t_mask);
+static uint32_t wait_for_irq(struct denali_nand_info *denali,
+                                                       uint32_t irq_mask);
+static void denali_irq_enable(struct denali_nand_info *denali,
+                                                       uint32_t int_mask);
 static uint32_t read_interrupt_status(struct denali_nand_info *denali);

 #define DEBUG_DENALI 0

 /* This is a wrapper for writing to the denali registers.
  * this allows us to create debug information so we can
- * observe how the driver is programming the device.
+ * observe how the driver is programming the device.
  * it uses standard linux convention for (val, addr) */
 static void denali_write32(uint32_t value, void *addr)
 {
-       iowrite32(value, addr);
+       iowrite32(value, addr);

 #if DEBUG_DENALI
-       printk(KERN_ERR "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32_=
t)addr & 0x1fff));
+       printk(KERN_ERR "wrote: 0x%x -> 0x%x\n", value,
+                       (uint32_t)((uint32_t)addr & 0x1fff));
 #endif
-}
+}

-/* Certain operations for the denali NAND controller use an indexed mode t=
o read/write
-   data. The operation is performed by writing the address value of the co=
mmand to
-   the device memory followed by the data. This function abstracts this co=
mmon
-   operation.
+/* Certain operations for the denali NAND controller use an indexed mode
+ * to read/write data. The operation is performed by writing the address
+ * value of the command to the device memory followed by the data. This
+ * function abstracts this common operation.
 */
-static void index_addr(struct denali_nand_info *denali, uint32_t address, =
uint32_t data)
+static void index_addr(struct denali_nand_info *denali,
+                                       uint32_t address, uint32_t data)
 {
        denali_write32(address, denali->flash_mem);
        denali_write32(data, denali->flash_mem + 0x10);
@@ -161,7 +165,7 @@ static void index_addr_read_data(struct denali_nand_inf=
o *denali,
        *pdata =3D ioread32(denali->flash_mem + 0x10);
 }

-/* We need to buffer some data for some of the NAND core routines.
+/* We need to buffer some data for some of the NAND core routines.
  * The operations manage buffering that data. */
 static void reset_buf(struct denali_nand_info *denali)
 {
@@ -183,7 +187,7 @@ static void read_status(struct denali_nand_info *denali=
)
        reset_buf(denali);

        /* initiate a device status read */
-       cmd =3D MODE_11 | BANK(denali->flash_bank);
+       cmd =3D MODE_11 | BANK(denali->flash_bank);
        index_addr(denali, cmd | COMMAND_CYCLE, 0x70);
        denali_write32(cmd | STATUS_CYCLE, denali->flash_mem);

@@ -191,7 +195,8 @@ static void read_status(struct denali_nand_info *denali=
)
        write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));

 #if DEBUG_DENALI
-       printk("device reporting status value of 0x%2x\n", denali->buf.buf[=
0]);
+       printk(KERN_INFO "device reporting status value of 0x%2x\n",
+                       denali->buf.buf[0]);
 #endif
 }

@@ -199,7 +204,7 @@ static void read_status(struct denali_nand_info *denali=
)
 static void reset_bank(struct denali_nand_info *denali)
 {
        uint32_t irq_status =3D 0;
-       uint32_t irq_mask =3D reset_complete[denali->flash_bank] |
+       uint32_t irq_mask =3D reset_complete[denali->flash_bank] |
                            operation_timeout[denali->flash_bank];
        int bank =3D 0;

@@ -209,11 +214,9 @@ static void reset_bank(struct denali_nand_info *denali=
)
        denali_write32(bank, denali->flash_reg + DEVICE_RESET);

        irq_status =3D wait_for_irq(denali, irq_mask);
-
+
        if (irq_status & operation_timeout[denali->flash_bank])
-       {
                printk(KERN_ERR "reset bank failed.\n");
-       }
 }

 /* Reset the flash controller */
@@ -229,9 +232,12 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_in=
fo *denali)
                denali->flash_reg + intr_status_addresses[i]);

        for (i =3D 0 ; i < LLD_MAX_FLASH_BANKS; i++) {
-               denali_write32(device_reset_banks[i], denali->flash_reg + D=
EVICE_RESET);
-               while (!(ioread32(denali->flash_reg + intr_status_addresses=
[i]) &
-                       (reset_complete[i] | operation_timeout[i])))
+               denali_write32(device_reset_banks[i],
+                               denali->flash_reg + DEVICE_RESET);
+               while (!(ioread32(denali->flash_reg +
+                                       intr_status_addresses[i]) &
+                                       (reset_complete[i] |
+                                        operation_timeout[i])))
                        ;
                if (ioread32(denali->flash_reg + intr_status_addresses[i]) =
&
                        operation_timeout[i])
@@ -247,10 +253,11 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_i=
nfo *denali)
 }

 /* this routine calculates the ONFI timing values for a given mode and pro=
grams
- * the clocking register accordingly. The mode is determined by the get_on=
fi_nand_para
-   routine.
+ * the clocking register accordingly. The mode is determined by the
+ * get_onfi_nand_para routine.
  */
-static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali, uint16_=
t mode)
+static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali,
+                                                               uint16_t mo=
de)
 {
        uint16_t Trea[6] =3D {40, 30, 25, 20, 20, 16};
        uint16_t Trp[6] =3D {50, 25, 17, 15, 12, 10};
@@ -356,10 +363,11 @@ static void set_ecc_config(struct denali_nand_info *d=
enali)
                denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 #endif

-       if ((ioread32(denali->flash_reg + ECC_CORRECTION) & ECC_CORRECTION_=
_VALUE)
-               =3D=3D 1) {
+       if ((ioread32(denali->flash_reg + ECC_CORRECTION) &
+                               ECC_CORRECTION__VALUE) =3D=3D 1) {
                denali->dev_info.wECCBytesPerSector =3D 4;
-               denali->dev_info.wECCBytesPerSector *=3D denali->dev_info.w=
DevicesConnected;
+               denali->dev_info.wECCBytesPerSector *=3D
+                       denali->dev_info.wDevicesConnected;
                denali->dev_info.wNumPageSpareFlag =3D
                        denali->dev_info.wPageSpareSize -
                        denali->dev_info.wPageDataSize /
@@ -375,8 +383,10 @@ static void set_ecc_config(struct denali_nand_info *de=
nali)
                else
                        denali->dev_info.wECCBytesPerSector +=3D 1;

-               denali->dev_info.wECCBytesPerSector *=3D denali->dev_info.w=
DevicesConnected;
-               denali->dev_info.wNumPageSpareFlag =3D denali->dev_info.wPa=
geSpareSize -
+               denali->dev_info.wECCBytesPerSector *=3D
+                       denali->dev_info.wDevicesConnected;
+               denali->dev_info.wNumPageSpareFlag =3D
+                       denali->dev_info.wPageSpareSize -
                        denali->dev_info.wPageDataSize /
                        (ECC_SECTOR_SIZE * denali->dev_info.wDevicesConnect=
ed) *
                        denali->dev_info.wECCBytesPerSector
@@ -399,8 +409,10 @@ static uint16_t get_onfi_nand_para(struct denali_nand_=
info *denali)
                INTR_STATUS0__TIME_OUT)))
                ;

-       if (ioread32(denali->flash_reg + INTR_STATUS0) & INTR_STATUS0__RST_=
COMP) {
-               denali_write32(DEVICE_RESET__BANK1, denali->flash_reg + DEV=
ICE_RESET);
+       if (ioread32(denali->flash_reg + INTR_STATUS0) &
+                       INTR_STATUS0__RST_COMP) {
+               denali_write32(DEVICE_RESET__BANK1,
+                               denali->flash_reg + DEVICE_RESET);
                while (!((ioread32(denali->flash_reg + INTR_STATUS1) &
                        INTR_STATUS1__RST_COMP) |
                        (ioread32(denali->flash_reg + INTR_STATUS1) &
@@ -421,9 +433,11 @@ static uint16_t get_onfi_nand_para(struct denali_nand_=
info *denali)
                                INTR_STATUS2__RST_COMP) {
                                denali_write32(DEVICE_RESET__BANK3,
                                        denali->flash_reg + DEVICE_RESET);
-                               while (!((ioread32(denali->flash_reg + INTR=
_STATUS3) &
+                               while (!((ioread32(denali->flash_reg +
+                                                               INTR_STATUS=
3) &
                                        INTR_STATUS3__RST_COMP) |
-                                       (ioread32(denali->flash_reg + INTR_=
STATUS3) &
+                                       (ioread32(denali->flash_reg +
+                                                         INTR_STATUS3) &
                                        INTR_STATUS3__TIME_OUT)))
                                        ;
                        } else {
@@ -434,10 +448,14 @@ static uint16_t get_onfi_nand_para(struct denali_nand=
_info *denali)
                }
        }

-       denali_write32(INTR_STATUS0__TIME_OUT, denali->flash_reg + INTR_STA=
TUS0);
-       denali_write32(INTR_STATUS1__TIME_OUT, denali->flash_reg + INTR_STA=
TUS1);
-       denali_write32(INTR_STATUS2__TIME_OUT, denali->flash_reg + INTR_STA=
TUS2);
-       denali_write32(INTR_STATUS3__TIME_OUT, denali->flash_reg + INTR_STA=
TUS3);
+       denali_write32(INTR_STATUS0__TIME_OUT,
+                       denali->flash_reg + INTR_STATUS0);
+       denali_write32(INTR_STATUS1__TIME_OUT,
+                       denali->flash_reg + INTR_STATUS1);
+       denali_write32(INTR_STATUS2__TIME_OUT,
+                       denali->flash_reg + INTR_STATUS2);
+       denali_write32(INTR_STATUS3__TIME_OUT,
+                       denali->flash_reg + INTR_STATUS3);

        denali->dev_info.wONFIDevFeatures =3D
                ioread32(denali->flash_reg + ONFI_DEVICE_FEATURES);
@@ -450,8 +468,10 @@ static uint16_t get_onfi_nand_para(struct denali_nand_=
info *denali)

        n_of_luns =3D ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) =
&
                ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS;
-       blks_lun_l =3D ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_BLOCK=
S_PER_LUN_L);
-       blks_lun_h =3D ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_BLOCK=
S_PER_LUN_U);
+       blks_lun_l =3D ioread32(denali->flash_reg +
+                       ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L);
+       blks_lun_h =3D ioread32(denali->flash_reg +
+                       ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U);

        blockperlun =3D (blks_lun_h << 16) | blks_lun_l;

@@ -462,7 +482,8 @@ static uint16_t get_onfi_nand_para(struct denali_nand_i=
nfo *denali)
                return FAIL;

        for (i =3D 5; i > 0; i--) {
-               if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) & (0x01 =
<< i))
+               if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
+                               (0x01 << i))
                        break;
        }

@@ -497,7 +518,8 @@ static void get_samsung_nand_para(struct denali_nand_in=
fo *denali)
        index_addr(denali, (uint32_t)(MODE_11 | 0), 0x90);
        index_addr(denali, (uint32_t)(MODE_11 | 1), 0);
        for (i =3D 0; i < 5; i++)
-               index_addr_read_data(denali, (uint32_t)(MODE_11 | 2), &id_b=
ytes[i]);
+               index_addr_read_data(denali, (uint32_t)(MODE_11 | 2),
+                                                       &id_bytes[i]);

        nand_dbg_print(NAND_DBG_DEBUG,
                "ID bytes: 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
@@ -517,7 +539,8 @@ static void get_samsung_nand_para(struct denali_nand_in=
fo *denali)

        no_of_planes =3D 1 << ((id_bytes[4] & 0x0c) >> 2);
        plane_size  =3D (uint64_t)64 << ((id_bytes[4] & 0x70) >> 4);
-       blk_size =3D 64 << ((ioread32(denali->flash_reg + DEVICE_PARAM_1) &=
 0x30) >> 4);
+       blk_size =3D 64 << ((ioread32(denali->flash_reg + DEVICE_PARAM_1) &
+                               0x30) >> 4);
        capacity =3D (uint64_t)128 * plane_size * no_of_planes;

        do_div(capacity, blk_size);
@@ -536,7 +559,8 @@ static void get_toshiba_nand_para(struct denali_nand_in=
fo *denali)
                denali_write32(216, denali->flash_reg + DEVICE_SPARE_AREA_S=
IZE);
                tmp =3D ioread32(denali->flash_reg + DEVICES_CONNECTED) *
                        ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE=
);
-               denali_write32(tmp, denali->flash_reg + LOGICAL_PAGE_SPARE_=
SIZE);
+               denali_write32(tmp, denali->flash_reg +
+                               LOGICAL_PAGE_SPARE_SIZE);
 #if SUPPORT_15BITECC
                denali_write32(15, denali->flash_reg + ECC_CORRECTION);
 #elif SUPPORT_8BITECC
@@ -575,10 +599,14 @@ static void get_hynix_nand_para(struct denali_nand_in=
fo *denali)
                denali_write32(128, denali->flash_reg + PAGES_PER_BLOCK);
                denali_write32(4096, denali->flash_reg + DEVICE_MAIN_AREA_S=
IZE);
                denali_write32(224, denali->flash_reg + DEVICE_SPARE_AREA_S=
IZE);
-               main_size =3D 4096 * ioread32(denali->flash_reg + DEVICES_C=
ONNECTED);
-               spare_size =3D 224 * ioread32(denali->flash_reg + DEVICES_C=
ONNECTED);
-               denali_write32(main_size, denali->flash_reg + LOGICAL_PAGE_=
DATA_SIZE);
-               denali_write32(spare_size, denali->flash_reg + LOGICAL_PAGE=
_SPARE_SIZE);
+               main_size =3D 4096 * ioread32(denali->flash_reg +
+                                                       DEVICES_CONNECTED);
+               spare_size =3D 224 * ioread32(denali->flash_reg +
+                                                       DEVICES_CONNECTED);
+               denali_write32(main_size, denali->flash_reg +
+                                                       LOGICAL_PAGE_DATA_S=
IZE);
+               denali_write32(spare_size, denali->flash_reg +
+                                               LOGICAL_PAGE_SPARE_SIZE);
                denali_write32(0, denali->flash_reg + DEVICE_WIDTH);
 #if SUPPORT_15BITECC
                denali_write32(15, denali->flash_reg + ECC_CORRECTION);
@@ -610,7 +638,7 @@ static void get_hynix_nand_para(struct denali_nand_info=
 *denali)
 }

 /* determines how many NAND chips are connected to the controller. Note fo=
r
-   Intel CE4100 devices we don't support more than one device.
+   Intel CE4100 devices we don't support more than one device.
  */
 static void find_valid_banks(struct denali_nand_info *denali)
 {
@@ -621,7 +649,8 @@ static void find_valid_banks(struct denali_nand_info *d=
enali)
        for (i =3D 0; i < LLD_MAX_FLASH_BANKS; i++) {
                index_addr(denali, (uint32_t)(MODE_11 | (i << 24) | 0), 0x9=
0);
                index_addr(denali, (uint32_t)(MODE_11 | (i << 24) | 1), 0);
-               index_addr_read_data(denali, (uint32_t)(MODE_11 | (i << 24)=
 | 2), &id[i]);
+               index_addr_read_data(denali,
+                               (uint32_t)(MODE_11 | (i << 24) | 2), &id[i]=
);

                nand_dbg_print(NAND_DBG_DEBUG,
                        "Return 1st ID for bank[%d]: %x\n", i, id[i]);
@@ -638,18 +667,15 @@ static void find_valid_banks(struct denali_nand_info =
*denali)
        }

        if (denali->platform =3D=3D INTEL_CE4100)
-       {
                /* Platform limitations of the CE4100 device limit
                 * users to a single chip solution for NAND.
-                 * Multichip support is not enabled.
-                */
-               if (denali->total_used_banks !=3D 1)
-               {
+                * Multichip support is not enabled.
+                */
+               if (denali->total_used_banks !=3D 1) {
                        printk(KERN_ERR "Sorry, Intel CE4100 only supports =
"
                                        "a single NAND device.\n");
                        BUG();
                }
-       }
        nand_dbg_print(NAND_DBG_DEBUG,
                "denali->total_used_banks: %d\n", denali->total_used_banks)=
;
 }
@@ -675,7 +701,8 @@ static void detect_partition_feature(struct denali_nand=
_info *denali)
                            (ioread32(denali->flash_reg + MAX_BLK_ADDR_1) &
                            MAX_BLK_ADDR_1__VALUE);

-                       denali->dev_info.wTotalBlocks *=3D denali->total_us=
ed_banks;
+                       denali->dev_info.wTotalBlocks *=3D
+                               denali->total_used_banks;

                        if (denali->dev_info.wSpectraEndBlock >=3D
                            denali->dev_info.wTotalBlocks) {
@@ -687,8 +714,10 @@ static void detect_partition_feature(struct denali_nan=
d_info *denali)
                                denali->dev_info.wSpectraEndBlock -
                                denali->dev_info.wSpectraStartBlock + 1;
                } else {
-                       denali->dev_info.wTotalBlocks *=3D denali->total_us=
ed_banks;
-                       denali->dev_info.wSpectraStartBlock =3D SPECTRA_STA=
RT_BLOCK;
+                       denali->dev_info.wTotalBlocks *=3D
+                               denali->total_used_banks;
+                       denali->dev_info.wSpectraStartBlock =3D
+                               SPECTRA_START_BLOCK;
                        denali->dev_info.wSpectraEndBlock =3D
                                denali->dev_info.wTotalBlocks - 1;
                        denali->dev_info.wDataBlockNum =3D
@@ -698,7 +727,8 @@ static void detect_partition_feature(struct denali_nand=
_info *denali)
        } else {
                denali->dev_info.wTotalBlocks *=3D denali->total_used_banks=
;
                denali->dev_info.wSpectraStartBlock =3D SPECTRA_START_BLOCK=
;
-               denali->dev_info.wSpectraEndBlock =3D denali->dev_info.wTot=
alBlocks - 1;
+               denali->dev_info.wSpectraEndBlock =3D
+                       denali->dev_info.wTotalBlocks - 1;
                denali->dev_info.wDataBlockNum =3D
                        denali->dev_info.wSpectraEndBlock -
                        denali->dev_info.wSpectraStartBlock + 1;
@@ -780,13 +810,19 @@ static uint16_t NAND_Read_Device_ID(struct denali_nan=
d_info *denali)
        nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
                       __FILE__, __LINE__, __func__);

-       denali->dev_info.wDeviceMaker =3D ioread32(denali->flash_reg + MANU=
FACTURER_ID);
-       denali->dev_info.wDeviceID =3D ioread32(denali->flash_reg + DEVICE_=
ID);
-       denali->dev_info.bDeviceParam0 =3D ioread32(denali->flash_reg + DEV=
ICE_PARAM_0);
-       denali->dev_info.bDeviceParam1 =3D ioread32(denali->flash_reg + DEV=
ICE_PARAM_1);
-       denali->dev_info.bDeviceParam2 =3D ioread32(denali->flash_reg + DEV=
ICE_PARAM_2);
+       denali->dev_info.wDeviceMaker =3D
+               ioread32(denali->flash_reg + MANUFACTURER_ID);
+       denali->dev_info.wDeviceID =3D
+               ioread32(denali->flash_reg + DEVICE_ID);
+       denali->dev_info.bDeviceParam0 =3D
+               ioread32(denali->flash_reg + DEVICE_PARAM_0);
+       denali->dev_info.bDeviceParam1 =3D
+               ioread32(denali->flash_reg + DEVICE_PARAM_1);
+       denali->dev_info.bDeviceParam2 =3D
+               ioread32(denali->flash_reg + DEVICE_PARAM_2);

-       denali->dev_info.MLCDevice =3D ioread32(denali->flash_reg + DEVICE_=
PARAM_0) & 0x0c;
+       denali->dev_info.MLCDevice =3D
+               ioread32(denali->flash_reg + DEVICE_PARAM_0) & 0x0c;

        if (ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) &
                ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE) { /* ONFI 1.0 NAND */
@@ -835,7 +871,8 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_=
info *denali)
        denali->dev_info.wPageSpareSize =3D
                ioread32(denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);

-       denali->dev_info.wPagesPerBlock =3D ioread32(denali->flash_reg + PA=
GES_PER_BLOCK);
+       denali->dev_info.wPagesPerBlock =3D
+               ioread32(denali->flash_reg + PAGES_PER_BLOCK);

        denali->dev_info.wPageSize =3D
            denali->dev_info.wPageDataSize + denali->dev_info.wPageSpareSiz=
e;
@@ -844,11 +881,13 @@ static uint16_t NAND_Read_Device_ID(struct denali_nan=
d_info *denali)
        denali->dev_info.wBlockDataSize =3D
            denali->dev_info.wPagesPerBlock * denali->dev_info.wPageDataSiz=
e;

-       denali->dev_info.wDeviceWidth =3D ioread32(denali->flash_reg + DEVI=
CE_WIDTH);
+       denali->dev_info.wDeviceWidth =3D
+               ioread32(denali->flash_reg + DEVICE_WIDTH);
        denali->dev_info.wDeviceType =3D
                ((ioread32(denali->flash_reg + DEVICE_WIDTH) > 0) ? 16 : 8)=
;

-       denali->dev_info.wDevicesConnected =3D ioread32(denali->flash_reg +=
 DEVICES_CONNECTED);
+       denali->dev_info.wDevicesConnected =3D
+               ioread32(denali->flash_reg + DEVICES_CONNECTED);

        denali->dev_info.wSpareSkipBytes =3D
                ioread32(denali->flash_reg + SPARE_AREA_SKIP_BYTES) *
@@ -885,12 +924,10 @@ static uint16_t NAND_Read_Device_ID(struct denali_nan=
d_info *denali)
        dump_device_info(denali);

        /* If the user specified to override the default timings
-        * with a specific ONFI mode, we apply those changes here.
+        * with a specific ONFI mode, we apply those changes here.
         */
        if (onfi_timing_mode !=3D NAND_DEFAULT_TIMINGS)
-       {
                NAND_ONFi_Timing_Mode(denali, onfi_timing_mode);
-       }

        return status;
 }
@@ -912,7 +949,7 @@ static void NAND_LLD_Enable_Disable_Interrupts(struct d=
enali_nand_info *denali,
  */
 static inline bool is_flash_bank_valid(int flash_bank)
 {
-       return (flash_bank >=3D 0 && flash_bank < 4);
+       return (flash_bank >=3D 0 && flash_bank < 4);
 }

 static void denali_irq_init(struct denali_nand_info *denali)
@@ -939,7 +976,8 @@ static void denali_irq_cleanup(int irqnum, struct denal=
i_nand_info *denali)
        free_irq(irqnum, denali);
 }

-static void denali_irq_enable(struct denali_nand_info *denali, uint32_t in=
t_mask)
+static void denali_irq_enable(struct denali_nand_info *denali,
+                                                       uint32_t int_mask)
 {
        denali_write32(int_mask, denali->flash_reg + INTR_EN0);
        denali_write32(int_mask, denali->flash_reg + INTR_EN1);
@@ -948,15 +986,16 @@ static void denali_irq_enable(struct denali_nand_info=
 *denali, uint32_t int_mask
 }

 /* This function only returns when an interrupt that this driver cares abo=
ut
- * occurs. This is to reduce the overhead of servicing interrupts
+ * occurs. This is to reduce the overhead of servicing interrupts
  */
 static inline uint32_t denali_irq_detected(struct denali_nand_info *denali=
)
 {
-       return (read_interrupt_status(denali) & DENALI_IRQ_ALL);
+       return read_interrupt_status(denali) & DENALI_IRQ_ALL;
 }

 /* Interrupts are cleared by writing a 1 to the appropriate status bit */
-static inline void clear_interrupt(struct denali_nand_info *denali, uint32=
_t irq_mask)
+static inline void clear_interrupt(struct denali_nand_info *denali,
+                                                       uint32_t irq_mask)
 {
        uint32_t intr_status_reg =3D 0;

@@ -995,17 +1034,15 @@ static void print_irq_log(struct denali_nand_info *d=
enali)
 {
        int i =3D 0;

-       printk("ISR debug log index =3D %X\n", denali->idx);
+       printk(KERN_INFO "ISR debug log index =3D %X\n", denali->idx);
        for (i =3D 0; i < 32; i++)
-       {
-               printk("%08X: %08X\n", i, denali->irq_debug_array[i]);
-       }
+               printk(KERN_INFO "%08X: %08X\n", i, denali->irq_debug_array=
[i]);
 }
 #endif

-/* This is the interrupt service routine. It handles all interrupts
- * sent to this device. Note that on CE4100, this is a shared
- * interrupt.
+/* This is the interrupt service routine. It handles all interrupts
+ * sent to this device. Note that on CE4100, this is a shared
+ * interrupt.
  */
 static irqreturn_t denali_isr(int irq, void *dev_id)
 {
@@ -1015,20 +1052,20 @@ static irqreturn_t denali_isr(int irq, void *dev_id=
)

        spin_lock(&denali->irq_lock);

-       /* check to see if a valid NAND chip has
-         * been selected.
+       /* check to see if a valid NAND chip has
+        * been selected.
         */
-       if (is_flash_bank_valid(denali->flash_bank))
-       {
-               /* check to see if controller generated
+       if (is_flash_bank_valid(denali->flash_bank)) {
+               /* check to see if controller generated
                 * the interrupt, since this is a shared interrupt */
-               if ((irq_status =3D denali_irq_detected(denali)) !=3D 0)
-               {
+               irq_status =3D denali_irq_detected(denali);
+               if (irq_status !=3D 0) {
 #if DEBUG_DENALI
-                       denali->irq_debug_array[denali->idx++] =3D 0x100000=
00 | irq_status;
+                       denali->irq_debug_array[denali->idx++] =3D
+                               0x10000000 | irq_status;
                        denali->idx %=3D 32;

-                       printk("IRQ status =3D 0x%04x\n", irq_status);
+                       printk(KERN_INFO "IRQ status =3D 0x%04x\n", irq_sta=
tus);
 #endif
                        /* handle interrupt */
                        /* first acknowledge it */
@@ -1054,61 +1091,62 @@ static uint32_t wait_for_irq(struct denali_nand_inf=
o *denali, uint32_t irq_mask)
        bool retry =3D false;
        unsigned long timeout =3D msecs_to_jiffies(1000);

-       do
-       {
+       do {
 #if DEBUG_DENALI
-               printk("waiting for 0x%x\n", irq_mask);
+               printk(KERN_INFO "waiting for 0x%x\n", irq_mask);
 #endif
-               comp_res =3D wait_for_completion_timeout(&denali->complete,=
 timeout);
+               comp_res =3D
+                       wait_for_completion_timeout(&denali->complete, time=
out);
                spin_lock_irq(&denali->irq_lock);
                intr_status =3D denali->irq_status;

 #if DEBUG_DENALI
-               denali->irq_debug_array[denali->idx++] =3D 0x20000000 | (ir=
q_mask << 16) | intr_status;
+               denali->irq_debug_array[denali->idx++] =3D
+                       0x20000000 | (irq_mask << 16) | intr_status;
                denali->idx %=3D 32;
 #endif

-               if (intr_status & irq_mask)
-               {
+               if (intr_status & irq_mask) {
                        denali->irq_status &=3D ~irq_mask;
                        spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
-                       if (retry) printk("status on retry =3D 0x%x\n", int=
r_status);
+                       if (retry)
+                               printk(KERN_INFO "status on retry =3D 0x%x\=
n",
+                                               intr_status);
 #endif
                        /* our interrupt was detected */
                        break;
-               }
-               else
-               {
-                       /* these are not the interrupts you are looking for=
 -
-                          need to wait again */
+               } else {
+                       /* these are not the interrupts you are looking for
+                        * need to wait again */
                        spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
                        print_irq_log(denali);
-                       printk("received irq nobody cared: irq_status =3D 0=
x%x,"
-                               " irq_mask =3D 0x%x, timeout =3D %ld\n", in=
tr_status, irq_mask, comp_res);
+                       printk(KERN_INFO "received irq nobody cared: "
+                                       "irq_status =3D 0x%x, irq_mask =3D =
0x%x, "
+                                       "timeout =3D %ld\n", intr_status,
+                                       irq_mask, comp_res);
 #endif
                        retry =3D true;
                }
        } while (comp_res !=3D 0);

-       if (comp_res =3D=3D 0)
-       {
+       if (comp_res =3D=3D 0) {
                /* timeout */
-               printk(KERN_ERR "timeout occurred, status =3D 0x%x, mask =
=3D 0x%x\n",
-                               intr_status, irq_mask);
+               printk(KERN_ERR "timeout occurred, status =3D 0x%x, mask =
=3D 0x%x\n",
+                               intr_status, irq_mask);

                intr_status =3D 0;
        }
        return intr_status;
 }

-/* This helper function setups the registers for ECC and whether or not
+/* This helper function setups the registers for ECC and whether or not
    the spare area will be transfered. */
-static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_e=
n,
+static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_e=
n,
                                bool transfer_spare)
 {
-       int ecc_en_flag =3D 0, transfer_spare_flag =3D 0;
+       int ecc_en_flag =3D 0, transfer_spare_flag =3D 0;

        /* set ECC, transfer spare bits if needed */
        ecc_en_flag =3D ecc_en ? ECC_ENABLE__FLAG : 0;
@@ -1116,85 +1154,85 @@ static void setup_ecc_for_xfer(struct denali_nand_i=
nfo *denali, bool ecc_en,

        /* Enable spare area/ECC per user's request. */
        denali_write32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
-       denali_write32(transfer_spare_flag, denali->flash_reg + TRANSFER_SP=
ARE_REG);
+       denali_write32(transfer_spare_flag,
+                       denali->flash_reg + TRANSFER_SPARE_REG);
 }

-/* sends a pipeline command operation to the controller. See the Denali NA=
ND
-   controller's user guide for more information (section 4.2.3.6).
+/* sends a pipeline command operation to the controller. See the Denali NA=
ND
+   controller's user guide for more information (section 4.2.3.6).
  */
-static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool =
ecc_en,
-                                       bool transfer_spare, int access_typ=
e,
-                                       int op)
+static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
+                                                       bool ecc_en,
+                                                       bool transfer_spare=
,
+                                                       int access_type,
+                                                       int op)
 {
        int status =3D PASS;
-       uint32_t addr =3D 0x0, cmd =3D 0x0, page_count =3D 1, irq_status =
=3D 0,
+       uint32_t addr =3D 0x0, cmd =3D 0x0, page_count =3D 1, irq_status =
=3D 0,
                 irq_mask =3D 0;

-       if (op =3D=3D DENALI_READ) irq_mask =3D INTR_STATUS0__LOAD_COMP;
-       else if (op =3D=3D DENALI_WRITE) irq_mask =3D 0;
-       else BUG();
+       if (op =3D=3D DENALI_READ)
+               irq_mask =3D INTR_STATUS0__LOAD_COMP;
+       else if (op =3D=3D DENALI_WRITE)
+               irq_mask =3D 0;
+       else
+               BUG();

        setup_ecc_for_xfer(denali, ecc_en, transfer_spare);

 #if DEBUG_DENALI
        spin_lock_irq(&denali->irq_lock);
-       denali->irq_debug_array[denali->idx++] =3D 0x40000000 | ioread32(de=
nali->flash_reg + ECC_ENABLE) | (access_type << 4);
+       denali->irq_debug_array[denali->idx++] =3D
+               0x40000000 | ioread32(denali->flash_reg + ECC_ENABLE) |
+               (access_type << 4);
        denali->idx %=3D 32;
        spin_unlock_irq(&denali->irq_lock);
 #endif


        /* clear interrupts */
-       clear_interrupts(denali);
+       clear_interrupts(denali);

        addr =3D BANK(denali->flash_bank) | denali->page;

-       if (op =3D=3D DENALI_WRITE && access_type !=3D SPARE_ACCESS)
-       {
-               cmd =3D MODE_01 | addr;
+       if (op =3D=3D DENALI_WRITE && access_type !=3D SPARE_ACCESS) {
+               cmd =3D MODE_01 | addr;
                denali_write32(cmd, denali->flash_mem);
-       }
-       else if (op =3D=3D DENALI_WRITE && access_type =3D=3D SPARE_ACCESS)
-       {
+       } else if (op =3D=3D DENALI_WRITE && access_type =3D=3D SPARE_ACCES=
S) {
                /* read spare area */
-               cmd =3D MODE_10 | addr;
+               cmd =3D MODE_10 | addr;
                index_addr(denali, (uint32_t)cmd, access_type);

-               cmd =3D MODE_01 | addr;
+               cmd =3D MODE_01 | addr;
                denali_write32(cmd, denali->flash_mem);
-       }
-       else if (op =3D=3D DENALI_READ)
-       {
+       } else if (op =3D=3D DENALI_READ) {
                /* setup page read request for access type */
-               cmd =3D MODE_10 | addr;
+               cmd =3D MODE_10 | addr;
                index_addr(denali, (uint32_t)cmd, access_type);

                /* page 33 of the NAND controller spec indicates we should =
not
-                  use the pipeline commands in Spare area only mode. So we
+                  use the pipeline commands in Spare area only mode. So we
                   don't.
                 */
-               if (access_type =3D=3D SPARE_ACCESS)
-               {
+               if (access_type =3D=3D SPARE_ACCESS) {
                        cmd =3D MODE_01 | addr;
                        denali_write32(cmd, denali->flash_mem);
-               }
-               else
-               {
-                       index_addr(denali, (uint32_t)cmd, 0x2000 | op | pag=
e_count);
-
-                       /* wait for command to be accepted
-                        * can always use status0 bit as the mask is identi=
cal for each
+               } else {
+                       index_addr(denali, (uint32_t)cmd,
+                                       0x2000 | op | page_count);
+
+                       /* wait for command to be accepted
+                        * can always use status0 bit as the mask is
+                        * identical for each
                         * bank. */
                        irq_status =3D wait_for_irq(denali, irq_mask);

-                       if (irq_status =3D=3D 0)
-                       {
+                       if (irq_status =3D=3D 0) {
                                printk(KERN_ERR "cmd, page, addr on timeout=
 "
-                                       "(0x%x, 0x%x, 0x%x)\n", cmd, denali=
->page, addr);
+                                       "(0x%x, 0x%x, 0x%x)\n", cmd,
+                                       denali->page, addr);
                                status =3D FAIL;
-                       }
-                       else
-                       {
+                       } else {
                                cmd =3D MODE_01 | addr;
                                denali_write32(cmd, denali->flash_mem);
                        }
@@ -1204,36 +1242,35 @@ static int denali_send_pipeline_cmd(struct denali_n=
and_info *denali, bool ecc_en
 }

 /* helper function that simply writes a buffer to the flash */
-static int write_data_to_flash_mem(struct denali_nand_info *denali, const =
uint8_t *buf,
-                                       int len)
+static int write_data_to_flash_mem(struct denali_nand_info *denali,
+                                                       const uint8_t *buf,
+                                                       int len)
 {
        uint32_t i =3D 0, *buf32;

-       /* verify that the len is a multiple of 4. see comment in
-        * read_data_from_flash_mem() */
+       /* verify that the len is a multiple of 4. see comment in
+        * read_data_from_flash_mem() */
        BUG_ON((len % 4) !=3D 0);

        /* write the data to the flash memory */
        buf32 =3D (uint32_t *)buf;
        for (i =3D 0; i < len / 4; i++)
-       {
                denali_write32(*buf32++, denali->flash_mem + 0x10);
-       }
-       return i*4; /* intent is to return the number of bytes read */
+       return i*4; /* intent is to return the number of bytes read */
 }

 /* helper function that simply reads a buffer from the flash */
-static int read_data_from_flash_mem(struct denali_nand_info *denali, uint8=
_t *buf,
-                                       int len)
+static int read_data_from_flash_mem(struct denali_nand_info *denali,
+                                                       uint8_t *buf,
+                                                       int len)
 {
        uint32_t i =3D 0, *buf32;

        /* we assume that len will be a multiple of 4, if not
         * it would be nice to know about it ASAP rather than
-        * have random failures...
-         *
-        * This assumption is based on the fact that this
-        * function is designed to be used to read flash pages,
+        * have random failures...
+        * This assumption is based on the fact that this
+        * function is designed to be used to read flash pages,
         * which are typically multiples of 4...
         */

@@ -1242,10 +1279,8 @@ static int read_data_from_flash_mem(struct denali_na=
nd_info *denali, uint8_t *bu
        /* transfer the data from the flash */
        buf32 =3D (uint32_t *)buf;
        for (i =3D 0; i < len / 4; i++)
-       {
                *buf32++ =3D ioread32(denali->flash_mem + 0x10);
-       }
-       return i*4; /* intent is to return the number of bytes read */
+       return i*4; /* intent is to return the number of bytes read */
 }

 /* writes OOB data to the device */
@@ -1253,38 +1288,35 @@ static int write_oob_data(struct mtd_info *mtd, uin=
t8_t *buf, int page)
 {
        struct denali_nand_info *denali =3D mtd_to_denali(mtd);
        uint32_t irq_status =3D 0;
-       uint32_t irq_mask =3D INTR_STATUS0__PROGRAM_COMP |
+       uint32_t irq_mask =3D INTR_STATUS0__PROGRAM_COMP |
                                                INTR_STATUS0__PROGRAM_FAIL;
        int status =3D 0;

        denali->page =3D page;

-       if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
-                                                       DENALI_WRITE) =3D=
=3D PASS)
-       {
+       if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
+                                                       DENALI_WRITE) =3D=
=3D PASS) {
                write_data_to_flash_mem(denali, buf, mtd->oobsize);

 #if DEBUG_DENALI
                spin_lock_irq(&denali->irq_lock);
-               denali->irq_debug_array[denali->idx++] =3D 0x80000000 | mtd=
->oobsize;
+               denali->irq_debug_array[denali->idx++] =3D
+                       0x80000000 | mtd->oobsize;
                denali->idx %=3D 32;
                spin_unlock_irq(&denali->irq_lock);
 #endif

-
+
                /* wait for operation to complete */
                irq_status =3D wait_for_irq(denali, irq_mask);

-               if (irq_status =3D=3D 0)
-               {
+               if (irq_status =3D=3D 0) {
                        printk(KERN_ERR "OOB write failed\n");
                        status =3D -EIO;
                }
-       }
-       else
-       {
+       } else {
                printk(KERN_ERR "unable to send pipeline command\n");
-               status =3D -EIO;
+               status =3D -EIO;
        }
        return status;
 }
@@ -1293,60 +1325,56 @@ static int write_oob_data(struct mtd_info *mtd, uin=
t8_t *buf, int page)
 static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
        struct denali_nand_info *denali =3D mtd_to_denali(mtd);
-       uint32_t irq_mask =3D INTR_STATUS0__LOAD_COMP, irq_status =3D 0, ad=
dr =3D 0x0, cmd =3D 0x0;
+       uint32_t irq_mask =3D INTR_STATUS0__LOAD_COMP,
+                        irq_status =3D 0, addr =3D 0x0, cmd =3D 0x0;

        denali->page =3D page;

 #if DEBUG_DENALI
-       printk("read_oob %d\n", page);
+       printk(KERN_INFO "read_oob %d\n", page);
 #endif
-       if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
-                                                       DENALI_READ) =3D=3D=
 PASS)
-       {
-               read_data_from_flash_mem(denali, buf, mtd->oobsize);
+       if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
+                                                       DENALI_READ) =3D=3D=
 PASS) {
+               read_data_from_flash_mem(denali, buf, mtd->oobsize);

-               /* wait for command to be accepted
+               /* wait for command to be accepted
                 * can always use status0 bit as the mask is identical for =
each
                 * bank. */
                irq_status =3D wait_for_irq(denali, irq_mask);

                if (irq_status =3D=3D 0)
-               {
-                       printk(KERN_ERR "page on OOB timeout %d\n", denali-=
>page);
-               }
+                       printk(KERN_ERR "page on OOB timeout %d\n",
+                                       denali->page);

                /* We set the device back to MAIN_ACCESS here as I observed
                 * instability with the controller if you do a block erase
                 * and the last transaction was a SPARE_ACCESS. Block erase
                 * is reliable (according to the MTD test infrastructure)
-                * if you are in MAIN_ACCESS.
+                * if you are in MAIN_ACCESS.
                 */
                addr =3D BANK(denali->flash_bank) | denali->page;
-               cmd =3D MODE_10 | addr;
+               cmd =3D MODE_10 | addr;
                index_addr(denali, (uint32_t)cmd, MAIN_ACCESS);

 #if DEBUG_DENALI
                spin_lock_irq(&denali->irq_lock);
-               denali->irq_debug_array[denali->idx++] =3D 0x60000000 | mtd=
->oobsize;
+               denali->irq_debug_array[denali->idx++] =3D
+                       0x60000000 | mtd->oobsize;
                denali->idx %=3D 32;
                spin_unlock_irq(&denali->irq_lock);
 #endif
        }
 }

-/* this function examines buffers to see if they contain data that
+/* this function examines buffers to see if they contain data that
  * indicate that the buffer is part of an erased region of flash.
  */
 bool is_erased(uint8_t *buf, int len)
 {
        int i =3D 0;
        for (i =3D 0; i < len; i++)
-       {
                if (buf[i] !=3D 0xFF)
-               {
                        return false;
-               }
-       }
        return true;
 }
 #define ECC_SECTOR_SIZE 512
@@ -1358,64 +1386,58 @@ bool is_erased(uint8_t *buf, int len)
 #define ECC_ERR_DEVICE(x)      ((x) & ERR_CORRECTION_INFO__DEVICE_NR >> 8)
 #define ECC_LAST_ERR(x)                ((x) & ERR_CORRECTION_INFO__LAST_ER=
R_INFO)

-static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
+static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
                        uint8_t *oobbuf, uint32_t irq_status)
 {
        bool check_erased_page =3D false;

-       if (irq_status & INTR_STATUS0__ECC_ERR)
-       {
+       if (irq_status & INTR_STATUS0__ECC_ERR) {
                /* read the ECC errors. we'll ignore them for now */
                uint32_t err_address =3D 0, err_correction_info =3D 0;
                uint32_t err_byte =3D 0, err_sector =3D 0, err_device =3D 0=
;
                uint32_t err_correction_value =3D 0;

-               do
-               {
-                       err_address =3D ioread32(denali->flash_reg +
+               do {
+                       err_address =3D ioread32(denali->flash_reg +
                                                ECC_ERROR_ADDRESS);
                        err_sector =3D ECC_SECTOR(err_address);
                        err_byte =3D ECC_BYTE(err_address);


-                       err_correction_info =3D ioread32(denali->flash_reg =
+
+                       err_correction_info =3D ioread32(denali->flash_reg =
+
                                                ERR_CORRECTION_INFO);
-                       err_correction_value =3D
+                       err_correction_value =3D
                                ECC_CORRECTION_VALUE(err_correction_info);
                        err_device =3D ECC_ERR_DEVICE(err_correction_info);

-                       if (ECC_ERROR_CORRECTABLE(err_correction_info))
-                       {
+                       if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
                                /* offset in our buffer is computed as:
-                                  sector number * sector size + offset in
+                                  sector number * sector size + offset in
                                   sector
                                 */
-                               int offset =3D err_sector * ECC_SECTOR_SIZE=
 +
+                               int offset =3D err_sector * ECC_SECTOR_SIZE=
 +
                                                                err_byte;
-                               if (offset < denali->mtd.writesize)
-                               {
+                               if (offset < denali->mtd.writesize) {
                                        /* correct the ECC error */
                                        buf[offset] ^=3D err_correction_val=
ue;
                                        denali->mtd.ecc_stats.corrected++;
-                               }
-                               else
-                               {
+                               } else {
                                        /* bummer, couldn't correct the err=
or */
                                        printk(KERN_ERR "ECC offset invalid=
\n");
                                        denali->mtd.ecc_stats.failed++;
                                }
-                       }
-                       else
-                       {
-                               /* if the error is not correctable, need to
-                                * look at the page to see if it is an eras=
ed page.
-                                * if so, then it's not a real ECC error */
+                       } else {
+                               /* if the error is not correctable, need to
+                                * look at the page to see if it is an
+                                * erased page.
+                                * if so, then it's not a real ECC error */
                                check_erased_page =3D true;
                        }

-#if DEBUG_DENALI
-                       printk("Detected ECC error in page %d: err_addr =3D=
 0x%08x,"
-                               " info to fix is 0x%08x\n", denali->page, e=
rr_address,
+#if DEBUG_DENALI
+                       printk(KERN_INFO "Detected ECC error in page %d: "
+                               "err_addr =3D 0x%08x, info to fix is 0x%08x=
\n",
+                               denali->page, err_address,
                                err_correction_info);
 #endif
                } while (!ECC_LAST_ERR(err_correction_info));
@@ -1428,7 +1450,8 @@ static void denali_enable_dma(struct denali_nand_info=
 *denali, bool en)
 {
        uint32_t reg_val =3D 0x0;

-       if (en) reg_val =3D DMA_ENABLE__FLAG;
+       if (en)
+               reg_val =3D DMA_ENABLE__FLAG;

        denali_write32(reg_val, denali->flash_reg + DMA_ENABLE);
        ioread32(denali->flash_reg + DMA_ENABLE);
@@ -1458,9 +1481,9 @@ static void denali_setup_dma(struct denali_nand_info =
*denali, int op)
        index_addr(denali, mode | 0x14000, 0x2400);
 }

-/* writes a page. user specifies type, and this function handles the
+/* writes a page. user specifies type, and this function handles the
    configuration details. */
-static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
+static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
                        const uint8_t *buf, bool raw_xfer)
 {
        struct denali_nand_info *denali =3D mtd_to_denali(mtd);
@@ -1470,7 +1493,7 @@ static void write_page(struct mtd_info *mtd, struct n=
and_chip *chip,
        size_t size =3D denali->mtd.writesize + denali->mtd.oobsize;

        uint32_t irq_status =3D 0;
-       uint32_t irq_mask =3D INTR_STATUS0__DMA_CMD_COMP |
+       uint32_t irq_mask =3D INTR_STATUS0__DMA_CMD_COMP |
                                                INTR_STATUS0__PROGRAM_FAIL;

        /* if it is a raw xfer, we want to disable ecc, and send
@@ -1484,73 +1507,71 @@ static void write_page(struct mtd_info *mtd, struct=
 nand_chip *chip,
        memcpy(denali->buf.buf, buf, mtd->writesize);

        if (raw_xfer)
-       {
                /* transfer the data to the spare area */
-               memcpy(denali->buf.buf + mtd->writesize,
-                       chip->oob_poi,
-                       mtd->oobsize);
-       }
+               memcpy(denali->buf.buf + mtd->writesize,
+                       chip->oob_poi,
+                       mtd->oobsize);

        pci_dma_sync_single_for_device(pci_dev, addr, size, PCI_DMA_TODEVIC=
E);

        clear_interrupts(denali);
-       denali_enable_dma(denali, true);
+       denali_enable_dma(denali, true);

        denali_setup_dma(denali, DENALI_WRITE);

        /* wait for operation to complete */
        irq_status =3D wait_for_irq(denali, irq_mask);

-       if (irq_status =3D=3D 0)
-       {
-               printk(KERN_ERR "timeout on write_page (type =3D %d)\n", ra=
w_xfer);
-               denali->status =3D
-                  (irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_STATUS_=
FAIL :
-                                                            PASS;
+       if (irq_status =3D=3D 0) {
+               printk(KERN_ERR "timeout on write_page (type =3D %d)\n",
+                               raw_xfer);
+               denali->status =3D
+                       (irq_status & INTR_STATUS0__PROGRAM_FAIL) ?
+                       NAND_STATUS_FAIL : PASS;
        }

-       denali_enable_dma(denali, false);
+       denali_enable_dma(denali, false);
        pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_TODEVICE);
 }

 /* NAND core entry points */

-/* this is the callback that the NAND core calls to write a page. Since
-   writing a page with ECC or without is similar, all the work is done
+/* this is the callback that the NAND core calls to write a page. Since
+   writing a page with ECC or without is similar, all the work is done
    by write_page above.   */
-static void denali_write_page(struct mtd_info *mtd, struct nand_chip *chip=
,
+static void denali_write_page(struct mtd_info *mtd, struct nand_chip *chip=
,
                                const uint8_t *buf)
 {
        /* for regular page writes, we let HW handle all the ECC
-         * data written to the device. */
+        * data written to the device. */
        write_page(mtd, chip, buf, false);
 }

-/* This is the callback that the NAND core calls to write a page without E=
CC.
+/* This is the callback that the NAND core calls to write a page without E=
CC.
    raw access is similiar to ECC page writes, so all the work is done in t=
he
-   write_page() function above.
+   write_page() function above.
  */
-static void denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
+static void denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
                                        const uint8_t *buf)
 {
-       /* for raw page writes, we want to disable ECC and simply write
+       /* for raw page writes, we want to disable ECC and simply write
           whatever data is in the buffer. */
        write_page(mtd, chip, buf, true);
 }

-static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
+static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
                            int page)
 {
-       return write_oob_data(mtd, chip->oob_poi, page);
+       return write_oob_data(mtd, chip->oob_poi, page);
 }

-static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
+static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
                           int page, int sndcmd)
 {
        read_oob_data(mtd, chip->oob_poi, page);

-       return 0; /* notify NAND core to send command to
-                   * NAND device. */
+       return 0; /* notify NAND core to send command to
+                                NAND device. */
 }

 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
@@ -1563,7 +1584,7 @@ static int denali_read_page(struct mtd_info *mtd, str=
uct nand_chip *chip,
        size_t size =3D denali->mtd.writesize + denali->mtd.oobsize;

        uint32_t irq_status =3D 0;
-       uint32_t irq_mask =3D INTR_STATUS0__ECC_TRANSACTION_DONE |
+       uint32_t irq_mask =3D INTR_STATUS0__ECC_TRANSACTION_DONE |
                            INTR_STATUS0__ECC_ERR;
        bool check_erased_page =3D false;

@@ -1581,26 +1602,20 @@ static int denali_read_page(struct mtd_info *mtd, s=
truct nand_chip *chip,
        pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_FROMDEVICE=
);

        memcpy(buf, denali->buf.buf, mtd->writesize);
-
+
        check_erased_page =3D handle_ecc(denali, buf, chip->oob_poi, irq_st=
atus);
        denali_enable_dma(denali, false);

-       if (check_erased_page)
-       {
+       if (check_erased_page) {
                read_oob_data(&denali->mtd, chip->oob_poi, denali->page);

                /* check ECC failures that may have occurred on erased page=
s */
-               if (check_erased_page)
-               {
+               if (check_erased_page) {
                        if (!is_erased(buf, denali->mtd.writesize))
-                       {
                                denali->mtd.ecc_stats.failed++;
-                       }
                        if (!is_erased(buf, denali->mtd.oobsize))
-                       {
                                denali->mtd.ecc_stats.failed++;
-                       }
-               }
+               }
        }
        return 0;
 }
@@ -1616,7 +1631,7 @@ static int denali_read_page_raw(struct mtd_info *mtd,=
 struct nand_chip *chip,

        uint32_t irq_status =3D 0;
        uint32_t irq_mask =3D INTR_STATUS0__DMA_CMD_COMP;
-
+
        setup_ecc_for_xfer(denali, false, true);
        denali_enable_dma(denali, true);

@@ -1644,12 +1659,10 @@ static uint8_t denali_read_byte(struct mtd_info *mt=
d)
        uint8_t result =3D 0xff;

        if (denali->buf.head < denali->buf.tail)
-       {
                result =3D denali->buf.buf[denali->buf.head++];
-       }

 #if DEBUG_DENALI
-       printk("read byte -> 0x%02x\n", result);
+       printk(KERN_INFO "read byte -> 0x%02x\n", result);
 #endif
        return result;
 }
@@ -1658,7 +1671,7 @@ static void denali_select_chip(struct mtd_info *mtd, =
int chip)
 {
        struct denali_nand_info *denali =3D mtd_to_denali(mtd);
 #if DEBUG_DENALI
-       printk("denali select chip %d\n", chip);
+       printk(KERN_INFO "denali select chip %d\n", chip);
 #endif
        spin_lock_irq(&denali->irq_lock);
        denali->flash_bank =3D chip;
@@ -1672,7 +1685,7 @@ static int denali_waitfunc(struct mtd_info *mtd, stru=
ct nand_chip *chip)
        denali->status =3D 0;

 #if DEBUG_DENALI
-       printk("waitfunc %d\n", status);
+       printk(KERN_INFO "waitfunc %d\n", status);
 #endif
        return status;
 }
@@ -1684,76 +1697,77 @@ static void denali_erase(struct mtd_info *mtd, int =
page)
        uint32_t cmd =3D 0x0, irq_status =3D 0;

 #if DEBUG_DENALI
-       printk("erase page: %d\n", page);
+       printk(KERN_INFO "erase page: %d\n", page);
 #endif
        /* clear interrupts */
-       clear_interrupts(denali);
+       clear_interrupts(denali);

        /* setup page read request for access type */
        cmd =3D MODE_10 | BANK(denali->flash_bank) | page;
        index_addr(denali, (uint32_t)cmd, 0x1);

        /* wait for erase to complete or failure to occur */
-       irq_status =3D wait_for_irq(denali, INTR_STATUS0__ERASE_COMP |
+       irq_status =3D wait_for_irq(denali, INTR_STATUS0__ERASE_COMP |
                                        INTR_STATUS0__ERASE_FAIL);

-       denali->status =3D (irq_status & INTR_STATUS0__ERASE_FAIL) ? NAND_S=
TATUS_FAIL :
-                                                                PASS;
+       denali->status =3D (irq_status & INTR_STATUS0__ERASE_FAIL) ?
+                                       NAND_STATUS_FAIL : PASS;
 }

-static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col=
,
+static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col=
,
                           int page)
 {
        struct denali_nand_info *denali =3D mtd_to_denali(mtd);

 #if DEBUG_DENALI
-       printk("cmdfunc: 0x%x %d %d\n", cmd, col, page);
+       printk(KERN_INFO "cmdfunc: 0x%x %d %d\n", cmd, col, page);
 #endif
-       switch (cmd)
-       {
-               case NAND_CMD_PAGEPROG:
-                       break;
-               case NAND_CMD_STATUS:
-                       read_status(denali);
-                       break;
-               case NAND_CMD_READID:
-                       reset_buf(denali);
-                       if (denali->flash_bank < denali->total_used_banks)
-                       {
-                               /* write manufacturer information into nand
-                                  buffer for NAND subsystem to fetch.
-                                */
-                               write_byte_to_buf(denali, denali->dev_info.=
wDeviceMaker);
-                               write_byte_to_buf(denali, denali->dev_info.=
wDeviceID);
-                               write_byte_to_buf(denali, denali->dev_info.=
bDeviceParam0);
-                               write_byte_to_buf(denali, denali->dev_info.=
bDeviceParam1);
-                               write_byte_to_buf(denali, denali->dev_info.=
bDeviceParam2);
-                       }
-                       else
-                       {
-                               int i;
-                               for (i =3D 0; i < 5; i++)
-                                       write_byte_to_buf(denali, 0xff);
-                       }
-                       break;
-               case NAND_CMD_READ0:
-               case NAND_CMD_SEQIN:
-                       denali->page =3D page;
-                       break;
-               case NAND_CMD_RESET:
-                       reset_bank(denali);
-                       break;
-               case NAND_CMD_READOOB:
-                       /* TODO: Read OOB data */
-                       break;
-               default:
-                       printk(KERN_ERR ": unsupported command received 0x%=
x\n", cmd);
-                       break;
+       switch (cmd) {
+       case NAND_CMD_PAGEPROG:
+               break;
+       case NAND_CMD_STATUS:
+               read_status(denali);
+               break;
+       case NAND_CMD_READID:
+               reset_buf(denali);
+               if (denali->flash_bank < denali->total_used_banks) {
+                       /* write manufacturer information into nand
+                          buffer for NAND subsystem to fetch.
+                                */
+                       write_byte_to_buf(denali,
+                                       denali->dev_info.wDeviceMaker);
+                       write_byte_to_buf(denali,
+                                       denali->dev_info.wDeviceID);
+                       write_byte_to_buf(denali,
+                                       denali->dev_info.bDeviceParam0);
+                       write_byte_to_buf(denali,
+                                       denali->dev_info.bDeviceParam1);
+                       write_byte_to_buf(denali,
+                                       denali->dev_info.bDeviceParam2);
+               } else {
+                       int i;
+                       for (i =3D 0; i < 5; i++)
+                               write_byte_to_buf(denali, 0xff);
+               }
+               break;
+       case NAND_CMD_READ0:
+       case NAND_CMD_SEQIN:
+               denali->page =3D page;
+               break;
+       case NAND_CMD_RESET:
+               reset_bank(denali);
+               break;
+       case NAND_CMD_READOOB:
+               /* TODO: Read OOB data */
+               break;
+       default:
+               printk(KERN_ERR ": unsupported command received 0x%x\n", cm=
d);
+               break;
        }
 }

 /* stubs for ECC functions not used by the NAND core */
-static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
+static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
                                uint8_t *ecc_code)
 {
        printk(KERN_ERR "denali_ecc_calculate called unexpectedly\n");
@@ -1761,7 +1775,7 @@ static int denali_ecc_calculate(struct mtd_info *mtd,=
 const uint8_t *data,
        return -EIO;
 }

-static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
+static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
                                uint8_t *read_ecc, uint8_t *calc_ecc)
 {
        printk(KERN_ERR "denali_ecc_correct called unexpectedly\n");
@@ -1782,7 +1796,8 @@ static void denali_hw_init(struct denali_nand_info *d=
enali)
        denali_irq_init(denali);
        NAND_Flash_Reset(denali);
        denali_write32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
-       denali_write32(CHIP_EN_DONT_CARE__FLAG, denali->flash_reg + CHIP_EN=
ABLE_DONT_CARE);
+       denali_write32(CHIP_EN_DONT_CARE__FLAG,
+                       denali->flash_reg + CHIP_ENABLE_DONT_CARE);

        denali_write32(0x0, denali->flash_reg + SPARE_AREA_SKIP_BYTES);
        denali_write32(0xffff, denali->flash_reg + SPARE_AREA_MARKER);
@@ -1793,24 +1808,26 @@ static void denali_hw_init(struct denali_nand_info =
*denali)
 }

 /* ECC layout for SLC devices. Denali spec indicates SLC fixed at 4 bytes =
*/
-#define ECC_BYTES_SLC   4 * (2048 / ECC_SECTOR_SIZE)
+#define ECC_BYTES_SLC   (4 * (2048 / ECC_SECTOR_SIZE))
 static struct nand_ecclayout nand_oob_slc =3D {
        .eccbytes =3D 4,
        .eccpos =3D { 0, 1, 2, 3 }, /* not used */
-       .oobfree =3D {{
-                       .offset =3D ECC_BYTES_SLC,
-                       .length =3D 64 - ECC_BYTES_SLC
-                  }}
+       .oobfree =3D {{
+                       .offset =3D ECC_BYTES_SLC,
+                       .length =3D 64 - ECC_BYTES_SLC
+                  }
+       }
 };

-#define ECC_BYTES_MLC   14 * (2048 / ECC_SECTOR_SIZE)
+#define ECC_BYTES_MLC   (14 * (2048 / ECC_SECTOR_SIZE))
 static struct nand_ecclayout nand_oob_mlc_14bit =3D {
        .eccbytes =3D 14,
        .eccpos =3D { 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13 }, /* not u=
sed */
-       .oobfree =3D {{
-                       .offset =3D ECC_BYTES_MLC,
-                       .length =3D 64 - ECC_BYTES_MLC
-                  }}
+       .oobfree =3D {{
+                       .offset =3D ECC_BYTES_MLC,
+                       .length =3D 64 - ECC_BYTES_MLC
+                  }
+       }
 };

 static uint8_t bbt_pattern[] =3D {'B', 'b', 't', '0' };
@@ -1842,12 +1859,12 @@ void denali_drv_init(struct denali_nand_info *denal=
i)
        denali->idx =3D 0;

        /* setup interrupt handler */
-       /* the completion object will be used to notify
+       /* the completion object will be used to notify
         * the callee that the interrupt is done */
        init_completion(&denali->complete);

        /* the spinlock will be used to synchronize the ISR
-        * with any element that might be access shared
+        * with any element that might be access shared
         * data (interrupt status) */
        spin_lock_init(&denali->irq_lock);

@@ -1880,13 +1897,12 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
        }

        if (id->driver_data =3D=3D INTEL_CE4100) {
-               /* Due to a silicon limitation, we can only support
-                * ONFI timing mode 1 and below.
-                */
-               if (onfi_timing_mode < -1 || onfi_timing_mode > 1)
-               {
-                       printk("Intel CE4100 only supports ONFI timing mode=
 1 "
-                               "or below\n");
+               /* Due to a silicon limitation, we can only support
+                * ONFI timing mode 1 and below.
+                */
+               if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
+                       printk(KERN_ERR "Intel CE4100 only supports ONFI"
+                                       " timing mode 1 or below\n");
                        ret =3D -EINVAL;
                        goto failed_enable;
                }
@@ -1905,7 +1921,8 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
                        mem_base =3D csr_base + csr_len;
                        mem_len =3D csr_len;
                        nand_dbg_print(NAND_DBG_WARN,
-                                      "Spectra: No second BAR for PCI devi=
ce; assuming %08Lx\n",
+                                      "Spectra: No second BAR for PCI devi=
ce;"
+                                          " assuming %08Lx\n",
                                       (uint64_t)csr_base);
                }
        }
@@ -1913,16 +1930,15 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
        /* Is 32-bit DMA supported? */
        ret =3D pci_set_dma_mask(dev, DMA_BIT_MASK(32));

-       if (ret)
-       {
+       if (ret) {
                printk(KERN_ERR "Spectra: no usable DMA configuration\n");
                goto failed_enable;
        }
-       denali->buf.dma_buf =3D pci_map_single(dev, denali->buf.buf, DENALI=
_BUF_SIZE,
-                                        PCI_DMA_BIDIRECTIONAL);
+       denali->buf.dma_buf =3D pci_map_single(dev, denali->buf.buf,
+                                                       DENALI_BUF_SIZE,
+                                                       PCI_DMA_BIDIRECTION=
AL);

-       if (pci_dma_mapping_error(dev, denali->buf.dma_buf))
-       {
+       if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
                printk(KERN_ERR "Spectra: failed to map DMA buffer\n");
                goto failed_enable;
        }
@@ -1976,11 +1992,10 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)

        NAND_Read_Device_ID(denali);

-       /* MTD supported page sizes vary by kernel. We validate our
-           kernel supports the device here.
+       /* MTD supported page sizes vary by kernel. We validate our
+        * kernel supports the device here.
         */
-       if (denali->dev_info.wPageSize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSI=
ZE)
-       {
+       if (denali->dev_info.wPageSize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSI=
ZE) {
                ret =3D -ENODEV;
                printk(KERN_ERR "Spectra: device size not supported by this=
 "
                        "version of MTD.");
@@ -2009,18 +2024,17 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
        denali->nand.read_byte =3D denali_read_byte;
        denali->nand.waitfunc =3D denali_waitfunc;

-       /* scan for NAND devices attached to the controller
+       /* scan for NAND devices attached to the controller
         * this is the first stage in a two step process to register
-        * with the nand subsystem */
-       if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL))
-       {
+        * with the nand subsystem */
+       if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL)) {
                ret =3D -ENXIO;
                goto failed_nand;
        }
-
-       /* second stage of the NAND scan
-        * this stage requires information regarding ECC and
-         * bad block management. */
+
+       /* second stage of the NAND scan
+        * this stage requires information regarding ECC and
+        * bad block management. */

        /* Bad block management */
        denali->nand.bbt_td =3D &bbt_main_descr;
@@ -2030,20 +2044,17 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
        denali->nand.options |=3D NAND_USE_FLASH_BBT | NAND_SKIP_BBTSCAN;
        denali->nand.ecc.mode =3D NAND_ECC_HW_SYNDROME;

-       if (denali->dev_info.MLCDevice)
-       {
+       if (denali->dev_info.MLCDevice) {
                denali->nand.ecc.layout =3D &nand_oob_mlc_14bit;
                denali->nand.ecc.bytes =3D ECC_BYTES_MLC;
-       }
-       else /* SLC */
-       {
+       } else { /* SLC */
                denali->nand.ecc.layout =3D &nand_oob_slc;
                denali->nand.ecc.bytes =3D ECC_BYTES_SLC;
        }

-       /* These functions are required by the NAND core framework, otherwi=
se,
-           the NAND core will assert. However, we don't need them, so we'l=
l stub
-           them out. */
+       /* These functions are required by the NAND core framework, otherwi=
se,
+        * the NAND core will assert. However, we don't need them, so we'll=
 stub
+        * them out. */
        denali->nand.ecc.calculate =3D denali_ecc_calculate;
        denali->nand.ecc.correct =3D denali_ecc_correct;
        denali->nand.ecc.hwctl =3D denali_ecc_hwctl;
@@ -2058,15 +2069,15 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
        denali->nand.ecc.write_oob =3D denali_write_oob;
        denali->nand.erase_cmd =3D denali_erase;

-       if (nand_scan_tail(&denali->mtd))
-       {
+       if (nand_scan_tail(&denali->mtd)) {
                ret =3D -ENXIO;
                goto failed_nand;
        }

        ret =3D add_mtd_device(&denali->mtd);
        if (ret) {
-               printk(KERN_ERR "Spectra: Failed to register MTD device: %d=
\n", ret);
+               printk(KERN_ERR "Spectra: Failed to register"
+                               " MTD device: %d\n", ret);
                goto failed_nand;
        }
        return 0;
@@ -2079,7 +2090,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
  failed_remap_csr:
        pci_release_regions(dev);
  failed_req_csr:
-       pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
+       pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
                                                        PCI_DMA_BIDIRECTION=
AL);
  failed_enable:
        kfree(denali);
@@ -2103,7 +2114,7 @@ static void denali_pci_remove(struct pci_dev *dev)
        iounmap(denali->flash_mem);
        pci_release_regions(dev);
        pci_disable_device(dev);
-       pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
+       pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
                                                        PCI_DMA_BIDIRECTION=
AL);
        pci_set_drvdata(dev, NULL);
        kfree(denali);
@@ -2120,7 +2131,8 @@ static struct pci_driver denali_pci_driver =3D {

 static int __devinit denali_init(void)
 {
-       printk(KERN_INFO "Spectra MTD driver built on %s @ %s\n", __DATE__,=
 __TIME__);
+       printk(KERN_INFO "Spectra MTD driver built on %s @ %s\n",
+                       __DATE__, __TIME__);
        return pci_register_driver(&denali_pci_driver);
 }

--
1.6.6.1
