Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB2EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ruVUAwt80t9KC9vWZIh4tSMvt/bGM/HWmbD05UKe/RA=; b=jldh0K93UOj5hw
	/BpInNqkcemLCjtFEV/MKmLO0ObDtsha7HSS9zIBioMJN2HXSiaapjZvYJi2vtJN04KhoROGQRuVO
	h/WFq319Y3JCKePyrW9uzum1zKxrXtCpnb2po5LRgxdM2tq5B28QBN6bTqa0fHZThcmJNz9tLMP5K
	4CbrX5FaAWQBPCLWK5scIAkjQY2DvRttYP2hqAPpF87y8E8//fVJ7f3WExQ8m3T/BUO3cmk124yC7
	z4fPRltOMvzdlwQMwY/2RaR4IA7ltOimjtHvepbo/Qlr6ZeOvLmcv6QUEOsmMrog0cXVpUxIEGXci
	X0Js6wg7M2Tf3/PXs/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2em-00FKFw-SQ; Thu, 27 Jan 2022 11:09:37 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2dq-00FJr3-7C
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 11:08:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC2BEFF80B;
 Thu, 27 Jan 2022 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643281714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ln1Kguuuzcqz2rq1NT2MAKP2loMpMc/GoDyrA3bHOg0=;
 b=nWhAo6xgLlUvT8xfbW2xnl6SQniz0J00Cb3AOghukBzbYUCO0bY1DGR6y7yugqqSvI5Eox
 bjAUuwRiSnfV8fC4MKpMECWE08gntrUt5ow7RIfryO2x24vLlgBbWVZHk/b5v6Pt2yVBcZ
 UxP7Nh1PnRmVQYapKQrXCD3nB8STXOrgLyEQcKeZDRK7W6PsZd0mMIAR2/oG4k+6abJI4m
 CTRgd+Jcx1kp1idzFWwLwvsSAYJvbIrnx7c0sfEMG73Yk76lELZxbYC++fFGVgAJeNUQaB
 3he/+Mb4owOaDOaXuD0ggRAFXJTWX7zE7mGEzKUPtyyteAA4N/hJTTjqGOpiow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mtd: Replace the expert mode symbols with a single helper
Date: Thu, 27 Jan 2022 12:08:28 +0100
Message-Id: <20220127110828.1065099-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030838_601402_ACD7CC60 
X-CRM114-Status: GOOD (  13.59  )
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

Reduce the number of exported symbols by replacing:
- mtd_expert_analysis_warning (the error string)
- mtd_expert_analysis_mode (the boolean)
with a single helper:
- mtd_check_expert_analysis_mode

Calling this helper will both check/return the content of the internal
boolean -which is not exported anymore- and as well WARN_ONCE() the
user.

While on this function, make the error string local to the helper and
set it const.

Update all the consumers.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c            | 21 +++++++++++++--------
 drivers/mtd/nand/core.c          |  2 +-
 drivers/mtd/nand/raw/nand_base.c |  2 +-
 drivers/mtd/nand/raw/nand_bbt.c  |  2 +-
 include/linux/mtd/mtd.h          |  3 +--
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 70f492dce158..06bd05ef20d6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -358,6 +358,19 @@ static int mtd_partname_debug_show(struct seq_file *s, void *p)
 
 DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
 
+static bool mtd_expert_analysis_mode;
+
+bool mtd_check_expert_analysis_mode(void)
+{
+	const char *mtd_expert_analysis_warning =
+		"Bad block checks have been entirely disabled.\n"
+		"This is only reserved for post-mortem forensics and debug purposes.\n"
+		"Never enable this mode if you do not know what you are doing!\n";
+
+	return WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning);
+}
+EXPORT_SYMBOL_GPL(mtd_check_expert_analysis_mode);
+
 static struct dentry *dfs_dir_mtd;
 
 static void mtd_debugfs_populate(struct mtd_info *mtd)
@@ -2370,14 +2383,6 @@ static struct backing_dev_info * __init mtd_bdi_init(const char *name)
 	return ret ? ERR_PTR(ret) : bdi;
 }
 
-char *mtd_expert_analysis_warning =
-	"Bad block checks have been entirely disabled.\n"
-	"This is only reserved for post-mortem forensics and debug purposes.\n"
-	"Never enable this mode if you do not know what you are doing!\n";
-EXPORT_SYMBOL_GPL(mtd_expert_analysis_warning);
-bool mtd_expert_analysis_mode;
-EXPORT_SYMBOL_GPL(mtd_expert_analysis_mode);
-
 static struct proc_dir_entry *proc_mtd;
 
 static int __init init_mtd(void)
diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 416947f28b67..3ff99a42a63f 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -21,7 +21,7 @@
  */
 bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos)
 {
-	if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
+	if (mtd_check_expert_analysis_mode())
 		return false;
 
 	if (nanddev_bbt_is_initialized(nand)) {
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e7b2ba016d8c..068ecf979033 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -321,7 +321,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 	if (nand_region_is_secured(chip, ofs, mtd->erasesize))
 		return -EIO;
 
-	if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
+	if (mtd_check_expert_analysis_mode())
 		return 0;
 
 	if (chip->legacy.block_bad)
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index ab630af3a309..a3723da2e0a0 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1455,7 +1455,7 @@ int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
 	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
 
-	if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
+	if (mtd_check_expert_analysis_mode())
 		return 0;
 
 	switch (res) {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 1ffa933121f6..5af096325b4d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -711,7 +711,6 @@ static inline int mtd_is_bitflip_or_eccerr(int err) {
 
 unsigned mtd_mmap_capabilities(struct mtd_info *mtd);
 
-extern char *mtd_expert_analysis_warning;
-extern bool mtd_expert_analysis_mode;
+bool mtd_check_expert_analysis_mode(void);
 
 #endif /* __MTD_MTD_H__ */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
