Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176EAC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD7B206E6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uf45Q+hl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD7B206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1Uft9NZsHPr6S0SygIjUnP5GMZeN1T+irHvzonWIIo=; b=uf45Q+hlrOVTKN
	kIjsXIRi34xPhh7D+2i6xR1JAoOUdjAsLFW/ZFmGOFlVjw/r1otVA+XJRFcl46kbP+xZ09ULNk9PS
	FqT+3WAQBF3ehKbz7/JVNlT1VMjWnWVGXViWUnc3AiStPxABUlvFxCFHtN6KyznkerkK4g0InxgBh
	z9J+522djyl0pSXj2fZ+7bq7UWlRrGRTqLOSdiHoeU38ur1Nw7gk8VZLNymouLR9GcTt94EQS5R/t
	dndtbB/Dp50RztwdxP0Nn/+5kGHyiHqy0nqqa9IKYQAqqOk5Na/U9PXDMBQUftTFWthRV29l/ILi9
	qxEovUPeznSMywAZhzkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYCl-0007RO-Vp; Mon, 04 May 2020 10:20:07 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYCh-0006NF-NI
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 10:20:05 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A541524002B;
 Mon,  4 May 2020 10:18:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 11/13] mtd: rawnand: Expose monolithic
 read/write_page_raw() helpers
Date: Mon,  4 May 2020 11:52:35 +0200
Message-Id: <20200504095237.1654-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504095237.1654-1-miquel.raynal@bootlin.com>
References: <20200504095237.1654-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_032004_072963_D362132A 
X-CRM114-Status: GOOD (  14.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The current nand_read/write_page_raw() helpers are already widely used
but do not fit the purpose of "constrained" controllers which cannot,
for instance, separate command/address cycles with data cycles.

Workaround this issue by proposing alternative helpers that can be
used by these controller drivers instead.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 77 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  8 +++-
 2 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 413974df8a5e..0286f68ef552 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2638,6 +2638,47 @@ int nand_read_page_raw(struct nand_chip *chip, uint8_t *buf, int oob_required,
 }
 EXPORT_SYMBOL(nand_read_page_raw);
 
+/**
+ * nand_monolithic_read_page_raw - Monolithic page read in raw mode
+ * @chip: NAND chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
+ *
+ * This is a raw page read, ie. without any error detection/correction.
+ * Monolithic means we are requesting all the relevant data (main plus
+ * eventually OOB) to be loaded in the NAND cache and sent over the
+ * bus (from the NAND chip to the NAND controller) in a single
+ * operation. This is an alternative to nand_read_page_raw(), which
+ * first reads the main data, and if the OOB data is requested too,
+ * then reads more data on the bus.
+ */
+int nand_monolithic_read_page_raw(struct nand_chip *chip, u8 *buf,
+				  int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	unsigned int size = mtd->writesize;
+	u8 *read_buf = buf;
+	int ret;
+
+	if (oob_required) {
+		size += mtd->oobsize;
+
+		if (buf != chip->data_buf)
+			read_buf = nand_get_data_buf(chip);
+	}
+
+	ret = nand_read_page_op(chip, page, 0, read_buf, size);
+	if (ret)
+		return ret;
+
+	if (buf != chip->data_buf)
+		memcpy(buf, read_buf, mtd->writesize);
+
+	return 0;
+}
+EXPORT_SYMBOL(nand_monolithic_read_page_raw);
+
 /**
  * nand_read_page_raw_syndrome - [INTERN] read raw page data without ecc
  * @chip: nand chip info structure
@@ -3646,6 +3687,42 @@ int nand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 }
 EXPORT_SYMBOL(nand_write_page_raw);
 
+/**
+ * nand_monolithic_write_page_raw - Monolithic page write in raw mode
+ * @chip: NAND chip info structure
+ * @buf: data buffer to write
+ * @oob_required: must write chip->oob_poi to OOB
+ * @page: page number to write
+ *
+ * This is a raw page write, ie. without any error detection/correction.
+ * Monolithic means we are requesting all the relevant data (main plus
+ * eventually OOB) to be sent over the bus and effectively programmed
+ * into the NAND chip arrays in a single operation. This is an
+ * alternative to nand_write_page_raw(), which first sends the main
+ * data, then eventually send the OOB data by latching more data
+ * cycles on the NAND bus, and finally sends the program command to
+ * synchronyze the NAND chip cache.
+ */
+int nand_monolithic_write_page_raw(struct nand_chip *chip, const u8 *buf,
+				   int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	unsigned int size = mtd->writesize;
+	u8 *write_buf = (u8 *)buf;
+
+	if (oob_required) {
+		size += mtd->oobsize;
+
+		if (buf != chip->data_buf) {
+			write_buf = nand_get_data_buf(chip);
+			memcpy(write_buf, buf, mtd->writesize);
+		}
+	}
+
+	return nand_prog_page_op(chip, page, 0, write_buf, size);
+}
+EXPORT_SYMBOL(nand_monolithic_write_page_raw);
+
 /**
  * nand_write_page_raw_syndrome - [INTERN] raw page write function
  * @chip: nand chip info structure
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 70380c91731c..830e05dd1e1d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1328,13 +1328,17 @@ int nand_read_oob_std(struct nand_chip *chip, int page);
 int nand_get_set_features_notsupp(struct nand_chip *chip, int addr,
 				  u8 *subfeature_param);
 
-/* Default read_page_raw implementation */
+/* Default read_page_raw implementations */
 int nand_read_page_raw(struct nand_chip *chip, uint8_t *buf, int oob_required,
 		       int page);
+int nand_monolithic_read_page_raw(struct nand_chip *chip, uint8_t *buf,
+				  int oob_required, int page);
 
-/* Default write_page_raw implementation */
+/* Default write_page_raw implementations */
 int nand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 			int oob_required, int page);
+int nand_monolithic_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
+				   int oob_required, int page);
 
 /* Reset and initialize a NAND device */
 int nand_reset(struct nand_chip *chip, int chipnr);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
