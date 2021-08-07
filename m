Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF56C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9D960F14
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC9D960F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2BCGw3NzbY0DQLPeufgnWBQzTwnViVgseboRM6NMnE=; b=Sw+PsqBWejkL+D
	ipya98jk3hH759owDtdwVIE7z2+hmFY6MrbhyjZVtGS06V4UxpRiuqV4TzTHdy3tCfgJK3H6dIpcO
	QdWLKcleqEt8QeEo2BTyu2jlpUAJrYZskG8Y3aKfz3MH3f+IF0ue+qS6G4Dy05okyFdoR32TKAwqG
	ueMvcVuuQmm96iK5VGBbrGaecxCFC5Tbn3rX95qhBZ9IjfXTUQqb/vhCFIqudC1m7XZyjwtgplBwU
	zAqhalrz+B5Al+UpHmU9x9U/t5IOlNL93wuW2h3nWcNB2YFCzNWFsSBlW+JHs8ifqKiVswnd23BPt
	GpSPakQLuF+IakAEgXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCU9X-00FBc1-3q; Sat, 07 Aug 2021 21:46:47 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCU8V-00FBLb-3N
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 21:45:45 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 98E63C6AA3; Sat,  7 Aug 2021 22:45:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628372739; bh=FaECp3RehvPziDHXKwo3DyfoUxDIlQS/YT4M2ULwY2o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rspCPUmGPNEt3iD5OtDi4G0u7JGq/2Stfck+PJ4fXpzb2+psox1lAeYLUVgcRjxlo
 GngTziiwua9F58eYSfEq3Gx0xFW9IzBif+Pr1SAYhbslHneuMjQNcQPvcRTLkmIn+n
 QUVn5gU2w+r3LcYrlhH9DhUGO8+NGG47Tb33YVHfSVHLrim7DJneyLItJUTFIymPyO
 IDQGF0ileuAGeZ3ydDMrJ2zh2DBLp4KLI5kcPqXNxRQcM1JgTZZEIPbqlvHH6whL/U
 3ESDOxKtDGYJDYV813A4RosVdP87n/E7DgPzDvylYmMGnnrrVzjHQOTWDTALPXJAlR
 M153sUBVfObqA==
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 5/5] mtd: rfd_ftl: use container_of() rather than cast
Date: Sat,  7 Aug 2021 22:45:38 +0100
Message-Id: <20210807214538.14484-6-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210807214538.14484-1-sean@mess.org>
References: <20210807214538.14484-1-sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_144543_319772_D73951D7 
X-CRM114-Status: GOOD (  10.00  )
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

The container_of() is much more readable and also safer.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/rfd_ftl.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 52be9f1fa9a2..af20a0a71108 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -239,7 +239,7 @@ static int scan_header(struct partition *part)
 
 static int rfd_ftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	u_long addr;
 	size_t retlen;
 	int rc;
@@ -600,7 +600,7 @@ static int find_free_sector(const struct partition *part, const struct block *bl
 
 static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf, ulong *old_addr)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	struct block *block;
 	u_long addr;
 	int i;
@@ -666,7 +666,7 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 
 static int rfd_ftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	u_long old_addr;
 	int i;
 	int rc = 0;
@@ -708,7 +708,7 @@ static int rfd_ftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *
 static int rfd_ftl_discardsect(struct mtd_blktrans_dev *dev,
 			       unsigned long sector, unsigned int nr_sects)
 {
-	struct partition *part = (struct partition *)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	u_long addr;
 	int rc;
 
@@ -735,7 +735,7 @@ static int rfd_ftl_discardsect(struct mtd_blktrans_dev *dev,
 
 static int rfd_ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 
 	geo->heads = 1;
 	geo->sectors = SECTORS_PER_TRACK;
@@ -792,7 +792,7 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 {
-	struct partition *part = (struct partition*)dev;
+	struct partition *part = container_of(dev, struct partition, mbd);
 	int i;
 
 	for (i=0; i<part->total_blocks; i++) {
@@ -803,7 +803,7 @@ static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 	vfree(part->sector_map);
 	kfree(part->header_cache);
 	kfree(part->blocks);
-	del_mtd_blktrans_dev(dev);
+	del_mtd_blktrans_dev(&part->mbd);
 }
 
 static struct mtd_blktrans_ops rfd_ftl_tr = {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
