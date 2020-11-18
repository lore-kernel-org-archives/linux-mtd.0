Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A84C63777
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:49:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CDE720719
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GvIMTiFq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YtHXD8P3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CDE720719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oqWnJ7MFH0tsbjpJ/AbdTQPiRP7N5iRHO0ACI1sq2xw=; b=GvIMTiFqZlm6kFysLRN1rqjGb
	Ri9tTppSQxh0Ch5HMdsmSJ6+Pszn2GhIvzCuyLCXOQpJ5MTeNoCzQq5Hvmuuz5RTAiXW0MyPRY45P
	4xM9lbdExEKZUZJdHAwczsnyU55pSU3x2nbfbPX2+A9WN8+ympWCUn4efhSoKk3KtsRFETXDsbns3
	zGAtAcb4s+Qsa4dyE1hNMswn5YtVSvRtllAC6yenmwNYUFW6ZVacGGNCDrYv4FyVGmkegSt1xJ+Sx
	Ab1+kpxZrKfYXp5lcJ8t0XkPwjaZMWzG8M0SyHykrI/DFonZibE1w0t8SAnqHpZbKb43kAIMhHoR6
	VKb0g2tyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8r-00089C-SS; Wed, 18 Nov 2020 08:48:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8Q-0007z9-K7
 for linux-mtd@merlin.infradead.org; Wed, 18 Nov 2020 08:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AuzCwkw90Oy6IPNhoiC+qBglSTsZM+HyoDoCPgOfof0=; b=YtHXD8P3bl/ZEagDvWBMs7HUMz
 zdBwVpVtkLRztaIitYOD+jnHVbFQ6nJ8vuy+RLNNTKM13Op/plycZzjy+O4m3LWRxyGds3Zqm8uXL
 0XuTVrpZcPUDGwu7KtN8TqRfLjbMNJ84KtyxsgxJmnWMTEPOjVTiAMZb5/WgHNDE+x7H3rKLRuDmH
 S0COUGr4VfDChivd1zEu5OgZhhAocAq3rfUghhZiWVdd7wm1RQ+tppv9VJnogHVF5m81oV1c+2vot
 cs+KiVe+jSmoJYHNAdtCaO4J/3LKZi6FdgQumaduslpItNE93jCeXFM/TwIDIwiBiRp2E9vOvb5No
 1S1bNtVg==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8O-0007lA-RG; Wed, 18 Nov 2020 08:48:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/20] block: change the hash used for looking up block devices
Date: Wed, 18 Nov 2020 09:47:46 +0100
Message-Id: <20201118084800.2339180-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-bcache@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding the minor to the major creates tons of pointless conflicts. Just
use the dev_t itself, which is 32-bits and thus is guaranteed to fit
into ino_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index d8664f5c1ff669..29db12c3bb501c 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -870,35 +870,12 @@ void __init bdev_cache_init(void)
 	blockdev_superblock = bd_mnt->mnt_sb;   /* For writeback */
 }
 
-/*
- * Most likely _very_ bad one - but then it's hardly critical for small
- * /dev and can be fixed when somebody will need really large one.
- * Keep in mind that it will be fed through icache hash function too.
- */
-static inline unsigned long hash(dev_t dev)
-{
-	return MAJOR(dev)+MINOR(dev);
-}
-
-static int bdev_test(struct inode *inode, void *data)
-{
-	return BDEV_I(inode)->bdev.bd_dev == *(dev_t *)data;
-}
-
-static int bdev_set(struct inode *inode, void *data)
-{
-	BDEV_I(inode)->bdev.bd_dev = *(dev_t *)data;
-	return 0;
-}
-
 static struct block_device *bdget(dev_t dev)
 {
 	struct block_device *bdev;
 	struct inode *inode;
 
-	inode = iget5_locked(blockdev_superblock, hash(dev),
-			bdev_test, bdev_set, &dev);
-
+	inode = iget_locked(blockdev_superblock, dev);
 	if (!inode)
 		return NULL;
 
@@ -910,6 +887,7 @@ static struct block_device *bdget(dev_t dev)
 		bdev->bd_super = NULL;
 		bdev->bd_inode = inode;
 		bdev->bd_part_count = 0;
+		bdev->bd_dev = dev;
 		inode->i_mode = S_IFBLK;
 		inode->i_rdev = dev;
 		inode->i_bdev = bdev;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
