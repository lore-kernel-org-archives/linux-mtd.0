Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F09C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFPRKf5XjfAM6fiXD0MkElYfEqAAkfC9Gqye+pVUHnc=; b=WpemIVuhbouFrl
	Ef4InxMVe00sllkjnWlKhHmnWVVM6ayIMdMsGPUpTLChewXFm97L6NR2wrwlpQONjmXho+l0TLiZO
	qV/6TCBYaPq3ErqOMbkMOdBrj3BxKLOiOv4RFeQ1pmexiQnu1QTrk37Wx+tT5pViI50z+8laxD2MF
	O0Jxy2PtzqRfgwu+GYH+RKSSak9xfGegJS3Pv6anydtxuLs48H1xCjULEfBIgRfuhBHPFtM7lrlax
	SfvHdCVdSYmiH1B0z4XnI3HpO9ZoZnZn0iX/zRrrg4EmF4WaFK6XaDHiypqlyQ78W87PySVTMRxSI
	kOziyPuaDXlRhxiAd2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDPWM-001iNb-KC; Fri, 28 Jan 2022 11:34:26 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDPWG-001iHz-Lg
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 11:34:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3D180200002;
 Fri, 28 Jan 2022 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643369656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1CEjWaGn442UpC5KUtYBdsKCK5vPUglxBwLzXt2NBLs=;
 b=MFO6e+xgfNta+KCB4CW9Up9yK5BCVeAdhZWko/joT9XGwNnm3r085LScaj0SS7ZaLEP5nu
 evfMJab0avwlCZwaY1U+Q7+mVFByjCajzSOnbkrKduH/7FvKj0jU2PfXBKLZtqxMe/yWvD
 poYaHCOWlY1q2JHymb/KvcAmp2Ro1MX2Bl1wVnd84ExMgKkVtrACMGWqrt+Lyay0FG3ogT
 mWONFg6xhJ2Sz5EtXCb2S4AFqITIrd4j+W0XZCBo0WBsFrRLzC2ek+krzTqCQN5ZgNiu8F
 ZshjnnCu8PHQRfzzf4ynGFUkIlzkQDefygrssrI6fPzLKdqCncjTQg77tm9eNA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] mtd: Replace the expert mode symbols with a single helper
Date: Fri, 28 Jan 2022 12:34:14 +0100
Message-Id: <20220128113414.1121924-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_033421_230603_DD2D7795 
X-CRM114-Status: GOOD (  14.92  )
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
boolean -which is not exported anymore- and as well conditionally
WARN_ONCE() the user, like it was done before.

While on this function, make the error string local to the helper and
set it const. Only export this helper when CONFIG_DEBUG_FS is defined to
limit the growth of the Linux kernel size only for a debug feature on
production kernels.

Mechanically update all the consumers.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Enclose the definition of the function within an #ifdef as requested
  by Geert.

 drivers/mtd/mtdcore.c            | 23 +++++++++++++++--------
 drivers/mtd/nand/core.c          |  2 +-
 drivers/mtd/nand/raw/nand_base.c |  2 +-
 drivers/mtd/nand/raw/nand_bbt.c  |  2 +-
 include/linux/mtd/mtd.h          |  8 ++++++--
 5 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 70f492dce158..1e7f3bbf847e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -358,6 +358,21 @@ static int mtd_partname_debug_show(struct seq_file *s, void *p)
 
 DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
 
+static bool mtd_expert_analysis_mode;
+
+#ifdef CONFIG_DEBUG_FS
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
+#endif
+
 static struct dentry *dfs_dir_mtd;
 
 static void mtd_debugfs_populate(struct mtd_info *mtd)
@@ -2370,14 +2385,6 @@ static struct backing_dev_info * __init mtd_bdi_init(const char *name)
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
index 1ffa933121f6..1b3fc8c71ab3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -711,7 +711,11 @@ static inline int mtd_is_bitflip_or_eccerr(int err) {
 
 unsigned mtd_mmap_capabilities(struct mtd_info *mtd);
 
-extern char *mtd_expert_analysis_warning;
-extern bool mtd_expert_analysis_mode;
+#ifdef CONFIG_DEBUG_FS
+bool mtd_check_expert_analysis_mode(void);
+#else
+static inline bool mtd_check_expert_analysis_mode(void) { return false; }
+#endif
+
 
 #endif /* __MTD_MTD_H__ */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
