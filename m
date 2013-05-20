Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UeFnH-0002HC-W2
 for linux-mtd@lists.infradead.org; Mon, 20 May 2013 02:25:49 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v6 05/10 fix] mtd: get the ECC info from the Extended
 Parameter Page
Date: Mon, 20 May 2013 10:08:25 +0800
Message-ID: <1369015705-4720-1-git-send-email-b32955@freescale.com>
In-Reply-To: <51966AA7.7050007@gmail.com>
References: <51966AA7.7050007@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, vikram186@gmail.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since the ONFI 2.1, the onfi spec adds the Extended Parameter Page
to store the ECC info.

The onfi spec tells us that if the nand chip's recommended ECC codeword
size is not 512 bytes, then the @ecc_bits is 0xff. The host _SHOULD_ then
read the Extended ECC information that is part of the extended parameter
page to retrieve the ECC requirements for this device.

This patch implement the reading of the Extended Parameter Page, and parses
the sections for ECC type, and get the ECC info from the ECC section.

Tested this patch with Micron MT29F64G08CBABAWP.

Acked-by: Pekon Gupta <pekon@ti.com>
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   88 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b63b731..3edf825 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2835,6 +2835,79 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
 	return crc;
 }
 
+/* Parse the Extended Parameter Page. */
+static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
+		struct nand_chip *chip, struct nand_onfi_params *p)
+{
+	struct onfi_ext_param_page *ep;
+	struct onfi_ext_section *s;
+	struct onfi_ext_ecc_info *ecc;
+	uint8_t *cursor;
+	int ret = -EINVAL;
+	int len;
+	int i;
+
+	len = le16_to_cpu(p->ext_param_page_length) * 16;
+	ep = kmalloc(len, GFP_KERNEL);
+	if (!ep) {
+		ret = -ENOMEM;
+		goto ext_out;
+	}
+
+	/* Send our own NAND_CMD_PARAM. */
+	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
+
+	/* Use the Change Read Column command to skip the ONFI param pages. */
+	chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
+			sizeof(*p) * p->num_of_param_pages , -1);
+
+	/* Read out the Extended Parameter Page. */
+	chip->read_buf(mtd, (uint8_t *)ep, len);
+	if ((onfi_crc16(ONFI_CRC_BASE, ((uint8_t *)ep) + 2, len - 2)
+		!= le16_to_cpu(ep->crc))) {
+		pr_debug("fail in the CRC.\n");
+		goto ext_out;
+	}
+
+	/*
+	 * From section 5.7.2.2, we know that the Extened Param Page is valid
+	 * when two or more bytes of the signatrue are valid.
+	 * So we only check the first two bytes here.
+	 */
+	if (strncmp(ep->sig, "EP", 2)) {
+		pr_debug("The signatrue is invalid.\n");
+		goto ext_out;
+	}
+
+	/* find the ECC section. */
+	cursor = (uint8_t *)(ep + 1);
+	for (i = 0; i < ONFI_EXT_SECTION_MAX; i++) {
+		s = ep->sections + i;
+		if (s->type == ONFI_SECTION_TYPE_2)
+			break;
+		cursor += s->length * 16;
+	}
+	if (i == ONFI_EXT_SECTION_MAX) {
+		pr_debug("We can not find the ECC section.\n");
+		goto ext_out;
+	}
+
+	/* get the info we want. */
+	ecc = (struct onfi_ext_ecc_info *)cursor;
+
+	if (ecc->codeword_size) {
+		chip->ecc_strength_ds = ecc->ecc_bits;
+		chip->ecc_step_ds = 1 << ecc->codeword_size;
+	}
+
+	pr_info("ONFI extended param page detected.\n");
+	return 0;
+
+ext_out:
+	kfree(ep);
+	return ret;
+}
+
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
@@ -2903,6 +2976,21 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	if (p->ecc_bits != 0xff) {
 		chip->ecc_strength_ds = p->ecc_bits;
 		chip->ecc_step_ds = 512;
+	} else if (chip->onfi_version >= 21 &&
+		(onfi_feature(chip) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
+
+		/*
+		 * The nand_flash_detect_ext_param_page() uses the
+		 * Change Read Column command which maybe not supported
+		 * by the chip->cmdfunc. So try to update the chip->cmdfunc
+		 * now. We do not replace user supplied command function.
+		 */
+		if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
+			chip->cmdfunc = nand_command_lp;
+
+		/* The Extended Parameter Page is supported since ONFI 2.1. */
+		if (nand_flash_detect_ext_param_page(mtd, chip, p))
+			pr_info("Failed to detect the extended param page.\n");
 	}
 
 	pr_info("ONFI flash detected\n");
-- 
1.7.1
