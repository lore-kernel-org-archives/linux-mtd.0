Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADD4C38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 10:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72CC3207DD
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 10:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0i6Ftkw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72CC3207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VRKQFucUNfRSgEDmL4YiCoY658BuWBnUwAKdRXUoj0=; b=f0i6Ftkwpk1wbE
	smKsesvLBPJHQP1kPUAz6HRZZHl7sFA+35jC3BjsuHWn+wpLVSjmu/Inpjv5EF4AEp+zOiYn9xhM3
	Vvcv4PG0blU6LOXgbugAihgCtd2YWkMnvEbJKE9hNG07dd2F7G2XGcZFC79d5IyWD3EUR+CSdTlOQ
	nwsqeed9QLOg77kA7jJjQp+nExPihvFetnnrXny3lgA00Lh/BksjkeucRoHrxoGFv/4FusHwg62wa
	i0sREX9Xx7XbtF6nzqiPIMZKkT+XJdcaSAPHq+Uzeb+DPpWBb3d+AJ14g+zACN9F91jqbW4XzksJm
	kveLRTdxAw649afkxnEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWe9I-0004IR-Eh; Thu, 07 May 2020 10:53:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWe91-00044H-Uv
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 10:52:49 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 24DDF240016;
 Thu,  7 May 2020 10:52:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 01/13] mtd: rawnand: Translate obscure bitfields into
 readable macros
Date: Thu,  7 May 2020 12:52:29 +0200
Message-Id: <20200507105241.14299-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507105241.14299-1-miquel.raynal@bootlin.com>
References: <20200507105241.14299-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_035248_272112_E596F0E8 
X-CRM114-Status: GOOD (  12.15  )
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

Use the BIT() macro instead of defining a 8-digit value.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/linux/mtd/rawnand.h | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 21873168ba4d..4b58de842340 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -129,36 +129,36 @@ enum nand_ecc_algo {
  * features.
  */
 /* Buswidth is 16 bit */
-#define NAND_BUSWIDTH_16	0x00000002
+#define NAND_BUSWIDTH_16	BIT(1)
 /* Chip has cache program function */
-#define NAND_CACHEPRG		0x00000008
+#define NAND_CACHEPRG		BIT(3)
 /*
  * Chip requires ready check on read (for auto-incremented sequential read).
  * True only for small page devices; large page devices do not support
  * autoincrement.
  */
-#define NAND_NEED_READRDY	0x00000100
+#define NAND_NEED_READRDY	BIT(8)
 
 /* Chip does not allow subpage writes */
-#define NAND_NO_SUBPAGE_WRITE	0x00000200
+#define NAND_NO_SUBPAGE_WRITE	BIT(9)
 
 /* Device is one of 'new' xD cards that expose fake nand command set */
-#define NAND_BROKEN_XD		0x00000400
+#define NAND_BROKEN_XD		BIT(10)
 
 /* Device behaves just like nand, but is readonly */
-#define NAND_ROM		0x00000800
+#define NAND_ROM		BIT(11)
 
 /* Device supports subpage reads */
-#define NAND_SUBPAGE_READ	0x00001000
+#define NAND_SUBPAGE_READ	BIT(12)
 
 /*
  * Some MLC NANDs need data scrambling to limit bitflips caused by repeated
  * patterns.
  */
-#define NAND_NEED_SCRAMBLING	0x00002000
+#define NAND_NEED_SCRAMBLING	BIT(13)
 
 /* Device needs 3rd row address cycle */
-#define NAND_ROW_ADDR_3		0x00004000
+#define NAND_ROW_ADDR_3		BIT(14)
 
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS NAND_CACHEPRG
@@ -173,9 +173,9 @@ enum nand_ecc_algo {
  * Position within the block: Each of these pages needs to be checked for a
  * bad block marking pattern.
  */
-#define NAND_BBM_FIRSTPAGE		0x01000000
-#define NAND_BBM_SECONDPAGE		0x02000000
-#define NAND_BBM_LASTPAGE		0x04000000
+#define NAND_BBM_FIRSTPAGE	BIT(24)
+#define NAND_BBM_SECONDPAGE	BIT(25)
+#define NAND_BBM_LASTPAGE	BIT(26)
 
 /* Position within the OOB data of the page */
 #define NAND_BBM_POS_SMALL		5
@@ -183,21 +183,21 @@ enum nand_ecc_algo {
 
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
-#define NAND_SKIP_BBTSCAN	0x00010000
+#define NAND_SKIP_BBTSCAN	BIT(16)
 /* Chip may not exist, so silence any errors in scan */
-#define NAND_SCAN_SILENT_NODEV	0x00040000
+#define NAND_SCAN_SILENT_NODEV	BIT(18)
 /*
  * Autodetect nand buswidth with readid/onfi.
  * This suppose the driver will configure the hardware in 8 bits mode
  * when calling nand_scan_ident, and update its configuration
  * before calling nand_scan_tail.
  */
-#define NAND_BUSWIDTH_AUTO      0x00080000
+#define NAND_BUSWIDTH_AUTO      BIT(19)
 /*
  * This option could be defined by controller drivers to protect against
  * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
  */
-#define NAND_USE_BOUNCE_BUFFER	0x00100000
+#define NAND_USE_BOUNCE_BUFFER	BIT(20)
 
 /*
  * In case your controller is implementing ->legacy.cmd_ctrl() and is relying
@@ -207,20 +207,20 @@ enum nand_ecc_algo {
  * If your controller already takes care of this delay, you don't need to set
  * this flag.
  */
-#define NAND_WAIT_TCCS		0x00200000
+#define NAND_WAIT_TCCS		BIT(21)
 
 /*
  * Whether the NAND chip is a boot medium. Drivers might use this information
  * to select ECC algorithms supported by the boot ROM or similar restrictions.
  */
-#define NAND_IS_BOOT_MEDIUM	0x00400000
+#define NAND_IS_BOOT_MEDIUM	BIT(22)
 
 /*
  * Do not try to tweak the timings at runtime. This is needed when the
  * controller initializes the timings on itself or when it relies on
  * configuration done by the bootloader.
  */
-#define NAND_KEEP_TIMINGS	0x00800000
+#define NAND_KEEP_TIMINGS	BIT(23)
 
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
