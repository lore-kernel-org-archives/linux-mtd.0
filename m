Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7D7C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 08:44:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A017610C8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 08:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A017610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUFDMi5EI+s/psrPGZEQQrD0RKHlefFIa6mMH4xvk/Y=; b=wY88G8aiOluEDF
	xHXCxA9+T3NxrJ4oB/HzvFns2CZ2DrP4hROtcay5wukJ4o9f9K3DXQQMW0tIgaXSGwM2rjv0DtPB8
	okLG9YIgvZyHdvLxXzhntoAQGVw0OaHfqKVl2TtO4YQw2P5s+1sRPc5ZYVbe+uj6W1DPcCbv8QDus
	LSCAuAzIJim13vVWtJ12XQHp4yS1IcmteVwpsBMoEnQcS9LMW/dliFNpYHmBP2odFyX8V7yNVOIp6
	43mUL1c3xp2DmeIET7cXve7EMiGKspVFbzooGoaXp7MM21yGe5dDGofADHwxPgMvBq3LBAhzfHupR
	8rLpAu5QjfP/5e3CUFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdTgF-006sfX-4P; Thu, 21 Oct 2021 08:44:07 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdTfx-006sZX-7T
 for linux-mtd@lists.infradead.org; Thu, 21 Oct 2021 08:43:50 +0000
Received: from BC-Mail-Ex03.internal.baidu.com (unknown [172.31.51.43])
 by Forcepoint Email with ESMTPS id 0FA979DB31A7193B259A;
 Thu, 21 Oct 2021 16:43:46 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex03.internal.baidu.com (172.31.51.43) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 21 Oct 2021 16:43:45 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 21 Oct 2021 16:43:45 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ubifs: Make use of the helper macro kthread_run()
Date: Thu, 21 Oct 2021 16:43:43 +0800
Message-ID: <20211021084344.2501-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex11.internal.baidu.com (172.31.51.51) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_014349_465419_2A4CE7BB 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Repalce kthread_create/wake_up_process() with kthread_run()
to simplify the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 fs/ubifs/super.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f0fb25727d96..0e7f206c43cf 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1367,7 +1367,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num, c->vi.vol_id);
 	if (!c->ro_mount) {
 		/* Create background thread */
-		c->bgt = kthread_create(ubifs_bg_thread, c, "%s", c->bgt_name);
+		c->bgt = kthread_run(ubifs_bg_thread, c, "%s", c->bgt_name);
 		if (IS_ERR(c->bgt)) {
 			err = PTR_ERR(c->bgt);
 			c->bgt = NULL;
@@ -1375,7 +1375,6 @@ static int mount_ubifs(struct ubifs_info *c)
 				  c->bgt_name, err);
 			goto out_wbufs;
 		}
-		wake_up_process(c->bgt);
 	}
 
 	err = ubifs_read_master(c);
@@ -1780,7 +1779,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		goto out;
 
 	/* Create background thread */
-	c->bgt = kthread_create(ubifs_bg_thread, c, "%s", c->bgt_name);
+	c->bgt = kthread_run(ubifs_bg_thread, c, "%s", c->bgt_name);
 	if (IS_ERR(c->bgt)) {
 		err = PTR_ERR(c->bgt);
 		c->bgt = NULL;
@@ -1788,7 +1787,6 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 			  c->bgt_name, err);
 		goto out;
 	}
-	wake_up_process(c->bgt);
 
 	c->orph_buf = vmalloc(c->leb_size);
 	if (!c->orph_buf) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
