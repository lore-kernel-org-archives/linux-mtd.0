Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17E5C63777
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 15:57:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A926D206F7
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 15:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x5xlCK7I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jo7jitVZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A926D206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NIz3gE1Vr7WVuApi3Nlr6NfndFKyXeEsKa+qGw7mOcs=; b=x5xlCK7I6IQl7Hv/XFXWCg7dc
	a5s3RUWWjk8JNbqWanwQEKsdsNs6ndprb/95aZUxF/AHsZiG3sqySG9Z7YDNSscbUWD3o5uJhAb95
	tu2YZdOngtWUCclLFAnTUVXDUlEDyLioRWjGPzmC4hn270VCOv1Tdt0fY1JXB0arFpF/RNbEH0A6e
	IRFWkgth1voK0j2hQYIVT5prKhLrkCEjoNm7QeBT22Hk+HyIKwY8gpJf+zSfEhb9tXCxa8tM2Mg5F
	e3nPNsFtx9MPagyjljoOyJmVo1rbfLRP9aTs4b/AlXmSDPyg8o1CdOy/J64vHU0QP+671wrOfdQoK
	2fpR8ZZxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYVE-00046C-03; Tue, 24 Nov 2020 13:37:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYNC-0008Ho-FE
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=s2bj0ka9tzVXa7iO1xuCgon+nWLgrfiF05EXz6Wq7iQ=; b=jo7jitVZLk7dE0nFi35W7LDPJN
 tFqdEul2zhhIuA5tOCbi5aycGTNvy8TrCwjvdqjWRV+CbsHXj1uHR9YGBIHpgX5k1OrWEEjG1OBGS
 05uqltCoKW08gYj1Exy9DRh4S20GKqktTwAhDBgXdpa6tr3gbKlx7crJ/yMgRgYb5bj1t1DPrZcGR
 /hwdibm8NOcUYLKg0vLiJpGjPeRHco2g+1GJeSTgoyu6wnqw78bcOPXI+iGIr/LCTqUZw/z9tv92S
 lld+DSHqPLq7Hfkngg8JscAjZbW0u/H0x3XHbCsyaVQZAi5fsRHdRkbzm4rSxa6gS65lVwxUXtiGV
 AvXj9emg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYN8-0006dt-TQ; Tue, 24 Nov 2020 13:28:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 29/45] block: initialize struct block_device in bdev_alloc
Date: Tue, 24 Nov 2020 14:27:35 +0100
Message-Id: <20201124132751.3747337-30-hch@lst.de>
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

Don't play tricks with slab constructors as bdev structures tends to not
get reused very much, and this makes the code a lot less error prone.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 43a0fda982c879..1e5c6d0eb92677 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -784,20 +784,11 @@ static void bdev_free_inode(struct inode *inode)
 	kmem_cache_free(bdev_cachep, BDEV_I(inode));
 }
 
-static void init_once(void *foo)
+static void init_once(void *data)
 {
-	struct bdev_inode *ei = (struct bdev_inode *) foo;
-	struct block_device *bdev = &ei->bdev;
+	struct bdev_inode *ei = data;
 
-	memset(bdev, 0, sizeof(*bdev));
-	mutex_init(&bdev->bd_mutex);
-#ifdef CONFIG_SYSFS
-	INIT_LIST_HEAD(&bdev->bd_holder_disks);
-#endif
-	bdev->bd_bdi = &noop_backing_dev_info;
 	inode_init_once(&ei->vfs_inode);
-	/* Initialize mutex for freeze. */
-	mutex_init(&bdev->bd_fsfreeze_mutex);
 }
 
 static void bdev_evict_inode(struct inode *inode)
@@ -872,12 +863,17 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	inode->i_data.a_ops = &def_blk_aops;
 
 	bdev = I_BDEV(inode);
+	memset(bdev, 0, sizeof(*bdev));
+	mutex_init(&bdev->bd_mutex);
+	mutex_init(&bdev->bd_fsfreeze_mutex);
 	spin_lock_init(&bdev->bd_size_lock);
 	bdev->bd_disk = disk;
 	bdev->bd_partno = partno;
-	bdev->bd_super = NULL;
 	bdev->bd_inode = inode;
-	bdev->bd_part_count = 0;
+	bdev->bd_bdi = &noop_backing_dev_info;
+#ifdef CONFIG_SYSFS
+	INIT_LIST_HEAD(&bdev->bd_holder_disks);
+#endif
 	return bdev;
 }
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
