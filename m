Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C50C3DA61
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2024 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Th5SY7RDVvn5HIZ5RJ45WxJrdGsO3r7oAe85gNGhbtA=; b=uKb5vs0ZQfKlk1
	m4HKb06d3/1/vs9ZCOT9tuY4l8AoVwzmHEULAIOdU3FnXzRybi1KowJByH+CJINgW9ByzJxmL1NBo
	BMEJcgMDN9MTo2YxWjUh0OrYlblGZZ+wILrfgNwXDXcmHK0ln+U2lMCvJqowkGhWrxTk7RhXwnVkn
	4LOc8zThGqFl9jICuQOuLkcXI7CGuYoZZln8jQ/TCOwc8+Rd3hMrUBt/xc8AW7dpH7FGRDTJvolL0
	jt3KLADKIuY0nLXO5tqC9MkbpPr1Fw/cxaNkTLW7oHXyV0gp0YspgJw1gFiN6rxiA/p7QGWZJ3J8d
	NznnYZTs70JYcTsVYsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUq-0000000ArXe-2e43;
	Mon, 29 Jul 2024 10:20:52 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUn-0000000ArWZ-1w76
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jul 2024 10:20:51 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202407291020451c776be68235ac599f
        for <linux-mtd@lists.infradead.org>;
        Mon, 29 Jul 2024 12:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vDzx797SXl3S694+rqgc+zh8E73wuHMK/uQOTpw6SQY=;
 b=aD4RXznozw0a8w9tbAQVZ0uOnzhhCIYmL1zgJWvowT5so9xO5FRDiNolaKSgeeyf/5VzCq
 ImZd90CDi551ZDjmbu0oGNkFagB+pkTmp3JCndLiM5qys2qwy2aTOTacqYFHOJRgBy3cPfb7
 xoxVGoQR1QgNbDCc19j4z39JJJhRhkWG7zXI+0voOa4coXfx++vZDFR66NsXYWuyk/sZnF+0
 Sll5L3eBUe9/9Bs89bD5gmmMPVCGPwHXoS87RDYNdZ23xBZ3HaGDoSrW8VDbWRKU/dPxv2Pb
 dCVNFOo03+LpSp87gdeAOGOI1Xz4OHDYJAXErZxAmmxrOOQctm3xymNw==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 1/3] mtd: spi-nor: handle JEDEC manufacturer bank
Date: Mon, 29 Jul 2024 12:20:14 +0200
Message-ID: <20240729102016.8527-2-alessandro.zini@siemens.com>
In-Reply-To: <20240729102016.8527-1-alessandro.zini@siemens.com>
References: <20240729102016.8527-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_032049_667448_62828324 
X-CRM114-Status: GOOD (  23.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alessandro Zini <alessandro.zini@siemens.com>

JEDEC JEP106 maintains a list of manufacturers IDs, consisting in 7
bit of information plus 1 parity bit, for a total of 1 Byte. Since the
number of manufacturers is way larger than this, JEDEC additionally
defines the continuation code 0x7f to be used as a prefix to the
actual ID, subdividing IDs in different banks.

This commit handles such manufacturer bank code by introducing a new
mfr_bank field in flash_info struct. This field is intended to be
populated when specifying a manufacturer part, and for retro
compatibility it is assumed to be 1 if omitted.
Note that this assumption was already implicitly taken, as only a
couple of the already supported manufacturer parts have the
continuation code prefixed to the actual ID.

Given the fast expanding pace of JEP106, the read ID operation has
been expanded to 128 Bytes plus the pre-existing 6 Bytes for the ID
code, thus supporting up to 128 banks.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 drivers/mtd/spi-nor/core.c    | 71 ++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/core.h    | 10 ++++-
 drivers/mtd/spi-nor/debugfs.c |  2 +
 drivers/mtd/spi-nor/sysfs.c   | 13 +++++++
 4 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e0c4efc424f4..07d2627c5850 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -407,6 +407,32 @@ int spi_nor_write_disable(struct spi_nor *nor)
 	return ret;
 }
 
+/**
+ * spi_nor_get_mfr_bank() - Get the JEDEC manufacturer bank number.
+ * @id:		pointer to the buffer where the JEDEC ID (incl. eventual
+ *		continuation codes) is stored.
+ * @bank:	pointer to a buffer where the bank number will be written.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_get_mfr_bank(u8 *id, u8 *bank)
+{
+	u8 tmp_bank;
+
+	tmp_bank = 0;
+	while (tmp_bank < SPI_NOR_MAX_ID_READ_LEN &&
+	       id[tmp_bank] == SPI_NOR_CONTINUATION_CODE)
+		tmp_bank++;
+
+	/* Incomplete read of JEDEC id */
+	if (tmp_bank == SPI_NOR_MAX_ID_READ_LEN)
+		return -EIO;
+
+	*bank = tmp_bank;
+
+	return 0;
+}
+
 /**
  * spi_nor_read_id() - Read the JEDEC ID.
  * @nor:	pointer to 'struct spi_nor'.
@@ -415,7 +441,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
  * @ndummy:	number of dummy bytes to send after an opcode or address. Can
  *		be zero if the operation does not require dummy bytes.
  * @id:		pointer to a DMA-able buffer where the value of the JEDEC ID
- *		will be written.
+ *		(incl. eventual continuation codes) will be written.
  * @proto:	the SPI protocol for register operation.
  *
  * Return: 0 on success, -errno otherwise.
@@ -427,13 +453,14 @@ int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_NOR_READID_OP(naddr, ndummy, id, SPI_NOR_MAX_ID_LEN);
+			SPI_NOR_READID_OP(naddr, ndummy, id,
+					  SPI_NOR_MAX_ID_READ_LEN);
 
 		spi_nor_spimem_setup_op(nor, &op, proto);
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
 		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
-						    SPI_NOR_MAX_ID_LEN);
+						    SPI_NOR_MAX_ID_READ_LEN);
 	}
 	return ret;
 }
@@ -1984,7 +2011,8 @@ static const struct flash_info spi_nor_generic_flash = {
 };
 
 static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
-						 const u8 *id)
+						 const u8 *id,
+						 u8 bank)
 {
 	const struct flash_info *part;
 	unsigned int i, j;
@@ -1992,8 +2020,22 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
 		for (j = 0; j < manufacturers[i]->nparts; j++) {
 			part = &manufacturers[i]->parts[j];
+
 			if (part->id &&
-			    !memcmp(part->id->bytes, id, part->id->len)) {
+			    !memcmp(part->id->bytes, id + bank, part->id->len)) {
+				/*
+				 * Subtract default bank number since
+				 * JEDEC does not count banks from 0
+				 */
+				if (part->mfr_bank && part->mfr_bank -
+					bank != SPI_NOR_DEFAULT_MFR_BANK)
+					continue;
+
+				/*
+				 * Either we found a matching bank or we
+				 * implicitly assume the default bank is
+				 * intended if not specified otherwise
+				 */
 				nor->manufacturer = manufacturers[i];
 				return part;
 			}
@@ -2007,6 +2049,7 @@ static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 {
 	const struct flash_info *info;
 	u8 *id = nor->bouncebuf;
+	u8 bank;
 	int ret;
 
 	ret = spi_nor_read_id(nor, 0, 0, id, nor->reg_proto);
@@ -2015,13 +2058,21 @@ static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 		return ERR_PTR(ret);
 	}
 
+	ret = spi_nor_get_mfr_bank(id, &bank);
+	if (ret) {
+		dev_dbg(nor->dev,
+			"error %d getting JEDEC manufacturer bank\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	info = spi_nor_match_id(nor, id, bank);
+
 	/* Cache the complete flash ID. */
-	nor->id = devm_kmemdup(nor->dev, id, SPI_NOR_MAX_ID_LEN, GFP_KERNEL);
+	nor->id = devm_kmemdup(nor->dev, id + bank,
+			       SPI_NOR_MAX_ID_LEN, GFP_KERNEL);
 	if (!nor->id)
 		return ERR_PTR(-ENOMEM);
 
-	info = spi_nor_match_id(nor, id);
-
 	/* Fallback to a generic flash described only by its SFDP data. */
 	if (!info) {
 		ret = spi_nor_check_sfdp_signature(nor);
@@ -3502,7 +3553,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	dev_dbg(dev, "Manufacturer and device ID: %*phN\n",
+	dev_dbg(dev, "Manufacturer bank: %u, device ID: %*phN\n",
+		nor->info->mfr_bank ?
+			  nor->info->mfr_bank : SPI_NOR_DEFAULT_MFR_BANK,
 		SPI_NOR_MAX_ID_LEN, nor->id);
 
 	return 0;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37..5091d720eba6 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -9,7 +9,11 @@
 
 #include "sfdp.h"
 
-#define SPI_NOR_MAX_ID_LEN	6
+#define SPI_NOR_MAX_ID_LEN		6
+/* Account for up to 128 banks  */
+#define SPI_NOR_MAX_ID_READ_LEN		(SPI_NOR_MAX_ID_LEN + 128)
+#define SPI_NOR_DEFAULT_MFR_BANK	1
+#define SPI_NOR_CONTINUATION_CODE	0x7f
 /*
  * 256 bytes is a sane default for most older flashes. Newer flashes will
  * have the page size defined within their SFDP tables.
@@ -498,6 +502,8 @@ struct spi_nor_id {
  * @mfr_flags:      manufacturer private flags. Used in the manufacturer fixup
  *                  hooks to differentiate support between flashes of the same
  *                  manufacturer.
+ * @mfr_bank:       (optional) manufacturer ID bank as per JEDEC JEP106.
+ *                  Defaults to 1.
  * @otp_org:        flash's OTP organization.
  * @fixups:         part specific fixup hooks.
  */
@@ -535,6 +541,7 @@ struct flash_info {
 #define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
 
 	u8 mfr_flags;
+	u8 mfr_bank;
 
 	const struct spi_nor_otp_organization *otp;
 	const struct spi_nor_fixups *fixups;
@@ -613,6 +620,7 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
+int spi_nor_get_mfr_bank(u8 *id, u8 *bank);
 int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
 		    enum spi_nor_protocol reg_proto);
 int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..035f0cf97111 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -85,6 +85,8 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	seq_printf(s, "name\t\t%s\n", info->name);
 	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
+	seq_printf(s, "mfr bank\t%u\n",
+		info->mfr_bank ? info->mfr_bank : SPI_NOR_DEFAULT_MFR_BANK);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
 	seq_printf(s, "write size\t%u\n", params->writesize);
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 96064e4babf0..4b8bda191c73 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -42,10 +42,23 @@ static ssize_t jedec_id_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(jedec_id);
 
+static ssize_t jedec_mfr_bank_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct spi_device *spi = to_spi_device(dev);
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+
+	return sysfs_emit(buf, "%u\n", nor->info->mfr_bank ?
+			  nor->info->mfr_bank : SPI_NOR_DEFAULT_MFR_BANK);
+}
+static DEVICE_ATTR_RO(jedec_mfr_bank);
+
 static struct attribute *spi_nor_sysfs_entries[] = {
 	&dev_attr_manufacturer.attr,
 	&dev_attr_partname.attr,
 	&dev_attr_jedec_id.attr,
+	&dev_attr_jedec_mfr_bank.attr,
 	NULL
 };
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
