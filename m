Received: from mail-qe0-x22f.google.com ([2607:f8b0:400d:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve6p9-0006ro-Js
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 17:23:24 +0000
Received: by mail-qe0-f47.google.com with SMTP id b4so6482869qen.34
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 09:23:01 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH 2/2] mtd: gpmi: Revert "mtd: gpmi: remove the nand_scan()"
Date: Wed,  6 Nov 2013 15:16:12 -0200
Message-Id: <1383758172-29798-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1383758172-29798-1-git-send-email-festevam@gmail.com>
References: <1383758172-29798-1-git-send-email-festevam@gmail.com>
Cc: marex@denx.de, Fabio Estevam <fabio.estevam@freescale.com>,
 stable@vger.kernel.org, b32955@freescale.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Commit f720e7ce (mtd: gpmi: remove the nand_scan()) caused the following 
regression on mx23:

[    1.150000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd7 (Samsung NAND 4GiB 3,3V 8-bit), 4096MiB, page size: 4096, OOB size: 8
[    1.160000] Unable to handle kernel NULL pointer dereference at virtual address 000005d0
[    1.170000] pgd = c0004000
[    1.170000] [000005d0] *pgd=00000000
[    1.180000] Internal error: Oops: 5 [#1] ARM
[    1.180000] Modules linked in:
[    1.180000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.0 #89
[    1.180000] task: c7440000 ti: c743a000 task.ti: c743a000
[    1.180000] PC is at memcmp+0x10/0x54
[    1.180000] LR is at gpmi_nand_probe+0x42c/0x894
[    1.180000] pc : [<c025fcb0>]    lr : [<c02f6a68>]    psr: 20000053
[    1.180000] sp : c743be2c  ip : 600000d3  fp : ffffffff
[    1.180000] r10: 000005d0  r9 : c02f5f08  r8 : 00000000
[    1.180000] r7 : c75858a8  r6 : c75858a8  r5 : c7585b18  r4 : c7585800
[    1.180000] r3 : 000005d0  r2 : 00000004  r1 : c05c33e4  r0 : 000005d0
[    1.180000] Flags: nzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment kernel
[    1.180000] Control: 0005317f  Table: 40004000  DAC: 00000017
[    1.180000] Process swapper (pid: 1, stack limit = 0xc743a1c0)
[    1.180000] Stack: (0xc743be2c to 0xc743c000)
[    1.180000] be20:                            c7585800 c05c316c c7585800 00000000 c012bad0
[    1.180000] be40: c7471810 c0276dd0 c761494c c76149a0 00000000 00000000 00000000 c7471810
[    1.180000] be60: 00000000 c0c09bf8 c06bf6e0 c06a9144 00000079 c06625bc 00000000 c02bfd68
[    1.180000] be80: c02bfd54 c02bebd4 c7471810 c06a9144 c7471844 c06bf6e0 00000000 c02bed84
[    1.180000] bea0: 00000000 c06a9144 c02becf0 c02bd1bc c74038a8 c7467bd0 c06a9144 c759ef80
[    1.180000] bec0: c06a23b8 c02be2a8 c05c3160 c06a9144 c06a9144 00000006 c066ec34 c06bf6e0
[    1.180000] bee0: c743a000 c02bf3ac 00000000 c06777bc 00000006 c00088ac c7440000 c0686908
[    1.180000] bf00: 60000053 c025f4b8 00000000 00000000 00000000 00000000 00000000 c045f4a8
[    1.180000] bf20: 00000002 c743a000 c0d2190e c049e9e4 00000079 c0037c20 c0617e98 00000006
[    1.180000] bf40: c0d21916 00000006 60000053 c06777bc 00000006 c066ec34 c06bf6e0 c0640480
[    1.180000] bf60: 00000079 c066ec40 00000000 c0640ac4 00000006 00000006 c0640480 6559f550
[    1.180000] bf80: 00000000 c04559ec 00000000 c04559ec 00000000 00000000 00000000 00000000
[    1.180000] bfa0: 00000000 c04559f4 00000000 c000ee60 00000000 00000000 00000000 00000000
[    1.180000] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.180000] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000 54555574 57555555
[    1.180000] [<c025fcb0>] (memcmp+0x10/0x54) from [<c05c316c>] (__func__.15198+0x103c94/0x1254e8)
[    1.180000] Code: e3520000 e52d4004 e1a03000 0a00000e (e5d0c000) 
[    1.390000] ---[ end trace 0aae7882440a8ce8 ]---
[    1.400000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

This reverts commit f720e7ce510bf79f029be45ce200ccfce5551280.

Cc: <stable@vger.kernel.org> #3.12
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Kernel 3.11 boots fine on mx23, but 3.12 fails because of this commit.

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 65 ++++++++++++++++------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index a5c60c4..5eaefdb 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -217,6 +217,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 	if (geo->page_size < mtd->writesize + mtd->oobsize) {
 		of->offset = geo->page_size - mtd->writesize;
 		of->length = mtd->oobsize - of->offset;
+		mtd->oobavail = gpmi_hw_ecclayout.oobavail = of->length;
 	}
 
 	geo->payload_size = mtd->writesize;
@@ -1591,22 +1592,19 @@ static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
 	if (ret)
 		return ret;
 
+	/* Adjust the ECC strength according to the chip. */
+	this->nand.ecc.strength = this->bch_geometry.ecc_strength;
+	this->mtd.ecc_strength = this->bch_geometry.ecc_strength;
+	this->mtd.bitflip_threshold = this->bch_geometry.ecc_strength;
+
 	/* NAND boot init, depends on the gpmi_set_geometry(). */
 	return nand_boot_init(this);
 }
 
-static void gpmi_nfc_exit(struct gpmi_nand_data *this)
-{
-	nand_release(&this->mtd);
-	gpmi_free_dma_buffer(this);
-}
-
-static int gpmi_init_last(struct gpmi_nand_data *this)
+static int gpmi_scan_bbt(struct mtd_info *mtd)
 {
-	struct mtd_info *mtd = &this->mtd;
 	struct nand_chip *chip = mtd->priv;
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	struct bch_geometry *bch_geo = &this->bch_geometry;
+	struct gpmi_nand_data *this = chip->priv;
 	int ret;
 
 	/* Prepare for the BBT scan. */
@@ -1614,16 +1612,6 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	/* Init the nand_ecc_ctrl{} */
-	ecc->read_page	= gpmi_ecc_read_page;
-	ecc->write_page	= gpmi_ecc_write_page;
-	ecc->read_oob	= gpmi_ecc_read_oob;
-	ecc->write_oob	= gpmi_ecc_write_oob;
-	ecc->mode	= NAND_ECC_HW;
-	ecc->size	= bch_geo->ecc_chunk_size;
-	ecc->strength	= bch_geo->ecc_strength;
-	ecc->layout	= &gpmi_hw_ecclayout;
-
 	/*
 	 * Can we enable the extra features? such as EDO or Sync mode.
 	 *
@@ -1632,7 +1620,14 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	 */
 	gpmi_extra_init(this);
 
-	return 0;
+	/* use the default BBT implementation */
+	return nand_default_bbt(mtd);
+}
+
+static void gpmi_nfc_exit(struct gpmi_nand_data *this)
+{
+	nand_release(&this->mtd);
+	gpmi_free_dma_buffer(this);
 }
 
 static int gpmi_nfc_init(struct gpmi_nand_data *this)
@@ -1658,33 +1653,33 @@ static int gpmi_nfc_init(struct gpmi_nand_data *this)
 	chip->read_byte		= gpmi_read_byte;
 	chip->read_buf		= gpmi_read_buf;
 	chip->write_buf		= gpmi_write_buf;
+	chip->ecc.read_page	= gpmi_ecc_read_page;
+	chip->ecc.write_page	= gpmi_ecc_write_page;
+	chip->ecc.read_oob	= gpmi_ecc_read_oob;
+	chip->ecc.write_oob	= gpmi_ecc_write_oob;
+	chip->scan_bbt		= gpmi_scan_bbt;
 	chip->badblock_pattern	= &gpmi_bbt_descr;
 	chip->block_markbad	= gpmi_block_markbad;
 	chip->options		|= NAND_NO_SUBPAGE_WRITE;
+	chip->ecc.mode		= NAND_ECC_HW;
+	chip->ecc.size		= 1;
+	chip->ecc.strength	= 8;
+	chip->ecc.layout	= &gpmi_hw_ecclayout;
 	if (of_get_nand_on_flash_bbt(this->dev->of_node))
 		chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
 
-	/*
-	 * Allocate a temporary DMA buffer for reading ID in the
-	 * nand_scan_ident().
-	 */
+	/* Allocate a temporary DMA buffer for reading ID in the nand_scan() */
 	this->bch_geometry.payload_size = 1024;
 	this->bch_geometry.auxiliary_size = 128;
 	ret = gpmi_alloc_dma_buffer(this);
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan_ident(mtd, 1, NULL);
-	if (ret)
-		goto err_out;
-
-	ret = gpmi_init_last(this);
-	if (ret)
-		goto err_out;
-
-	ret = nand_scan_tail(mtd);
-	if (ret)
+	ret = nand_scan(mtd, 1);
+	if (ret) {
+		pr_err("Chip scan failed\n");
 		goto err_out;
+	}
 
 	ppdata.of_node = this->pdev->dev.of_node;
 	ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
-- 
1.8.1.2
