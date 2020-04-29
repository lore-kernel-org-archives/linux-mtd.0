Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06296C83006
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:57:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 838152173E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+wzrPaU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 838152173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYMm/58opvixsuGMPWApCKeGulV8uRMlVAwjY26Jehs=; b=Q+wzrPaUca/e30
	l03ITgwa4zMjoGpJRCA91pGJOfD9FpEbK7e7+Y5HdAFXpFqPTVkm8e6L4A+UVBwYcXAveLrfoU5IL
	6KniBic4mY7Oy4CBf4W9SEFcsJ7ohs/bT8vrh7ZP4AsxTGqua7IklMgQItbQMoEAiHeKg/22qklsQ
	vptNeaRRam1RslEknpmFi74OuEoQKIgQyPT5beOEahHKxpBh396TKBODa8cTG7oJdnBYsRxt8onk4
	dykD2pCL0kxqqBEO6YTI9T2qNE6ubzU130Ilo328OqYWbRIA3+zq90wL8UCu+xScIVJrMFY91RZO4
	cH/lq953aN2SZoAimqig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTp5i-0005bq-L2; Wed, 29 Apr 2020 15:57:42 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTp40-0003yY-M1
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 15:55:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0D84520008;
 Wed, 29 Apr 2020 15:55:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 09/11] mtd: rawnand: Expose monolithic
 read/write_page_raw() helpers
Date: Wed, 29 Apr 2020 17:55:38 +0200
Message-Id: <20200429155540.22048-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200429155540.22048-1-miquel.raynal@bootlin.com>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_085556_998892_D2D5590A 
X-CRM114-Status: GOOD (  12.90  )
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

Workaround this issue by proposing alternative helpers that cannot be
used by controller drivers instead.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 60 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  8 +++--
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 15a9189b2307..2e525cb5a4e4 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2629,6 +2629,39 @@ int nand_read_page_raw(struct nand_chip *chip, uint8_t *buf, int oob_required,
 }
 EXPORT_SYMBOL(nand_read_page_raw);
 
+/**
+ * nand_monolithic_read_page_raw - Read raw page data without ECC in one go
+ * @chip: nand chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
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
@@ -3636,6 +3669,33 @@ int nand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 }
 EXPORT_SYMBOL(nand_write_page_raw);
 
+/**
+ * nand_monolithic_write_page_raw - Raw page write in one go
+ * @chip: NAND chip info structure
+ * @buf: data buffer
+ * @oob_required: must write chip->oob_poi to OOB
+ * @page: page number to write
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
index d40ad19ba0f6..0da10e99cf39 100644
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
