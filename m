From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Mon, 21 Jun 2010 18:30:43 +0800
Subject: [PATCH 1/5] [MTD/denali] fixed all checkpatch errors
Message-ID: <mailman.65.1278925440.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  806 +++++++++++++++++++++++------------------=
----
 drivers/mtd/nand/denali.h |   88 +++---
 2 files changed, 451 insertions(+), 443 deletions(-)

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

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 422a29a..a38c8ae 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -17,7 +17,7 @@
  *
  */

-#include <linux/mtd/nand.h>
+#include <linux/mtd/nand.h>

 #define DEVICE_RESET                           0x0
 #define     DEVICE_RESET__BANK0                                0x0001
@@ -83,7 +83,7 @@
 #define RE_2_WE                                        0x120
 #define     RE_2_WE__VALUE                             0x003f

-#define ACC_CLKS                               0x130
+#define ACC_CLKS                               0x130
 #define     ACC_CLKS__VALUE                            0x000f

 #define NUMBER_OF_PLANES                       0x140
@@ -622,43 +622,40 @@

 /* flash.h */
 struct device_info_tag {
-        uint16_t wDeviceMaker;
-        uint16_t wDeviceID;
+       uint16_t wDeviceMaker;
+       uint16_t wDeviceID;
        uint8_t  bDeviceParam0;
        uint8_t  bDeviceParam1;
        uint8_t  bDeviceParam2;
-        uint32_t wDeviceType;
-        uint32_t wSpectraStartBlock;
-        uint32_t wSpectraEndBlock;
-        uint32_t wTotalBlocks;
-        uint16_t wPagesPerBlock;
-        uint16_t wPageSize;
-        uint16_t wPageDataSize;
-        uint16_t wPageSpareSize;
-        uint16_t wNumPageSpareFlag;
-        uint16_t wECCBytesPerSector;
-        uint32_t wBlockSize;
-        uint32_t wBlockDataSize;
-        uint32_t wDataBlockNum;
-        uint8_t bPlaneNum;
-        uint16_t wDeviceMainAreaSize;
-        uint16_t wDeviceSpareAreaSize;
-        uint16_t wDevicesConnected;
-        uint16_t wDeviceWidth;
-        uint16_t wHWRevision;
-        uint16_t wHWFeatures;
-
-        uint16_t wONFIDevFeatures;
-        uint16_t wONFIOptCommands;
-        uint16_t wONFITimingMode;
-        uint16_t wONFIPgmCacheTimingMode;
-
-        uint16_t MLCDevice;
-        uint16_t wSpareSkipBytes;
-
-        uint8_t nBitsInPageNumber;
-        uint8_t nBitsInPageDataSize;
-        uint8_t nBitsInBlockDataSize;
+       uint32_t wDeviceType;
+       uint32_t wSpectraStartBlock;
+       uint32_t wSpectraEndBlock;
+       uint32_t wTotalBlocks;
+       uint16_t wPagesPerBlock;
+       uint16_t wPageSize;
+       uint16_t wPageDataSize;
+       uint16_t wPageSpareSize;
+       uint16_t wNumPageSpareFlag;
+       uint16_t wECCBytesPerSector;
+       uint32_t wBlockSize;
+       uint32_t wBlockDataSize;
+       uint32_t wDataBlockNum;
+       uint8_t bPlaneNum;
+       uint16_t wDeviceMainAreaSize;
+       uint16_t wDeviceSpareAreaSize;
+       uint16_t wDevicesConnected;
+       uint16_t wDeviceWidth;
+       uint16_t wHWRevision;
+       uint16_t wHWFeatures;
+       uint16_t wONFIDevFeatures;
+       uint16_t wONFIOptCommands;
+       uint16_t wONFITimingMode;
+       uint16_t wONFIPgmCacheTimingMode;
+       uint16_t MLCDevice;
+       uint16_t wSpareSkipBytes;
+       uint8_t nBitsInPageNumber;
+       uint8_t nBitsInPageDataSize;
+       uint8_t nBitsInBlockDataSize;
 };

 /* ffsdefs.h */
@@ -684,11 +681,11 @@ struct device_info_tag {
 #define NAND_DBG_TRACE 3

 #ifdef VERBOSE
-#define nand_dbg_print(level, args...)                  \
-        do {                                            \
-                if (level <=3D nand_debug_level)          \
-                        printk(KERN_ALERT args);        \
-        } while (0)
+#define nand_dbg_print(level, args...)         \
+       do {            \
+                       if (level <=3D nand_debug_level)  \
+                               printk(KERN_ALERT args);        \
+       } while (0)
 #else
 #define nand_dbg_print(level, args...)
 #endif
@@ -772,10 +769,9 @@ struct device_info_tag {
 #define ECC_SECTOR_SIZE     512
 #define LLD_MAX_FLASH_BANKS     4

-#define DENALI_BUF_SIZE                NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZ=
E
+#define DENALI_BUF_SIZE                (NAND_MAX_PAGESIZE + NAND_MAX_OOBSI=
ZE)

-struct nand_buf
-{
+struct nand_buf {
        int head;
        int tail;
        uint8_t buf[DENALI_BUF_SIZE];
@@ -810,7 +806,7 @@ struct denali_nand_info {

 static uint16_t  NAND_Flash_Reset(struct denali_nand_info *denali);
 static uint16_t  NAND_Read_Device_ID(struct denali_nand_info *denali);
-static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *de=
nali, uint16_t INT_ENABLE);
+static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *de=
nali,
+                                                       uint16_t INT_ENABLE=
);

 #endif /*_LLD_NAND_*/
-
--
1.6.6.1


--_002_5D8008F58939784290FAB48F549751981D09B718B2shsmsx502ccrc_
Content-Type: application/octet-stream;
	name="0001-MTD-denali-fixed-all-checkpatch-errors.patch"
Content-Description: 0001-MTD-denali-fixed-all-checkpatch-errors.patch
Content-Disposition: attachment;
	filename="0001-MTD-denali-fixed-all-checkpatch-errors.patch"; size=63235;
	creation-date="Mon, 21 Jun 2010 18:56:23 GMT";
	modification-date="Mon, 21 Jun 2010 18:56:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjMGIwZjk0MmIwNTY1ZjAxYjJiMTkwYjFiYmVlNDYxMGI5OTcyNDlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVhbnhpYW8gRG9uZyA8Y2h1YW54aWFvLmRvbmdAaW50ZWwu
Y29tPgpEYXRlOiBNb24sIDIxIEp1biAyMDEwIDE4OjMwOjQzICswODAwClN1YmplY3Q6IFtQQVRD
SCAxLzVdIFtNVEQvZGVuYWxpXSBmaXhlZCBhbGwgY2hlY2twYXRjaCBlcnJvcnMKClNpZ25lZC1v
ZmYtYnk6IENodWFueGlhbyBEb25nIDxjaHVhbnhpYW8uZG9uZ0BpbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9kZW5hbGkuYyB8ICA4MDYgKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5oIHwgICA4OCArKyst
LS0KIDIgZmlsZXMgY2hhbmdlZCwgNDUxIGluc2VydGlvbnMoKyksIDQ0MyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9kZW5hbGkuYwppbmRleCBjYTAzNDI4Li40ZTI1NWZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9uYW5kL2RlbmFsaS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmMKQEAgLTI5LDE1
ICsyOSwxNSBAQAogCiBNT0RVTEVfTElDRU5TRSgiR1BMIik7CiAKLS8qIFdlIGRlZmluZSBhIG1v
ZHVsZSBwYXJhbWV0ZXIgdGhhdCBhbGxvd3MgdGhlIHVzZXIgdG8gb3ZlcnJpZGUgCisvKiBXZSBk
ZWZpbmUgYSBtb2R1bGUgcGFyYW1ldGVyIHRoYXQgYWxsb3dzIHRoZSB1c2VyIHRvIG92ZXJyaWRl
CiAgKiB0aGUgaGFyZHdhcmUgYW5kIGRlY2lkZSB3aGF0IHRpbWluZyBtb2RlIHNob3VsZCBiZSB1
c2VkLgogICovCiAjZGVmaW5lIE5BTkRfREVGQVVMVF9USU1JTkdTCS0xCiAKIHN0YXRpYyBpbnQg
b25maV90aW1pbmdfbW9kZSA9IE5BTkRfREVGQVVMVF9USU1JTkdTOwogbW9kdWxlX3BhcmFtKG9u
ZmlfdGltaW5nX21vZGUsIGludCwgU19JUlVHTyk7Ci1NT0RVTEVfUEFSTV9ERVNDKG9uZmlfdGlt
aW5nX21vZGUsICJPdmVycmlkZXMgZGVmYXVsdCBPTkZJIHNldHRpbmcuIC0xIGluZGljYXRlcyIK
LQkJCQkJIiB1c2UgZGVmYXVsdCB0aW1pbmdzIik7CitNT0RVTEVfUEFSTV9ERVNDKG9uZmlfdGlt
aW5nX21vZGUsICJPdmVycmlkZXMgZGVmYXVsdCBPTkZJIHNldHRpbmcuIgorCQkJCQkiLTEgaW5k
aWNhdGVzIHVzZSBkZWZhdWx0IHRpbWluZ3MiKTsKIAogI2RlZmluZSBERU5BTElfTkFORF9OQU1F
ICAgICJkZW5hbGktbmFuZCIKIApAQCAtNTQsMTMgKzU0LDEzIEBAIE1PRFVMRV9QQVJNX0RFU0Mo
b25maV90aW1pbmdfbW9kZSwgIk92ZXJyaWRlcyBkZWZhdWx0IE9ORkkgc2V0dGluZy4gLTEgaW5k
aWNhdGVzCiAJCQlJTlRSX1NUQVRVUzBfX1JTVF9DT01QIHwgXAogCQkJSU5UUl9TVEFUVVMwX19F
UkFTRV9DT01QKQogCi0vKiBpbmRpY2F0ZXMgd2hldGhlciBvciBub3QgdGhlIGludGVybmFsIHZh
bHVlIGZvciB0aGUgZmxhc2ggYmFuayBpcyAKKy8qIGluZGljYXRlcyB3aGV0aGVyIG9yIG5vdCB0
aGUgaW50ZXJuYWwgdmFsdWUgZm9yIHRoZSBmbGFzaCBiYW5rIGlzCiAgICB2YWxpZCBvciBub3Qg
Ki8KLSNkZWZpbmUgQ0hJUF9TRUxFQ1RfSU5WQUxJRCAJLTEKKyNkZWZpbmUgQ0hJUF9TRUxFQ1Rf
SU5WQUxJRAktMQogCiAjZGVmaW5lIFNVUFBPUlRfOEJJVEVDQwkJMQogCi0vKiBUaGlzIG1hY3Jv
IGRpdmlkZXMgdHdvIGludGVnZXJzIGFuZCByb3VuZHMgZnJhY3Rpb25hbCB2YWx1ZXMgdXAgCisv
KiBUaGlzIG1hY3JvIGRpdmlkZXMgdHdvIGludGVnZXJzIGFuZCByb3VuZHMgZnJhY3Rpb25hbCB2
YWx1ZXMgdXAKICAqIHRvIHRoZSBuZWFyZXN0IGludGVnZXIgdmFsdWUuICovCiAjZGVmaW5lIENF
SUxfRElWKFgsIFkpICgoKFgpJShZKSkgPyAoKFgpLyhZKSsxKSA6ICgoWCkvKFkpKSkKIApAQCAt
ODMsNyArODMsNyBAQCBNT0RVTEVfUEFSTV9ERVNDKG9uZmlfdGltaW5nX21vZGUsICJPdmVycmlk
ZXMgZGVmYXVsdCBPTkZJIHNldHRpbmcuIC0xIGluZGljYXRlcwogI2RlZmluZSBBRERSX0NZQ0xF
CTEKICNkZWZpbmUgU1RBVFVTX0NZQ0xFCTIKIAotLyogdGhpcyBpcyBhIGhlbHBlciBtYWNybyB0
aGF0IGFsbG93cyB1cyB0byAKKy8qIHRoaXMgaXMgYSBoZWxwZXIgbWFjcm8gdGhhdCBhbGxvd3Mg
dXMgdG8KICAqIGZvcm1hdCB0aGUgYmFuayBpbnRvIHRoZSBwcm9wZXIgYml0cyBmb3IgdGhlIGNv
bnRyb2xsZXIgKi8KICNkZWZpbmUgQkFOSyh4KSAoKHgpIDw8IDI0KQogCkBAIC05NSw1OSArOTUs
NjMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGRlbmFsaV9wY2lfaWRzW10g
PSB7CiB9OwogCiAKLS8qIHRoZXNlIGFyZSBzdGF0aWMgbG9va3VwIHRhYmxlcyB0aGF0IGdpdmUg
dXMgZWFzeSBhY2Nlc3MgdG8gCi0gICByZWdpc3RlcnMgaW4gdGhlIE5BTkQgY29udHJvbGxlci4g
IAorLyogdGhlc2UgYXJlIHN0YXRpYyBsb29rdXAgdGFibGVzIHRoYXQgZ2l2ZSB1cyBlYXN5IGFj
Y2VzcyB0bworICAgcmVnaXN0ZXJzIGluIHRoZSBOQU5EIGNvbnRyb2xsZXIuCiAgKi8KLXN0YXRp
YyBjb25zdCB1aW50MzJfdCBpbnRyX3N0YXR1c19hZGRyZXNzZXNbNF0gPSB7SU5UUl9TVEFUVVMw
LCAKLQkJCQkJCSAgSU5UUl9TVEFUVVMxLCAKLQkJCQkJICAgICAJICBJTlRSX1NUQVRVUzIsIAor
c3RhdGljIGNvbnN0IHVpbnQzMl90IGludHJfc3RhdHVzX2FkZHJlc3Nlc1s0XSA9IHtJTlRSX1NU
QVRVUzAsCisJCQkJCQkgIElOVFJfU1RBVFVTMSwKKwkJCQkJCUlOVFJfU1RBVFVTMiwKIAkJCQkJ
CSAgSU5UUl9TVEFUVVMzfTsKIAogc3RhdGljIGNvbnN0IHVpbnQzMl90IGRldmljZV9yZXNldF9i
YW5rc1s0XSA9IHtERVZJQ0VfUkVTRVRfX0JBTkswLAotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBERVZJQ0VfUkVTRVRfX0JBTksxLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBERVZJQ0VfUkVTRVRfX0JBTksyLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBERVZJQ0VfUkVT
RVRfX0JBTkszfTsKKwkJCQkJCQlERVZJQ0VfUkVTRVRfX0JBTksxLAorCQkJCQkJCURFVklDRV9S
RVNFVF9fQkFOSzIsCisJCQkJCQkJREVWSUNFX1JFU0VUX19CQU5LM307CiAKIHN0YXRpYyBjb25z
dCB1aW50MzJfdCBvcGVyYXRpb25fdGltZW91dFs0XSA9IHtJTlRSX1NUQVRVUzBfX1RJTUVfT1VU
LAotICAgICAgICAgICAgICAgICAgICAgICAgCQkgICAgICBJTlRSX1NUQVRVUzFfX1RJTUVfT1VU
LAotCQkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRSX1NUQVRVUzJfX1RJTUVfT1VU
LAotCQkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRSX1NUQVRVUzNfX1RJTUVfT1VU
fTsKKwkJCQkJCQlJTlRSX1NUQVRVUzFfX1RJTUVfT1VULAorCQkJCQkJCUlOVFJfU1RBVFVTMl9f
VElNRV9PVVQsCisJCQkJCQkJSU5UUl9TVEFUVVMzX19USU1FX09VVH07CiAKIHN0YXRpYyBjb25z
dCB1aW50MzJfdCByZXNldF9jb21wbGV0ZVs0XSA9IHtJTlRSX1NUQVRVUzBfX1JTVF9DT01QLAot
ICAgICAgICAgICAgICAgIAkJICAgICAgICAgICBJTlRSX1NUQVRVUzFfX1JTVF9DT01QLAotCQkg
ICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRSX1NUQVRVUzJfX1JTVF9DT01QLAotCQkgICAg
ICAgICAgICAgICAgICAgICAgICAgICBJTlRSX1NUQVRVUzNfX1JTVF9DT01QfTsKKwkJCQkJCQlJ
TlRSX1NUQVRVUzFfX1JTVF9DT01QLAorCQkJCQkJCUlOVFJfU1RBVFVTMl9fUlNUX0NPTVAsCisJ
CQkJCQkJSU5UUl9TVEFUVVMzX19SU1RfQ09NUH07CiAKIC8qIHNwZWNpZmllcyB0aGUgZGVidWcg
bGV2ZWwgb2YgdGhlIGRyaXZlciAqLwotc3RhdGljIGludCBuYW5kX2RlYnVnX2xldmVsID0gMDsK
K3N0YXRpYyBpbnQgbmFuZF9kZWJ1Z19sZXZlbDsKIAogLyogZm9yd2FyZCBkZWNsYXJhdGlvbnMg
Ki8KIHN0YXRpYyB2b2lkIGNsZWFyX2ludGVycnVwdHMoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8g
KmRlbmFsaSk7Ci1zdGF0aWMgdWludDMyX3Qgd2FpdF9mb3JfaXJxKHN0cnVjdCBkZW5hbGlfbmFu
ZF9pbmZvICpkZW5hbGksIHVpbnQzMl90IGlycV9tYXNrKTsKLXN0YXRpYyB2b2lkIGRlbmFsaV9p
cnFfZW5hYmxlKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGksIHVpbnQzMl90IGludF9t
YXNrKTsKK3N0YXRpYyB1aW50MzJfdCB3YWl0X2Zvcl9pcnEoc3RydWN0IGRlbmFsaV9uYW5kX2lu
Zm8gKmRlbmFsaSwKKwkJCQkJCQl1aW50MzJfdCBpcnFfbWFzayk7CitzdGF0aWMgdm9pZCBkZW5h
bGlfaXJxX2VuYWJsZShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLAorCQkJCQkJCXVp
bnQzMl90IGludF9tYXNrKTsKIHN0YXRpYyB1aW50MzJfdCByZWFkX2ludGVycnVwdF9zdGF0dXMo
c3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSk7CiAKICNkZWZpbmUgREVCVUdfREVOQUxJ
IDAKIAogLyogVGhpcyBpcyBhIHdyYXBwZXIgZm9yIHdyaXRpbmcgdG8gdGhlIGRlbmFsaSByZWdp
c3RlcnMuCiAgKiB0aGlzIGFsbG93cyB1cyB0byBjcmVhdGUgZGVidWcgaW5mb3JtYXRpb24gc28g
d2UgY2FuCi0gKiBvYnNlcnZlIGhvdyB0aGUgZHJpdmVyIGlzIHByb2dyYW1taW5nIHRoZSBkZXZp
Y2UuIAorICogb2JzZXJ2ZSBob3cgdGhlIGRyaXZlciBpcyBwcm9ncmFtbWluZyB0aGUgZGV2aWNl
LgogICogaXQgdXNlcyBzdGFuZGFyZCBsaW51eCBjb252ZW50aW9uIGZvciAodmFsLCBhZGRyKSAq
Lwogc3RhdGljIHZvaWQgZGVuYWxpX3dyaXRlMzIodWludDMyX3QgdmFsdWUsIHZvaWQgKmFkZHIp
CiB7Ci0JaW93cml0ZTMyKHZhbHVlLCBhZGRyKTsJCisJaW93cml0ZTMyKHZhbHVlLCBhZGRyKTsK
IAogI2lmIERFQlVHX0RFTkFMSQotCXByaW50ayhLRVJOX0VSUiAid3JvdGU6IDB4JXggLT4gMHgl
eFxuIiwgdmFsdWUsICh1aW50MzJfdCkoKHVpbnQzMl90KWFkZHIgJiAweDFmZmYpKTsKKwlwcmlu
dGsoS0VSTl9FUlIgIndyb3RlOiAweCV4IC0+IDB4JXhcbiIsIHZhbHVlLAorCQkJKHVpbnQzMl90
KSgodWludDMyX3QpYWRkciAmIDB4MWZmZikpOwogI2VuZGlmCi19IAorfQogCi0vKiBDZXJ0YWlu
IG9wZXJhdGlvbnMgZm9yIHRoZSBkZW5hbGkgTkFORCBjb250cm9sbGVyIHVzZSBhbiBpbmRleGVk
IG1vZGUgdG8gcmVhZC93cml0ZSAKLSAgIGRhdGEuIFRoZSBvcGVyYXRpb24gaXMgcGVyZm9ybWVk
IGJ5IHdyaXRpbmcgdGhlIGFkZHJlc3MgdmFsdWUgb2YgdGhlIGNvbW1hbmQgdG8gCi0gICB0aGUg
ZGV2aWNlIG1lbW9yeSBmb2xsb3dlZCBieSB0aGUgZGF0YS4gVGhpcyBmdW5jdGlvbiBhYnN0cmFj
dHMgdGhpcyBjb21tb24gCi0gICBvcGVyYXRpb24uIAorLyogQ2VydGFpbiBvcGVyYXRpb25zIGZv
ciB0aGUgZGVuYWxpIE5BTkQgY29udHJvbGxlciB1c2UgYW4gaW5kZXhlZCBtb2RlCisgKiB0byBy
ZWFkL3dyaXRlIGRhdGEuIFRoZSBvcGVyYXRpb24gaXMgcGVyZm9ybWVkIGJ5IHdyaXRpbmcgdGhl
IGFkZHJlc3MKKyAqIHZhbHVlIG9mIHRoZSBjb21tYW5kIHRvIHRoZSBkZXZpY2UgbWVtb3J5IGZv
bGxvd2VkIGJ5IHRoZSBkYXRhLiBUaGlzCisgKiBmdW5jdGlvbiBhYnN0cmFjdHMgdGhpcyBjb21t
b24gb3BlcmF0aW9uLgogKi8KLXN0YXRpYyB2b2lkIGluZGV4X2FkZHIoc3RydWN0IGRlbmFsaV9u
YW5kX2luZm8gKmRlbmFsaSwgdWludDMyX3QgYWRkcmVzcywgdWludDMyX3QgZGF0YSkKK3N0YXRp
YyB2b2lkIGluZGV4X2FkZHIoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwKKwkJCQkJ
dWludDMyX3QgYWRkcmVzcywgdWludDMyX3QgZGF0YSkKIHsKIAlkZW5hbGlfd3JpdGUzMihhZGRy
ZXNzLCBkZW5hbGktPmZsYXNoX21lbSk7CiAJZGVuYWxpX3dyaXRlMzIoZGF0YSwgZGVuYWxpLT5m
bGFzaF9tZW0gKyAweDEwKTsKQEAgLTE2MSw3ICsxNjUsNyBAQCBzdGF0aWMgdm9pZCBpbmRleF9h
ZGRyX3JlYWRfZGF0YShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLAogCSpwZGF0YSA9
IGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfbWVtICsgMHgxMCk7CiB9CiAKLS8qIFdlIG5lZWQgdG8g
YnVmZmVyIHNvbWUgZGF0YSBmb3Igc29tZSBvZiB0aGUgTkFORCBjb3JlIHJvdXRpbmVzLiAKKy8q
IFdlIG5lZWQgdG8gYnVmZmVyIHNvbWUgZGF0YSBmb3Igc29tZSBvZiB0aGUgTkFORCBjb3JlIHJv
dXRpbmVzLgogICogVGhlIG9wZXJhdGlvbnMgbWFuYWdlIGJ1ZmZlcmluZyB0aGF0IGRhdGEuICov
CiBzdGF0aWMgdm9pZCByZXNldF9idWYoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkK
IHsKQEAgLTE4Myw3ICsxODcsNyBAQCBzdGF0aWMgdm9pZCByZWFkX3N0YXR1cyhzdHJ1Y3QgZGVu
YWxpX25hbmRfaW5mbyAqZGVuYWxpKQogCXJlc2V0X2J1ZihkZW5hbGkpOwogCiAJLyogaW5pdGlh
dGUgYSBkZXZpY2Ugc3RhdHVzIHJlYWQgKi8KLQljbWQgPSBNT0RFXzExIHwgQkFOSyhkZW5hbGkt
PmZsYXNoX2JhbmspOyAKKwljbWQgPSBNT0RFXzExIHwgQkFOSyhkZW5hbGktPmZsYXNoX2Jhbmsp
OwogCWluZGV4X2FkZHIoZGVuYWxpLCBjbWQgfCBDT01NQU5EX0NZQ0xFLCAweDcwKTsKIAlkZW5h
bGlfd3JpdGUzMihjbWQgfCBTVEFUVVNfQ1lDTEUsIGRlbmFsaS0+Zmxhc2hfbWVtKTsKIApAQCAt
MTkxLDcgKzE5NSw4IEBAIHN0YXRpYyB2b2lkIHJlYWRfc3RhdHVzKHN0cnVjdCBkZW5hbGlfbmFu
ZF9pbmZvICpkZW5hbGkpCiAJd3JpdGVfYnl0ZV90b19idWYoZGVuYWxpLCBpb3JlYWQzMihkZW5h
bGktPmZsYXNoX21lbSArIDB4MTApKTsKIAogI2lmIERFQlVHX0RFTkFMSQotCXByaW50aygiZGV2
aWNlIHJlcG9ydGluZyBzdGF0dXMgdmFsdWUgb2YgMHglMnhcbiIsIGRlbmFsaS0+YnVmLmJ1Zlsw
XSk7CisJcHJpbnRrKEtFUk5fSU5GTyAiZGV2aWNlIHJlcG9ydGluZyBzdGF0dXMgdmFsdWUgb2Yg
MHglMnhcbiIsCisJCQlkZW5hbGktPmJ1Zi5idWZbMF0pOwogI2VuZGlmCiB9CiAKQEAgLTE5OSw3
ICsyMDQsNyBAQCBzdGF0aWMgdm9pZCByZWFkX3N0YXR1cyhzdHJ1Y3QgZGVuYWxpX25hbmRfaW5m
byAqZGVuYWxpKQogc3RhdGljIHZvaWQgcmVzZXRfYmFuayhzdHJ1Y3QgZGVuYWxpX25hbmRfaW5m
byAqZGVuYWxpKQogewogCXVpbnQzMl90IGlycV9zdGF0dXMgPSAwOwotCXVpbnQzMl90IGlycV9t
YXNrID0gcmVzZXRfY29tcGxldGVbZGVuYWxpLT5mbGFzaF9iYW5rXSB8IAorCXVpbnQzMl90IGly
cV9tYXNrID0gcmVzZXRfY29tcGxldGVbZGVuYWxpLT5mbGFzaF9iYW5rXSB8CiAJCQkgICAgb3Bl
cmF0aW9uX3RpbWVvdXRbZGVuYWxpLT5mbGFzaF9iYW5rXTsKIAlpbnQgYmFuayA9IDA7CiAKQEAg
LTIwOSwxMSArMjE0LDkgQEAgc3RhdGljIHZvaWQgcmVzZXRfYmFuayhzdHJ1Y3QgZGVuYWxpX25h
bmRfaW5mbyAqZGVuYWxpKQogCWRlbmFsaV93cml0ZTMyKGJhbmssIGRlbmFsaS0+Zmxhc2hfcmVn
ICsgREVWSUNFX1JFU0VUKTsKIAogCWlycV9zdGF0dXMgPSB3YWl0X2Zvcl9pcnEoZGVuYWxpLCBp
cnFfbWFzayk7Ci0JCisKIAlpZiAoaXJxX3N0YXR1cyAmIG9wZXJhdGlvbl90aW1lb3V0W2RlbmFs
aS0+Zmxhc2hfYmFua10pCi0JewogCQlwcmludGsoS0VSTl9FUlIgInJlc2V0IGJhbmsgZmFpbGVk
LlxuIik7Ci0JfQogfQogCiAvKiBSZXNldCB0aGUgZmxhc2ggY29udHJvbGxlciAqLwpAQCAtMjI5
LDkgKzIzMiwxMiBAQCBzdGF0aWMgdWludDE2X3QgTkFORF9GbGFzaF9SZXNldChzdHJ1Y3QgZGVu
YWxpX25hbmRfaW5mbyAqZGVuYWxpKQogCQlkZW5hbGktPmZsYXNoX3JlZyArIGludHJfc3RhdHVz
X2FkZHJlc3Nlc1tpXSk7CiAKIAlmb3IgKGkgPSAwIDsgaSA8IExMRF9NQVhfRkxBU0hfQkFOS1M7
IGkrKykgewotCQlkZW5hbGlfd3JpdGUzMihkZXZpY2VfcmVzZXRfYmFua3NbaV0sIGRlbmFsaS0+
Zmxhc2hfcmVnICsgREVWSUNFX1JFU0VUKTsKLQkJd2hpbGUgKCEoaW9yZWFkMzIoZGVuYWxpLT5m
bGFzaF9yZWcgKyBpbnRyX3N0YXR1c19hZGRyZXNzZXNbaV0pICYKLQkJCShyZXNldF9jb21wbGV0
ZVtpXSB8IG9wZXJhdGlvbl90aW1lb3V0W2ldKSkpCisJCWRlbmFsaV93cml0ZTMyKGRldmljZV9y
ZXNldF9iYW5rc1tpXSwKKwkJCQlkZW5hbGktPmZsYXNoX3JlZyArIERFVklDRV9SRVNFVCk7CisJ
CXdoaWxlICghKGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsKKwkJCQkJaW50cl9zdGF0dXNf
YWRkcmVzc2VzW2ldKSAmCisJCQkJCShyZXNldF9jb21wbGV0ZVtpXSB8CisJCQkJCSBvcGVyYXRp
b25fdGltZW91dFtpXSkpKQogCQkJOwogCQlpZiAoaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcg
KyBpbnRyX3N0YXR1c19hZGRyZXNzZXNbaV0pICYKIAkJCW9wZXJhdGlvbl90aW1lb3V0W2ldKQpA
QCAtMjQ3LDEwICsyNTMsMTEgQEAgc3RhdGljIHVpbnQxNl90IE5BTkRfRmxhc2hfUmVzZXQoc3Ry
dWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkKIH0KIAogLyogdGhpcyByb3V0aW5lIGNhbGN1
bGF0ZXMgdGhlIE9ORkkgdGltaW5nIHZhbHVlcyBmb3IgYSBnaXZlbiBtb2RlIGFuZCBwcm9ncmFt
cwotICogdGhlIGNsb2NraW5nIHJlZ2lzdGVyIGFjY29yZGluZ2x5LiBUaGUgbW9kZSBpcyBkZXRl
cm1pbmVkIGJ5IHRoZSBnZXRfb25maV9uYW5kX3BhcmEKLSAgIHJvdXRpbmUuCisgKiB0aGUgY2xv
Y2tpbmcgcmVnaXN0ZXIgYWNjb3JkaW5nbHkuIFRoZSBtb2RlIGlzIGRldGVybWluZWQgYnkgdGhl
CisgKiBnZXRfb25maV9uYW5kX3BhcmEgcm91dGluZS4KICAqLwotc3RhdGljIHZvaWQgTkFORF9P
TkZpX1RpbWluZ19Nb2RlKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGksIHVpbnQxNl90
IG1vZGUpCitzdGF0aWMgdm9pZCBOQU5EX09ORmlfVGltaW5nX01vZGUoc3RydWN0IGRlbmFsaV9u
YW5kX2luZm8gKmRlbmFsaSwKKwkJCQkJCQkJdWludDE2X3QgbW9kZSkKIHsKIAl1aW50MTZfdCBU
cmVhWzZdID0gezQwLCAzMCwgMjUsIDIwLCAyMCwgMTZ9OwogCXVpbnQxNl90IFRycFs2XSA9IHs1
MCwgMjUsIDE3LCAxNSwgMTIsIDEwfTsKQEAgLTM1NiwxMCArMzYzLDExIEBAIHN0YXRpYyB2b2lk
IHNldF9lY2NfY29uZmlnKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAJCWRlbmFs
aV93cml0ZTMyKDgsIGRlbmFsaS0+Zmxhc2hfcmVnICsgRUNDX0NPUlJFQ1RJT04pOwogI2VuZGlm
CiAKLQlpZiAoKGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgRUNDX0NPUlJFQ1RJT04pICYg
RUNDX0NPUlJFQ1RJT05fX1ZBTFVFKQotCQk9PSAxKSB7CisJaWYgKChpb3JlYWQzMihkZW5hbGkt
PmZsYXNoX3JlZyArIEVDQ19DT1JSRUNUSU9OKSAmCisJCQkJRUNDX0NPUlJFQ1RJT05fX1ZBTFVF
KSA9PSAxKSB7CiAJCWRlbmFsaS0+ZGV2X2luZm8ud0VDQ0J5dGVzUGVyU2VjdG9yID0gNDsKLQkJ
ZGVuYWxpLT5kZXZfaW5mby53RUNDQnl0ZXNQZXJTZWN0b3IgKj0gZGVuYWxpLT5kZXZfaW5mby53
RGV2aWNlc0Nvbm5lY3RlZDsKKwkJZGVuYWxpLT5kZXZfaW5mby53RUNDQnl0ZXNQZXJTZWN0b3Ig
Kj0KKwkJCWRlbmFsaS0+ZGV2X2luZm8ud0RldmljZXNDb25uZWN0ZWQ7CiAJCWRlbmFsaS0+ZGV2
X2luZm8ud051bVBhZ2VTcGFyZUZsYWcgPQogCQkJZGVuYWxpLT5kZXZfaW5mby53UGFnZVNwYXJl
U2l6ZSAtCiAJCQlkZW5hbGktPmRldl9pbmZvLndQYWdlRGF0YVNpemUgLwpAQCAtMzc1LDggKzM4
MywxMCBAQCBzdGF0aWMgdm9pZCBzZXRfZWNjX2NvbmZpZyhzdHJ1Y3QgZGVuYWxpX25hbmRfaW5m
byAqZGVuYWxpKQogCQllbHNlCiAJCQlkZW5hbGktPmRldl9pbmZvLndFQ0NCeXRlc1BlclNlY3Rv
ciArPSAxOwogCi0JCWRlbmFsaS0+ZGV2X2luZm8ud0VDQ0J5dGVzUGVyU2VjdG9yICo9IGRlbmFs
aS0+ZGV2X2luZm8ud0RldmljZXNDb25uZWN0ZWQ7Ci0JCWRlbmFsaS0+ZGV2X2luZm8ud051bVBh
Z2VTcGFyZUZsYWcgPSBkZW5hbGktPmRldl9pbmZvLndQYWdlU3BhcmVTaXplIC0KKwkJZGVuYWxp
LT5kZXZfaW5mby53RUNDQnl0ZXNQZXJTZWN0b3IgKj0KKwkJCWRlbmFsaS0+ZGV2X2luZm8ud0Rl
dmljZXNDb25uZWN0ZWQ7CisJCWRlbmFsaS0+ZGV2X2luZm8ud051bVBhZ2VTcGFyZUZsYWcgPQor
CQkJZGVuYWxpLT5kZXZfaW5mby53UGFnZVNwYXJlU2l6ZSAtCiAJCQlkZW5hbGktPmRldl9pbmZv
LndQYWdlRGF0YVNpemUgLwogCQkJKEVDQ19TRUNUT1JfU0laRSAqIGRlbmFsaS0+ZGV2X2luZm8u
d0RldmljZXNDb25uZWN0ZWQpICoKIAkJCWRlbmFsaS0+ZGV2X2luZm8ud0VDQ0J5dGVzUGVyU2Vj
dG9yCkBAIC0zOTksOCArNDA5LDEwIEBAIHN0YXRpYyB1aW50MTZfdCBnZXRfb25maV9uYW5kX3Bh
cmEoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkKIAkJSU5UUl9TVEFUVVMwX19USU1F
X09VVCkpKQogCQk7CiAKLQlpZiAoaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBJTlRSX1NU
QVRVUzApICYgSU5UUl9TVEFUVVMwX19SU1RfQ09NUCkgewotCQlkZW5hbGlfd3JpdGUzMihERVZJ
Q0VfUkVTRVRfX0JBTksxLCBkZW5hbGktPmZsYXNoX3JlZyArIERFVklDRV9SRVNFVCk7CisJaWYg
KGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgSU5UUl9TVEFUVVMwKSAmCisJCQlJTlRSX1NU
QVRVUzBfX1JTVF9DT01QKSB7CisJCWRlbmFsaV93cml0ZTMyKERFVklDRV9SRVNFVF9fQkFOSzEs
CisJCQkJZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfUkVTRVQpOwogCQl3aGlsZSAoISgoaW9y
ZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBJTlRSX1NUQVRVUzEpICYKIAkJCUlOVFJfU1RBVFVT
MV9fUlNUX0NPTVApIHwKIAkJCShpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArIElOVFJfU1RB
VFVTMSkgJgpAQCAtNDIxLDkgKzQzMywxMSBAQCBzdGF0aWMgdWludDE2X3QgZ2V0X29uZmlfbmFu
ZF9wYXJhKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAJCQkJSU5UUl9TVEFUVVMy
X19SU1RfQ09NUCkgewogCQkJCWRlbmFsaV93cml0ZTMyKERFVklDRV9SRVNFVF9fQkFOSzMsCiAJ
CQkJCWRlbmFsaS0+Zmxhc2hfcmVnICsgREVWSUNFX1JFU0VUKTsKLQkJCQl3aGlsZSAoISgoaW9y
ZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBJTlRSX1NUQVRVUzMpICYKKwkJCQl3aGlsZSAoISgo
aW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKworCQkJCQkJCQlJTlRSX1NUQVRVUzMpICYKIAkJ
CQkJSU5UUl9TVEFUVVMzX19SU1RfQ09NUCkgfAotCQkJCQkoaW9yZWFkMzIoZGVuYWxpLT5mbGFz
aF9yZWcgKyBJTlRSX1NUQVRVUzMpICYKKwkJCQkJKGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVn
ICsKKwkJCQkJCQkgIElOVFJfU1RBVFVTMykgJgogCQkJCQlJTlRSX1NUQVRVUzNfX1RJTUVfT1VU
KSkpCiAJCQkJCTsKIAkJCX0gZWxzZSB7CkBAIC00MzQsMTAgKzQ0OCwxNCBAQCBzdGF0aWMgdWlu
dDE2X3QgZ2V0X29uZmlfbmFuZF9wYXJhKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkp
CiAJCX0KIAl9CiAKLQlkZW5hbGlfd3JpdGUzMihJTlRSX1NUQVRVUzBfX1RJTUVfT1VULCBkZW5h
bGktPmZsYXNoX3JlZyArIElOVFJfU1RBVFVTMCk7Ci0JZGVuYWxpX3dyaXRlMzIoSU5UUl9TVEFU
VVMxX19USU1FX09VVCwgZGVuYWxpLT5mbGFzaF9yZWcgKyBJTlRSX1NUQVRVUzEpOwotCWRlbmFs
aV93cml0ZTMyKElOVFJfU1RBVFVTMl9fVElNRV9PVVQsIGRlbmFsaS0+Zmxhc2hfcmVnICsgSU5U
Ul9TVEFUVVMyKTsKLQlkZW5hbGlfd3JpdGUzMihJTlRSX1NUQVRVUzNfX1RJTUVfT1VULCBkZW5h
bGktPmZsYXNoX3JlZyArIElOVFJfU1RBVFVTMyk7CisJZGVuYWxpX3dyaXRlMzIoSU5UUl9TVEFU
VVMwX19USU1FX09VVCwKKwkJCWRlbmFsaS0+Zmxhc2hfcmVnICsgSU5UUl9TVEFUVVMwKTsKKwlk
ZW5hbGlfd3JpdGUzMihJTlRSX1NUQVRVUzFfX1RJTUVfT1VULAorCQkJZGVuYWxpLT5mbGFzaF9y
ZWcgKyBJTlRSX1NUQVRVUzEpOworCWRlbmFsaV93cml0ZTMyKElOVFJfU1RBVFVTMl9fVElNRV9P
VVQsCisJCQlkZW5hbGktPmZsYXNoX3JlZyArIElOVFJfU1RBVFVTMik7CisJZGVuYWxpX3dyaXRl
MzIoSU5UUl9TVEFUVVMzX19USU1FX09VVCwKKwkJCWRlbmFsaS0+Zmxhc2hfcmVnICsgSU5UUl9T
VEFUVVMzKTsKIAogCWRlbmFsaS0+ZGV2X2luZm8ud09ORklEZXZGZWF0dXJlcyA9CiAJCWlvcmVh
ZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgT05GSV9ERVZJQ0VfRkVBVFVSRVMpOwpAQCAtNDUwLDgg
KzQ2OCwxMCBAQCBzdGF0aWMgdWludDE2X3QgZ2V0X29uZmlfbmFuZF9wYXJhKHN0cnVjdCBkZW5h
bGlfbmFuZF9pbmZvICpkZW5hbGkpCiAKIAluX29mX2x1bnMgPSBpb3JlYWQzMihkZW5hbGktPmZs
YXNoX3JlZyArIE9ORklfREVWSUNFX05PX09GX0xVTlMpICYKIAkJT05GSV9ERVZJQ0VfTk9fT0Zf
TFVOU19fTk9fT0ZfTFVOUzsKLQlibGtzX2x1bl9sID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9y
ZWcgKyBPTkZJX0RFVklDRV9OT19PRl9CTE9DS1NfUEVSX0xVTl9MKTsKLQlibGtzX2x1bl9oID0g
aW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBPTkZJX0RFVklDRV9OT19PRl9CTE9DS1NfUEVS
X0xVTl9VKTsKKwlibGtzX2x1bl9sID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKworCQkJ
T05GSV9ERVZJQ0VfTk9fT0ZfQkxPQ0tTX1BFUl9MVU5fTCk7CisJYmxrc19sdW5faCA9IGlvcmVh
ZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsKKwkJCU9ORklfREVWSUNFX05PX09GX0JMT0NLU19QRVJf
TFVOX1UpOwogCiAJYmxvY2twZXJsdW4gPSAoYmxrc19sdW5faCA8PCAxNikgfCBibGtzX2x1bl9s
OwogCkBAIC00NjIsNyArNDgyLDggQEAgc3RhdGljIHVpbnQxNl90IGdldF9vbmZpX25hbmRfcGFy
YShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQogCQlyZXR1cm4gRkFJTDsKIAogCWZv
ciAoaSA9IDU7IGkgPiAwOyBpLS0pIHsKLQkJaWYgKGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVn
ICsgT05GSV9USU1JTkdfTU9ERSkgJiAoMHgwMSA8PCBpKSkKKwkJaWYgKGlvcmVhZDMyKGRlbmFs
aS0+Zmxhc2hfcmVnICsgT05GSV9USU1JTkdfTU9ERSkgJgorCQkJCSgweDAxIDw8IGkpKQogCQkJ
YnJlYWs7CiAJfQogCkBAIC00OTcsNyArNTE4LDggQEAgc3RhdGljIHZvaWQgZ2V0X3NhbXN1bmdf
bmFuZF9wYXJhKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAJaW5kZXhfYWRkcihk
ZW5hbGksICh1aW50MzJfdCkoTU9ERV8xMSB8IDApLCAweDkwKTsKIAlpbmRleF9hZGRyKGRlbmFs
aSwgKHVpbnQzMl90KShNT0RFXzExIHwgMSksIDApOwogCWZvciAoaSA9IDA7IGkgPCA1OyBpKysp
Ci0JCWluZGV4X2FkZHJfcmVhZF9kYXRhKGRlbmFsaSwgKHVpbnQzMl90KShNT0RFXzExIHwgMiks
ICZpZF9ieXRlc1tpXSk7CisJCWluZGV4X2FkZHJfcmVhZF9kYXRhKGRlbmFsaSwgKHVpbnQzMl90
KShNT0RFXzExIHwgMiksCisJCQkJCQkJJmlkX2J5dGVzW2ldKTsKIAogCW5hbmRfZGJnX3ByaW50
KE5BTkRfREJHX0RFQlVHLAogCQkiSUQgYnl0ZXM6IDB4JXgsIDB4JXgsIDB4JXgsIDB4JXgsIDB4
JXhcbiIsCkBAIC01MTcsNyArNTM5LDggQEAgc3RhdGljIHZvaWQgZ2V0X3NhbXN1bmdfbmFuZF9w
YXJhKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAKIAlub19vZl9wbGFuZXMgPSAx
IDw8ICgoaWRfYnl0ZXNbNF0gJiAweDBjKSA+PiAyKTsKIAlwbGFuZV9zaXplICA9ICh1aW50NjRf
dCk2NCA8PCAoKGlkX2J5dGVzWzRdICYgMHg3MCkgPj4gNCk7Ci0JYmxrX3NpemUgPSA2NCA8PCAo
KGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgREVWSUNFX1BBUkFNXzEpICYgMHgzMCkgPj4g
NCk7CisJYmxrX3NpemUgPSA2NCA8PCAoKGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgREVW
SUNFX1BBUkFNXzEpICYKKwkJCQkweDMwKSA+PiA0KTsKIAljYXBhY2l0eSA9ICh1aW50NjRfdCkx
MjggKiBwbGFuZV9zaXplICogbm9fb2ZfcGxhbmVzOwogCiAJZG9fZGl2KGNhcGFjaXR5LCBibGtf
c2l6ZSk7CkBAIC01MzYsNyArNTU5LDggQEAgc3RhdGljIHZvaWQgZ2V0X3Rvc2hpYmFfbmFuZF9w
YXJhKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAJCWRlbmFsaV93cml0ZTMyKDIx
NiwgZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfU1BBUkVfQVJFQV9TSVpFKTsKIAkJdG1wID0g
aW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VTX0NPTk5FQ1RFRCkgKgogCQkJaW9y
ZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfU1BBUkVfQVJFQV9TSVpFKTsKLQkJZGVu
YWxpX3dyaXRlMzIodG1wLCBkZW5hbGktPmZsYXNoX3JlZyArIExPR0lDQUxfUEFHRV9TUEFSRV9T
SVpFKTsKKwkJZGVuYWxpX3dyaXRlMzIodG1wLCBkZW5hbGktPmZsYXNoX3JlZyArCisJCQkJTE9H
SUNBTF9QQUdFX1NQQVJFX1NJWkUpOwogI2lmIFNVUFBPUlRfMTVCSVRFQ0MKIAkJZGVuYWxpX3dy
aXRlMzIoMTUsIGRlbmFsaS0+Zmxhc2hfcmVnICsgRUNDX0NPUlJFQ1RJT04pOwogI2VsaWYgU1VQ
UE9SVF84QklURUNDCkBAIC01NzUsMTAgKzU5OSwxNCBAQCBzdGF0aWMgdm9pZCBnZXRfaHluaXhf
bmFuZF9wYXJhKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAJCWRlbmFsaV93cml0
ZTMyKDEyOCwgZGVuYWxpLT5mbGFzaF9yZWcgKyBQQUdFU19QRVJfQkxPQ0spOwogCQlkZW5hbGlf
d3JpdGUzMig0MDk2LCBkZW5hbGktPmZsYXNoX3JlZyArIERFVklDRV9NQUlOX0FSRUFfU0laRSk7
CiAJCWRlbmFsaV93cml0ZTMyKDIyNCwgZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfU1BBUkVf
QVJFQV9TSVpFKTsKLQkJbWFpbl9zaXplID0gNDA5NiAqIGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hf
cmVnICsgREVWSUNFU19DT05ORUNURUQpOwotCQlzcGFyZV9zaXplID0gMjI0ICogaW9yZWFkMzIo
ZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VTX0NPTk5FQ1RFRCk7Ci0JCWRlbmFsaV93cml0ZTMy
KG1haW5fc2l6ZSwgZGVuYWxpLT5mbGFzaF9yZWcgKyBMT0dJQ0FMX1BBR0VfREFUQV9TSVpFKTsK
LQkJZGVuYWxpX3dyaXRlMzIoc3BhcmVfc2l6ZSwgZGVuYWxpLT5mbGFzaF9yZWcgKyBMT0dJQ0FM
X1BBR0VfU1BBUkVfU0laRSk7CisJCW1haW5fc2l6ZSA9IDQwOTYgKiBpb3JlYWQzMihkZW5hbGkt
PmZsYXNoX3JlZyArCisJCQkJCQkJREVWSUNFU19DT05ORUNURUQpOworCQlzcGFyZV9zaXplID0g
MjI0ICogaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKworCQkJCQkJCURFVklDRVNfQ09OTkVD
VEVEKTsKKwkJZGVuYWxpX3dyaXRlMzIobWFpbl9zaXplLCBkZW5hbGktPmZsYXNoX3JlZyArCisJ
CQkJCQkJTE9HSUNBTF9QQUdFX0RBVEFfU0laRSk7CisJCWRlbmFsaV93cml0ZTMyKHNwYXJlX3Np
emUsIGRlbmFsaS0+Zmxhc2hfcmVnICsKKwkJCQkJCUxPR0lDQUxfUEFHRV9TUEFSRV9TSVpFKTsK
IAkJZGVuYWxpX3dyaXRlMzIoMCwgZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfV0lEVEgpOwog
I2lmIFNVUFBPUlRfMTVCSVRFQ0MKIAkJZGVuYWxpX3dyaXRlMzIoMTUsIGRlbmFsaS0+Zmxhc2hf
cmVnICsgRUNDX0NPUlJFQ1RJT04pOwpAQCAtNjEwLDcgKzYzOCw3IEBAIHN0YXRpYyB2b2lkIGdl
dF9oeW5peF9uYW5kX3BhcmEoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkKIH0KIAog
LyogZGV0ZXJtaW5lcyBob3cgbWFueSBOQU5EIGNoaXBzIGFyZSBjb25uZWN0ZWQgdG8gdGhlIGNv
bnRyb2xsZXIuIE5vdGUgZm9yCi0gICBJbnRlbCBDRTQxMDAgZGV2aWNlcyB3ZSBkb24ndCBzdXBw
b3J0IG1vcmUgdGhhbiBvbmUgZGV2aWNlLiAKKyAgIEludGVsIENFNDEwMCBkZXZpY2VzIHdlIGRv
bid0IHN1cHBvcnQgbW9yZSB0aGFuIG9uZSBkZXZpY2UuCiAgKi8KIHN0YXRpYyB2b2lkIGZpbmRf
dmFsaWRfYmFua3Moc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkKIHsKQEAgLTYyMSw3
ICs2NDksOCBAQCBzdGF0aWMgdm9pZCBmaW5kX3ZhbGlkX2JhbmtzKHN0cnVjdCBkZW5hbGlfbmFu
ZF9pbmZvICpkZW5hbGkpCiAJZm9yIChpID0gMDsgaSA8IExMRF9NQVhfRkxBU0hfQkFOS1M7IGkr
KykgewogCQlpbmRleF9hZGRyKGRlbmFsaSwgKHVpbnQzMl90KShNT0RFXzExIHwgKGkgPDwgMjQp
IHwgMCksIDB4OTApOwogCQlpbmRleF9hZGRyKGRlbmFsaSwgKHVpbnQzMl90KShNT0RFXzExIHwg
KGkgPDwgMjQpIHwgMSksIDApOwotCQlpbmRleF9hZGRyX3JlYWRfZGF0YShkZW5hbGksICh1aW50
MzJfdCkoTU9ERV8xMSB8IChpIDw8IDI0KSB8IDIpLCAmaWRbaV0pOworCQlpbmRleF9hZGRyX3Jl
YWRfZGF0YShkZW5hbGksCisJCQkJKHVpbnQzMl90KShNT0RFXzExIHwgKGkgPDwgMjQpIHwgMiks
ICZpZFtpXSk7CiAKIAkJbmFuZF9kYmdfcHJpbnQoTkFORF9EQkdfREVCVUcsCiAJCQkiUmV0dXJu
IDFzdCBJRCBmb3IgYmFua1slZF06ICV4XG4iLCBpLCBpZFtpXSk7CkBAIC02MzgsMTggKzY2Nywx
NSBAQCBzdGF0aWMgdm9pZCBmaW5kX3ZhbGlkX2JhbmtzKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZv
ICpkZW5hbGkpCiAJfQogCiAJaWYgKGRlbmFsaS0+cGxhdGZvcm0gPT0gSU5URUxfQ0U0MTAwKQot
CXsKIAkJLyogUGxhdGZvcm0gbGltaXRhdGlvbnMgb2YgdGhlIENFNDEwMCBkZXZpY2UgbGltaXQK
IAkJICogdXNlcnMgdG8gYSBzaW5nbGUgY2hpcCBzb2x1dGlvbiBmb3IgTkFORC4KLSAgICAgICAg
ICAgICAgICAgKiBNdWx0aWNoaXAgc3VwcG9ydCBpcyBub3QgZW5hYmxlZC4gCi0JCSAqLyAKLQkJ
aWYgKGRlbmFsaS0+dG90YWxfdXNlZF9iYW5rcyAhPSAxKQotCQl7CisJCSAqIE11bHRpY2hpcCBz
dXBwb3J0IGlzIG5vdCBlbmFibGVkLgorCQkgKi8KKwkJaWYgKGRlbmFsaS0+dG90YWxfdXNlZF9i
YW5rcyAhPSAxKSB7CiAJCQlwcmludGsoS0VSTl9FUlIgIlNvcnJ5LCBJbnRlbCBDRTQxMDAgb25s
eSBzdXBwb3J0cyAiCiAJCQkJCSJhIHNpbmdsZSBOQU5EIGRldmljZS5cbiIpOwogCQkJQlVHKCk7
CiAJCX0KLQl9CiAJbmFuZF9kYmdfcHJpbnQoTkFORF9EQkdfREVCVUcsCiAJCSJkZW5hbGktPnRv
dGFsX3VzZWRfYmFua3M6ICVkXG4iLCBkZW5hbGktPnRvdGFsX3VzZWRfYmFua3MpOwogfQpAQCAt
Njc1LDcgKzcwMSw4IEBAIHN0YXRpYyB2b2lkIGRldGVjdF9wYXJ0aXRpb25fZmVhdHVyZShzdHJ1
Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQogCQkJICAgIChpb3JlYWQzMihkZW5hbGktPmZs
YXNoX3JlZyArIE1BWF9CTEtfQUREUl8xKSAmCiAJCQkgICAgTUFYX0JMS19BRERSXzFfX1ZBTFVF
KTsKIAotCQkJZGVuYWxpLT5kZXZfaW5mby53VG90YWxCbG9ja3MgKj0gZGVuYWxpLT50b3RhbF91
c2VkX2JhbmtzOworCQkJZGVuYWxpLT5kZXZfaW5mby53VG90YWxCbG9ja3MgKj0KKwkJCQlkZW5h
bGktPnRvdGFsX3VzZWRfYmFua3M7CiAKIAkJCWlmIChkZW5hbGktPmRldl9pbmZvLndTcGVjdHJh
RW5kQmxvY2sgPj0KIAkJCSAgICBkZW5hbGktPmRldl9pbmZvLndUb3RhbEJsb2NrcykgewpAQCAt
Njg3LDggKzcxNCwxMCBAQCBzdGF0aWMgdm9pZCBkZXRlY3RfcGFydGl0aW9uX2ZlYXR1cmUoc3Ry
dWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkKIAkJCQlkZW5hbGktPmRldl9pbmZvLndTcGVj
dHJhRW5kQmxvY2sgLQogCQkJCWRlbmFsaS0+ZGV2X2luZm8ud1NwZWN0cmFTdGFydEJsb2NrICsg
MTsKIAkJfSBlbHNlIHsKLQkJCWRlbmFsaS0+ZGV2X2luZm8ud1RvdGFsQmxvY2tzICo9IGRlbmFs
aS0+dG90YWxfdXNlZF9iYW5rczsKLQkJCWRlbmFsaS0+ZGV2X2luZm8ud1NwZWN0cmFTdGFydEJs
b2NrID0gU1BFQ1RSQV9TVEFSVF9CTE9DSzsKKwkJCWRlbmFsaS0+ZGV2X2luZm8ud1RvdGFsQmxv
Y2tzICo9CisJCQkJZGVuYWxpLT50b3RhbF91c2VkX2JhbmtzOworCQkJZGVuYWxpLT5kZXZfaW5m
by53U3BlY3RyYVN0YXJ0QmxvY2sgPQorCQkJCVNQRUNUUkFfU1RBUlRfQkxPQ0s7CiAJCQlkZW5h
bGktPmRldl9pbmZvLndTcGVjdHJhRW5kQmxvY2sgPQogCQkJCWRlbmFsaS0+ZGV2X2luZm8ud1Rv
dGFsQmxvY2tzIC0gMTsKIAkJCWRlbmFsaS0+ZGV2X2luZm8ud0RhdGFCbG9ja051bSA9CkBAIC02
OTgsNyArNzI3LDggQEAgc3RhdGljIHZvaWQgZGV0ZWN0X3BhcnRpdGlvbl9mZWF0dXJlKHN0cnVj
dCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAJfSBlbHNlIHsKIAkJZGVuYWxpLT5kZXZfaW5m
by53VG90YWxCbG9ja3MgKj0gZGVuYWxpLT50b3RhbF91c2VkX2JhbmtzOwogCQlkZW5hbGktPmRl
dl9pbmZvLndTcGVjdHJhU3RhcnRCbG9jayA9IFNQRUNUUkFfU1RBUlRfQkxPQ0s7Ci0JCWRlbmFs
aS0+ZGV2X2luZm8ud1NwZWN0cmFFbmRCbG9jayA9IGRlbmFsaS0+ZGV2X2luZm8ud1RvdGFsQmxv
Y2tzIC0gMTsKKwkJZGVuYWxpLT5kZXZfaW5mby53U3BlY3RyYUVuZEJsb2NrID0KKwkJCWRlbmFs
aS0+ZGV2X2luZm8ud1RvdGFsQmxvY2tzIC0gMTsKIAkJZGVuYWxpLT5kZXZfaW5mby53RGF0YUJs
b2NrTnVtID0KIAkJCWRlbmFsaS0+ZGV2X2luZm8ud1NwZWN0cmFFbmRCbG9jayAtCiAJCQlkZW5h
bGktPmRldl9pbmZvLndTcGVjdHJhU3RhcnRCbG9jayArIDE7CkBAIC03ODAsMTMgKzgxMCwxOSBA
QCBzdGF0aWMgdWludDE2X3QgTkFORF9SZWFkX0RldmljZV9JRChzdHJ1Y3QgZGVuYWxpX25hbmRf
aW5mbyAqZGVuYWxpKQogCW5hbmRfZGJnX3ByaW50KE5BTkRfREJHX1RSQUNFLCAiJXMsIExpbmUg
JWQsIEZ1bmN0aW9uOiAlc1xuIiwKIAkJICAgICAgIF9fRklMRV9fLCBfX0xJTkVfXywgX19mdW5j
X18pOwogCi0JZGVuYWxpLT5kZXZfaW5mby53RGV2aWNlTWFrZXIgPSBpb3JlYWQzMihkZW5hbGkt
PmZsYXNoX3JlZyArIE1BTlVGQUNUVVJFUl9JRCk7Ci0JZGVuYWxpLT5kZXZfaW5mby53RGV2aWNl
SUQgPSBpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArIERFVklDRV9JRCk7Ci0JZGVuYWxpLT5k
ZXZfaW5mby5iRGV2aWNlUGFyYW0wID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJ
Q0VfUEFSQU1fMCk7Ci0JZGVuYWxpLT5kZXZfaW5mby5iRGV2aWNlUGFyYW0xID0gaW9yZWFkMzIo
ZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfUEFSQU1fMSk7Ci0JZGVuYWxpLT5kZXZfaW5mby5i
RGV2aWNlUGFyYW0yID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfUEFSQU1f
Mik7CisJZGVuYWxpLT5kZXZfaW5mby53RGV2aWNlTWFrZXIgPQorCQlpb3JlYWQzMihkZW5hbGkt
PmZsYXNoX3JlZyArIE1BTlVGQUNUVVJFUl9JRCk7CisJZGVuYWxpLT5kZXZfaW5mby53RGV2aWNl
SUQgPQorCQlpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArIERFVklDRV9JRCk7CisJZGVuYWxp
LT5kZXZfaW5mby5iRGV2aWNlUGFyYW0wID0KKwkJaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcg
KyBERVZJQ0VfUEFSQU1fMCk7CisJZGVuYWxpLT5kZXZfaW5mby5iRGV2aWNlUGFyYW0xID0KKwkJ
aW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfUEFSQU1fMSk7CisJZGVuYWxpLT5k
ZXZfaW5mby5iRGV2aWNlUGFyYW0yID0KKwkJaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBE
RVZJQ0VfUEFSQU1fMik7CiAKLQlkZW5hbGktPmRldl9pbmZvLk1MQ0RldmljZSA9IGlvcmVhZDMy
KGRlbmFsaS0+Zmxhc2hfcmVnICsgREVWSUNFX1BBUkFNXzApICYgMHgwYzsKKwlkZW5hbGktPmRl
dl9pbmZvLk1MQ0RldmljZSA9CisJCWlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgREVWSUNF
X1BBUkFNXzApICYgMHgwYzsKIAogCWlmIChpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArIE9O
RklfREVWSUNFX05PX09GX0xVTlMpICYKIAkJT05GSV9ERVZJQ0VfTk9fT0ZfTFVOU19fT05GSV9E
RVZJQ0UpIHsgLyogT05GSSAxLjAgTkFORCAqLwpAQCAtODM1LDcgKzg3MSw4IEBAIHN0YXRpYyB1
aW50MTZfdCBOQU5EX1JlYWRfRGV2aWNlX0lEKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5h
bGkpCiAJZGVuYWxpLT5kZXZfaW5mby53UGFnZVNwYXJlU2l6ZSA9CiAJCWlvcmVhZDMyKGRlbmFs
aS0+Zmxhc2hfcmVnICsgTE9HSUNBTF9QQUdFX1NQQVJFX1NJWkUpOwogCi0JZGVuYWxpLT5kZXZf
aW5mby53UGFnZXNQZXJCbG9jayA9IGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgUEFHRVNf
UEVSX0JMT0NLKTsKKwlkZW5hbGktPmRldl9pbmZvLndQYWdlc1BlckJsb2NrID0KKwkJaW9yZWFk
MzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBQQUdFU19QRVJfQkxPQ0spOwogCiAJZGVuYWxpLT5kZXZf
aW5mby53UGFnZVNpemUgPQogCSAgICBkZW5hbGktPmRldl9pbmZvLndQYWdlRGF0YVNpemUgKyBk
ZW5hbGktPmRldl9pbmZvLndQYWdlU3BhcmVTaXplOwpAQCAtODQ0LDExICs4ODEsMTMgQEAgc3Rh
dGljIHVpbnQxNl90IE5BTkRfUmVhZF9EZXZpY2VfSUQoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8g
KmRlbmFsaSkKIAlkZW5hbGktPmRldl9pbmZvLndCbG9ja0RhdGFTaXplID0KIAkgICAgZGVuYWxp
LT5kZXZfaW5mby53UGFnZXNQZXJCbG9jayAqIGRlbmFsaS0+ZGV2X2luZm8ud1BhZ2VEYXRhU2l6
ZTsKIAotCWRlbmFsaS0+ZGV2X2luZm8ud0RldmljZVdpZHRoID0gaW9yZWFkMzIoZGVuYWxpLT5m
bGFzaF9yZWcgKyBERVZJQ0VfV0lEVEgpOworCWRlbmFsaS0+ZGV2X2luZm8ud0RldmljZVdpZHRo
ID0KKwkJaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VfV0lEVEgpOwogCWRlbmFs
aS0+ZGV2X2luZm8ud0RldmljZVR5cGUgPQogCQkoKGlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVn
ICsgREVWSUNFX1dJRFRIKSA+IDApID8gMTYgOiA4KTsKIAotCWRlbmFsaS0+ZGV2X2luZm8ud0Rl
dmljZXNDb25uZWN0ZWQgPSBpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArIERFVklDRVNfQ09O
TkVDVEVEKTsKKwlkZW5hbGktPmRldl9pbmZvLndEZXZpY2VzQ29ubmVjdGVkID0KKwkJaW9yZWFk
MzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBERVZJQ0VTX0NPTk5FQ1RFRCk7CiAKIAlkZW5hbGktPmRl
dl9pbmZvLndTcGFyZVNraXBCeXRlcyA9CiAJCWlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsg
U1BBUkVfQVJFQV9TS0lQX0JZVEVTKSAqCkBAIC04ODUsMTIgKzkyNCwxMCBAQCBzdGF0aWMgdWlu
dDE2X3QgTkFORF9SZWFkX0RldmljZV9JRChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxp
KQogCWR1bXBfZGV2aWNlX2luZm8oZGVuYWxpKTsKIAogCS8qIElmIHRoZSB1c2VyIHNwZWNpZmll
ZCB0byBvdmVycmlkZSB0aGUgZGVmYXVsdCB0aW1pbmdzCi0JICogd2l0aCBhIHNwZWNpZmljIE9O
RkkgbW9kZSwgd2UgYXBwbHkgdGhvc2UgY2hhbmdlcyBoZXJlLiAKKwkgKiB3aXRoIGEgc3BlY2lm
aWMgT05GSSBtb2RlLCB3ZSBhcHBseSB0aG9zZSBjaGFuZ2VzIGhlcmUuCiAJICovCiAJaWYgKG9u
ZmlfdGltaW5nX21vZGUgIT0gTkFORF9ERUZBVUxUX1RJTUlOR1MpCi0JewogCQlOQU5EX09ORmlf
VGltaW5nX01vZGUoZGVuYWxpLCBvbmZpX3RpbWluZ19tb2RlKTsKLQl9CiAKIAlyZXR1cm4gc3Rh
dHVzOwogfQpAQCAtOTEyLDcgKzk0OSw3IEBAIHN0YXRpYyB2b2lkIE5BTkRfTExEX0VuYWJsZV9E
aXNhYmxlX0ludGVycnVwdHMoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwKICAqLwog
c3RhdGljIGlubGluZSBib29sIGlzX2ZsYXNoX2JhbmtfdmFsaWQoaW50IGZsYXNoX2JhbmspCiB7
Ci0JcmV0dXJuIChmbGFzaF9iYW5rID49IDAgJiYgZmxhc2hfYmFuayA8IDQpOyAKKwlyZXR1cm4g
KGZsYXNoX2JhbmsgPj0gMCAmJiBmbGFzaF9iYW5rIDwgNCk7CiB9CiAKIHN0YXRpYyB2b2lkIGRl
bmFsaV9pcnFfaW5pdChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQpAQCAtOTM5LDcg
Kzk3Niw4IEBAIHN0YXRpYyB2b2lkIGRlbmFsaV9pcnFfY2xlYW51cChpbnQgaXJxbnVtLCBzdHJ1
Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQogCWZyZWVfaXJxKGlycW51bSwgZGVuYWxpKTsK
IH0KIAotc3RhdGljIHZvaWQgZGVuYWxpX2lycV9lbmFibGUoc3RydWN0IGRlbmFsaV9uYW5kX2lu
Zm8gKmRlbmFsaSwgdWludDMyX3QgaW50X21hc2spCitzdGF0aWMgdm9pZCBkZW5hbGlfaXJxX2Vu
YWJsZShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLAorCQkJCQkJCXVpbnQzMl90IGlu
dF9tYXNrKQogewogCWRlbmFsaV93cml0ZTMyKGludF9tYXNrLCBkZW5hbGktPmZsYXNoX3JlZyAr
IElOVFJfRU4wKTsKIAlkZW5hbGlfd3JpdGUzMihpbnRfbWFzaywgZGVuYWxpLT5mbGFzaF9yZWcg
KyBJTlRSX0VOMSk7CkBAIC05NDgsMTUgKzk4NiwxNiBAQCBzdGF0aWMgdm9pZCBkZW5hbGlfaXJx
X2VuYWJsZShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLCB1aW50MzJfdCBpbnRfbWFz
awogfQogCiAvKiBUaGlzIGZ1bmN0aW9uIG9ubHkgcmV0dXJucyB3aGVuIGFuIGludGVycnVwdCB0
aGF0IHRoaXMgZHJpdmVyIGNhcmVzIGFib3V0Ci0gKiBvY2N1cnMuIFRoaXMgaXMgdG8gcmVkdWNl
IHRoZSBvdmVyaGVhZCBvZiBzZXJ2aWNpbmcgaW50ZXJydXB0cyAKKyAqIG9jY3Vycy4gVGhpcyBp
cyB0byByZWR1Y2UgdGhlIG92ZXJoZWFkIG9mIHNlcnZpY2luZyBpbnRlcnJ1cHRzCiAgKi8KIHN0
YXRpYyBpbmxpbmUgdWludDMyX3QgZGVuYWxpX2lycV9kZXRlY3RlZChzdHJ1Y3QgZGVuYWxpX25h
bmRfaW5mbyAqZGVuYWxpKQogewotCXJldHVybiAocmVhZF9pbnRlcnJ1cHRfc3RhdHVzKGRlbmFs
aSkgJiBERU5BTElfSVJRX0FMTCk7CisJcmV0dXJuIHJlYWRfaW50ZXJydXB0X3N0YXR1cyhkZW5h
bGkpICYgREVOQUxJX0lSUV9BTEw7CiB9CiAKIC8qIEludGVycnVwdHMgYXJlIGNsZWFyZWQgYnkg
d3JpdGluZyBhIDEgdG8gdGhlIGFwcHJvcHJpYXRlIHN0YXR1cyBiaXQgKi8KLXN0YXRpYyBpbmxp
bmUgdm9pZCBjbGVhcl9pbnRlcnJ1cHQoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwg
dWludDMyX3QgaXJxX21hc2spCitzdGF0aWMgaW5saW5lIHZvaWQgY2xlYXJfaW50ZXJydXB0KHN0
cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGksCisJCQkJCQkJdWludDMyX3QgaXJxX21hc2sp
CiB7CiAJdWludDMyX3QgaW50cl9zdGF0dXNfcmVnID0gMDsKIApAQCAtOTk1LDE3ICsxMDM0LDE1
IEBAIHN0YXRpYyB2b2lkIHByaW50X2lycV9sb2coc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRl
bmFsaSkKIHsKIAlpbnQgaSA9IDA7CiAKLQlwcmludGsoIklTUiBkZWJ1ZyBsb2cgaW5kZXggPSAl
WFxuIiwgZGVuYWxpLT5pZHgpOworCXByaW50ayhLRVJOX0lORk8gIklTUiBkZWJ1ZyBsb2cgaW5k
ZXggPSAlWFxuIiwgZGVuYWxpLT5pZHgpOwogCWZvciAoaSA9IDA7IGkgPCAzMjsgaSsrKQotCXsK
LQkJcHJpbnRrKCIlMDhYOiAlMDhYXG4iLCBpLCBkZW5hbGktPmlycV9kZWJ1Z19hcnJheVtpXSk7
Ci0JfQorCQlwcmludGsoS0VSTl9JTkZPICIlMDhYOiAlMDhYXG4iLCBpLCBkZW5hbGktPmlycV9k
ZWJ1Z19hcnJheVtpXSk7CiB9CiAjZW5kaWYKIAotLyogVGhpcyBpcyB0aGUgaW50ZXJydXB0IHNl
cnZpY2Ugcm91dGluZS4gSXQgaGFuZGxlcyBhbGwgaW50ZXJydXB0cyAKLSAqIHNlbnQgdG8gdGhp
cyBkZXZpY2UuIE5vdGUgdGhhdCBvbiBDRTQxMDAsIHRoaXMgaXMgYSBzaGFyZWQgCi0gKiBpbnRl
cnJ1cHQuIAorLyogVGhpcyBpcyB0aGUgaW50ZXJydXB0IHNlcnZpY2Ugcm91dGluZS4gSXQgaGFu
ZGxlcyBhbGwgaW50ZXJydXB0cworICogc2VudCB0byB0aGlzIGRldmljZS4gTm90ZSB0aGF0IG9u
IENFNDEwMCwgdGhpcyBpcyBhIHNoYXJlZAorICogaW50ZXJydXB0LgogICovCiBzdGF0aWMgaXJx
cmV0dXJuX3QgZGVuYWxpX2lzcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiB7CkBAIC0xMDE1LDIw
ICsxMDUyLDIwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkZW5hbGlfaXNyKGludCBpcnEsIHZvaWQg
KmRldl9pZCkKIAogCXNwaW5fbG9jaygmZGVuYWxpLT5pcnFfbG9jayk7CiAKLQkvKiBjaGVjayB0
byBzZWUgaWYgYSB2YWxpZCBOQU5EIGNoaXAgaGFzIAotICAgICAgICAgKiBiZWVuIHNlbGVjdGVk
LiAKKwkvKiBjaGVjayB0byBzZWUgaWYgYSB2YWxpZCBOQU5EIGNoaXAgaGFzCisJICogYmVlbiBz
ZWxlY3RlZC4KIAkgKi8KLQlpZiAoaXNfZmxhc2hfYmFua192YWxpZChkZW5hbGktPmZsYXNoX2Jh
bmspKQotCXsKLQkJLyogY2hlY2sgdG8gc2VlIGlmIGNvbnRyb2xsZXIgZ2VuZXJhdGVkIAorCWlm
IChpc19mbGFzaF9iYW5rX3ZhbGlkKGRlbmFsaS0+Zmxhc2hfYmFuaykpIHsKKwkJLyogY2hlY2sg
dG8gc2VlIGlmIGNvbnRyb2xsZXIgZ2VuZXJhdGVkCiAJCSAqIHRoZSBpbnRlcnJ1cHQsIHNpbmNl
IHRoaXMgaXMgYSBzaGFyZWQgaW50ZXJydXB0ICovCi0JCWlmICgoaXJxX3N0YXR1cyA9IGRlbmFs
aV9pcnFfZGV0ZWN0ZWQoZGVuYWxpKSkgIT0gMCkKLQkJeworCQlpcnFfc3RhdHVzID0gZGVuYWxp
X2lycV9kZXRlY3RlZChkZW5hbGkpOworCQlpZiAoaXJxX3N0YXR1cyAhPSAwKSB7CiAjaWYgREVC
VUdfREVOQUxJCi0JCQlkZW5hbGktPmlycV9kZWJ1Z19hcnJheVtkZW5hbGktPmlkeCsrXSA9IDB4
MTAwMDAwMDAgfCBpcnFfc3RhdHVzOworCQkJZGVuYWxpLT5pcnFfZGVidWdfYXJyYXlbZGVuYWxp
LT5pZHgrK10gPQorCQkJCTB4MTAwMDAwMDAgfCBpcnFfc3RhdHVzOwogCQkJZGVuYWxpLT5pZHgg
JT0gMzI7CiAKLQkJCXByaW50aygiSVJRIHN0YXR1cyA9IDB4JTA0eFxuIiwgaXJxX3N0YXR1cyk7
CisJCQlwcmludGsoS0VSTl9JTkZPICJJUlEgc3RhdHVzID0gMHglMDR4XG4iLCBpcnFfc3RhdHVz
KTsKICNlbmRpZgogCQkJLyogaGFuZGxlIGludGVycnVwdCAqLwogCQkJLyogZmlyc3QgYWNrbm93
bGVkZ2UgaXQgKi8KQEAgLTEwNTQsNjEgKzEwOTEsNjIgQEAgc3RhdGljIHVpbnQzMl90IHdhaXRf
Zm9yX2lycShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLCB1aW50MzJfdCBpcnFfbWFz
aykKIAlib29sIHJldHJ5ID0gZmFsc2U7CiAJdW5zaWduZWQgbG9uZyB0aW1lb3V0ID0gbXNlY3Nf
dG9famlmZmllcygxMDAwKTsKIAotCWRvCi0JeworCWRvIHsKICNpZiBERUJVR19ERU5BTEkKLQkJ
cHJpbnRrKCJ3YWl0aW5nIGZvciAweCV4XG4iLCBpcnFfbWFzayk7CisJCXByaW50ayhLRVJOX0lO
Rk8gIndhaXRpbmcgZm9yIDB4JXhcbiIsIGlycV9tYXNrKTsKICNlbmRpZgotCQljb21wX3JlcyA9
IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmZGVuYWxpLT5jb21wbGV0ZSwgdGltZW91dCk7
CisJCWNvbXBfcmVzID0KKwkJCXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmZGVuYWxpLT5j
b21wbGV0ZSwgdGltZW91dCk7CiAJCXNwaW5fbG9ja19pcnEoJmRlbmFsaS0+aXJxX2xvY2spOwog
CQlpbnRyX3N0YXR1cyA9IGRlbmFsaS0+aXJxX3N0YXR1czsKIAogI2lmIERFQlVHX0RFTkFMSQot
CQlkZW5hbGktPmlycV9kZWJ1Z19hcnJheVtkZW5hbGktPmlkeCsrXSA9IDB4MjAwMDAwMDAgfCAo
aXJxX21hc2sgPDwgMTYpIHwgaW50cl9zdGF0dXM7CisJCWRlbmFsaS0+aXJxX2RlYnVnX2FycmF5
W2RlbmFsaS0+aWR4KytdID0KKwkJCTB4MjAwMDAwMDAgfCAoaXJxX21hc2sgPDwgMTYpIHwgaW50
cl9zdGF0dXM7CiAJCWRlbmFsaS0+aWR4ICU9IDMyOwogI2VuZGlmCiAKLQkJaWYgKGludHJfc3Rh
dHVzICYgaXJxX21hc2spCi0JCXsKKwkJaWYgKGludHJfc3RhdHVzICYgaXJxX21hc2spIHsKIAkJ
CWRlbmFsaS0+aXJxX3N0YXR1cyAmPSB+aXJxX21hc2s7CiAJCQlzcGluX3VubG9ja19pcnEoJmRl
bmFsaS0+aXJxX2xvY2spOwogI2lmIERFQlVHX0RFTkFMSQotCQkJaWYgKHJldHJ5KSBwcmludGso
InN0YXR1cyBvbiByZXRyeSA9IDB4JXhcbiIsIGludHJfc3RhdHVzKTsKKwkJCWlmIChyZXRyeSkK
KwkJCQlwcmludGsoS0VSTl9JTkZPICJzdGF0dXMgb24gcmV0cnkgPSAweCV4XG4iLAorCQkJCQkJ
aW50cl9zdGF0dXMpOwogI2VuZGlmCiAJCQkvKiBvdXIgaW50ZXJydXB0IHdhcyBkZXRlY3RlZCAq
LwogCQkJYnJlYWs7Ci0JCX0KLQkJZWxzZSAKLQkJewotCQkJLyogdGhlc2UgYXJlIG5vdCB0aGUg
aW50ZXJydXB0cyB5b3UgYXJlIGxvb2tpbmcgZm9yIC0gCi0JCSAgICAgICAgICAgbmVlZCB0byB3
YWl0IGFnYWluICovCisJCX0gZWxzZSB7CisJCQkvKiB0aGVzZSBhcmUgbm90IHRoZSBpbnRlcnJ1
cHRzIHlvdSBhcmUgbG9va2luZyBmb3IKKwkJCSAqIG5lZWQgdG8gd2FpdCBhZ2FpbiAqLwogCQkJ
c3Bpbl91bmxvY2tfaXJxKCZkZW5hbGktPmlycV9sb2NrKTsKICNpZiBERUJVR19ERU5BTEkKIAkJ
CXByaW50X2lycV9sb2coZGVuYWxpKTsKLQkJCXByaW50aygicmVjZWl2ZWQgaXJxIG5vYm9keSBj
YXJlZDogaXJxX3N0YXR1cyA9IDB4JXgsIgotCQkJCSIgaXJxX21hc2sgPSAweCV4LCB0aW1lb3V0
ID0gJWxkXG4iLCBpbnRyX3N0YXR1cywgaXJxX21hc2ssIGNvbXBfcmVzKTsKKwkJCXByaW50ayhL
RVJOX0lORk8gInJlY2VpdmVkIGlycSBub2JvZHkgY2FyZWQ6ICIKKwkJCQkJImlycV9zdGF0dXMg
PSAweCV4LCBpcnFfbWFzayA9IDB4JXgsICIKKwkJCQkJInRpbWVvdXQgPSAlbGRcbiIsIGludHJf
c3RhdHVzLAorCQkJCQlpcnFfbWFzaywgY29tcF9yZXMpOwogI2VuZGlmCiAJCQlyZXRyeSA9IHRy
dWU7CiAJCX0KIAl9IHdoaWxlIChjb21wX3JlcyAhPSAwKTsKIAotCWlmIChjb21wX3JlcyA9PSAw
KQotCXsKKwlpZiAoY29tcF9yZXMgPT0gMCkgewogCQkvKiB0aW1lb3V0ICovCi0JCXByaW50ayhL
RVJOX0VSUiAidGltZW91dCBvY2N1cnJlZCwgc3RhdHVzID0gMHgleCwgbWFzayA9IDB4JXhcbiIs
IAotCSAgICAgICAJCQlpbnRyX3N0YXR1cywgaXJxX21hc2spOworCQlwcmludGsoS0VSTl9FUlIg
InRpbWVvdXQgb2NjdXJyZWQsIHN0YXR1cyA9IDB4JXgsIG1hc2sgPSAweCV4XG4iLAorCQkJCWlu
dHJfc3RhdHVzLCBpcnFfbWFzayk7CiAKIAkJaW50cl9zdGF0dXMgPSAwOwogCX0KIAlyZXR1cm4g
aW50cl9zdGF0dXM7CiB9CiAKLS8qIFRoaXMgaGVscGVyIGZ1bmN0aW9uIHNldHVwcyB0aGUgcmVn
aXN0ZXJzIGZvciBFQ0MgYW5kIHdoZXRoZXIgb3Igbm90IAorLyogVGhpcyBoZWxwZXIgZnVuY3Rp
b24gc2V0dXBzIHRoZSByZWdpc3RlcnMgZm9yIEVDQyBhbmQgd2hldGhlciBvciBub3QKICAgIHRo
ZSBzcGFyZSBhcmVhIHdpbGwgYmUgdHJhbnNmZXJlZC4gKi8KLXN0YXRpYyB2b2lkIHNldHVwX2Vj
Y19mb3JfeGZlcihzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLCBib29sIGVjY19lbiwg
CitzdGF0aWMgdm9pZCBzZXR1cF9lY2NfZm9yX3hmZXIoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8g
KmRlbmFsaSwgYm9vbCBlY2NfZW4sCiAJCQkJYm9vbCB0cmFuc2Zlcl9zcGFyZSkKIHsKLQlpbnQg
ZWNjX2VuX2ZsYWcgPSAwLCB0cmFuc2Zlcl9zcGFyZV9mbGFnID0gMDsgCisJaW50IGVjY19lbl9m
bGFnID0gMCwgdHJhbnNmZXJfc3BhcmVfZmxhZyA9IDA7CiAKIAkvKiBzZXQgRUNDLCB0cmFuc2Zl
ciBzcGFyZSBiaXRzIGlmIG5lZWRlZCAqLwogCWVjY19lbl9mbGFnID0gZWNjX2VuID8gRUNDX0VO
QUJMRV9fRkxBRyA6IDA7CkBAIC0xMTE2LDg1ICsxMTU0LDg1IEBAIHN0YXRpYyB2b2lkIHNldHVw
X2VjY19mb3JfeGZlcihzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLCBib29sIGVjY19l
biwKIAogCS8qIEVuYWJsZSBzcGFyZSBhcmVhL0VDQyBwZXIgdXNlcidzIHJlcXVlc3QuICovCiAJ
ZGVuYWxpX3dyaXRlMzIoZWNjX2VuX2ZsYWcsIGRlbmFsaS0+Zmxhc2hfcmVnICsgRUNDX0VOQUJM
RSk7Ci0JZGVuYWxpX3dyaXRlMzIodHJhbnNmZXJfc3BhcmVfZmxhZywgZGVuYWxpLT5mbGFzaF9y
ZWcgKyBUUkFOU0ZFUl9TUEFSRV9SRUcpOworCWRlbmFsaV93cml0ZTMyKHRyYW5zZmVyX3NwYXJl
X2ZsYWcsCisJCQlkZW5hbGktPmZsYXNoX3JlZyArIFRSQU5TRkVSX1NQQVJFX1JFRyk7CiB9CiAK
LS8qIHNlbmRzIGEgcGlwZWxpbmUgY29tbWFuZCBvcGVyYXRpb24gdG8gdGhlIGNvbnRyb2xsZXIu
IFNlZSB0aGUgRGVuYWxpIE5BTkQgCi0gICBjb250cm9sbGVyJ3MgdXNlciBndWlkZSBmb3IgbW9y
ZSBpbmZvcm1hdGlvbiAoc2VjdGlvbiA0LjIuMy42KS4gCisvKiBzZW5kcyBhIHBpcGVsaW5lIGNv
bW1hbmQgb3BlcmF0aW9uIHRvIHRoZSBjb250cm9sbGVyLiBTZWUgdGhlIERlbmFsaSBOQU5ECisg
ICBjb250cm9sbGVyJ3MgdXNlciBndWlkZSBmb3IgbW9yZSBpbmZvcm1hdGlvbiAoc2VjdGlvbiA0
LjIuMy42KS4KICAqLwotc3RhdGljIGludCBkZW5hbGlfc2VuZF9waXBlbGluZV9jbWQoc3RydWN0
IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwgYm9vbCBlY2NfZW4sIAotCQkJCQlib29sIHRyYW5z
ZmVyX3NwYXJlLCBpbnQgYWNjZXNzX3R5cGUsIAotCQkJCQlpbnQgb3ApCitzdGF0aWMgaW50IGRl
bmFsaV9zZW5kX3BpcGVsaW5lX2NtZChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLAor
CQkJCQkJCWJvb2wgZWNjX2VuLAorCQkJCQkJCWJvb2wgdHJhbnNmZXJfc3BhcmUsCisJCQkJCQkJ
aW50IGFjY2Vzc190eXBlLAorCQkJCQkJCWludCBvcCkKIHsKIAlpbnQgc3RhdHVzID0gUEFTUzsK
LQl1aW50MzJfdCBhZGRyID0gMHgwLCBjbWQgPSAweDAsIHBhZ2VfY291bnQgPSAxLCBpcnFfc3Rh
dHVzID0gMCwgCisJdWludDMyX3QgYWRkciA9IDB4MCwgY21kID0gMHgwLCBwYWdlX2NvdW50ID0g
MSwgaXJxX3N0YXR1cyA9IDAsCiAJCSBpcnFfbWFzayA9IDA7CiAKLQlpZiAob3AgPT0gREVOQUxJ
X1JFQUQpIGlycV9tYXNrID0gSU5UUl9TVEFUVVMwX19MT0FEX0NPTVA7Ci0JZWxzZSBpZiAob3Ag
PT0gREVOQUxJX1dSSVRFKSBpcnFfbWFzayA9IDA7Ci0JZWxzZSBCVUcoKTsKKwlpZiAob3AgPT0g
REVOQUxJX1JFQUQpCisJCWlycV9tYXNrID0gSU5UUl9TVEFUVVMwX19MT0FEX0NPTVA7CisJZWxz
ZSBpZiAob3AgPT0gREVOQUxJX1dSSVRFKQorCQlpcnFfbWFzayA9IDA7CisJZWxzZQorCQlCVUco
KTsKIAogCXNldHVwX2VjY19mb3JfeGZlcihkZW5hbGksIGVjY19lbiwgdHJhbnNmZXJfc3BhcmUp
OwogCiAjaWYgREVCVUdfREVOQUxJCiAJc3Bpbl9sb2NrX2lycSgmZGVuYWxpLT5pcnFfbG9jayk7
Ci0JZGVuYWxpLT5pcnFfZGVidWdfYXJyYXlbZGVuYWxpLT5pZHgrK10gPSAweDQwMDAwMDAwIHwg
aW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyBFQ0NfRU5BQkxFKSB8IChhY2Nlc3NfdHlwZSA8
PCA0KTsKKwlkZW5hbGktPmlycV9kZWJ1Z19hcnJheVtkZW5hbGktPmlkeCsrXSA9CisJCTB4NDAw
MDAwMDAgfCBpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArIEVDQ19FTkFCTEUpIHwKKwkJKGFj
Y2Vzc190eXBlIDw8IDQpOwogCWRlbmFsaS0+aWR4ICU9IDMyOwogCXNwaW5fdW5sb2NrX2lycSgm
ZGVuYWxpLT5pcnFfbG9jayk7CiAjZW5kaWYKIAogCiAJLyogY2xlYXIgaW50ZXJydXB0cyAqLwot
CWNsZWFyX2ludGVycnVwdHMoZGVuYWxpKTsJCisJY2xlYXJfaW50ZXJydXB0cyhkZW5hbGkpOwog
CiAJYWRkciA9IEJBTksoZGVuYWxpLT5mbGFzaF9iYW5rKSB8IGRlbmFsaS0+cGFnZTsKIAotCWlm
IChvcCA9PSBERU5BTElfV1JJVEUgJiYgYWNjZXNzX3R5cGUgIT0gU1BBUkVfQUNDRVNTKQotCXsK
LQkJY21kID0gTU9ERV8wMSB8IGFkZHI7IAorCWlmIChvcCA9PSBERU5BTElfV1JJVEUgJiYgYWNj
ZXNzX3R5cGUgIT0gU1BBUkVfQUNDRVNTKSB7CisJCWNtZCA9IE1PREVfMDEgfCBhZGRyOwogCQlk
ZW5hbGlfd3JpdGUzMihjbWQsIGRlbmFsaS0+Zmxhc2hfbWVtKTsKLQl9Ci0JZWxzZSBpZiAob3Ag
PT0gREVOQUxJX1dSSVRFICYmIGFjY2Vzc190eXBlID09IFNQQVJFX0FDQ0VTUykKLQl7CisJfSBl
bHNlIGlmIChvcCA9PSBERU5BTElfV1JJVEUgJiYgYWNjZXNzX3R5cGUgPT0gU1BBUkVfQUNDRVNT
KSB7CiAJCS8qIHJlYWQgc3BhcmUgYXJlYSAqLwotCQljbWQgPSBNT0RFXzEwIHwgYWRkcjsgCisJ
CWNtZCA9IE1PREVfMTAgfCBhZGRyOwogCQlpbmRleF9hZGRyKGRlbmFsaSwgKHVpbnQzMl90KWNt
ZCwgYWNjZXNzX3R5cGUpOwogCi0JCWNtZCA9IE1PREVfMDEgfCBhZGRyOyAKKwkJY21kID0gTU9E
RV8wMSB8IGFkZHI7CiAJCWRlbmFsaV93cml0ZTMyKGNtZCwgZGVuYWxpLT5mbGFzaF9tZW0pOwot
CX0KLQllbHNlIGlmIChvcCA9PSBERU5BTElfUkVBRCkKLQl7CisJfSBlbHNlIGlmIChvcCA9PSBE
RU5BTElfUkVBRCkgewogCQkvKiBzZXR1cCBwYWdlIHJlYWQgcmVxdWVzdCBmb3IgYWNjZXNzIHR5
cGUgKi8KLQkJY21kID0gTU9ERV8xMCB8IGFkZHI7IAorCQljbWQgPSBNT0RFXzEwIHwgYWRkcjsK
IAkJaW5kZXhfYWRkcihkZW5hbGksICh1aW50MzJfdCljbWQsIGFjY2Vzc190eXBlKTsKIAogCQkv
KiBwYWdlIDMzIG9mIHRoZSBOQU5EIGNvbnRyb2xsZXIgc3BlYyBpbmRpY2F0ZXMgd2Ugc2hvdWxk
IG5vdAotCQkgICB1c2UgdGhlIHBpcGVsaW5lIGNvbW1hbmRzIGluIFNwYXJlIGFyZWEgb25seSBt
b2RlLiBTbyB3ZSAKKwkJICAgdXNlIHRoZSBwaXBlbGluZSBjb21tYW5kcyBpbiBTcGFyZSBhcmVh
IG9ubHkgbW9kZS4gU28gd2UKIAkJICAgZG9uJ3QuCiAJCSAqLwotCQlpZiAoYWNjZXNzX3R5cGUg
PT0gU1BBUkVfQUNDRVNTKQotCQl7CisJCWlmIChhY2Nlc3NfdHlwZSA9PSBTUEFSRV9BQ0NFU1Mp
IHsKIAkJCWNtZCA9IE1PREVfMDEgfCBhZGRyOwogCQkJZGVuYWxpX3dyaXRlMzIoY21kLCBkZW5h
bGktPmZsYXNoX21lbSk7Ci0JCX0KLQkJZWxzZQotCQl7Ci0JCQlpbmRleF9hZGRyKGRlbmFsaSwg
KHVpbnQzMl90KWNtZCwgMHgyMDAwIHwgb3AgfCBwYWdlX2NvdW50KTsKLQkKLQkJCS8qIHdhaXQg
Zm9yIGNvbW1hbmQgdG8gYmUgYWNjZXB0ZWQgIAotCQkJICogY2FuIGFsd2F5cyB1c2Ugc3RhdHVz
MCBiaXQgYXMgdGhlIG1hc2sgaXMgaWRlbnRpY2FsIGZvciBlYWNoCisJCX0gZWxzZSB7CisJCQlp
bmRleF9hZGRyKGRlbmFsaSwgKHVpbnQzMl90KWNtZCwKKwkJCQkJMHgyMDAwIHwgb3AgfCBwYWdl
X2NvdW50KTsKKworCQkJLyogd2FpdCBmb3IgY29tbWFuZCB0byBiZSBhY2NlcHRlZAorCQkJICog
Y2FuIGFsd2F5cyB1c2Ugc3RhdHVzMCBiaXQgYXMgdGhlIG1hc2sgaXMKKwkJCSAqIGlkZW50aWNh
bCBmb3IgZWFjaAogCQkJICogYmFuay4gKi8KIAkJCWlycV9zdGF0dXMgPSB3YWl0X2Zvcl9pcnEo
ZGVuYWxpLCBpcnFfbWFzayk7CiAKLQkJCWlmIChpcnFfc3RhdHVzID09IDApCi0JCQl7CisJCQlp
ZiAoaXJxX3N0YXR1cyA9PSAwKSB7CiAJCQkJcHJpbnRrKEtFUk5fRVJSICJjbWQsIHBhZ2UsIGFk
ZHIgb24gdGltZW91dCAiCi0JCQkJCSIoMHgleCwgMHgleCwgMHgleClcbiIsIGNtZCwgZGVuYWxp
LT5wYWdlLCBhZGRyKTsKKwkJCQkJIigweCV4LCAweCV4LCAweCV4KVxuIiwgY21kLAorCQkJCQlk
ZW5hbGktPnBhZ2UsIGFkZHIpOwogCQkJCXN0YXR1cyA9IEZBSUw7Ci0JCQl9Ci0JCQllbHNlCi0J
CQl7CisJCQl9IGVsc2UgewogCQkJCWNtZCA9IE1PREVfMDEgfCBhZGRyOwogCQkJCWRlbmFsaV93
cml0ZTMyKGNtZCwgZGVuYWxpLT5mbGFzaF9tZW0pOwogCQkJfQpAQCAtMTIwNCwzNiArMTI0Miwz
NSBAQCBzdGF0aWMgaW50IGRlbmFsaV9zZW5kX3BpcGVsaW5lX2NtZChzdHJ1Y3QgZGVuYWxpX25h
bmRfaW5mbyAqZGVuYWxpLCBib29sIGVjY19lbgogfQogCiAvKiBoZWxwZXIgZnVuY3Rpb24gdGhh
dCBzaW1wbHkgd3JpdGVzIGEgYnVmZmVyIHRvIHRoZSBmbGFzaCAqLwotc3RhdGljIGludCB3cml0
ZV9kYXRhX3RvX2ZsYXNoX21lbShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLCBjb25z
dCB1aW50OF90ICpidWYsIAotCQkJCQlpbnQgbGVuKSAKK3N0YXRpYyBpbnQgd3JpdGVfZGF0YV90
b19mbGFzaF9tZW0oc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwKKwkJCQkJCQljb25z
dCB1aW50OF90ICpidWYsCisJCQkJCQkJaW50IGxlbikKIHsKIAl1aW50MzJfdCBpID0gMCwgKmJ1
ZjMyOwogCi0JLyogdmVyaWZ5IHRoYXQgdGhlIGxlbiBpcyBhIG11bHRpcGxlIG9mIDQuIHNlZSBj
b21tZW50IGluIAotCSAqIHJlYWRfZGF0YV9mcm9tX2ZsYXNoX21lbSgpICovCQorCS8qIHZlcmlm
eSB0aGF0IHRoZSBsZW4gaXMgYSBtdWx0aXBsZSBvZiA0LiBzZWUgY29tbWVudCBpbgorCSAqIHJl
YWRfZGF0YV9mcm9tX2ZsYXNoX21lbSgpICovCiAJQlVHX09OKChsZW4gJSA0KSAhPSAwKTsKIAog
CS8qIHdyaXRlIHRoZSBkYXRhIHRvIHRoZSBmbGFzaCBtZW1vcnkgKi8KIAlidWYzMiA9ICh1aW50
MzJfdCAqKWJ1ZjsKIAlmb3IgKGkgPSAwOyBpIDwgbGVuIC8gNDsgaSsrKQotCXsKIAkJZGVuYWxp
X3dyaXRlMzIoKmJ1ZjMyKyssIGRlbmFsaS0+Zmxhc2hfbWVtICsgMHgxMCk7Ci0JfQotCXJldHVy
biBpKjQ7IC8qIGludGVudCBpcyB0byByZXR1cm4gdGhlIG51bWJlciBvZiBieXRlcyByZWFkICov
IAorCXJldHVybiBpKjQ7IC8qIGludGVudCBpcyB0byByZXR1cm4gdGhlIG51bWJlciBvZiBieXRl
cyByZWFkICovCiB9CiAKIC8qIGhlbHBlciBmdW5jdGlvbiB0aGF0IHNpbXBseSByZWFkcyBhIGJ1
ZmZlciBmcm9tIHRoZSBmbGFzaCAqLwotc3RhdGljIGludCByZWFkX2RhdGFfZnJvbV9mbGFzaF9t
ZW0oc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwgdWludDhfdCAqYnVmLCAKLQkJCQkJ
aW50IGxlbikKK3N0YXRpYyBpbnQgcmVhZF9kYXRhX2Zyb21fZmxhc2hfbWVtKHN0cnVjdCBkZW5h
bGlfbmFuZF9pbmZvICpkZW5hbGksCisJCQkJCQkJdWludDhfdCAqYnVmLAorCQkJCQkJCWludCBs
ZW4pCiB7CiAJdWludDMyX3QgaSA9IDAsICpidWYzMjsKIAogCS8qIHdlIGFzc3VtZSB0aGF0IGxl
biB3aWxsIGJlIGEgbXVsdGlwbGUgb2YgNCwgaWYgbm90CiAJICogaXQgd291bGQgYmUgbmljZSB0
byBrbm93IGFib3V0IGl0IEFTQVAgcmF0aGVyIHRoYW4KLQkgKiBoYXZlIHJhbmRvbSBmYWlsdXJl
cy4uLiAKLSAgICAgICAgICoJCi0JICogVGhpcyBhc3N1bXB0aW9uIGlzIGJhc2VkIG9uIHRoZSBm
YWN0IHRoYXQgdGhpcyAKLQkgKiBmdW5jdGlvbiBpcyBkZXNpZ25lZCB0byBiZSB1c2VkIHRvIHJl
YWQgZmxhc2ggcGFnZXMsIAorCSAqIGhhdmUgcmFuZG9tIGZhaWx1cmVzLi4uCisJICogVGhpcyBh
c3N1bXB0aW9uIGlzIGJhc2VkIG9uIHRoZSBmYWN0IHRoYXQgdGhpcworCSAqIGZ1bmN0aW9uIGlz
IGRlc2lnbmVkIHRvIGJlIHVzZWQgdG8gcmVhZCBmbGFzaCBwYWdlcywKIAkgKiB3aGljaCBhcmUg
dHlwaWNhbGx5IG11bHRpcGxlcyBvZiA0Li4uCiAJICovCiAKQEAgLTEyNDIsMTAgKzEyNzksOCBA
QCBzdGF0aWMgaW50IHJlYWRfZGF0YV9mcm9tX2ZsYXNoX21lbShzdHJ1Y3QgZGVuYWxpX25hbmRf
aW5mbyAqZGVuYWxpLCB1aW50OF90ICpidQogCS8qIHRyYW5zZmVyIHRoZSBkYXRhIGZyb20gdGhl
IGZsYXNoICovCiAJYnVmMzIgPSAodWludDMyX3QgKilidWY7CiAJZm9yIChpID0gMDsgaSA8IGxl
biAvIDQ7IGkrKykKLQl7CiAJCSpidWYzMisrID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9tZW0g
KyAweDEwKTsKLQl9Ci0JcmV0dXJuIGkqNDsgLyogaW50ZW50IGlzIHRvIHJldHVybiB0aGUgbnVt
YmVyIG9mIGJ5dGVzIHJlYWQgKi8gCisJcmV0dXJuIGkqNDsgLyogaW50ZW50IGlzIHRvIHJldHVy
biB0aGUgbnVtYmVyIG9mIGJ5dGVzIHJlYWQgKi8KIH0KIAogLyogd3JpdGVzIE9PQiBkYXRhIHRv
IHRoZSBkZXZpY2UgKi8KQEAgLTEyNTMsMzggKzEyODgsMzUgQEAgc3RhdGljIGludCB3cml0ZV9v
b2JfZGF0YShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdWludDhfdCAqYnVmLCBpbnQgcGFnZSkKIHsK
IAlzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpID0gbXRkX3RvX2RlbmFsaShtdGQpOwog
CXVpbnQzMl90IGlycV9zdGF0dXMgPSAwOwotCXVpbnQzMl90IGlycV9tYXNrID0gSU5UUl9TVEFU
VVMwX19QUk9HUkFNX0NPTVAgfCAKKwl1aW50MzJfdCBpcnFfbWFzayA9IElOVFJfU1RBVFVTMF9f
UFJPR1JBTV9DT01QIHwKIAkJCQkJCUlOVFJfU1RBVFVTMF9fUFJPR1JBTV9GQUlMOwogCWludCBz
dGF0dXMgPSAwOwogCiAJZGVuYWxpLT5wYWdlID0gcGFnZTsKIAotCWlmIChkZW5hbGlfc2VuZF9w
aXBlbGluZV9jbWQoZGVuYWxpLCBmYWxzZSwgZmFsc2UsIFNQQVJFX0FDQ0VTUywgCi0JCQkJCQkJ
REVOQUxJX1dSSVRFKSA9PSBQQVNTKSAKLQl7CisJaWYgKGRlbmFsaV9zZW5kX3BpcGVsaW5lX2Nt
ZChkZW5hbGksIGZhbHNlLCBmYWxzZSwgU1BBUkVfQUNDRVNTLAorCQkJCQkJCURFTkFMSV9XUklU
RSkgPT0gUEFTUykgewogCQl3cml0ZV9kYXRhX3RvX2ZsYXNoX21lbShkZW5hbGksIGJ1ZiwgbXRk
LT5vb2JzaXplKTsKIAogI2lmIERFQlVHX0RFTkFMSQogCQlzcGluX2xvY2tfaXJxKCZkZW5hbGkt
PmlycV9sb2NrKTsKLQkJZGVuYWxpLT5pcnFfZGVidWdfYXJyYXlbZGVuYWxpLT5pZHgrK10gPSAw
eDgwMDAwMDAwIHwgbXRkLT5vb2JzaXplOworCQlkZW5hbGktPmlycV9kZWJ1Z19hcnJheVtkZW5h
bGktPmlkeCsrXSA9CisJCQkweDgwMDAwMDAwIHwgbXRkLT5vb2JzaXplOwogCQlkZW5hbGktPmlk
eCAlPSAzMjsKIAkJc3Bpbl91bmxvY2tfaXJxKCZkZW5hbGktPmlycV9sb2NrKTsKICNlbmRpZgog
Ci0JCisKIAkJLyogd2FpdCBmb3Igb3BlcmF0aW9uIHRvIGNvbXBsZXRlICovCiAJCWlycV9zdGF0
dXMgPSB3YWl0X2Zvcl9pcnEoZGVuYWxpLCBpcnFfbWFzayk7CiAKLQkJaWYgKGlycV9zdGF0dXMg
PT0gMCkKLQkJeworCQlpZiAoaXJxX3N0YXR1cyA9PSAwKSB7CiAJCQlwcmludGsoS0VSTl9FUlIg
Ik9PQiB3cml0ZSBmYWlsZWRcbiIpOwogCQkJc3RhdHVzID0gLUVJTzsKIAkJfQotCX0KLQllbHNl
IAotCXsgCQorCX0gZWxzZSB7CiAJCXByaW50ayhLRVJOX0VSUiAidW5hYmxlIHRvIHNlbmQgcGlw
ZWxpbmUgY29tbWFuZFxuIik7Ci0JCXN0YXR1cyA9IC1FSU87IAorCQlzdGF0dXMgPSAtRUlPOwog
CX0KIAlyZXR1cm4gc3RhdHVzOwogfQpAQCAtMTI5Myw2MCArMTMyNSw1NiBAQCBzdGF0aWMgaW50
IHdyaXRlX29vYl9kYXRhKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCB1aW50OF90ICpidWYsIGludCBw
YWdlKQogc3RhdGljIHZvaWQgcmVhZF9vb2JfZGF0YShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdWlu
dDhfdCAqYnVmLCBpbnQgcGFnZSkKIHsKIAlzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxp
ID0gbXRkX3RvX2RlbmFsaShtdGQpOwotCXVpbnQzMl90IGlycV9tYXNrID0gSU5UUl9TVEFUVVMw
X19MT0FEX0NPTVAsIGlycV9zdGF0dXMgPSAwLCBhZGRyID0gMHgwLCBjbWQgPSAweDA7CisJdWlu
dDMyX3QgaXJxX21hc2sgPSBJTlRSX1NUQVRVUzBfX0xPQURfQ09NUCwKKwkJCSBpcnFfc3RhdHVz
ID0gMCwgYWRkciA9IDB4MCwgY21kID0gMHgwOwogCiAJZGVuYWxpLT5wYWdlID0gcGFnZTsKIAog
I2lmIERFQlVHX0RFTkFMSQotCXByaW50aygicmVhZF9vb2IgJWRcbiIsIHBhZ2UpOworCXByaW50
ayhLRVJOX0lORk8gInJlYWRfb29iICVkXG4iLCBwYWdlKTsKICNlbmRpZgotCWlmIChkZW5hbGlf
c2VuZF9waXBlbGluZV9jbWQoZGVuYWxpLCBmYWxzZSwgdHJ1ZSwgU1BBUkVfQUNDRVNTLCAKLQkJ
CQkJCQlERU5BTElfUkVBRCkgPT0gUEFTUykgCi0JewotCQlyZWFkX2RhdGFfZnJvbV9mbGFzaF9t
ZW0oZGVuYWxpLCBidWYsIG10ZC0+b29ic2l6ZSk7CQorCWlmIChkZW5hbGlfc2VuZF9waXBlbGlu
ZV9jbWQoZGVuYWxpLCBmYWxzZSwgdHJ1ZSwgU1BBUkVfQUNDRVNTLAorCQkJCQkJCURFTkFMSV9S
RUFEKSA9PSBQQVNTKSB7CisJCXJlYWRfZGF0YV9mcm9tX2ZsYXNoX21lbShkZW5hbGksIGJ1Ziwg
bXRkLT5vb2JzaXplKTsKIAotCQkvKiB3YWl0IGZvciBjb21tYW5kIHRvIGJlIGFjY2VwdGVkICAK
KwkJLyogd2FpdCBmb3IgY29tbWFuZCB0byBiZSBhY2NlcHRlZAogCQkgKiBjYW4gYWx3YXlzIHVz
ZSBzdGF0dXMwIGJpdCBhcyB0aGUgbWFzayBpcyBpZGVudGljYWwgZm9yIGVhY2gKIAkJICogYmFu
ay4gKi8KIAkJaXJxX3N0YXR1cyA9IHdhaXRfZm9yX2lycShkZW5hbGksIGlycV9tYXNrKTsKIAog
CQlpZiAoaXJxX3N0YXR1cyA9PSAwKQotCQl7Ci0JCQlwcmludGsoS0VSTl9FUlIgInBhZ2Ugb24g
T09CIHRpbWVvdXQgJWRcbiIsIGRlbmFsaS0+cGFnZSk7Ci0JCX0KKwkJCXByaW50ayhLRVJOX0VS
UiAicGFnZSBvbiBPT0IgdGltZW91dCAlZFxuIiwKKwkJCQkJZGVuYWxpLT5wYWdlKTsKIAogCQkv
KiBXZSBzZXQgdGhlIGRldmljZSBiYWNrIHRvIE1BSU5fQUNDRVNTIGhlcmUgYXMgSSBvYnNlcnZl
ZAogCQkgKiBpbnN0YWJpbGl0eSB3aXRoIHRoZSBjb250cm9sbGVyIGlmIHlvdSBkbyBhIGJsb2Nr
IGVyYXNlCiAJCSAqIGFuZCB0aGUgbGFzdCB0cmFuc2FjdGlvbiB3YXMgYSBTUEFSRV9BQ0NFU1Mu
IEJsb2NrIGVyYXNlCiAJCSAqIGlzIHJlbGlhYmxlIChhY2NvcmRpbmcgdG8gdGhlIE1URCB0ZXN0
IGluZnJhc3RydWN0dXJlKQotCQkgKiBpZiB5b3UgYXJlIGluIE1BSU5fQUNDRVNTLiAKKwkJICog
aWYgeW91IGFyZSBpbiBNQUlOX0FDQ0VTUy4KIAkJICovCiAJCWFkZHIgPSBCQU5LKGRlbmFsaS0+
Zmxhc2hfYmFuaykgfCBkZW5hbGktPnBhZ2U7Ci0JCWNtZCA9IE1PREVfMTAgfCBhZGRyOyAKKwkJ
Y21kID0gTU9ERV8xMCB8IGFkZHI7CiAJCWluZGV4X2FkZHIoZGVuYWxpLCAodWludDMyX3QpY21k
LCBNQUlOX0FDQ0VTUyk7CiAKICNpZiBERUJVR19ERU5BTEkKIAkJc3Bpbl9sb2NrX2lycSgmZGVu
YWxpLT5pcnFfbG9jayk7Ci0JCWRlbmFsaS0+aXJxX2RlYnVnX2FycmF5W2RlbmFsaS0+aWR4Kytd
ID0gMHg2MDAwMDAwMCB8IG10ZC0+b29ic2l6ZTsKKwkJZGVuYWxpLT5pcnFfZGVidWdfYXJyYXlb
ZGVuYWxpLT5pZHgrK10gPQorCQkJMHg2MDAwMDAwMCB8IG10ZC0+b29ic2l6ZTsKIAkJZGVuYWxp
LT5pZHggJT0gMzI7CiAJCXNwaW5fdW5sb2NrX2lycSgmZGVuYWxpLT5pcnFfbG9jayk7CiAjZW5k
aWYKIAl9CiB9CiAKLS8qIHRoaXMgZnVuY3Rpb24gZXhhbWluZXMgYnVmZmVycyB0byBzZWUgaWYg
dGhleSBjb250YWluIGRhdGEgdGhhdCAKKy8qIHRoaXMgZnVuY3Rpb24gZXhhbWluZXMgYnVmZmVy
cyB0byBzZWUgaWYgdGhleSBjb250YWluIGRhdGEgdGhhdAogICogaW5kaWNhdGUgdGhhdCB0aGUg
YnVmZmVyIGlzIHBhcnQgb2YgYW4gZXJhc2VkIHJlZ2lvbiBvZiBmbGFzaC4KICAqLwogYm9vbCBp
c19lcmFzZWQodWludDhfdCAqYnVmLCBpbnQgbGVuKQogewogCWludCBpID0gMDsKIAlmb3IgKGkg
PSAwOyBpIDwgbGVuOyBpKyspCi0JewkKIAkJaWYgKGJ1ZltpXSAhPSAweEZGKQotCQl7CiAJCQly
ZXR1cm4gZmFsc2U7Ci0JCX0KLQl9CiAJcmV0dXJuIHRydWU7CiB9CiAjZGVmaW5lIEVDQ19TRUNU
T1JfU0laRSA1MTIKQEAgLTEzNTgsNjQgKzEzODYsNTggQEAgYm9vbCBpc19lcmFzZWQodWludDhf
dCAqYnVmLCBpbnQgbGVuKQogI2RlZmluZSBFQ0NfRVJSX0RFVklDRSh4KQkoKHgpICYgRVJSX0NP
UlJFQ1RJT05fSU5GT19fREVWSUNFX05SID4+IDgpCiAjZGVmaW5lIEVDQ19MQVNUX0VSUih4KQkJ
KCh4KSAmIEVSUl9DT1JSRUNUSU9OX0lORk9fX0xBU1RfRVJSX0lORk8pCiAKLXN0YXRpYyBib29s
IGhhbmRsZV9lY2Moc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwgdWludDhfdCAqYnVm
LCAKK3N0YXRpYyBib29sIGhhbmRsZV9lY2Moc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFs
aSwgdWludDhfdCAqYnVmLAogCQkJdWludDhfdCAqb29iYnVmLCB1aW50MzJfdCBpcnFfc3RhdHVz
KQogewogCWJvb2wgY2hlY2tfZXJhc2VkX3BhZ2UgPSBmYWxzZTsKIAotCWlmIChpcnFfc3RhdHVz
ICYgSU5UUl9TVEFUVVMwX19FQ0NfRVJSKQotCXsKKwlpZiAoaXJxX3N0YXR1cyAmIElOVFJfU1RB
VFVTMF9fRUNDX0VSUikgewogCQkvKiByZWFkIHRoZSBFQ0MgZXJyb3JzLiB3ZSdsbCBpZ25vcmUg
dGhlbSBmb3Igbm93ICovCiAJCXVpbnQzMl90IGVycl9hZGRyZXNzID0gMCwgZXJyX2NvcnJlY3Rp
b25faW5mbyA9IDA7CiAJCXVpbnQzMl90IGVycl9ieXRlID0gMCwgZXJyX3NlY3RvciA9IDAsIGVy
cl9kZXZpY2UgPSAwOwogCQl1aW50MzJfdCBlcnJfY29ycmVjdGlvbl92YWx1ZSA9IDA7CiAKLQkJ
ZG8gCi0JCXsKLQkJCWVycl9hZGRyZXNzID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyAK
KwkJZG8geworCQkJZXJyX2FkZHJlc3MgPSBpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArCiAJ
CQkJCQlFQ0NfRVJST1JfQUREUkVTUyk7CiAJCQllcnJfc2VjdG9yID0gRUNDX1NFQ1RPUihlcnJf
YWRkcmVzcyk7CiAJCQllcnJfYnl0ZSA9IEVDQ19CWVRFKGVycl9hZGRyZXNzKTsKIAogCi0JCQll
cnJfY29ycmVjdGlvbl9pbmZvID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKyAKKwkJCWVy
cl9jb3JyZWN0aW9uX2luZm8gPSBpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArCiAJCQkJCQlF
UlJfQ09SUkVDVElPTl9JTkZPKTsKLQkJCWVycl9jb3JyZWN0aW9uX3ZhbHVlID0gCisJCQllcnJf
Y29ycmVjdGlvbl92YWx1ZSA9CiAJCQkJRUNDX0NPUlJFQ1RJT05fVkFMVUUoZXJyX2NvcnJlY3Rp
b25faW5mbyk7CiAJCQllcnJfZGV2aWNlID0gRUNDX0VSUl9ERVZJQ0UoZXJyX2NvcnJlY3Rpb25f
aW5mbyk7CiAKLQkJCWlmIChFQ0NfRVJST1JfQ09SUkVDVEFCTEUoZXJyX2NvcnJlY3Rpb25faW5m
bykpCi0JCQl7CisJCQlpZiAoRUNDX0VSUk9SX0NPUlJFQ1RBQkxFKGVycl9jb3JyZWN0aW9uX2lu
Zm8pKSB7CiAJCQkJLyogb2Zmc2V0IGluIG91ciBidWZmZXIgaXMgY29tcHV0ZWQgYXM6Ci0JCQkJ
ICAgc2VjdG9yIG51bWJlciAqIHNlY3RvciBzaXplICsgb2Zmc2V0IGluIAorCQkJCSAgIHNlY3Rv
ciBudW1iZXIgKiBzZWN0b3Igc2l6ZSArIG9mZnNldCBpbgogCQkJCSAgIHNlY3RvcgogCQkJCSAq
LwotCQkJCWludCBvZmZzZXQgPSBlcnJfc2VjdG9yICogRUNDX1NFQ1RPUl9TSVpFICsgCisJCQkJ
aW50IG9mZnNldCA9IGVycl9zZWN0b3IgKiBFQ0NfU0VDVE9SX1NJWkUgKwogCQkJCQkJCQllcnJf
Ynl0ZTsKLQkJCQlpZiAob2Zmc2V0IDwgZGVuYWxpLT5tdGQud3JpdGVzaXplKQotCQkJCXsKKwkJ
CQlpZiAob2Zmc2V0IDwgZGVuYWxpLT5tdGQud3JpdGVzaXplKSB7CiAJCQkJCS8qIGNvcnJlY3Qg
dGhlIEVDQyBlcnJvciAqLwogCQkJCQlidWZbb2Zmc2V0XSBePSBlcnJfY29ycmVjdGlvbl92YWx1
ZTsKIAkJCQkJZGVuYWxpLT5tdGQuZWNjX3N0YXRzLmNvcnJlY3RlZCsrOwotCQkJCX0KLQkJCQll
bHNlCi0JCQkJeworCQkJCX0gZWxzZSB7CiAJCQkJCS8qIGJ1bW1lciwgY291bGRuJ3QgY29ycmVj
dCB0aGUgZXJyb3IgKi8KIAkJCQkJcHJpbnRrKEtFUk5fRVJSICJFQ0Mgb2Zmc2V0IGludmFsaWRc
biIpOwogCQkJCQlkZW5hbGktPm10ZC5lY2Nfc3RhdHMuZmFpbGVkKys7CiAJCQkJfQotCQkJfQot
CQkJZWxzZQotCQkJewotCQkJCS8qIGlmIHRoZSBlcnJvciBpcyBub3QgY29ycmVjdGFibGUsIG5l
ZWQgdG8gCi0JCQkJICogbG9vayBhdCB0aGUgcGFnZSB0byBzZWUgaWYgaXQgaXMgYW4gZXJhc2Vk
IHBhZ2UuCi0JCQkJICogaWYgc28sIHRoZW4gaXQncyBub3QgYSByZWFsIEVDQyBlcnJvciAqLwkK
KwkJCX0gZWxzZSB7CisJCQkJLyogaWYgdGhlIGVycm9yIGlzIG5vdCBjb3JyZWN0YWJsZSwgbmVl
ZCB0bworCQkJCSAqIGxvb2sgYXQgdGhlIHBhZ2UgdG8gc2VlIGlmIGl0IGlzIGFuCisJCQkJICog
ZXJhc2VkIHBhZ2UuCisJCQkJICogaWYgc28sIHRoZW4gaXQncyBub3QgYSByZWFsIEVDQyBlcnJv
ciAqLwogCQkJCWNoZWNrX2VyYXNlZF9wYWdlID0gdHJ1ZTsKIAkJCX0KIAotI2lmIERFQlVHX0RF
TkFMSSAKLQkJCXByaW50aygiRGV0ZWN0ZWQgRUNDIGVycm9yIGluIHBhZ2UgJWQ6IGVycl9hZGRy
ID0gMHglMDh4LCIKLQkJCQkiIGluZm8gdG8gZml4IGlzIDB4JTA4eFxuIiwgZGVuYWxpLT5wYWdl
LCBlcnJfYWRkcmVzcywgCisjaWYgREVCVUdfREVOQUxJCisJCQlwcmludGsoS0VSTl9JTkZPICJE
ZXRlY3RlZCBFQ0MgZXJyb3IgaW4gcGFnZSAlZDogIgorCQkJCSJlcnJfYWRkciA9IDB4JTA4eCwg
aW5mbyB0byBmaXggaXMgMHglMDh4XG4iLAorCQkJCWRlbmFsaS0+cGFnZSwgZXJyX2FkZHJlc3Ms
CiAJCQkJZXJyX2NvcnJlY3Rpb25faW5mbyk7CiAjZW5kaWYKIAkJfSB3aGlsZSAoIUVDQ19MQVNU
X0VSUihlcnJfY29ycmVjdGlvbl9pbmZvKSk7CkBAIC0xNDI4LDcgKzE0NTAsOCBAQCBzdGF0aWMg
dm9pZCBkZW5hbGlfZW5hYmxlX2RtYShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpLCBi
b29sIGVuKQogewogCXVpbnQzMl90IHJlZ192YWwgPSAweDA7CiAKLQlpZiAoZW4pIHJlZ192YWwg
PSBETUFfRU5BQkxFX19GTEFHOworCWlmIChlbikKKwkJcmVnX3ZhbCA9IERNQV9FTkFCTEVfX0ZM
QUc7CiAKIAlkZW5hbGlfd3JpdGUzMihyZWdfdmFsLCBkZW5hbGktPmZsYXNoX3JlZyArIERNQV9F
TkFCTEUpOwogCWlvcmVhZDMyKGRlbmFsaS0+Zmxhc2hfcmVnICsgRE1BX0VOQUJMRSk7CkBAIC0x
NDU4LDkgKzE0ODEsOSBAQCBzdGF0aWMgdm9pZCBkZW5hbGlfc2V0dXBfZG1hKHN0cnVjdCBkZW5h
bGlfbmFuZF9pbmZvICpkZW5hbGksIGludCBvcCkKIAlpbmRleF9hZGRyKGRlbmFsaSwgbW9kZSB8
IDB4MTQwMDAsIDB4MjQwMCk7CiB9CiAKLS8qIHdyaXRlcyBhIHBhZ2UuIHVzZXIgc3BlY2lmaWVz
IHR5cGUsIGFuZCB0aGlzIGZ1bmN0aW9uIGhhbmRsZXMgdGhlIAorLyogd3JpdGVzIGEgcGFnZS4g
dXNlciBzcGVjaWZpZXMgdHlwZSwgYW5kIHRoaXMgZnVuY3Rpb24gaGFuZGxlcyB0aGUKICAgIGNv
bmZpZ3VyYXRpb24gZGV0YWlscy4gKi8KLXN0YXRpYyB2b2lkIHdyaXRlX3BhZ2Uoc3RydWN0IG10
ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIAorc3RhdGljIHZvaWQgd3JpdGVf
cGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAkJCWNv
bnN0IHVpbnQ4X3QgKmJ1ZiwgYm9vbCByYXdfeGZlcikKIHsKIAlzdHJ1Y3QgZGVuYWxpX25hbmRf
aW5mbyAqZGVuYWxpID0gbXRkX3RvX2RlbmFsaShtdGQpOwpAQCAtMTQ3MCw3ICsxNDkzLDcgQEAg
c3RhdGljIHZvaWQgd3JpdGVfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCwKIAlzaXplX3Qgc2l6ZSA9IGRlbmFsaS0+bXRkLndyaXRlc2l6ZSArIGRlbmFs
aS0+bXRkLm9vYnNpemU7CiAKIAl1aW50MzJfdCBpcnFfc3RhdHVzID0gMDsKLQl1aW50MzJfdCBp
cnFfbWFzayA9IElOVFJfU1RBVFVTMF9fRE1BX0NNRF9DT01QIHwgCisJdWludDMyX3QgaXJxX21h
c2sgPSBJTlRSX1NUQVRVUzBfX0RNQV9DTURfQ09NUCB8CiAJCQkJCQlJTlRSX1NUQVRVUzBfX1BS
T0dSQU1fRkFJTDsKIAogCS8qIGlmIGl0IGlzIGEgcmF3IHhmZXIsIHdlIHdhbnQgdG8gZGlzYWJs
ZSBlY2MsIGFuZCBzZW5kCkBAIC0xNDg0LDczICsxNTA3LDcxIEBAIHN0YXRpYyB2b2lkIHdyaXRl
X3BhZ2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAJbWVt
Y3B5KGRlbmFsaS0+YnVmLmJ1ZiwgYnVmLCBtdGQtPndyaXRlc2l6ZSk7CiAKIAlpZiAocmF3X3hm
ZXIpCi0JewogCQkvKiB0cmFuc2ZlciB0aGUgZGF0YSB0byB0aGUgc3BhcmUgYXJlYSAqLwotCQlt
ZW1jcHkoZGVuYWxpLT5idWYuYnVmICsgbXRkLT53cml0ZXNpemUsIAotCQkJY2hpcC0+b29iX3Bv
aSwgCi0JCQltdGQtPm9vYnNpemUpOyAKLQl9CisJCW1lbWNweShkZW5hbGktPmJ1Zi5idWYgKyBt
dGQtPndyaXRlc2l6ZSwKKwkJCWNoaXAtPm9vYl9wb2ksCisJCQltdGQtPm9vYnNpemUpOwogCiAJ
cGNpX2RtYV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlKHBjaV9kZXYsIGFkZHIsIHNpemUsIFBDSV9E
TUFfVE9ERVZJQ0UpOwogCiAJY2xlYXJfaW50ZXJydXB0cyhkZW5hbGkpOwotCWRlbmFsaV9lbmFi
bGVfZG1hKGRlbmFsaSwgdHJ1ZSk7CQorCWRlbmFsaV9lbmFibGVfZG1hKGRlbmFsaSwgdHJ1ZSk7
CiAKIAlkZW5hbGlfc2V0dXBfZG1hKGRlbmFsaSwgREVOQUxJX1dSSVRFKTsKIAogCS8qIHdhaXQg
Zm9yIG9wZXJhdGlvbiB0byBjb21wbGV0ZSAqLwogCWlycV9zdGF0dXMgPSB3YWl0X2Zvcl9pcnEo
ZGVuYWxpLCBpcnFfbWFzayk7CiAKLQlpZiAoaXJxX3N0YXR1cyA9PSAwKQotCXsKLQkJcHJpbnRr
KEtFUk5fRVJSICJ0aW1lb3V0IG9uIHdyaXRlX3BhZ2UgKHR5cGUgPSAlZClcbiIsIHJhd194ZmVy
KTsKLQkJZGVuYWxpLT5zdGF0dXMgPSAKLQkgICAJICAgKGlycV9zdGF0dXMgJiBJTlRSX1NUQVRV
UzBfX1BST0dSQU1fRkFJTCkgPyBOQU5EX1NUQVRVU19GQUlMIDogCi0JCQkJCQkgICAJICAgICBQ
QVNTOworCWlmIChpcnFfc3RhdHVzID09IDApIHsKKwkJcHJpbnRrKEtFUk5fRVJSICJ0aW1lb3V0
IG9uIHdyaXRlX3BhZ2UgKHR5cGUgPSAlZClcbiIsCisJCQkJcmF3X3hmZXIpOworCQlkZW5hbGkt
PnN0YXR1cyA9CisJCQkoaXJxX3N0YXR1cyAmIElOVFJfU1RBVFVTMF9fUFJPR1JBTV9GQUlMKSA/
CisJCQlOQU5EX1NUQVRVU19GQUlMIDogUEFTUzsKIAl9CiAKLQlkZW5hbGlfZW5hYmxlX2RtYShk
ZW5hbGksIGZhbHNlKTsJCisJZGVuYWxpX2VuYWJsZV9kbWEoZGVuYWxpLCBmYWxzZSk7CiAJcGNp
X2RtYV9zeW5jX3NpbmdsZV9mb3JfY3B1KHBjaV9kZXYsIGFkZHIsIHNpemUsIFBDSV9ETUFfVE9E
RVZJQ0UpOwogfQogCiAvKiBOQU5EIGNvcmUgZW50cnkgcG9pbnRzICovCiAKLS8qIHRoaXMgaXMg
dGhlIGNhbGxiYWNrIHRoYXQgdGhlIE5BTkQgY29yZSBjYWxscyB0byB3cml0ZSBhIHBhZ2UuIFNp
bmNlIAotICAgd3JpdGluZyBhIHBhZ2Ugd2l0aCBFQ0Mgb3Igd2l0aG91dCBpcyBzaW1pbGFyLCBh
bGwgdGhlIHdvcmsgaXMgZG9uZSAKKy8qIHRoaXMgaXMgdGhlIGNhbGxiYWNrIHRoYXQgdGhlIE5B
TkQgY29yZSBjYWxscyB0byB3cml0ZSBhIHBhZ2UuIFNpbmNlCisgICB3cml0aW5nIGEgcGFnZSB3
aXRoIEVDQyBvciB3aXRob3V0IGlzIHNpbWlsYXIsIGFsbCB0aGUgd29yayBpcyBkb25lCiAgICBi
eSB3cml0ZV9wYWdlIGFib3ZlLiAgICovCi1zdGF0aWMgdm9pZCBkZW5hbGlfd3JpdGVfcGFnZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgCitzdGF0aWMgdm9p
ZCBkZW5hbGlfd3JpdGVfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCwKIAkJCQljb25zdCB1aW50OF90ICpidWYpCiB7CiAJLyogZm9yIHJlZ3VsYXIgcGFn
ZSB3cml0ZXMsIHdlIGxldCBIVyBoYW5kbGUgYWxsIHRoZSBFQ0MKLSAgICAgICAgICogZGF0YSB3
cml0dGVuIHRvIHRoZSBkZXZpY2UuICovCisJICogZGF0YSB3cml0dGVuIHRvIHRoZSBkZXZpY2Uu
ICovCiAJd3JpdGVfcGFnZShtdGQsIGNoaXAsIGJ1ZiwgZmFsc2UpOwogfQogCi0vKiBUaGlzIGlz
IHRoZSBjYWxsYmFjayB0aGF0IHRoZSBOQU5EIGNvcmUgY2FsbHMgdG8gd3JpdGUgYSBwYWdlIHdp
dGhvdXQgRUNDLiAKKy8qIFRoaXMgaXMgdGhlIGNhbGxiYWNrIHRoYXQgdGhlIE5BTkQgY29yZSBj
YWxscyB0byB3cml0ZSBhIHBhZ2Ugd2l0aG91dCBFQ0MuCiAgICByYXcgYWNjZXNzIGlzIHNpbWls
aWFyIHRvIEVDQyBwYWdlIHdyaXRlcywgc28gYWxsIHRoZSB3b3JrIGlzIGRvbmUgaW4gdGhlCi0g
ICB3cml0ZV9wYWdlKCkgZnVuY3Rpb24gYWJvdmUuIAorICAgd3JpdGVfcGFnZSgpIGZ1bmN0aW9u
IGFib3ZlLgogICovCi1zdGF0aWMgdm9pZCBkZW5hbGlfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG10
ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIAorc3RhdGljIHZvaWQgZGVuYWxp
X3dyaXRlX3BhZ2VfcmF3KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwLAogCQkJCQljb25zdCB1aW50OF90ICpidWYpCiB7Ci0JLyogZm9yIHJhdyBwYWdlIHdyaXRl
cywgd2Ugd2FudCB0byBkaXNhYmxlIEVDQyBhbmQgc2ltcGx5IHdyaXRlIAorCS8qIGZvciByYXcg
cGFnZSB3cml0ZXMsIHdlIHdhbnQgdG8gZGlzYWJsZSBFQ0MgYW5kIHNpbXBseSB3cml0ZQogCSAg
IHdoYXRldmVyIGRhdGEgaXMgaW4gdGhlIGJ1ZmZlci4gKi8KIAl3cml0ZV9wYWdlKG10ZCwgY2hp
cCwgYnVmLCB0cnVlKTsKIH0KIAotc3RhdGljIGludCBkZW5hbGlfd3JpdGVfb29iKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCAKK3N0YXRpYyBpbnQgZGVuYWxp
X3dyaXRlX29vYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
IAkJCSAgICBpbnQgcGFnZSkKIHsKLQlyZXR1cm4gd3JpdGVfb29iX2RhdGEobXRkLCBjaGlwLT5v
b2JfcG9pLCBwYWdlKTsJCisJcmV0dXJuIHdyaXRlX29vYl9kYXRhKG10ZCwgY2hpcC0+b29iX3Bv
aSwgcGFnZSk7CiB9CiAKLXN0YXRpYyBpbnQgZGVuYWxpX3JlYWRfb29iKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCAKK3N0YXRpYyBpbnQgZGVuYWxpX3JlYWRf
b29iKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogCQkJICAg
aW50IHBhZ2UsIGludCBzbmRjbWQpCiB7CiAJcmVhZF9vb2JfZGF0YShtdGQsIGNoaXAtPm9vYl9w
b2ksIHBhZ2UpOwogCi0JcmV0dXJuIDA7IC8qIG5vdGlmeSBOQU5EIGNvcmUgdG8gc2VuZCBjb21t
YW5kIHRvIAotICAgICAgICAgICAgICAgICAgICogTkFORCBkZXZpY2UuICovCisJcmV0dXJuIDA7
IC8qIG5vdGlmeSBOQU5EIGNvcmUgdG8gc2VuZCBjb21tYW5kIHRvCisJCQkJIE5BTkQgZGV2aWNl
LiAqLwogfQogCiBzdGF0aWMgaW50IGRlbmFsaV9yZWFkX3BhZ2Uoc3RydWN0IG10ZF9pbmZvICpt
dGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCkBAIC0xNTYzLDcgKzE1ODQsNyBAQCBzdGF0aWMg
aW50IGRlbmFsaV9yZWFkX3BhZ2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsCiAJc2l6ZV90IHNpemUgPSBkZW5hbGktPm10ZC53cml0ZXNpemUgKyBkZW5hbGkt
Pm10ZC5vb2JzaXplOwogCiAJdWludDMyX3QgaXJxX3N0YXR1cyA9IDA7Ci0JdWludDMyX3QgaXJx
X21hc2sgPSBJTlRSX1NUQVRVUzBfX0VDQ19UUkFOU0FDVElPTl9ET05FIHwgCisJdWludDMyX3Qg
aXJxX21hc2sgPSBJTlRSX1NUQVRVUzBfX0VDQ19UUkFOU0FDVElPTl9ET05FIHwKIAkJCSAgICBJ
TlRSX1NUQVRVUzBfX0VDQ19FUlI7CiAJYm9vbCBjaGVja19lcmFzZWRfcGFnZSA9IGZhbHNlOwog
CkBAIC0xNTgxLDI2ICsxNjAyLDIwIEBAIHN0YXRpYyBpbnQgZGVuYWxpX3JlYWRfcGFnZShzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAlwY2lfZG1hX3N5bmNf
c2luZ2xlX2Zvcl9jcHUocGNpX2RldiwgYWRkciwgc2l6ZSwgUENJX0RNQV9GUk9NREVWSUNFKTsK
IAogCW1lbWNweShidWYsIGRlbmFsaS0+YnVmLmJ1ZiwgbXRkLT53cml0ZXNpemUpOwotCQorCiAJ
Y2hlY2tfZXJhc2VkX3BhZ2UgPSBoYW5kbGVfZWNjKGRlbmFsaSwgYnVmLCBjaGlwLT5vb2JfcG9p
LCBpcnFfc3RhdHVzKTsKIAlkZW5hbGlfZW5hYmxlX2RtYShkZW5hbGksIGZhbHNlKTsKIAotCWlm
IChjaGVja19lcmFzZWRfcGFnZSkKLQl7CisJaWYgKGNoZWNrX2VyYXNlZF9wYWdlKSB7CiAJCXJl
YWRfb29iX2RhdGEoJmRlbmFsaS0+bXRkLCBjaGlwLT5vb2JfcG9pLCBkZW5hbGktPnBhZ2UpOwog
CiAJCS8qIGNoZWNrIEVDQyBmYWlsdXJlcyB0aGF0IG1heSBoYXZlIG9jY3VycmVkIG9uIGVyYXNl
ZCBwYWdlcyAqLwotCQlpZiAoY2hlY2tfZXJhc2VkX3BhZ2UpCi0JCXsKKwkJaWYgKGNoZWNrX2Vy
YXNlZF9wYWdlKSB7CiAJCQlpZiAoIWlzX2VyYXNlZChidWYsIGRlbmFsaS0+bXRkLndyaXRlc2l6
ZSkpCi0JCQl7CiAJCQkJZGVuYWxpLT5tdGQuZWNjX3N0YXRzLmZhaWxlZCsrOwotCQkJfQogCQkJ
aWYgKCFpc19lcmFzZWQoYnVmLCBkZW5hbGktPm10ZC5vb2JzaXplKSkKLQkJCXsKIAkJCQlkZW5h
bGktPm10ZC5lY2Nfc3RhdHMuZmFpbGVkKys7Ci0JCQl9Ci0JCX0JCisJCX0KIAl9CiAJcmV0dXJu
IDA7CiB9CkBAIC0xNjE2LDcgKzE2MzEsNyBAQCBzdGF0aWMgaW50IGRlbmFsaV9yZWFkX3BhZ2Vf
cmF3KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogCiAJdWlu
dDMyX3QgaXJxX3N0YXR1cyA9IDA7CiAJdWludDMyX3QgaXJxX21hc2sgPSBJTlRSX1NUQVRVUzBf
X0RNQV9DTURfQ09NUDsKLQkJCQkJCQorCiAJc2V0dXBfZWNjX2Zvcl94ZmVyKGRlbmFsaSwgZmFs
c2UsIHRydWUpOwogCWRlbmFsaV9lbmFibGVfZG1hKGRlbmFsaSwgdHJ1ZSk7CiAKQEAgLTE2NDQs
MTIgKzE2NTksMTAgQEAgc3RhdGljIHVpbnQ4X3QgZGVuYWxpX3JlYWRfYnl0ZShzdHJ1Y3QgbXRk
X2luZm8gKm10ZCkKIAl1aW50OF90IHJlc3VsdCA9IDB4ZmY7CiAKIAlpZiAoZGVuYWxpLT5idWYu
aGVhZCA8IGRlbmFsaS0+YnVmLnRhaWwpCi0JewogCQlyZXN1bHQgPSBkZW5hbGktPmJ1Zi5idWZb
ZGVuYWxpLT5idWYuaGVhZCsrXTsKLQl9CiAKICNpZiBERUJVR19ERU5BTEkKLQlwcmludGsoInJl
YWQgYnl0ZSAtPiAweCUwMnhcbiIsIHJlc3VsdCk7CisJcHJpbnRrKEtFUk5fSU5GTyAicmVhZCBi
eXRlIC0+IDB4JTAyeFxuIiwgcmVzdWx0KTsKICNlbmRpZgogCXJldHVybiByZXN1bHQ7CiB9CkBA
IC0xNjU4LDcgKzE2NzEsNyBAQCBzdGF0aWMgdm9pZCBkZW5hbGlfc2VsZWN0X2NoaXAoc3RydWN0
IG10ZF9pbmZvICptdGQsIGludCBjaGlwKQogewogCXN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpk
ZW5hbGkgPSBtdGRfdG9fZGVuYWxpKG10ZCk7CiAjaWYgREVCVUdfREVOQUxJCi0JcHJpbnRrKCJk
ZW5hbGkgc2VsZWN0IGNoaXAgJWRcbiIsIGNoaXApOworCXByaW50ayhLRVJOX0lORk8gImRlbmFs
aSBzZWxlY3QgY2hpcCAlZFxuIiwgY2hpcCk7CiAjZW5kaWYKIAlzcGluX2xvY2tfaXJxKCZkZW5h
bGktPmlycV9sb2NrKTsKIAlkZW5hbGktPmZsYXNoX2JhbmsgPSBjaGlwOwpAQCAtMTY3Miw3ICsx
Njg1LDcgQEAgc3RhdGljIGludCBkZW5hbGlfd2FpdGZ1bmMoc3RydWN0IG10ZF9pbmZvICptdGQs
IHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCiAJZGVuYWxpLT5zdGF0dXMgPSAwOwogCiAjaWYgREVC
VUdfREVOQUxJCi0JcHJpbnRrKCJ3YWl0ZnVuYyAlZFxuIiwgc3RhdHVzKTsKKwlwcmludGsoS0VS
Tl9JTkZPICJ3YWl0ZnVuYyAlZFxuIiwgc3RhdHVzKTsKICNlbmRpZgogCXJldHVybiBzdGF0dXM7
CiB9CkBAIC0xNjg0LDc2ICsxNjk3LDc3IEBAIHN0YXRpYyB2b2lkIGRlbmFsaV9lcmFzZShzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgaW50IHBhZ2UpCiAJdWludDMyX3QgY21kID0gMHgwLCBpcnFfc3Rh
dHVzID0gMDsKIAogI2lmIERFQlVHX0RFTkFMSQotCXByaW50aygiZXJhc2UgcGFnZTogJWRcbiIs
IHBhZ2UpOworCXByaW50ayhLRVJOX0lORk8gImVyYXNlIHBhZ2U6ICVkXG4iLCBwYWdlKTsKICNl
bmRpZgogCS8qIGNsZWFyIGludGVycnVwdHMgKi8KLQljbGVhcl9pbnRlcnJ1cHRzKGRlbmFsaSk7
CQorCWNsZWFyX2ludGVycnVwdHMoZGVuYWxpKTsKIAogCS8qIHNldHVwIHBhZ2UgcmVhZCByZXF1
ZXN0IGZvciBhY2Nlc3MgdHlwZSAqLwogCWNtZCA9IE1PREVfMTAgfCBCQU5LKGRlbmFsaS0+Zmxh
c2hfYmFuaykgfCBwYWdlOwogCWluZGV4X2FkZHIoZGVuYWxpLCAodWludDMyX3QpY21kLCAweDEp
OwogCiAJLyogd2FpdCBmb3IgZXJhc2UgdG8gY29tcGxldGUgb3IgZmFpbHVyZSB0byBvY2N1ciAq
LwotCWlycV9zdGF0dXMgPSB3YWl0X2Zvcl9pcnEoZGVuYWxpLCBJTlRSX1NUQVRVUzBfX0VSQVNF
X0NPTVAgfCAKKwlpcnFfc3RhdHVzID0gd2FpdF9mb3JfaXJxKGRlbmFsaSwgSU5UUl9TVEFUVVMw
X19FUkFTRV9DT01QIHwKIAkJCQkJSU5UUl9TVEFUVVMwX19FUkFTRV9GQUlMKTsKIAotCWRlbmFs
aS0+c3RhdHVzID0gKGlycV9zdGF0dXMgJiBJTlRSX1NUQVRVUzBfX0VSQVNFX0ZBSUwpID8gTkFO
RF9TVEFUVVNfRkFJTCA6IAotCQkJCQkJCQkgUEFTUzsKKwlkZW5hbGktPnN0YXR1cyA9IChpcnFf
c3RhdHVzICYgSU5UUl9TVEFUVVMwX19FUkFTRV9GQUlMKSA/CisJCQkJCU5BTkRfU1RBVFVTX0ZB
SUwgOiBQQVNTOwogfQogCi1zdGF0aWMgdm9pZCBkZW5hbGlfY21kZnVuYyhzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwgdW5zaWduZWQgaW50IGNtZCwgaW50IGNvbCwgCitzdGF0aWMgdm9pZCBkZW5hbGlf
Y21kZnVuYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdW5zaWduZWQgaW50IGNtZCwgaW50IGNvbCwK
IAkJCSAgIGludCBwYWdlKQogewogCXN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkgPSBt
dGRfdG9fZGVuYWxpKG10ZCk7CiAKICNpZiBERUJVR19ERU5BTEkKLQlwcmludGsoImNtZGZ1bmM6
IDB4JXggJWQgJWRcbiIsIGNtZCwgY29sLCBwYWdlKTsKKwlwcmludGsoS0VSTl9JTkZPICJjbWRm
dW5jOiAweCV4ICVkICVkXG4iLCBjbWQsIGNvbCwgcGFnZSk7CiAjZW5kaWYKLQlzd2l0Y2ggKGNt
ZCkKLQl7IAotCQljYXNlIE5BTkRfQ01EX1BBR0VQUk9HOgotCQkJYnJlYWs7Ci0JCWNhc2UgTkFO
RF9DTURfU1RBVFVTOgotCQkJcmVhZF9zdGF0dXMoZGVuYWxpKTsKLQkJCWJyZWFrOwotCQljYXNl
IE5BTkRfQ01EX1JFQURJRDoKLQkJCXJlc2V0X2J1ZihkZW5hbGkpOwotCQkJaWYgKGRlbmFsaS0+
Zmxhc2hfYmFuayA8IGRlbmFsaS0+dG90YWxfdXNlZF9iYW5rcykKLQkJCXsKLQkJCQkvKiB3cml0
ZSBtYW51ZmFjdHVyZXIgaW5mb3JtYXRpb24gaW50byBuYW5kIAotCQkJCSAgIGJ1ZmZlciBmb3Ig
TkFORCBzdWJzeXN0ZW0gdG8gZmV0Y2guCi0gIAkJCSAgICAgICAgICovIAotCSAgICAgICAgICAg
ICAgICAgICAgICAgIHdyaXRlX2J5dGVfdG9fYnVmKGRlbmFsaSwgZGVuYWxpLT5kZXZfaW5mby53
RGV2aWNlTWFrZXIpOwotCSAgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlX2J5dGVfdG9fYnVm
KGRlbmFsaSwgZGVuYWxpLT5kZXZfaW5mby53RGV2aWNlSUQpOwotCSAgICAgICAgICAgICAgICAg
ICAgICAgIHdyaXRlX2J5dGVfdG9fYnVmKGRlbmFsaSwgZGVuYWxpLT5kZXZfaW5mby5iRGV2aWNl
UGFyYW0wKTsKLQkgICAgICAgICAgICAgICAgICAgICAgICB3cml0ZV9ieXRlX3RvX2J1ZihkZW5h
bGksIGRlbmFsaS0+ZGV2X2luZm8uYkRldmljZVBhcmFtMSk7Ci0JICAgICAgICAgICAgICAgICAg
ICAgICAgd3JpdGVfYnl0ZV90b19idWYoZGVuYWxpLCBkZW5hbGktPmRldl9pbmZvLmJEZXZpY2VQ
YXJhbTIpOwotCQkJfQotCQkJZWxzZSAKLQkJCXsKLQkJCQlpbnQgaTsKLQkJCQlmb3IgKGkgPSAw
OyBpIDwgNTsgaSsrKSAKLQkJCQkJd3JpdGVfYnl0ZV90b19idWYoZGVuYWxpLCAweGZmKTsKLQkJ
CX0KLQkJCWJyZWFrOwotCQljYXNlIE5BTkRfQ01EX1JFQUQwOgotCQljYXNlIE5BTkRfQ01EX1NF
UUlOOgotCQkJZGVuYWxpLT5wYWdlID0gcGFnZTsKLQkJCWJyZWFrOwotCQljYXNlIE5BTkRfQ01E
X1JFU0VUOgotCQkJcmVzZXRfYmFuayhkZW5hbGkpOwotCQkJYnJlYWs7Ci0JCWNhc2UgTkFORF9D
TURfUkVBRE9PQjoKLQkJCS8qIFRPRE86IFJlYWQgT09CIGRhdGEgKi8KLQkJCWJyZWFrOwotCQlk
ZWZhdWx0OgotCQkJcHJpbnRrKEtFUk5fRVJSICI6IHVuc3VwcG9ydGVkIGNvbW1hbmQgcmVjZWl2
ZWQgMHgleFxuIiwgY21kKTsKLQkJCWJyZWFrOworCXN3aXRjaCAoY21kKSB7CisJY2FzZSBOQU5E
X0NNRF9QQUdFUFJPRzoKKwkJYnJlYWs7CisJY2FzZSBOQU5EX0NNRF9TVEFUVVM6CisJCXJlYWRf
c3RhdHVzKGRlbmFsaSk7CisJCWJyZWFrOworCWNhc2UgTkFORF9DTURfUkVBRElEOgorCQlyZXNl
dF9idWYoZGVuYWxpKTsKKwkJaWYgKGRlbmFsaS0+Zmxhc2hfYmFuayA8IGRlbmFsaS0+dG90YWxf
dXNlZF9iYW5rcykgeworCQkJLyogd3JpdGUgbWFudWZhY3R1cmVyIGluZm9ybWF0aW9uIGludG8g
bmFuZAorCQkJICAgYnVmZmVyIGZvciBOQU5EIHN1YnN5c3RlbSB0byBmZXRjaC4KKwkJCQkgKi8K
KwkJCXdyaXRlX2J5dGVfdG9fYnVmKGRlbmFsaSwKKwkJCQkJZGVuYWxpLT5kZXZfaW5mby53RGV2
aWNlTWFrZXIpOworCQkJd3JpdGVfYnl0ZV90b19idWYoZGVuYWxpLAorCQkJCQlkZW5hbGktPmRl
dl9pbmZvLndEZXZpY2VJRCk7CisJCQl3cml0ZV9ieXRlX3RvX2J1ZihkZW5hbGksCisJCQkJCWRl
bmFsaS0+ZGV2X2luZm8uYkRldmljZVBhcmFtMCk7CisJCQl3cml0ZV9ieXRlX3RvX2J1ZihkZW5h
bGksCisJCQkJCWRlbmFsaS0+ZGV2X2luZm8uYkRldmljZVBhcmFtMSk7CisJCQl3cml0ZV9ieXRl
X3RvX2J1ZihkZW5hbGksCisJCQkJCWRlbmFsaS0+ZGV2X2luZm8uYkRldmljZVBhcmFtMik7CisJ
CX0gZWxzZSB7CisJCQlpbnQgaTsKKwkJCWZvciAoaSA9IDA7IGkgPCA1OyBpKyspCisJCQkJd3Jp
dGVfYnl0ZV90b19idWYoZGVuYWxpLCAweGZmKTsKKwkJfQorCQlicmVhazsKKwljYXNlIE5BTkRf
Q01EX1JFQUQwOgorCWNhc2UgTkFORF9DTURfU0VRSU46CisJCWRlbmFsaS0+cGFnZSA9IHBhZ2U7
CisJCWJyZWFrOworCWNhc2UgTkFORF9DTURfUkVTRVQ6CisJCXJlc2V0X2JhbmsoZGVuYWxpKTsK
KwkJYnJlYWs7CisJY2FzZSBOQU5EX0NNRF9SRUFET09COgorCQkvKiBUT0RPOiBSZWFkIE9PQiBk
YXRhICovCisJCWJyZWFrOworCWRlZmF1bHQ6CisJCXByaW50ayhLRVJOX0VSUiAiOiB1bnN1cHBv
cnRlZCBjb21tYW5kIHJlY2VpdmVkIDB4JXhcbiIsIGNtZCk7CisJCWJyZWFrOwogCX0KIH0KIAog
Lyogc3R1YnMgZm9yIEVDQyBmdW5jdGlvbnMgbm90IHVzZWQgYnkgdGhlIE5BTkQgY29yZSAqLwot
c3RhdGljIGludCBkZW5hbGlfZWNjX2NhbGN1bGF0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgY29u
c3QgdWludDhfdCAqZGF0YSwgCitzdGF0aWMgaW50IGRlbmFsaV9lY2NfY2FsY3VsYXRlKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBjb25zdCB1aW50OF90ICpkYXRhLAogCQkJCXVpbnQ4X3QgKmVjY19j
b2RlKQogewogCXByaW50ayhLRVJOX0VSUiAiZGVuYWxpX2VjY19jYWxjdWxhdGUgY2FsbGVkIHVu
ZXhwZWN0ZWRseVxuIik7CkBAIC0xNzYxLDcgKzE3NzUsNyBAQCBzdGF0aWMgaW50IGRlbmFsaV9l
Y2NfY2FsY3VsYXRlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBjb25zdCB1aW50OF90ICpkYXRhLAog
CXJldHVybiAtRUlPOwogfQogCi1zdGF0aWMgaW50IGRlbmFsaV9lY2NfY29ycmVjdChzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgdWludDhfdCAqZGF0YSwgCitzdGF0aWMgaW50IGRlbmFsaV9lY2NfY29y
cmVjdChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdWludDhfdCAqZGF0YSwKIAkJCQl1aW50OF90ICpy
ZWFkX2VjYywgdWludDhfdCAqY2FsY19lY2MpCiB7CiAJcHJpbnRrKEtFUk5fRVJSICJkZW5hbGlf
ZWNjX2NvcnJlY3QgY2FsbGVkIHVuZXhwZWN0ZWRseVxuIik7CkBAIC0xNzgyLDcgKzE3OTYsOCBA
QCBzdGF0aWMgdm9pZCBkZW5hbGlfaHdfaW5pdChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVu
YWxpKQogCWRlbmFsaV9pcnFfaW5pdChkZW5hbGkpOwogCU5BTkRfRmxhc2hfUmVzZXQoZGVuYWxp
KTsKIAlkZW5hbGlfd3JpdGUzMigweDBGLCBkZW5hbGktPmZsYXNoX3JlZyArIFJCX1BJTl9FTkFC
TEVEKTsKLQlkZW5hbGlfd3JpdGUzMihDSElQX0VOX0RPTlRfQ0FSRV9fRkxBRywgZGVuYWxpLT5m
bGFzaF9yZWcgKyBDSElQX0VOQUJMRV9ET05UX0NBUkUpOworCWRlbmFsaV93cml0ZTMyKENISVBf
RU5fRE9OVF9DQVJFX19GTEFHLAorCQkJZGVuYWxpLT5mbGFzaF9yZWcgKyBDSElQX0VOQUJMRV9E
T05UX0NBUkUpOwogCiAJZGVuYWxpX3dyaXRlMzIoMHgwLCBkZW5hbGktPmZsYXNoX3JlZyArIFNQ
QVJFX0FSRUFfU0tJUF9CWVRFUyk7CiAJZGVuYWxpX3dyaXRlMzIoMHhmZmZmLCBkZW5hbGktPmZs
YXNoX3JlZyArIFNQQVJFX0FSRUFfTUFSS0VSKTsKQEAgLTE3OTMsMjQgKzE4MDgsMjYgQEAgc3Rh
dGljIHZvaWQgZGVuYWxpX2h3X2luaXQoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkK
IH0KIAogLyogRUNDIGxheW91dCBmb3IgU0xDIGRldmljZXMuIERlbmFsaSBzcGVjIGluZGljYXRl
cyBTTEMgZml4ZWQgYXQgNCBieXRlcyAqLwotI2RlZmluZSBFQ0NfQllURVNfU0xDICAgNCAqICgy
MDQ4IC8gRUNDX1NFQ1RPUl9TSVpFKQorI2RlZmluZSBFQ0NfQllURVNfU0xDICAgKDQgKiAoMjA0
OCAvIEVDQ19TRUNUT1JfU0laRSkpCiBzdGF0aWMgc3RydWN0IG5hbmRfZWNjbGF5b3V0IG5hbmRf
b29iX3NsYyA9IHsKIAkuZWNjYnl0ZXMgPSA0LAogCS5lY2Nwb3MgPSB7IDAsIDEsIDIsIDMgfSwg
Lyogbm90IHVzZWQgKi8KLQkub29iZnJlZSA9IHt7IAotCQkJLm9mZnNldCA9IEVDQ19CWVRFU19T
TEMsIAotCQkJLmxlbmd0aCA9IDY0IC0gRUNDX0JZVEVTX1NMQyAgCi0JCSAgIH19CisJLm9vYmZy
ZWUgPSB7eworCQkJLm9mZnNldCA9IEVDQ19CWVRFU19TTEMsCisJCQkubGVuZ3RoID0gNjQgLSBF
Q0NfQllURVNfU0xDCisJCSAgIH0KKwl9CiB9OwogCi0jZGVmaW5lIEVDQ19CWVRFU19NTEMgICAx
NCAqICgyMDQ4IC8gRUNDX1NFQ1RPUl9TSVpFKQorI2RlZmluZSBFQ0NfQllURVNfTUxDICAgKDE0
ICogKDIwNDggLyBFQ0NfU0VDVE9SX1NJWkUpKQogc3RhdGljIHN0cnVjdCBuYW5kX2VjY2xheW91
dCBuYW5kX29vYl9tbGNfMTRiaXQgPSB7CiAJLmVjY2J5dGVzID0gMTQsCiAJLmVjY3BvcyA9IHsg
MCwgMSwgMiwgMywgNSwgNiwgNywgOCwgOSwgMTAsIDExLCAxMiwgMTMgfSwgLyogbm90IHVzZWQg
Ki8KLQkub29iZnJlZSA9IHt7IAotCQkJLm9mZnNldCA9IEVDQ19CWVRFU19NTEMsIAotCQkJLmxl
bmd0aCA9IDY0IC0gRUNDX0JZVEVTX01MQyAgCi0JCSAgIH19CisJLm9vYmZyZWUgPSB7eworCQkJ
Lm9mZnNldCA9IEVDQ19CWVRFU19NTEMsCisJCQkubGVuZ3RoID0gNjQgLSBFQ0NfQllURVNfTUxD
CisJCSAgIH0KKwl9CiB9OwogCiBzdGF0aWMgdWludDhfdCBiYnRfcGF0dGVybltdID0geydCJywg
J2InLCAndCcsICcwJyB9OwpAQCAtMTg0MiwxMiArMTg1OSwxMiBAQCB2b2lkIGRlbmFsaV9kcnZf
aW5pdChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQogCWRlbmFsaS0+aWR4ID0gMDsK
IAogCS8qIHNldHVwIGludGVycnVwdCBoYW5kbGVyICovCi0JLyogdGhlIGNvbXBsZXRpb24gb2Jq
ZWN0IHdpbGwgYmUgdXNlZCB0byBub3RpZnkgCisJLyogdGhlIGNvbXBsZXRpb24gb2JqZWN0IHdp
bGwgYmUgdXNlZCB0byBub3RpZnkKIAkgKiB0aGUgY2FsbGVlIHRoYXQgdGhlIGludGVycnVwdCBp
cyBkb25lICovCiAJaW5pdF9jb21wbGV0aW9uKCZkZW5hbGktPmNvbXBsZXRlKTsKIAogCS8qIHRo
ZSBzcGlubG9jayB3aWxsIGJlIHVzZWQgdG8gc3luY2hyb25pemUgdGhlIElTUgotCSAqIHdpdGgg
YW55IGVsZW1lbnQgdGhhdCBtaWdodCBiZSBhY2Nlc3Mgc2hhcmVkIAorCSAqIHdpdGggYW55IGVs
ZW1lbnQgdGhhdCBtaWdodCBiZSBhY2Nlc3Mgc2hhcmVkCiAJICogZGF0YSAoaW50ZXJydXB0IHN0
YXR1cykgKi8KIAlzcGluX2xvY2tfaW5pdCgmZGVuYWxpLT5pcnFfbG9jayk7CiAKQEAgLTE4ODAs
MTMgKzE4OTcsMTIgQEAgc3RhdGljIGludCBkZW5hbGlfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2
ICpkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKIAl9CiAKIAlpZiAoaWQtPmRy
aXZlcl9kYXRhID09IElOVEVMX0NFNDEwMCkgewotCQkvKiBEdWUgdG8gYSBzaWxpY29uIGxpbWl0
YXRpb24sIHdlIGNhbiBvbmx5IHN1cHBvcnQgCi0JCSAqIE9ORkkgdGltaW5nIG1vZGUgMSBhbmQg
YmVsb3cuIAotCQkgKi8gCi0JCWlmIChvbmZpX3RpbWluZ19tb2RlIDwgLTEgfHwgb25maV90aW1p
bmdfbW9kZSA+IDEpCi0JCXsKLQkJCXByaW50aygiSW50ZWwgQ0U0MTAwIG9ubHkgc3VwcG9ydHMg
T05GSSB0aW1pbmcgbW9kZSAxICIKLQkJCQkib3IgYmVsb3dcbiIpOworCQkvKiBEdWUgdG8gYSBz
aWxpY29uIGxpbWl0YXRpb24sIHdlIGNhbiBvbmx5IHN1cHBvcnQKKwkJICogT05GSSB0aW1pbmcg
bW9kZSAxIGFuZCBiZWxvdy4KKwkJICovCisJCWlmIChvbmZpX3RpbWluZ19tb2RlIDwgLTEgfHwg
b25maV90aW1pbmdfbW9kZSA+IDEpIHsKKwkJCXByaW50ayhLRVJOX0VSUiAiSW50ZWwgQ0U0MTAw
IG9ubHkgc3VwcG9ydHMgT05GSSIKKwkJCQkJIiB0aW1pbmcgbW9kZSAxIG9yIGJlbG93XG4iKTsK
IAkJCXJldCA9IC1FSU5WQUw7CiAJCQlnb3RvIGZhaWxlZF9lbmFibGU7CiAJCX0KQEAgLTE5MDUs
NyArMTkyMSw4IEBAIHN0YXRpYyBpbnQgZGVuYWxpX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
ZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJCQltZW1fYmFzZSA9IGNzcl9i
YXNlICsgY3NyX2xlbjsKIAkJCW1lbV9sZW4gPSBjc3JfbGVuOwogCQkJbmFuZF9kYmdfcHJpbnQo
TkFORF9EQkdfV0FSTiwKLQkJCQkgICAgICAgIlNwZWN0cmE6IE5vIHNlY29uZCBCQVIgZm9yIFBD
SSBkZXZpY2U7IGFzc3VtaW5nICUwOEx4XG4iLAorCQkJCSAgICAgICAiU3BlY3RyYTogTm8gc2Vj
b25kIEJBUiBmb3IgUENJIGRldmljZTsiCisJCQkJCSAgICIgYXNzdW1pbmcgJTA4THhcbiIsCiAJ
CQkJICAgICAgICh1aW50NjRfdCljc3JfYmFzZSk7CiAJCX0KIAl9CkBAIC0xOTEzLDE2ICsxOTMw
LDE1IEBAIHN0YXRpYyBpbnQgZGVuYWxpX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJLyogSXMgMzItYml0IERNQSBzdXBwb3J0
ZWQ/ICovCiAJcmV0ID0gcGNpX3NldF9kbWFfbWFzayhkZXYsIERNQV9CSVRfTUFTSygzMikpOwog
Ci0JaWYgKHJldCkKLQl7CisJaWYgKHJldCkgewogCQlwcmludGsoS0VSTl9FUlIgIlNwZWN0cmE6
IG5vIHVzYWJsZSBETUEgY29uZmlndXJhdGlvblxuIik7CiAJCWdvdG8gZmFpbGVkX2VuYWJsZTsK
IAl9Ci0JZGVuYWxpLT5idWYuZG1hX2J1ZiA9IHBjaV9tYXBfc2luZ2xlKGRldiwgZGVuYWxpLT5i
dWYuYnVmLCBERU5BTElfQlVGX1NJWkUsIAotCQkJCQkgUENJX0RNQV9CSURJUkVDVElPTkFMKTsK
KwlkZW5hbGktPmJ1Zi5kbWFfYnVmID0gcGNpX21hcF9zaW5nbGUoZGV2LCBkZW5hbGktPmJ1Zi5i
dWYsCisJCQkJCQkJREVOQUxJX0JVRl9TSVpFLAorCQkJCQkJCVBDSV9ETUFfQklESVJFQ1RJT05B
TCk7CiAKLQlpZiAocGNpX2RtYV9tYXBwaW5nX2Vycm9yKGRldiwgZGVuYWxpLT5idWYuZG1hX2J1
ZikpCi0JeworCWlmIChwY2lfZG1hX21hcHBpbmdfZXJyb3IoZGV2LCBkZW5hbGktPmJ1Zi5kbWFf
YnVmKSkgewogCQlwcmludGsoS0VSTl9FUlIgIlNwZWN0cmE6IGZhaWxlZCB0byBtYXAgRE1BIGJ1
ZmZlclxuIik7CiAJCWdvdG8gZmFpbGVkX2VuYWJsZTsKIAl9CkBAIC0xOTc2LDExICsxOTkyLDEw
IEBAIHN0YXRpYyBpbnQgZGVuYWxpX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAKIAlOQU5EX1JlYWRfRGV2aWNlX0lEKGRlbmFs
aSk7CiAKLQkvKiBNVEQgc3VwcG9ydGVkIHBhZ2Ugc2l6ZXMgdmFyeSBieSBrZXJuZWwuIFdlIHZh
bGlkYXRlIG91ciAKLSAgICAgICAgICAga2VybmVsIHN1cHBvcnRzIHRoZSBkZXZpY2UgaGVyZS4K
KwkvKiBNVEQgc3VwcG9ydGVkIHBhZ2Ugc2l6ZXMgdmFyeSBieSBrZXJuZWwuIFdlIHZhbGlkYXRl
IG91cgorCSAqIGtlcm5lbCBzdXBwb3J0cyB0aGUgZGV2aWNlIGhlcmUuCiAJICovCi0JaWYgKGRl
bmFsaS0+ZGV2X2luZm8ud1BhZ2VTaXplID4gTkFORF9NQVhfUEFHRVNJWkUgKyBOQU5EX01BWF9P
T0JTSVpFKQotCXsKKwlpZiAoZGVuYWxpLT5kZXZfaW5mby53UGFnZVNpemUgPiBOQU5EX01BWF9Q
QUdFU0laRSArIE5BTkRfTUFYX09PQlNJWkUpIHsKIAkJcmV0ID0gLUVOT0RFVjsKIAkJcHJpbnRr
KEtFUk5fRVJSICJTcGVjdHJhOiBkZXZpY2Ugc2l6ZSBub3Qgc3VwcG9ydGVkIGJ5IHRoaXMgIgog
CQkJInZlcnNpb24gb2YgTVRELiIpOwpAQCAtMjAwOSwxOCArMjAyNCwxNyBAQCBzdGF0aWMgaW50
IGRlbmFsaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKmRldiwgY29uc3Qgc3RydWN0IHBjaV9k
ZXZpY2VfaWQgKmlkKQogCWRlbmFsaS0+bmFuZC5yZWFkX2J5dGUgPSBkZW5hbGlfcmVhZF9ieXRl
OwogCWRlbmFsaS0+bmFuZC53YWl0ZnVuYyA9IGRlbmFsaV93YWl0ZnVuYzsKIAotCS8qIHNjYW4g
Zm9yIE5BTkQgZGV2aWNlcyBhdHRhY2hlZCB0byB0aGUgY29udHJvbGxlciAKKwkvKiBzY2FuIGZv
ciBOQU5EIGRldmljZXMgYXR0YWNoZWQgdG8gdGhlIGNvbnRyb2xsZXIKIAkgKiB0aGlzIGlzIHRo
ZSBmaXJzdCBzdGFnZSBpbiBhIHR3byBzdGVwIHByb2Nlc3MgdG8gcmVnaXN0ZXIKLQkgKiB3aXRo
IHRoZSBuYW5kIHN1YnN5c3RlbSAqLwkKLQlpZiAobmFuZF9zY2FuX2lkZW50KCZkZW5hbGktPm10
ZCwgTExEX01BWF9GTEFTSF9CQU5LUywgTlVMTCkpCi0JeworCSAqIHdpdGggdGhlIG5hbmQgc3Vi
c3lzdGVtICovCisJaWYgKG5hbmRfc2Nhbl9pZGVudCgmZGVuYWxpLT5tdGQsIExMRF9NQVhfRkxB
U0hfQkFOS1MsIE5VTEwpKSB7CiAJCXJldCA9IC1FTlhJTzsKIAkJZ290byBmYWlsZWRfbmFuZDsK
IAl9Ci0JCi0JLyogc2Vjb25kIHN0YWdlIG9mIHRoZSBOQU5EIHNjYW4gCi0JICogdGhpcyBzdGFn
ZSByZXF1aXJlcyBpbmZvcm1hdGlvbiByZWdhcmRpbmcgRUNDIGFuZCAKLSAgICAgICAgICogYmFk
IGJsb2NrIG1hbmFnZW1lbnQuICovCisKKwkvKiBzZWNvbmQgc3RhZ2Ugb2YgdGhlIE5BTkQgc2Nh
bgorCSAqIHRoaXMgc3RhZ2UgcmVxdWlyZXMgaW5mb3JtYXRpb24gcmVnYXJkaW5nIEVDQyBhbmQK
KwkgKiBiYWQgYmxvY2sgbWFuYWdlbWVudC4gKi8KIAogCS8qIEJhZCBibG9jayBtYW5hZ2VtZW50
ICovCiAJZGVuYWxpLT5uYW5kLmJidF90ZCA9ICZiYnRfbWFpbl9kZXNjcjsKQEAgLTIwMzAsMjAg
KzIwNDQsMTcgQEAgc3RhdGljIGludCBkZW5hbGlfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpk
ZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKIAlkZW5hbGktPm5hbmQub3B0aW9u
cyB8PSBOQU5EX1VTRV9GTEFTSF9CQlQgfCBOQU5EX1NLSVBfQkJUU0NBTjsKIAlkZW5hbGktPm5h
bmQuZWNjLm1vZGUgPSBOQU5EX0VDQ19IV19TWU5EUk9NRTsKIAotCWlmIChkZW5hbGktPmRldl9p
bmZvLk1MQ0RldmljZSkKLQl7CisJaWYgKGRlbmFsaS0+ZGV2X2luZm8uTUxDRGV2aWNlKSB7CiAJ
CWRlbmFsaS0+bmFuZC5lY2MubGF5b3V0ID0gJm5hbmRfb29iX21sY18xNGJpdDsKIAkJZGVuYWxp
LT5uYW5kLmVjYy5ieXRlcyA9IEVDQ19CWVRFU19NTEM7Ci0JfQotCWVsc2UgLyogU0xDICovCi0J
eworCX0gZWxzZSB7IC8qIFNMQyAqLwogCQlkZW5hbGktPm5hbmQuZWNjLmxheW91dCA9ICZuYW5k
X29vYl9zbGM7CiAJCWRlbmFsaS0+bmFuZC5lY2MuYnl0ZXMgPSBFQ0NfQllURVNfU0xDOwogCX0K
IAotCS8qIFRoZXNlIGZ1bmN0aW9ucyBhcmUgcmVxdWlyZWQgYnkgdGhlIE5BTkQgY29yZSBmcmFt
ZXdvcmssIG90aGVyd2lzZSwgCi0gICAgICAgICAgIHRoZSBOQU5EIGNvcmUgd2lsbCBhc3NlcnQu
IEhvd2V2ZXIsIHdlIGRvbid0IG5lZWQgdGhlbSwgc28gd2UnbGwgc3R1YiAKLSAgICAgICAgICAg
dGhlbSBvdXQuICovCisJLyogVGhlc2UgZnVuY3Rpb25zIGFyZSByZXF1aXJlZCBieSB0aGUgTkFO
RCBjb3JlIGZyYW1ld29yaywgb3RoZXJ3aXNlLAorCSAqIHRoZSBOQU5EIGNvcmUgd2lsbCBhc3Nl
cnQuIEhvd2V2ZXIsIHdlIGRvbid0IG5lZWQgdGhlbSwgc28gd2UnbGwgc3R1YgorCSAqIHRoZW0g
b3V0LiAqLwogCWRlbmFsaS0+bmFuZC5lY2MuY2FsY3VsYXRlID0gZGVuYWxpX2VjY19jYWxjdWxh
dGU7CiAJZGVuYWxpLT5uYW5kLmVjYy5jb3JyZWN0ID0gZGVuYWxpX2VjY19jb3JyZWN0OwogCWRl
bmFsaS0+bmFuZC5lY2MuaHdjdGwgPSBkZW5hbGlfZWNjX2h3Y3RsOwpAQCAtMjA1OCwxNSArMjA2
OSwxNSBAQCBzdGF0aWMgaW50IGRlbmFsaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKmRldiwg
Y29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQogCWRlbmFsaS0+bmFuZC5lY2Mud3JpdGVf
b29iID0gZGVuYWxpX3dyaXRlX29vYjsKIAlkZW5hbGktPm5hbmQuZXJhc2VfY21kID0gZGVuYWxp
X2VyYXNlOwogCi0JaWYgKG5hbmRfc2Nhbl90YWlsKCZkZW5hbGktPm10ZCkpCi0JeworCWlmIChu
YW5kX3NjYW5fdGFpbCgmZGVuYWxpLT5tdGQpKSB7CiAJCXJldCA9IC1FTlhJTzsKIAkJZ290byBm
YWlsZWRfbmFuZDsKIAl9CiAKIAlyZXQgPSBhZGRfbXRkX2RldmljZSgmZGVuYWxpLT5tdGQpOwog
CWlmIChyZXQpIHsKLQkJcHJpbnRrKEtFUk5fRVJSICJTcGVjdHJhOiBGYWlsZWQgdG8gcmVnaXN0
ZXIgTVREIGRldmljZTogJWRcbiIsIHJldCk7CisJCXByaW50ayhLRVJOX0VSUiAiU3BlY3RyYTog
RmFpbGVkIHRvIHJlZ2lzdGVyIgorCQkJCSIgTVREIGRldmljZTogJWRcbiIsIHJldCk7CiAJCWdv
dG8gZmFpbGVkX25hbmQ7CiAJfQogCXJldHVybiAwOwpAQCAtMjA3OSw3ICsyMDkwLDcgQEAgc3Rh
dGljIGludCBkZW5hbGlfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGNvbnN0IHN0cnVj
dCBwY2lfZGV2aWNlX2lkICppZCkKICBmYWlsZWRfcmVtYXBfY3NyOgogCXBjaV9yZWxlYXNlX3Jl
Z2lvbnMoZGV2KTsKICBmYWlsZWRfcmVxX2NzcjoKLQlwY2lfdW5tYXBfc2luZ2xlKGRldiwgZGVu
YWxpLT5idWYuZG1hX2J1ZiwgREVOQUxJX0JVRl9TSVpFLCAKKwlwY2lfdW5tYXBfc2luZ2xlKGRl
diwgZGVuYWxpLT5idWYuZG1hX2J1ZiwgREVOQUxJX0JVRl9TSVpFLAogCQkJCQkJCVBDSV9ETUFf
QklESVJFQ1RJT05BTCk7CiAgZmFpbGVkX2VuYWJsZToKIAlrZnJlZShkZW5hbGkpOwpAQCAtMjEw
Myw3ICsyMTE0LDcgQEAgc3RhdGljIHZvaWQgZGVuYWxpX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9k
ZXYgKmRldikKIAlpb3VubWFwKGRlbmFsaS0+Zmxhc2hfbWVtKTsKIAlwY2lfcmVsZWFzZV9yZWdp
b25zKGRldik7CiAJcGNpX2Rpc2FibGVfZGV2aWNlKGRldik7Ci0JcGNpX3VubWFwX3NpbmdsZShk
ZXYsIGRlbmFsaS0+YnVmLmRtYV9idWYsIERFTkFMSV9CVUZfU0laRSwgCisJcGNpX3VubWFwX3Np
bmdsZShkZXYsIGRlbmFsaS0+YnVmLmRtYV9idWYsIERFTkFMSV9CVUZfU0laRSwKIAkJCQkJCQlQ
Q0lfRE1BX0JJRElSRUNUSU9OQUwpOwogCXBjaV9zZXRfZHJ2ZGF0YShkZXYsIE5VTEwpOwogCWtm
cmVlKGRlbmFsaSk7CkBAIC0yMTIwLDcgKzIxMzEsOCBAQCBzdGF0aWMgc3RydWN0IHBjaV9kcml2
ZXIgZGVuYWxpX3BjaV9kcml2ZXIgPSB7CiAKIHN0YXRpYyBpbnQgX19kZXZpbml0IGRlbmFsaV9p
bml0KHZvaWQpCiB7Ci0JcHJpbnRrKEtFUk5fSU5GTyAiU3BlY3RyYSBNVEQgZHJpdmVyIGJ1aWx0
IG9uICVzIEAgJXNcbiIsIF9fREFURV9fLCBfX1RJTUVfXyk7CisJcHJpbnRrKEtFUk5fSU5GTyAi
U3BlY3RyYSBNVEQgZHJpdmVyIGJ1aWx0IG9uICVzIEAgJXNcbiIsCisJCQlfX0RBVEVfXywgX19U
SU1FX18pOwogCXJldHVybiBwY2lfcmVnaXN0ZXJfZHJpdmVyKCZkZW5hbGlfcGNpX2RyaXZlcik7
CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmggYi9kcml2ZXJzL210
ZC9uYW5kL2RlbmFsaS5oCmluZGV4IDQyMmEyOWEuLmEzOGM4YWUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvZGVuYWxpLmgKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9kZW5hbGkuaApAQCAt
MTcsNyArMTcsNyBAQAogICoKICAqLwogCi0jaW5jbHVkZSA8bGludXgvbXRkL25hbmQuaD4gCisj
aW5jbHVkZSA8bGludXgvbXRkL25hbmQuaD4KIAogI2RlZmluZSBERVZJQ0VfUkVTRVQJCQkJMHgw
CiAjZGVmaW5lICAgICBERVZJQ0VfUkVTRVRfX0JBTkswCQkJCTB4MDAwMQpAQCAtODMsNyArODMs
NyBAQAogI2RlZmluZSBSRV8yX1dFCQkJCQkweDEyMAogI2RlZmluZSAgICAgUkVfMl9XRV9fVkFM
VUUJCQkJMHgwMDNmCiAKLSNkZWZpbmUgQUNDX0NMS1MgICAgCQkJCTB4MTMwCisjZGVmaW5lIEFD
Q19DTEtTCQkJCTB4MTMwCiAjZGVmaW5lICAgICBBQ0NfQ0xLU19fVkFMVUUJCQkJMHgwMDBmCiAK
ICNkZWZpbmUgTlVNQkVSX09GX1BMQU5FUwkJCTB4MTQwCkBAIC02MjIsNDMgKzYyMiw0MCBAQAog
CiAvKiBmbGFzaC5oICovCiBzdHJ1Y3QgZGV2aWNlX2luZm9fdGFnIHsKLSAgICAgICAgdWludDE2
X3Qgd0RldmljZU1ha2VyOwotICAgICAgICB1aW50MTZfdCB3RGV2aWNlSUQ7CisJdWludDE2X3Qg
d0RldmljZU1ha2VyOworCXVpbnQxNl90IHdEZXZpY2VJRDsKIAl1aW50OF90ICBiRGV2aWNlUGFy
YW0wOwogCXVpbnQ4X3QgIGJEZXZpY2VQYXJhbTE7CiAJdWludDhfdCAgYkRldmljZVBhcmFtMjsK
LSAgICAgICAgdWludDMyX3Qgd0RldmljZVR5cGU7Ci0gICAgICAgIHVpbnQzMl90IHdTcGVjdHJh
U3RhcnRCbG9jazsKLSAgICAgICAgdWludDMyX3Qgd1NwZWN0cmFFbmRCbG9jazsKLSAgICAgICAg
dWludDMyX3Qgd1RvdGFsQmxvY2tzOwotICAgICAgICB1aW50MTZfdCB3UGFnZXNQZXJCbG9jazsK
LSAgICAgICAgdWludDE2X3Qgd1BhZ2VTaXplOwotICAgICAgICB1aW50MTZfdCB3UGFnZURhdGFT
aXplOwotICAgICAgICB1aW50MTZfdCB3UGFnZVNwYXJlU2l6ZTsKLSAgICAgICAgdWludDE2X3Qg
d051bVBhZ2VTcGFyZUZsYWc7Ci0gICAgICAgIHVpbnQxNl90IHdFQ0NCeXRlc1BlclNlY3RvcjsK
LSAgICAgICAgdWludDMyX3Qgd0Jsb2NrU2l6ZTsKLSAgICAgICAgdWludDMyX3Qgd0Jsb2NrRGF0
YVNpemU7Ci0gICAgICAgIHVpbnQzMl90IHdEYXRhQmxvY2tOdW07Ci0gICAgICAgIHVpbnQ4X3Qg
YlBsYW5lTnVtOwotICAgICAgICB1aW50MTZfdCB3RGV2aWNlTWFpbkFyZWFTaXplOwotICAgICAg
ICB1aW50MTZfdCB3RGV2aWNlU3BhcmVBcmVhU2l6ZTsKLSAgICAgICAgdWludDE2X3Qgd0Rldmlj
ZXNDb25uZWN0ZWQ7Ci0gICAgICAgIHVpbnQxNl90IHdEZXZpY2VXaWR0aDsKLSAgICAgICAgdWlu
dDE2X3Qgd0hXUmV2aXNpb247Ci0gICAgICAgIHVpbnQxNl90IHdIV0ZlYXR1cmVzOwotCi0gICAg
ICAgIHVpbnQxNl90IHdPTkZJRGV2RmVhdHVyZXM7Ci0gICAgICAgIHVpbnQxNl90IHdPTkZJT3B0
Q29tbWFuZHM7Ci0gICAgICAgIHVpbnQxNl90IHdPTkZJVGltaW5nTW9kZTsKLSAgICAgICAgdWlu
dDE2X3Qgd09ORklQZ21DYWNoZVRpbWluZ01vZGU7Ci0KLSAgICAgICAgdWludDE2X3QgTUxDRGV2
aWNlOwotICAgICAgICB1aW50MTZfdCB3U3BhcmVTa2lwQnl0ZXM7Ci0KLSAgICAgICAgdWludDhf
dCBuQml0c0luUGFnZU51bWJlcjsKLSAgICAgICAgdWludDhfdCBuQml0c0luUGFnZURhdGFTaXpl
OwotICAgICAgICB1aW50OF90IG5CaXRzSW5CbG9ja0RhdGFTaXplOworCXVpbnQzMl90IHdEZXZp
Y2VUeXBlOworCXVpbnQzMl90IHdTcGVjdHJhU3RhcnRCbG9jazsKKwl1aW50MzJfdCB3U3BlY3Ry
YUVuZEJsb2NrOworCXVpbnQzMl90IHdUb3RhbEJsb2NrczsKKwl1aW50MTZfdCB3UGFnZXNQZXJC
bG9jazsKKwl1aW50MTZfdCB3UGFnZVNpemU7CisJdWludDE2X3Qgd1BhZ2VEYXRhU2l6ZTsKKwl1
aW50MTZfdCB3UGFnZVNwYXJlU2l6ZTsKKwl1aW50MTZfdCB3TnVtUGFnZVNwYXJlRmxhZzsKKwl1
aW50MTZfdCB3RUNDQnl0ZXNQZXJTZWN0b3I7CisJdWludDMyX3Qgd0Jsb2NrU2l6ZTsKKwl1aW50
MzJfdCB3QmxvY2tEYXRhU2l6ZTsKKwl1aW50MzJfdCB3RGF0YUJsb2NrTnVtOworCXVpbnQ4X3Qg
YlBsYW5lTnVtOworCXVpbnQxNl90IHdEZXZpY2VNYWluQXJlYVNpemU7CisJdWludDE2X3Qgd0Rl
dmljZVNwYXJlQXJlYVNpemU7CisJdWludDE2X3Qgd0RldmljZXNDb25uZWN0ZWQ7CisJdWludDE2
X3Qgd0RldmljZVdpZHRoOworCXVpbnQxNl90IHdIV1JldmlzaW9uOworCXVpbnQxNl90IHdIV0Zl
YXR1cmVzOworCXVpbnQxNl90IHdPTkZJRGV2RmVhdHVyZXM7CisJdWludDE2X3Qgd09ORklPcHRD
b21tYW5kczsKKwl1aW50MTZfdCB3T05GSVRpbWluZ01vZGU7CisJdWludDE2X3Qgd09ORklQZ21D
YWNoZVRpbWluZ01vZGU7CisJdWludDE2X3QgTUxDRGV2aWNlOworCXVpbnQxNl90IHdTcGFyZVNr
aXBCeXRlczsKKwl1aW50OF90IG5CaXRzSW5QYWdlTnVtYmVyOworCXVpbnQ4X3QgbkJpdHNJblBh
Z2VEYXRhU2l6ZTsKKwl1aW50OF90IG5CaXRzSW5CbG9ja0RhdGFTaXplOwogfTsKIAogLyogZmZz
ZGVmcy5oICovCkBAIC02ODQsMTEgKzY4MSwxMSBAQCBzdHJ1Y3QgZGV2aWNlX2luZm9fdGFnIHsK
ICNkZWZpbmUgTkFORF9EQkdfVFJBQ0UgMwogCiAjaWZkZWYgVkVSQk9TRQotI2RlZmluZSBuYW5k
X2RiZ19wcmludChsZXZlbCwgYXJncy4uLikgICAgICAgICAgICAgICAgICBcCi0gICAgICAgIGRv
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAg
ICAgICAgICBpZiAobGV2ZWwgPD0gbmFuZF9kZWJ1Z19sZXZlbCkgICAgICAgICAgXAotICAgICAg
ICAgICAgICAgICAgICAgICAgcHJpbnRrKEtFUk5fQUxFUlQgYXJncyk7ICAgICAgICBcCi0gICAg
ICAgIH0gd2hpbGUgKDApCisjZGVmaW5lIG5hbmRfZGJnX3ByaW50KGxldmVsLCBhcmdzLi4uKQkJ
XAorCWRvIHsJCVwKKwkJCWlmIChsZXZlbCA8PSBuYW5kX2RlYnVnX2xldmVsKQlcCisJCQkJcHJp
bnRrKEtFUk5fQUxFUlQgYXJncyk7CVwKKwl9IHdoaWxlICgwKQogI2Vsc2UKICNkZWZpbmUgbmFu
ZF9kYmdfcHJpbnQobGV2ZWwsIGFyZ3MuLi4pCiAjZW5kaWYKQEAgLTc3MiwxMCArNzY5LDkgQEAg
c3RydWN0IGRldmljZV9pbmZvX3RhZyB7CiAjZGVmaW5lIEVDQ19TRUNUT1JfU0laRSAgICAgNTEy
CiAjZGVmaW5lIExMRF9NQVhfRkxBU0hfQkFOS1MgICAgIDQKIAotI2RlZmluZSBERU5BTElfQlVG
X1NJWkUJCU5BTkRfTUFYX1BBR0VTSVpFICsgTkFORF9NQVhfT09CU0laRQorI2RlZmluZSBERU5B
TElfQlVGX1NJWkUJCShOQU5EX01BWF9QQUdFU0laRSArIE5BTkRfTUFYX09PQlNJWkUpCiAKLXN0
cnVjdCBuYW5kX2J1Zgoteworc3RydWN0IG5hbmRfYnVmIHsKIAlpbnQgaGVhZDsKIAlpbnQgdGFp
bDsKIAl1aW50OF90IGJ1ZltERU5BTElfQlVGX1NJWkVdOwpAQCAtODEwLDcgKzgwNiw3IEBAIHN0
cnVjdCBkZW5hbGlfbmFuZF9pbmZvIHsKIAogc3RhdGljIHVpbnQxNl90ICBOQU5EX0ZsYXNoX1Jl
c2V0KHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpOwogc3RhdGljIHVpbnQxNl90ICBO
QU5EX1JlYWRfRGV2aWNlX0lEKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpOwotc3Rh
dGljIHZvaWQgTkFORF9MTERfRW5hYmxlX0Rpc2FibGVfSW50ZXJydXB0cyhzdHJ1Y3QgZGVuYWxp
X25hbmRfaW5mbyAqZGVuYWxpLCB1aW50MTZfdCBJTlRfRU5BQkxFKTsKK3N0YXRpYyB2b2lkIE5B
TkRfTExEX0VuYWJsZV9EaXNhYmxlX0ludGVycnVwdHMoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8g
KmRlbmFsaSwKKwkJCQkJCQl1aW50MTZfdCBJTlRfRU5BQkxFKTsKIAogI2VuZGlmIC8qX0xMRF9O
QU5EXyovCi0KLS0gCjEuNi42LjEKCg==

--_002_5D8008F58939784290FAB48F549751981D09B718B2shsmsx502ccrc_--
