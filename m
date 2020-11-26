Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2657FC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E6C621D46
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wLTbGeU2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f/NqtmWw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E6C621D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rC63+kDpDGGE+s39g9GkJR12K4CopmYG1Xt1OzeVWOU=; b=wLTbGeU2EZ1shvAxRkW05vUkd
	bEymJrKoeFAICK9rM374YfV2dLb2NJGN4ulOructD2qtmx4j0FqHY7wMKZUsLdEArtMaSa2ztUDdg
	rCCSm677BVZU0rZu3laISnNkCj69C7l0P8hPQ+UOniZ72fAWCbgLpd1iWx1TORqQbn3vuelrFXBYa
	nnE7qc/bk7MwLSR8gPB8GjqR+IrbEHnyblj5P7jFHQ+NkiJVz6kaTkvkKGiVYcP25xGPRIFe8CSaX
	nQ025dJODIKNmtV0QWt/4nKWjWIFdjrlA20vQAmdxbGPjQtDm1BywXHI0b9XaL4P/PRM9fx2Hk/+u
	Ozk01gAKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiGzo-0008K5-F6; Thu, 26 Nov 2020 13:07:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGyx-000810-Ok
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aX/8uJuUHGL/5OzvkMliljHbjWPWg1zNhllSpoE70RI=; b=f/NqtmWwXz+in+xDMmB5RLjv8a
 cVt4qBnc4YL+TtpGupRWfcpXZ/6CMSupd9Lm6rDcG1f45gWluVGZPaAXmikFmFovKMbyRSkP3ZBT+
 hc6sbcvaUgr/SQB4V48gh+284LgxPRXzht7xX5qdbG0JHflMTnkExFap8GLHZ+7al6WBvVO+ZIGXU
 yuV9QZKfTfoVvNAS/JM0osWswLlacLPKcjLjBgIVxwI8KvhfrAKHYZ9mvupyLktTioMa2ASs/VYxH
 bMQUA75QBjhD4AyShZxBO5EeAFqyZ7Z5prC6cKkcC7lpED8A7ZOTzw8QU7NMhM4j/01Ns3IuFxx42
 Fx9txkcg==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGyw-0003xL-Ej; Thu, 26 Nov 2020 13:06:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/44] zram: do not call set_blocksize
Date: Thu, 26 Nov 2020 14:03:44 +0100
Message-Id: <20201126130422.92945-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126130422.92945-1-hch@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
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
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

set_blocksize is used by file systems to use their preferred buffer cache
block size.  Block drivers should not set it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>
---
 drivers/block/zram/zram_drv.c | 11 +----------
 drivers/block/zram/zram_drv.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 6d15d51cee2b7e..b5f68951c9d280 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -403,13 +403,10 @@ static void reset_bdev(struct zram *zram)
 		return;
 
 	bdev = zram->bdev;
-	if (zram->old_block_size)
-		set_blocksize(bdev, zram->old_block_size);
 	blkdev_put(bdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL);
 	/* hope filp_close flush all of IO */
 	filp_close(zram->backing_dev, NULL);
 	zram->backing_dev = NULL;
-	zram->old_block_size = 0;
 	zram->bdev = NULL;
 	zram->disk->fops = &zram_devops;
 	kvfree(zram->bitmap);
@@ -454,7 +451,7 @@ static ssize_t backing_dev_store(struct device *dev,
 	struct file *backing_dev = NULL;
 	struct inode *inode;
 	struct address_space *mapping;
-	unsigned int bitmap_sz, old_block_size = 0;
+	unsigned int bitmap_sz;
 	unsigned long nr_pages, *bitmap = NULL;
 	struct block_device *bdev = NULL;
 	int err;
@@ -509,14 +506,8 @@ static ssize_t backing_dev_store(struct device *dev,
 		goto out;
 	}
 
-	old_block_size = block_size(bdev);
-	err = set_blocksize(bdev, PAGE_SIZE);
-	if (err)
-		goto out;
-
 	reset_bdev(zram);
 
-	zram->old_block_size = old_block_size;
 	zram->bdev = bdev;
 	zram->backing_dev = backing_dev;
 	zram->bitmap = bitmap;
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index f2fd46daa76045..712354a4207c77 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -118,7 +118,6 @@ struct zram {
 	bool wb_limit_enable;
 	u64 bd_wb_limit;
 	struct block_device *bdev;
-	unsigned int old_block_size;
 	unsigned long *bitmap;
 	unsigned long nr_pages;
 #endif
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
