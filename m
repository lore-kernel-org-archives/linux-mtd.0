From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Tue, 27 Jul 2010 11:28:09 +0800
Subject: [PATCH 5/6] mtd: denali.c: fix all "line over 80 characters" warni=
Message-ID: <mailman.91.1280203230.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

ngs

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  300 +++++++++++++++++++++++++++++------------=
----
 1 files changed, 192 insertions(+), 108 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 55a7a39..3ce11cc 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -36,8 +36,8 @@ MODULE_LICENSE("GPL");

 static int onfi_timing_mode =3D NAND_DEFAULT_TIMINGS;
 module_param(onfi_timing_mode, int, S_IRUGO);
-MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting. -1 ind=
icates"
-                                       " use default timings");
+MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
+                       " -1 indicates use default timings");

 #define DENALI_NAND_NAME    "denali-nand"

@@ -123,8 +123,10 @@ static int nand_debug_level =3D 0;

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
@@ -138,16 +140,19 @@ static void denali_write32(uint32_t value, void *addr=
)
        iowrite32(value, addr);

 #if DEBUG_DENALI
-       printk(KERN_INFO "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32=
_t)addr & 0x1fff));
+       printk(KERN_INFO "wrote: 0x%x -> 0x%x\n", value,
+                       (uint32_t)((uint32_t)addr & 0x1fff));
 #endif
 }

-/* Certain operations for the denali NAND controller use an indexed mode t=
o read/write
-   data. The operation is performed by writing the address value of the co=
mmand to
-   the device memory followed by the data. This function abstracts this co=
mmon
-   operation.
+/* Certain operations for the denali NAND controller use
+ * an indexed mode to read/write data. The operation is
+ * performed by writing the address value of the command
+ * to the device memory followed by the data. This function
+ * abstracts this common operation.
 */
-static void index_addr(struct denali_nand_info *denali, uint32_t address, =
uint32_t data)
+static void index_addr(struct denali_nand_info *denali,
+                               uint32_t address, uint32_t data)
 {
        denali_write32(address, denali->flash_mem);
        denali_write32(data, denali->flash_mem + 0x10);
@@ -191,7 +196,8 @@ static void read_status(struct denali_nand_info *denali=
)
        write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));

 #if DEBUG_DENALI
-       printk(KERN_INFO "device reporting status value of 0x%2x\n", denali=
->buf.buf[0]);
+       printk(KERN_INFO "device reporting status value of 0x%2x\n",
+                       denali->buf.buf[0]);
 #endif
 }

@@ -227,8 +233,10 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_in=
fo *denali)
                denali->flash_reg + intr_status_addresses[i]);

        for (i =3D 0 ; i < LLD_MAX_FLASH_BANKS; i++) {
-               denali_write32(device_reset_banks[i], denali->flash_reg + D=
EVICE_RESET);
-               while (!(ioread32(denali->flash_reg + intr_status_addresses=
[i]) &
+               denali_write32(device_reset_banks[i],
+                               denali->flash_reg + DEVICE_RESET);
+               while (!(ioread32(denali->flash_reg +
+                                               intr_status_addresses[i]) &
                        (reset_complete[i] | operation_timeout[i])))
                        ;
                if (ioread32(denali->flash_reg + intr_status_addresses[i]) =
&
@@ -244,11 +252,12 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_i=
nfo *denali)
        return PASS;
 }

-/* this routine calculates the ONFI timing values for a given mode and pro=
grams
- * the clocking register accordingly. The mode is determined by the get_on=
fi_nand_para
-   routine.
+/* this routine calculates the ONFI timing values for a given mode and
+ * programs the clocking register accordingly. The mode is determined by
+ * the get_onfi_nand_para routine.
  */
-static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali, uint16_=
t mode)
+static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali,
+                                                               uint16_t mo=
de)
 {
        uint16_t Trea[6] =3D {40, 30, 25, 20, 20, 16};
        uint16_t Trp[6] =3D {50, 25, 17, 15, 12, 10};
@@ -354,10 +363,11 @@ static void set_ecc_config(struct denali_nand_info *d=
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
@@ -373,8 +383,10 @@ static void set_ecc_config(struct denali_nand_info *de=
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
@@ -392,13 +404,15 @@ static uint16_t get_onfi_nand_para(struct denali_nand=
_info *denali)
        denali_write32(DEVICE_RESET__BANK0, denali->flash_reg + DEVICE_RESE=
T);

        while (!((ioread32(denali->flash_reg + INTR_STATUS0) &
-               INTR_STATUS0__RST_COMP) |
-               (ioread32(denali->flash_reg + INTR_STATUS0) &
-               INTR_STATUS0__TIME_OUT)))
+                       INTR_STATUS0__RST_COMP) |
+                       (ioread32(denali->flash_reg + INTR_STATUS0) &
+                       INTR_STATUS0__TIME_OUT)))
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
@@ -419,10 +433,12 @@ static uint16_t get_onfi_nand_para(struct denali_nand=
_info *denali)
                                INTR_STATUS2__RST_COMP) {
                                denali_write32(DEVICE_RESET__BANK3,
                                        denali->flash_reg + DEVICE_RESET);
-                               while (!((ioread32(denali->flash_reg + INTR=
_STATUS3) &
-                                       INTR_STATUS3__RST_COMP) |
-                                       (ioread32(denali->flash_reg + INTR_=
STATUS3) &
-                                       INTR_STATUS3__TIME_OUT)))
+                               while (!((ioread32(denali->flash_reg +
+                                               INTR_STATUS3) &
+                                               INTR_STATUS3__RST_COMP) |
+                                               (ioread32(denali->flash_reg=
 +
+                                               INTR_STATUS3) &
+                                               INTR_STATUS3__TIME_OUT)))
                                        ;
                        } else {
                                printk(KERN_ERR "Getting a time out for ban=
k 2!\n");
@@ -432,10 +448,14 @@ static uint16_t get_onfi_nand_para(struct denali_nand=
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
@@ -448,8 +468,10 @@ static uint16_t get_onfi_nand_para(struct denali_nand_=
info *denali)

        n_of_luns =3D ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) =
&
                ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS;
-       blks_lun_l =3D ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_BLOCK=
S_PER_LUN_L);
-       blks_lun_h =3D ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_BLOCK=
S_PER_LUN_U);
+       blks_lun_l =3D ioread32(denali->flash_reg +
+                               ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L);
+       blks_lun_h =3D ioread32(denali->flash_reg +
+                               ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U);

        blockperlun =3D (blks_lun_h << 16) | blks_lun_l;

@@ -460,7 +482,8 @@ static uint16_t get_onfi_nand_para(struct denali_nand_i=
nfo *denali)
                return FAIL;

        for (i =3D 5; i > 0; i--) {
-               if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) & (0x01 =
<< i))
+               if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
+                       (0x01 << i))
                        break;
        }

@@ -495,7 +518,8 @@ static void get_samsung_nand_para(struct denali_nand_in=
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
@@ -515,7 +539,8 @@ static void get_samsung_nand_para(struct denali_nand_in=
fo *denali)

        no_of_planes =3D 1 << ((id_bytes[4] & 0x0c) >> 2);
        plane_size  =3D (uint64_t)64 << ((id_bytes[4] & 0x70) >> 4);
-       blk_size =3D 64 << ((ioread32(denali->flash_reg + DEVICE_PARAM_1) &=
 0x30) >> 4);
+       blk_size =3D 64 << ((ioread32(denali->flash_reg + DEVICE_PARAM_1) &
+                                       0x30) >> 4);
        capacity =3D (uint64_t)128 * plane_size * no_of_planes;

        do_div(capacity, blk_size);
@@ -534,7 +559,8 @@ static void get_toshiba_nand_para(struct denali_nand_in=
fo *denali)
                denali_write32(216, denali->flash_reg + DEVICE_SPARE_AREA_S=
IZE);
                tmp =3D ioread32(denali->flash_reg + DEVICES_CONNECTED) *
                        ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE=
);
-               denali_write32(tmp, denali->flash_reg + LOGICAL_PAGE_SPARE_=
SIZE);
+               denali_write32(tmp,
+                               denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE=
);
 #if SUPPORT_15BITECC
                denali_write32(15, denali->flash_reg + ECC_CORRECTION);
 #elif SUPPORT_8BITECC
@@ -573,10 +599,14 @@ static void get_hynix_nand_para(struct denali_nand_in=
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
+               main_size =3D 4096 *
+                       ioread32(denali->flash_reg + DEVICES_CONNECTED);
+               spare_size =3D 224 *
+                       ioread32(denali->flash_reg + DEVICES_CONNECTED);
+               denali_write32(main_size,
+                               denali->flash_reg + LOGICAL_PAGE_DATA_SIZE)=
;
+               denali_write32(spare_size,
+                               denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE=
);
                denali_write32(0, denali->flash_reg + DEVICE_WIDTH);
 #if SUPPORT_15BITECC
                denali_write32(15, denali->flash_reg + ECC_CORRECTION);
@@ -619,7 +649,8 @@ static void find_valid_banks(struct denali_nand_info *d=
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
@@ -671,7 +702,8 @@ static void detect_partition_feature(struct denali_nand=
_info *denali)
                            (ioread32(denali->flash_reg + MAX_BLK_ADDR_1) &
                            MAX_BLK_ADDR_1__VALUE);

-                       denali->dev_info.wTotalBlocks *=3D denali->total_us=
ed_banks;
+                       denali->dev_info.wTotalBlocks *=3D
+                               denali->total_used_banks;

                        if (denali->dev_info.wSpectraEndBlock >=3D
                            denali->dev_info.wTotalBlocks) {
@@ -683,8 +715,10 @@ static void detect_partition_feature(struct denali_nan=
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
@@ -694,7 +728,8 @@ static void detect_partition_feature(struct denali_nand=
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
@@ -776,13 +811,19 @@ static uint16_t NAND_Read_Device_ID(struct denali_nan=
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
@@ -831,7 +872,8 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_=
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
@@ -840,11 +882,13 @@ static uint16_t NAND_Read_Device_ID(struct denali_nan=
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
@@ -933,7 +977,8 @@ static void denali_irq_cleanup(int irqnum, struct denal=
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
@@ -950,7 +995,8 @@ static inline uint32_t denali_irq_detected(struct denal=
i_nand_info *denali)
 }

 /* Interrupts are cleared by writing a 1 to the appropriate status bit */
-static inline void clear_interrupt(struct denali_nand_info *denali, uint32=
_t irq_mask)
+static inline void clear_interrupt(struct denali_nand_info *denali,
+                                                       uint32_t irq_mask)
 {
        uint32_t intr_status_reg =3D 0;

@@ -1013,9 +1059,11 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
        if (is_flash_bank_valid(denali->flash_bank)) {
                /* check to see if controller generated
                 * the interrupt, since this is a shared interrupt */
-               if ((irq_status =3D denali_irq_detected(denali)) !=3D 0) {
+               irq_status =3D denali_irq_detected(denali);
+               if (irq_status !=3D 0) {
 #if DEBUG_DENALI
-                       denali->irq_debug_array[denali->idx++] =3D 0x100000=
00 | irq_status;
+                       denali->irq_debug_array[denali->idx++] =3D
+                               0x10000000 | irq_status;
                        denali->idx %=3D 32;

                        printk(KERN_INFO "IRQ status =3D 0x%04x\n", irq_sta=
tus);
@@ -1048,12 +1096,14 @@ static uint32_t wait_for_irq(struct denali_nand_inf=
o *denali, uint32_t irq_mask)
 #if DEBUG_DENALI
                printk(KERN_INFO "waiting for 0x%x\n", irq_mask);
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

@@ -1061,7 +1111,9 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
                        denali->irq_status &=3D ~irq_mask;
                        spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
-                       if (retry) printk(KERN_INFO "status on retry =3D 0x=
%x\n", intr_status);
+                       if (retry)
+                               printk(KERN_INFO "status on retry =3D 0x%x\=
n",
+                                               intr_status);
 #endif
                        /* our interrupt was detected */
                        break;
@@ -1071,8 +1123,10 @@ static uint32_t wait_for_irq(struct denali_nand_info=
 *denali, uint32_t irq_mask)
                        spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
                        print_irq_log(denali);
-                       printk(KERN_INFO "received irq nobody cared: irq_st=
atus =3D 0x%x,"
-                               " irq_mask =3D 0x%x, timeout =3D %ld\n", in=
tr_status, irq_mask, comp_res);
+                       printk(KERN_INFO "received irq nobody cared:"
+                                       " irq_status =3D 0x%x, irq_mask =3D=
 0x%x,"
+                                       " timeout =3D %ld\n", intr_status,
+                                       irq_mask, comp_res);
 #endif
                        retry =3D true;
                }
@@ -1101,15 +1155,18 @@ static void setup_ecc_for_xfer(struct denali_nand_i=
nfo *denali, bool ecc_en,

        /* Enable spare area/ECC per user's request. */
        denali_write32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
-       denali_write32(transfer_spare_flag, denali->flash_reg + TRANSFER_SP=
ARE_REG);
+       denali_write32(transfer_spare_flag,
+                       denali->flash_reg + TRANSFER_SPARE_REG);
 }

 /* sends a pipeline command operation to the controller. See the Denali NA=
ND
    controller's user guide for more information (section 4.2.3.6).
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
        uint32_t addr =3D 0x0, cmd =3D 0x0, page_count =3D 1, irq_status =
=3D 0,
@@ -1123,7 +1180,9 @@ static int denali_send_pipeline_cmd(struct denali_nan=
d_info *denali, bool ecc_en

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
@@ -1157,16 +1216,19 @@ static int denali_send_pipeline_cmd(struct denali_n=
and_info *denali, bool ecc_en
                        cmd =3D MODE_01 | addr;
                        denali_write32(cmd, denali->flash_mem);
                } else {
-                       index_addr(denali, (uint32_t)cmd, 0x2000 | op | pag=
e_count);
+                       index_addr(denali, (uint32_t)cmd,
+                                       0x2000 | op | page_count);

                        /* wait for command to be accepted
-                        * can always use status0 bit as the mask is identi=
cal for each
+                        * can always use status0 bit as the
+                        * mask is identical for each
                         * bank. */
                        irq_status =3D wait_for_irq(denali, irq_mask);

                        if (irq_status =3D=3D 0) {
                                printk(KERN_ERR "cmd, page, addr on timeout=
 "
-                                       "(0x%x, 0x%x, 0x%x)\n", cmd, denali=
->page, addr);
+                                       "(0x%x, 0x%x, 0x%x)\n", cmd,
+                                       denali->page, addr);
                                status =3D FAIL;
                        } else {
                                cmd =3D MODE_01 | addr;
@@ -1178,8 +1240,9 @@ static int denali_send_pipeline_cmd(struct denali_nan=
d_info *denali, bool ecc_en
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

@@ -1195,8 +1258,9 @@ static int write_data_to_flash_mem(struct denali_nand=
_info *denali, const uint8_
 }

 /* helper function that simply reads a buffer from the flash */
-static int read_data_from_flash_mem(struct denali_nand_info *denali, uint8=
_t *buf,
-                                       int len)
+static int read_data_from_flash_mem(struct denali_nand_info *denali,
+                                                               uint8_t *bu=
f,
+                                                               int len)
 {
        uint32_t i =3D 0, *buf32;

@@ -1234,7 +1298,8 @@ static int write_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)

 #if DEBUG_DENALI
                spin_lock_irq(&denali->irq_lock);
-               denali->irq_debug_array[denali->idx++] =3D 0x80000000 | mtd=
->oobsize;
+               denali->irq_debug_array[denali->idx++] =3D
+                       0x80000000 | mtd->oobsize;
                denali->idx %=3D 32;
                spin_unlock_irq(&denali->irq_lock);
 #endif
@@ -1258,7 +1323,8 @@ static int write_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)
 static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
        struct denali_nand_info *denali =3D mtd_to_denali(mtd);
-       uint32_t irq_mask =3D INTR_STATUS0__LOAD_COMP, irq_status =3D 0, ad=
dr =3D 0x0, cmd =3D 0x0;
+       uint32_t irq_mask =3D INTR_STATUS0__LOAD_COMP,
+                        irq_status =3D 0, addr =3D 0x0, cmd =3D 0x0;

        denali->page =3D page;

@@ -1275,7 +1341,8 @@ static void read_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)
                irq_status =3D wait_for_irq(denali, irq_mask);

                if (irq_status =3D=3D 0)
-                       printk(KERN_ERR "page on OOB timeout %d\n", denali-=
>page);
+                       printk(KERN_ERR "page on OOB timeout %d\n",
+                                       denali->page);

                /* We set the device back to MAIN_ACCESS here as I observed
                 * instability with the controller if you do a block erase
@@ -1289,7 +1356,8 @@ static void read_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)

 #if DEBUG_DENALI
                spin_lock_irq(&denali->irq_lock);
-               denali->irq_debug_array[denali->idx++] =3D 0x60000000 | mtd=
->oobsize;
+               denali->irq_debug_array[denali->idx++] =3D
+                       0x60000000 | mtd->oobsize;
                denali->idx %=3D 32;
                spin_unlock_irq(&denali->irq_lock);
 #endif
@@ -1358,15 +1426,17 @@ static bool handle_ecc(struct denali_nand_info *den=
ali, uint8_t *buf,
                                }
                        } else {
                                /* if the error is not correctable, need to
-                                * look at the page to see if it is an eras=
ed page.
-                                * if so, then it's not a real ECC error */
+                                * look at the page to see if it is an eras=
ed
+                                * page. if so, then it's not a real ECC er=
ror
+                                * */
                                check_erased_page =3D true;
                        }

 #if DEBUG_DENALI
-                       printk(KERN_INFO "Detected ECC error in page %d: er=
r_addr =3D 0x%08x,"
-                               " info to fix is 0x%08x\n", denali->page, e=
rr_address,
-                               err_correction_info);
+                       printk(KERN_INFO "Detected ECC error in page %d:"
+                                       " err_addr =3D 0x%08x, info to fix =
is"
+                                       " 0x%08x\n", denali->page, err_addr=
ess,
+                                       err_correction_info);
 #endif
                } while (!ECC_LAST_ERR(err_correction_info));
        }
@@ -1451,10 +1521,11 @@ static void write_page(struct mtd_info *mtd, struct=
 nand_chip *chip,
        irq_status =3D wait_for_irq(denali, irq_mask);

        if (irq_status =3D=3D 0) {
-               printk(KERN_ERR "timeout on write_page (type =3D %d)\n", ra=
w_xfer);
+               printk(KERN_ERR "timeout on write_page"
+                               " (type =3D %d)\n", raw_xfer);
                denali->status =3D
-                       (irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_ST=
ATUS_FAIL :
-                                                                          =
                                     PASS;
+                       (irq_status & INTR_STATUS0__PROGRAM_FAIL) ?
+                       NAND_STATUS_FAIL : PASS;
        }

        denali_enable_dma(denali, false);
@@ -1637,8 +1708,8 @@ static void denali_erase(struct mtd_info *mtd, int pa=
ge)
        irq_status =3D wait_for_irq(denali, INTR_STATUS0__ERASE_COMP |
                                        INTR_STATUS0__ERASE_FAIL);

-       denali->status =3D (irq_status & INTR_STATUS0__ERASE_FAIL) ? NAND_S=
TATUS_FAIL :
-                                                                PASS;
+       denali->status =3D (irq_status & INTR_STATUS0__ERASE_FAIL) ?
+                                               NAND_STATUS_FAIL : PASS;
 }

 static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col=
,
@@ -1661,11 +1732,16 @@ static void denali_cmdfunc(struct mtd_info *mtd, un=
signed int cmd, int col,
                                /* write manufacturer information into nand
                                   buffer for NAND subsystem to fetch.
                                   */
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
+                               write_byte_to_buf(denali,
+                                               denali->dev_info.wDeviceMak=
er);
+                               write_byte_to_buf(denali,
+                                               denali->dev_info.wDeviceID)=
;
+                               write_byte_to_buf(denali,
+                                               denali->dev_info.bDevicePar=
am0);
+                               write_byte_to_buf(denali,
+                                               denali->dev_info.bDevicePar=
am1);
+                               write_byte_to_buf(denali,
+                                               denali->dev_info.bDevicePar=
am2);
                        } else {
                                int i;
                                for (i =3D 0; i < 5; i++)
@@ -1683,7 +1759,8 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
                        /* TODO: Read OOB data */
                        break;
                default:
-                       printk(KERN_ERR ": unsupported command received 0x%=
x\n", cmd);
+                       printk(KERN_ERR ": unsupported command"
+                                       " received 0x%x\n", cmd);
                        break;
        }
 }
@@ -1718,7 +1795,8 @@ static void denali_hw_init(struct denali_nand_info *d=
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
@@ -1824,8 +1902,8 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
                 * ONFI timing mode 1 and below.
                 */
                if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-                       printk(KERN_ERR "Intel CE4100 only supports ONFI ti=
ming mode 1 "
-                               "or below\n");
+                       printk(KERN_ERR "Intel CE4100 only supports"
+                                       " ONFI timing mode 1 or below\n");
                        ret =3D -EINVAL;
                        goto failed_enable;
                }
@@ -1844,7 +1922,9 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
                        mem_base =3D csr_base + csr_len;
                        mem_len =3D csr_len;
                        nand_dbg_print(NAND_DBG_WARN,
-                                      "Spectra: No second BAR for PCI devi=
ce; assuming %08Lx\n",
+                                      "Spectra: No second"
+                                          " BAR for PCI device;"
+                                          " assuming %08Lx\n",
                                       (uint64_t)csr_base);
                }
        }
@@ -1856,8 +1936,10 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
                printk(KERN_ERR "Spectra: no usable DMA configuration\n");
                goto failed_enable;
        }
-       denali->buf.dma_buf =3D pci_map_single(dev, denali->buf.buf, DENALI=
_BUF_SIZE,
-                                        PCI_DMA_BIDIRECTIONAL);
+       denali->buf.dma_buf =3D
+               pci_map_single(dev, denali->buf.buf,
+                                               DENALI_BUF_SIZE,
+                                               PCI_DMA_BIDIRECTIONAL);

        if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
                printk(KERN_ERR "Spectra: failed to map DMA buffer\n");
@@ -1997,7 +2079,8 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)

        ret =3D add_mtd_device(&denali->mtd);
        if (ret) {
-               printk(KERN_ERR "Spectra: Failed to register MTD device: %d=
\n", ret);
+               printk(KERN_ERR "Spectra: Failed to register"
+                               " MTD device: %d\n", ret);
                goto failed_nand;
        }
        return 0;
@@ -2051,7 +2134,8 @@ static struct pci_driver denali_pci_driver =3D {

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
