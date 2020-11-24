Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74416C825AA
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF395206F9
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DSyBKlox";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gSBkuGb0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF395206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vc9Ui0INoJLIMf1t0LVYG84JXcOondM1F+W7MQ1o6cc=; b=DSyBKloxXK4zvaIT/mzsv3/V3
	IH+XTfWgRc8YmdyxM5wmAIc3rUNPBOOAJZY8ZUNIOPQdlVeityBz/ZJrX9CS2o2BWEZM2b0WcaiaS
	XJ4GAkkFuGNkXPfdDP36L2cGf40GBoWG+ToAJLDdPugmvgvag/QpK69r29ofr8ku704Fb9CYBjU25
	UwGVJFGKJ8R49HcBkOEsap0smoNpPWk9u7RCjeRaqapO9J5kFs6Cy1dIHN0hAS/CKctbo8FLwYPig
	Y5EHxJbvyQlFF4JFDBMMp6JE/QIWsLiF1KL7ZQtF7x47fQIGOuuZm9euLOnRnOYc8WmbJhgzNSuP2
	E3RJI2KRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMw-0008B5-Qi; Tue, 24 Nov 2020 13:28:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMY-00082c-64
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=q5VEN3b+/NuaC3nLa7Ob8T2zF/1/3On5f5TLNt/sEKk=; b=gSBkuGb01pZYejE/qt8U+f1Prp
 H6UFF5H/7Q8DKAajhbcAG/TWkWqcbJP6bF/2kpoG1MhuVrgkQKne/Is825NwtMjoMkmVuk6QyOhw4
 6d32g0XCyz8crp9IhQ8kuRwKQHuh2i/recIYUgVpmwkRUq3tDkXkobmCdXxgw2dGWnUTzWgrewmho
 SphjpGruHOWqUH4vavWTPhddkaX2Ct2GTq94foULjN6riyh6UEzcq/lFdKB/Bgo2FSx5SzSq74gko
 EnRhAkBQn/CQvobi3r+bM87y3KzNaOsLt6QALXtIHOxRJ1xW5O4DJquFcSCvJ8LYd4MwXPv9+3hgu
 zAxlftXQ==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMW-0006V1-Oc; Tue, 24 Nov 2020 13:28:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/45] zram: do not call set_blocksize
Date: Tue, 24 Nov 2020 14:27:13 +0100
Message-Id: <20201124132751.3747337-8-hch@lst.de>
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

set_blocksize is used by file systems to use their preferred buffer cache
block size.  Block drivers should not set it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/zram/zram_drv.c | 11 +----------
 drivers/block/zram/zram_drv.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 2e6d75ec1afddb..88baa6158eaee1 100644
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
