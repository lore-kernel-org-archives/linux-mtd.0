Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29577C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 11:47:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D5261AFB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 11:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3D5261AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X6yyGNh3zMkf9Kz9tCENPQl7fs/6kZ2OJakmiKzZ4Yg=; b=MnyB+1LWJYKynx
	cSW8oWO771YfdUC22qi86hsVsqpE35rreMTKgW0rfZv60hOd/TIQfZCXNDByROrGnBwmUK+ZAFJ6p
	legLWgvCy3Ig5IaouqmccO9hJ9HvdzrXOp2x5oiai+WwxqGornd6l+TgrRPc3PO/AWqPnlXbNOAxW
	3vmgZljeY77gbEqZRFFT2p4wCH+uxR/zTTCU5ak5XNGBJWd8I6dcOiKzAcP5qaQvTOoP5L8XGO0cR
	kZSTTw5M8+tV6vhTVYhldFRg+n0pIF9fkgmXbQca9MLL+WL8VKNgUH+WcFr8mlLJqUrgWxgpSt0Ed
	qh+PeOaOFdZpBqCH7H7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfsi-007duk-AK; Thu, 18 Nov 2021 11:47:08 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfsf-007dtv-8d
 for linux-mtd@lists.infradead.org; Thu, 18 Nov 2021 11:47:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 03CCDE0009;
 Thu, 18 Nov 2021 11:46:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: Introduce an expert mode for forensics and debugging
 purposes
Date: Thu, 18 Nov 2021 12:46:59 +0100
Message-Id: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_034705_603201_E6FDF267 
X-CRM114-Status: GOOD (  12.88  )
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

When developping NAND controller drivers or when debugging filesystem
corruptions, it is quite common to need hacking locally into the
MTD/NAND core in order to get access to the content of the bad
blocks. Instead of having multiple implementations out there let's
provide a simple yet effective specific MTD-wide debugfs entry to fully
disable these checks on purpose.

A warning is added to inform the user when this mode gets enabled.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c            | 10 ++++++++++
 drivers/mtd/nand/core.c          |  3 +++
 drivers/mtd/nand/raw/nand_base.c |  3 +++
 drivers/mtd/nand/raw/nand_bbt.c  |  3 +++
 include/linux/mtd/mtd.h          |  3 +++
 5 files changed, 22 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9186268d361b..4d367d5c4021 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2365,6 +2365,14 @@ static struct backing_dev_info * __init mtd_bdi_init(const char *name)
 	return ret ? ERR_PTR(ret) : bdi;
 }
 
+char *mtd_expert_analysis_warning =
+	"Bad block checks have been entirely disabled.\n"
+	"This is only reserved for post-mortem forensics and debug purposes.\n"
+	"Never enable this mode if you do not know what you are doing!\n";
+EXPORT_SYMBOL_GPL(mtd_expert_analysis_warning);
+bool mtd_expert_analysis_mode;
+EXPORT_SYMBOL_GPL(mtd_expert_analysis_mode);
+
 static struct proc_dir_entry *proc_mtd;
 
 static int __init init_mtd(void)
@@ -2388,6 +2396,8 @@ static int __init init_mtd(void)
 		goto out_procfs;
 
 	dfs_dir_mtd = debugfs_create_dir("mtd", NULL);
+	debugfs_create_bool("expert_analysis_mode", 0600, dfs_dir_mtd,
+			    &mtd_expert_analysis_mode);
 
 	return 0;
 
diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 5e13a03d2b32..33c7788d76c2 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -21,6 +21,9 @@
  */
 bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos)
 {
+	if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
+		return 0;
+
 	if (nanddev_bbt_is_initialized(nand)) {
 		unsigned int entry;
 		int status;
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..b3a9bc08b4bb 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -321,6 +321,9 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 	if (nand_region_is_secured(chip, ofs, mtd->erasesize))
 		return -EIO;
 
+	if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
+		return 0;
+
 	if (chip->legacy.block_bad)
 		return chip->legacy.block_bad(chip, ofs);
 
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b7ad030225f8..ab630af3a309 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1455,6 +1455,9 @@ int nand_isbad_bbt(struct nand_chip *this, loff_t offs, int allowbbt)
 	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
 
+	if (WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning))
+		return 0;
+
 	switch (res) {
 	case BBT_BLOCK_GOOD:
 		return 0;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f5e7dfc2e4e9..1ffa933121f6 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -711,4 +711,7 @@ static inline int mtd_is_bitflip_or_eccerr(int err) {
 
 unsigned mtd_mmap_capabilities(struct mtd_info *mtd);
 
+extern char *mtd_expert_analysis_warning;
+extern bool mtd_expert_analysis_mode;
+
 #endif /* __MTD_MTD_H__ */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
