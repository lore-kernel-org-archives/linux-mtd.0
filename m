Received: from mga14.intel.com ([143.182.124.37])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdbKP-0000ot-TK
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 03:59:43 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 27 Jul 2010 11:58:58 +0800
Subject: [PATCH 3/6] mtd: denali.c: fixed all open brace { check-patch errors
Message-ID: <5D8008F58939784290FAB48F549751981D4E9692B9@shsmsx502.ccr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Yuan, Hang" <hang.yuan@intel.com>, "Woodhouse,
	David" <david.woodhouse@intel.com>, "Gao, Yunpeng" <yunpeng.gao@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From f286f94af4884de6c150eefed92cc62ac110e607 Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 27 Jul 2010 10:41:53 +0800
Subject: [PATCH 3/6] mtd: denali.c: fixed all open brace { check-patch erro=
rs

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  164 +++++++++++++----------------------------=
----
 1 files changed, 48 insertions(+), 116 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ca02838..f850a65 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -211,9 +211,7 @@ static void reset_bank(struct denali_nand_info *denali)
        irq_status =3D wait_for_irq(denali, irq_mask);

        if (irq_status & operation_timeout[denali->flash_bank])
-       {
                printk(KERN_ERR "reset bank failed.\n");
-       }
 }

 /* Reset the flash controller */
@@ -637,14 +635,12 @@ static void find_valid_banks(struct denali_nand_info =
*denali)
                }
        }

-       if (denali->platform =3D=3D INTEL_CE4100)
-       {
+       if (denali->platform =3D=3D INTEL_CE4100) {
                /* Platform limitations of the CE4100 device limit
                 * users to a single chip solution for NAND.
                 * Multichip support is not enabled.
                 */
-               if (denali->total_used_banks !=3D 1)
-               {
+               if (denali->total_used_banks !=3D 1) {
                        printk(KERN_ERR "Sorry, Intel CE4100 only supports =
"
                                        "a single NAND device.\n");
                        BUG();
@@ -888,9 +884,7 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_=
info *denali)
         * with a specific ONFI mode, we apply those changes here.
         */
        if (onfi_timing_mode !=3D NAND_DEFAULT_TIMINGS)
-       {
                NAND_ONFi_Timing_Mode(denali, onfi_timing_mode);
-       }

        return status;
 }
@@ -997,9 +991,7 @@ static void print_irq_log(struct denali_nand_info *dena=
li)

        printk("ISR debug log index =3D %X\n", denali->idx);
        for (i =3D 0; i < 32; i++)
-       {
                printk("%08X: %08X\n", i, denali->irq_debug_array[i]);
-       }
 }
 #endif

@@ -1018,12 +1010,10 @@ static irqreturn_t denali_isr(int irq, void *dev_id=
)
        /* check to see if a valid NAND chip has
         * been selected.
         */
-       if (is_flash_bank_valid(denali->flash_bank))
-       {
+       if (is_flash_bank_valid(denali->flash_bank)) {
                /* check to see if controller generated
                 * the interrupt, since this is a shared interrupt */
-               if ((irq_status =3D denali_irq_detected(denali)) !=3D 0)
-               {
+               if ((irq_status =3D denali_irq_detected(denali)) !=3D 0) {
 #if DEBUG_DENALI
                        denali->irq_debug_array[denali->idx++] =3D 0x100000=
00 | irq_status;
                        denali->idx %=3D 32;
@@ -1054,8 +1044,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
        bool retry =3D false;
        unsigned long timeout =3D msecs_to_jiffies(1000);

-       do
-       {
+       do {
 #if DEBUG_DENALI
                printk("waiting for 0x%x\n", irq_mask);
 #endif
@@ -1068,8 +1057,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
                denali->idx %=3D 32;
 #endif

-               if (intr_status & irq_mask)
-               {
+               if (intr_status & irq_mask) {
                        denali->irq_status &=3D ~irq_mask;
                        spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
@@ -1077,9 +1065,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
 #endif
                        /* our interrupt was detected */
                        break;
-               }
-               else
-               {
+               } else {
                        /* these are not the interrupts you are looking for=
 -
                         * need to wait again */
                        spin_unlock_irq(&denali->irq_lock);
@@ -1092,8 +1078,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
                }
        } while (comp_res !=3D 0);

-       if (comp_res =3D=3D 0)
-       {
+       if (comp_res =3D=3D 0) {
                /* timeout */
                printk(KERN_ERR "timeout occurred, status =3D 0x%x, mask =
=3D 0x%x\n",
                                intr_status, irq_mask);
@@ -1149,22 +1134,17 @@ static int denali_send_pipeline_cmd(struct denali_n=
and_info *denali, bool ecc_en

        addr =3D BANK(denali->flash_bank) | denali->page;

-       if (op =3D=3D DENALI_WRITE && access_type !=3D SPARE_ACCESS)
-       {
+       if (op =3D=3D DENALI_WRITE && access_type !=3D SPARE_ACCESS) {
                cmd =3D MODE_01 | addr;
                denali_write32(cmd, denali->flash_mem);
-       }
-       else if (op =3D=3D DENALI_WRITE && access_type =3D=3D SPARE_ACCESS)
-       {
+       } else if (op =3D=3D DENALI_WRITE && access_type =3D=3D SPARE_ACCES=
S) {
                /* read spare area */
                cmd =3D MODE_10 | addr;
                index_addr(denali, (uint32_t)cmd, access_type);

                cmd =3D MODE_01 | addr;
                denali_write32(cmd, denali->flash_mem);
-       }
-       else if (op =3D=3D DENALI_READ)
-       {
+       } else if (op =3D=3D DENALI_READ) {
                /* setup page read request for access type */
                cmd =3D MODE_10 | addr;
                index_addr(denali, (uint32_t)cmd, access_type);
@@ -1173,13 +1153,10 @@ static int denali_send_pipeline_cmd(struct denali_n=
and_info *denali, bool ecc_en
                   use the pipeline commands in Spare area only mode. So we
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
+               } else {
                        index_addr(denali, (uint32_t)cmd, 0x2000 | op | pag=
e_count);

                        /* wait for command to be accepted
@@ -1187,14 +1164,11 @@ static int denali_send_pipeline_cmd(struct denali_n=
and_info *denali, bool ecc_en
                         * bank. */
                        irq_status =3D wait_for_irq(denali, irq_mask);

-                       if (irq_status =3D=3D 0)
-                       {
+                       if (irq_status =3D=3D 0) {
                                printk(KERN_ERR "cmd, page, addr on timeout=
 "
                                        "(0x%x, 0x%x, 0x%x)\n", cmd, denali=
->page, addr);
                                status =3D FAIL;
-                       }
-                       else
-                       {
+                       } else {
                                cmd =3D MODE_01 | addr;
                                denali_write32(cmd, denali->flash_mem);
                        }
@@ -1216,9 +1190,7 @@ static int write_data_to_flash_mem(struct denali_nand=
_info *denali, const uint8_
        /* write the data to the flash memory */
        buf32 =3D (uint32_t *)buf;
        for (i =3D 0; i < len / 4; i++)
-       {
                denali_write32(*buf32++, denali->flash_mem + 0x10);
-       }
        return i*4; /* intent is to return the number of bytes read */
 }

@@ -1241,9 +1213,7 @@ static int read_data_from_flash_mem(struct denali_nan=
d_info *denali, uint8_t *bu
        /* transfer the data from the flash */
        buf32 =3D (uint32_t *)buf;
        for (i =3D 0; i < len / 4; i++)
-       {
                *buf32++ =3D ioread32(denali->flash_mem + 0x10);
-       }
        return i*4; /* intent is to return the number of bytes read */
 }

@@ -1259,8 +1229,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)
        denali->page =3D page;

        if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
-                                                       DENALI_WRITE) =3D=
=3D PASS)
-       {
+                                                       DENALI_WRITE) =3D=
=3D PASS) {
                write_data_to_flash_mem(denali, buf, mtd->oobsize);

 #if DEBUG_DENALI
@@ -1274,14 +1243,11 @@ static int write_oob_data(struct mtd_info *mtd, uin=
t8_t *buf, int page)
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
                status =3D -EIO;
        }
@@ -1300,8 +1266,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)
        printk("read_oob %d\n", page);
 #endif
        if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
-                                                       DENALI_READ) =3D=3D=
 PASS)
-       {
+                                                       DENALI_READ) =3D=3D=
 PASS) {
                read_data_from_flash_mem(denali, buf, mtd->oobsize);

                /* wait for command to be accepted
@@ -1310,9 +1275,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)
                irq_status =3D wait_for_irq(denali, irq_mask);

                if (irq_status =3D=3D 0)
-               {
                        printk(KERN_ERR "page on OOB timeout %d\n", denali-=
>page);
-               }

                /* We set the device back to MAIN_ACCESS here as I observed
                 * instability with the controller if you do a block erase
@@ -1340,12 +1303,8 @@ bool is_erased(uint8_t *buf, int len)
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
@@ -1362,15 +1321,13 @@ static bool handle_ecc(struct denali_nand_info *den=
ali, uint8_t *buf,
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
+               do {
                        err_address =3D ioread32(denali->flash_reg +
                                                ECC_ERROR_ADDRESS);
                        err_sector =3D ECC_SECTOR(err_address);
@@ -1383,29 +1340,23 @@ static bool handle_ecc(struct denali_nand_info *den=
ali, uint8_t *buf,
                                ECC_CORRECTION_VALUE(err_correction_info);
                        err_device =3D ECC_ERR_DEVICE(err_correction_info);

-                       if (ECC_ERROR_CORRECTABLE(err_correction_info))
-                       {
+                       if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
                                /* offset in our buffer is computed as:
                                   sector number * sector size + offset in
                                   sector
                                 */
                                int offset =3D err_sector * ECC_SECTOR_SIZE=
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
+                       } else {
                                /* if the error is not correctable, need to
                                 * look at the page to see if it is an eras=
ed page.
                                 * if so, then it's not a real ECC error */
@@ -1482,8 +1433,7 @@ static void write_page(struct mtd_info *mtd, struct n=
and_chip *chip,
        /* copy buffer into DMA buffer */
        memcpy(denali->buf.buf, buf, mtd->writesize);

-       if (raw_xfer)
-       {
+       if (raw_xfer) {
                /* transfer the data to the spare area */
                memcpy(denali->buf.buf + mtd->writesize,
                        chip->oob_poi,
@@ -1500,8 +1450,7 @@ static void write_page(struct mtd_info *mtd, struct n=
and_chip *chip,
        /* wait for operation to complete */
        irq_status =3D wait_for_irq(denali, irq_mask);

-       if (irq_status =3D=3D 0)
-       {
+       if (irq_status =3D=3D 0) {
                printk(KERN_ERR "timeout on write_page (type =3D %d)\n", ra=
w_xfer);
                denali->status =3D
                        (irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_ST=
ATUS_FAIL :
@@ -1584,21 +1533,15 @@ static int denali_read_page(struct mtd_info *mtd, s=
truct nand_chip *chip,
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
                }
        }
        return 0;
@@ -1643,9 +1586,7 @@ static uint8_t denali_read_byte(struct mtd_info *mtd)
        uint8_t result =3D 0xff;

        if (denali->buf.head < denali->buf.tail)
-       {
                result =3D denali->buf.buf[denali->buf.head++];
-       }

 #if DEBUG_DENALI
        printk("read byte -> 0x%02x\n", result);
@@ -1708,8 +1649,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
 #if DEBUG_DENALI
        printk("cmdfunc: 0x%x %d %d\n", cmd, col, page);
 #endif
-       switch (cmd)
-       {
+       switch (cmd) {
                case NAND_CMD_PAGEPROG:
                        break;
                case NAND_CMD_STATUS:
@@ -1717,8 +1657,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
                        break;
                case NAND_CMD_READID:
                        reset_buf(denali);
-                       if (denali->flash_bank < denali->total_used_banks)
-                       {
+                       if (denali->flash_bank < denali->total_used_banks) =
{
                                /* write manufacturer information into nand
                                   buffer for NAND subsystem to fetch.
                                   */
@@ -1727,9 +1666,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
                                write_byte_to_buf(denali, denali->dev_info.=
bDeviceParam0);
                                write_byte_to_buf(denali, denali->dev_info.=
bDeviceParam1);
                                write_byte_to_buf(denali, denali->dev_info.=
bDeviceParam2);
-                       }
-                       else
-                       {
+                       } else {
                                int i;
                                for (i =3D 0; i < 5; i++)
                                        write_byte_to_buf(denali, 0xff);
@@ -1796,20 +1733,24 @@ static void denali_hw_init(struct denali_nand_info =
*denali)
 static struct nand_ecclayout nand_oob_slc =3D {
        .eccbytes =3D 4,
        .eccpos =3D { 0, 1, 2, 3 }, /* not used */
-       .oobfree =3D {{
+       .oobfree =3D {
+               {
                        .offset =3D ECC_BYTES_SLC,
                        .length =3D 64 - ECC_BYTES_SLC
-                  }}
+               }
+       }
 };

 #define ECC_BYTES_MLC   14 * (2048 / ECC_SECTOR_SIZE)
 static struct nand_ecclayout nand_oob_mlc_14bit =3D {
        .eccbytes =3D 14,
        .eccpos =3D { 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13 }, /* not u=
sed */
-       .oobfree =3D {{
+       .oobfree =3D {
+               {
                        .offset =3D ECC_BYTES_MLC,
                        .length =3D 64 - ECC_BYTES_MLC
-                  }}
+               }
+       }
 };

 static uint8_t bbt_pattern[] =3D {'B', 'b', 't', '0' };
@@ -1882,8 +1823,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
                /* Due to a silicon limitation, we can only support
                 * ONFI timing mode 1 and below.
                 */
-               if (onfi_timing_mode < -1 || onfi_timing_mode > 1)
-               {
+               if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
                        printk("Intel CE4100 only supports ONFI timing mode=
 1 "
                                "or below\n");
                        ret =3D -EINVAL;
@@ -1912,16 +1852,14 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
        /* Is 32-bit DMA supported? */
        ret =3D pci_set_dma_mask(dev, DMA_BIT_MASK(32));

-       if (ret)
-       {
+       if (ret) {
                printk(KERN_ERR "Spectra: no usable DMA configuration\n");
                goto failed_enable;
        }
        denali->buf.dma_buf =3D pci_map_single(dev, denali->buf.buf, DENALI=
_BUF_SIZE,
                                         PCI_DMA_BIDIRECTIONAL);

-       if (pci_dma_mapping_error(dev, denali->buf.dma_buf))
-       {
+       if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
                printk(KERN_ERR "Spectra: failed to map DMA buffer\n");
                goto failed_enable;
        }
@@ -1978,8 +1916,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
        /* MTD supported page sizes vary by kernel. We validate our
         * kernel supports the device here.
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
@@ -2011,8 +1948,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
        /* scan for NAND devices attached to the controller
         * this is the first stage in a two step process to register
         * with the nand subsystem */
-       if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL))
-       {
+       if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL)) {
                ret =3D -ENXIO;
                goto failed_nand;
        }
@@ -2029,13 +1965,10 @@ static int denali_pci_probe(struct pci_dev *dev, co=
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
+       } else {/* SLC */
                denali->nand.ecc.layout =3D &nand_oob_slc;
                denali->nand.ecc.bytes =3D ECC_BYTES_SLC;
        }
@@ -2057,8 +1990,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
        denali->nand.ecc.write_oob =3D denali_write_oob;
        denali->nand.erase_cmd =3D denali_erase;

-       if (nand_scan_tail(&denali->mtd))
-       {
+       if (nand_scan_tail(&denali->mtd)) {
                ret =3D -ENXIO;
                goto failed_nand;
        }
--
1.6.6.1
