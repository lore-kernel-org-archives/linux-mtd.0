Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439F3C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:46:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03905610D1
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03905610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24hqd5qVM1S8GbtSDaCSjKea1Z4uhGItN4LuZ8UPJuw=; b=KWW6ojnBCLrdp4
	uaqbUoWFpBeJTaU3x3vHHDKb7DviUwe2MWJM5VYq4iYcKt2MX7CLUA9I02Lf4bn3yUHsazS2/ECwX
	d0Ri4lPhgrH94d8pjS++dQ4sV9D7EBiwVK7Ohp1+N5QSgw91ZWqWteS+xoPyxcxw0cqQfzE62OvNZ
	jS2iLkhOHsT8jZvkm3KmzFkpXvX7WV9reI/Nm80I4eNzolnDHaUw16JPH/9AawT2DLz6VYuovosjB
	B5S87r+Ts3qGEGtVEtTgNaZG9klc+XPaeE+JFCd4Z/oVQHuSMbAzQXmYD8+Jg9PTjVcUuJyl5T+xL
	XQOxp5SrkOfTZ0acaVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Eyu-009hYJ-Qv; Tue, 13 Jul 2021 09:45:36 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ExS-009h2T-Jh
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 09:44:08 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id DD736C65B6; Tue, 13 Jul 2021 10:44:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1626169443; bh=gPGf8BDFjmjAFRHqRrXs+zq2fUPrCMhwcadwucAE+7k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F2kFG3X8/O6c769zmFjzdoJTCl2jUL8+W7P1p87GRLqda+OHnQFPvbfa5mTNnx1j0
 NEIBV9SDXDoyR3XiyeTnSNkLdd6jt2yIpkSHGcn8+ZPOkelXIAfUqkm238lZyPc3Sz
 CiFlD6Ygx06EU69kfsEzj1pcUEEg/zz1NC2LYoV3x5sa1L6Iq9QjrMKt7cgGq+hzYQ
 B/Yk6z2zkL134ZXQX4tT3VPH5b9H1s/RDpHbhS1tJR+GJGnoza5XzYEujmEDTN7ioX
 +S8Nl5hTchWFrNMMO2t5Ms+lDxjqg340Ii+lACAk1mZ65gBoFdy8jZ4QBDN8eLe0Ir
 bOUHBB9uBXFIA==
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: rfd_ftl: fix use-after-free
Date: Tue, 13 Jul 2021 10:44:03 +0100
Message-Id: <29e817be984471dc2438a9414a9a7e1768d62950.1626169090.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626169090.git.sean@mess.org>
References: <cover.1626169090.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_024406_879273_374433E2 
X-CRM114-Status: GOOD (  11.69  )
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

del_mtd_blktrans_dev() will kfree part, so this is a use-after-free. Use
container_of() to make it clearer what the cast is doing.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/rfd_ftl.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 7f5f6d247cae..af20a0a71108 100644
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
@@ -800,10 +800,10 @@ static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 			part->mbd.mtd->name, i, part->blocks[i].erases);
 	}
 
-	del_mtd_blktrans_dev(dev);
 	vfree(part->sector_map);
 	kfree(part->header_cache);
 	kfree(part->blocks);
+	del_mtd_blktrans_dev(&part->mbd);
 }
 
 static struct mtd_blktrans_ops rfd_ftl_tr = {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
