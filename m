Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FAEC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:32:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3E0204EC
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BIMMQBv3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PBlG+SI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3E0204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MXWdXcJRZJ1UOUHwHp1pB1DNh4IJRx1n9jwPSmI1Pjw=; b=BIMMQBv3XR4UJcHUg6WjJig+W
	/zG28ZMpwtkF78ObCKPcSG3M/sP+8gMPeslotqupXQ625CO1cqlfsMbEZlOIMSxzgiqWsxNN/WPO7
	Kkzru5uQJN1SdF5amdGRBQj5XPEL2C7xA18Jl4LCIhmT6MP1YmZCYqMsmPAKRJC4tCe//5PfGV6ML
	Plw1bJhJ9Do/wLIi4tD42vVobYq4QoZbmwzObwrHrA/U5MYDvR5jLJlXX/2Gt1m/fmWHd8QqzqV56
	KGpwLtSXgXcGXFAf5HlrmCv66TTM4Z5T8+4P/zAAD4zs4nM0h6m0iz64Z0CeTADrI5dunNjezAeLD
	uOPq/36ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYPy-0001Ly-3A; Tue, 24 Nov 2020 13:31:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMm-00086Z-2R
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aYwkX4I6zMx34nzrdb7tYezzW5eC03Czg70BjD05yqI=; b=PBlG+SI1LP3b7gr/lJlKmKFFJd
 bocVKBuspYZb9+bd6oRwQGEd0L7j3hQYuLx9nBobabPLesfL8HLab1E4KCm/5+LC3aeewsBsrF0Ec
 hulcbyCIFfsfA8vcNobuzkqbXhMEwxxlSaiC+PbDLVpuj7Vfeb4n/Hc03FWeCTlPALu7BKMacg7VB
 VdoUIV8XfOoQvjg+7Lpil7jQgfh2pOibzDF+EEKPx14W4pVYNFzWxgoqa5dOjKsd+dX8NOcHTR0xd
 r+KlCQy9eeFmFLAe7pGrffUSOJRf0kI5rzxEXRSylWdG/EZ+5D3kd5agpzXpiDKm6I3+ieiU+g83C
 6CbAnNrA==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMk-0006Xd-Im; Tue, 24 Nov 2020 13:28:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 16/45] block: change the hash used for looking up block devices
Date: Tue, 24 Nov 2020 14:27:22 +0100
Message-Id: <20201124132751.3747337-17-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding the minor to the major creates tons of pointless conflicts. Just
use the dev_t itself, which is 32-bits and thus is guaranteed to fit
into ino_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/block_dev.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index f6a2a06ad262fa..437f67e12b2838 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -863,35 +863,12 @@ void __init bdev_cache_init(void)
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
 
@@ -903,6 +880,7 @@ static struct block_device *bdget(dev_t dev)
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
