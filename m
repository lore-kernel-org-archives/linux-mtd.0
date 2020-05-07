Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B57C38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 10:53:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877D8207DD
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 10:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qhRv4NO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877D8207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aBrAjQ8xmZllnCeOguWbfEDgyQ+1H06qJIMd+SdugA=; b=qhRv4NO7HRRtNr
	InGbA3HshCqLbCD02GOvSB2z57bjyvzC2QqRa//JqSf7nv/0fdXgFWtU75dV9xZtaicEc6zzxn6Wm
	wp6TDYbQYU/tpndoSm11fJrQZj7vi7yvRBfGQfugvesxXgcE3/SFtZ8oEubqlXr10zxw77eqJ2jWN
	89cKsd6gQKcJdvf2A3kUhZtIlgHPywWyWwSOBy6DSc0brkqzcRMzi8OfVfADsll9G23fMmZOJr0gj
	2IamA6JI1bjeGpmsylwE2yY6e9puC1ciH5krEeontaWF+pLF03AGXcvcp7Yu3MCZ26aewZFo1HW40
	BSpoH8Uo9MDUL0iPNh+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWe9Y-0004YL-3i; Thu, 07 May 2020 10:53:20 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWe92-00044I-Hh
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 10:52:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3D69F24000F;
 Thu,  7 May 2020 10:52:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 02/13] mtd: rawnand: Reorder the nand_chip->options flags
Date: Thu,  7 May 2020 12:52:30 +0200
Message-Id: <20200507105241.14299-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507105241.14299-1-miquel.raynal@bootlin.com>
References: <20200507105241.14299-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_035248_858628_61506857 
X-CRM114-Status: GOOD (  11.77  )
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

These flags are in a strange order, reorder the list, add spaces when
it is relevant, pack definitions that are related.

There is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/linux/mtd/rawnand.h | 57 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 4b58de842340..e70fea67030b 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -118,20 +118,25 @@ enum nand_ecc_algo {
 #define NAND_ECC_GENERIC_ERASED_CHECK	BIT(0)
 #define NAND_ECC_MAXIMIZE		BIT(1)
 
-/*
- * When using software implementation of Hamming, we can specify which byte
- * ordering should be used.
- */
-#define NAND_ECC_SOFT_HAMMING_SM_ORDER	BIT(2)
-
 /*
  * Option constants for bizarre disfunctionality and real
  * features.
  */
+
 /* Buswidth is 16 bit */
 #define NAND_BUSWIDTH_16	BIT(1)
+
+/*
+ * When using software implementation of Hamming, we can specify which byte
+ * ordering should be used.
+ */
+#define NAND_ECC_SOFT_HAMMING_SM_ORDER	BIT(2)
+
 /* Chip has cache program function */
 #define NAND_CACHEPRG		BIT(3)
+/* Options valid for Samsung large page devices */
+#define NAND_SAMSUNG_LP_OPTIONS NAND_CACHEPRG
+
 /*
  * Chip requires ready check on read (for auto-incremented sequential read).
  * True only for small page devices; large page devices do not support
@@ -150,6 +155,8 @@ enum nand_ecc_algo {
 
 /* Device supports subpage reads */
 #define NAND_SUBPAGE_READ	BIT(12)
+/* Macros to identify the above */
+#define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
 
 /*
  * Some MLC NANDs need data scrambling to limit bitflips caused by repeated
@@ -160,32 +167,12 @@ enum nand_ecc_algo {
 /* Device needs 3rd row address cycle */
 #define NAND_ROW_ADDR_3		BIT(14)
 
-/* Options valid for Samsung large page devices */
-#define NAND_SAMSUNG_LP_OPTIONS NAND_CACHEPRG
-
-/* Macros to identify the above */
-#define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
-
-/*
- * There are different places where the manufacturer stores the factory bad
- * block markers.
- *
- * Position within the block: Each of these pages needs to be checked for a
- * bad block marking pattern.
- */
-#define NAND_BBM_FIRSTPAGE	BIT(24)
-#define NAND_BBM_SECONDPAGE	BIT(25)
-#define NAND_BBM_LASTPAGE	BIT(26)
-
-/* Position within the OOB data of the page */
-#define NAND_BBM_POS_SMALL		5
-#define NAND_BBM_POS_LARGE		0
-
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	BIT(16)
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	BIT(18)
+
 /*
  * Autodetect nand buswidth with readid/onfi.
  * This suppose the driver will configure the hardware in 8 bits mode
@@ -193,6 +180,7 @@ enum nand_ecc_algo {
  * before calling nand_scan_tail.
  */
 #define NAND_BUSWIDTH_AUTO      BIT(19)
+
 /*
  * This option could be defined by controller drivers to protect against
  * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
@@ -222,11 +210,26 @@ enum nand_ecc_algo {
  */
 #define NAND_KEEP_TIMINGS	BIT(23)
 
+/*
+ * There are different places where the manufacturer stores the factory bad
+ * block markers.
+ *
+ * Position within the block: Each of these pages needs to be checked for a
+ * bad block marking pattern.
+ */
+#define NAND_BBM_FIRSTPAGE	BIT(24)
+#define NAND_BBM_SECONDPAGE	BIT(25)
+#define NAND_BBM_LASTPAGE	BIT(26)
+
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
 #define NAND_CI_CELLTYPE_MSK	0x0C
 #define NAND_CI_CELLTYPE_SHIFT	2
 
+/* Position within the OOB data of the page */
+#define NAND_BBM_POS_SMALL		5
+#define NAND_BBM_POS_LARGE		0
+
 /**
  * struct nand_parameters - NAND generic parameters from the parameter page
  * @model: Model name
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
