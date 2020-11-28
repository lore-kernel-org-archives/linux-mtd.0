Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CEDC63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:17:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128A12467C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kddconqz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IF4S4kPs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128A12467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xnXbEvivtu5swJv3wW+qsIwS+RcvVYft8n4chaCPO6I=; b=kddconqz/9zx8YI3pQoF/yFCZ
	Hl9aq0yOWDpdCPkj9sHz8YjnoB9G/P+y/yWJCoIg3ksUvzPrrd/dOFisCnAuDie4YzV397OVDviYl
	KqdGhJF1sAQNOp9Tytqr5opyjS/l4PvPg4fr0MfRKJXMmNbpbqShM+qyj9Mm6cw02+2Ha6uvO7m93
	/BW6hpGBMbvk+1rc5GVYfzqBxHACG7HLgxb3ZbzfXnV0pZQmq9tCDGamV7pqap3HavzKmxB70HHI+
	IOm8n4v17wTFb+NyoOdA05JSqft59KSsMO0s6EG20OFrgIcLqh+kdzSRkGW2yHgw3ZqtKyrrDPnMC
	XWO89ROTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2ti-00018g-LR; Sat, 28 Nov 2020 16:16:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2si-0000m9-H5
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bNo1hf7PfDOKYspt1zBlnNXnA2O9e+2HajFAIfk9hrw=; b=IF4S4kPse/Khbpzm2iJYZOb5//
 AebOxo6dHKchkTnMRRirIcjeliUTt5bCFZUYwfEMlPQgswO+q8DQZlTf9KLLxiJKY0zUKP0bn304s
 BH0EqqzknDZovzUVwE34x04IYgUMie3qdBceYJVlsVESyvYsavEFm1+gqFxk1/Wtkj6kCUanwVb0s
 0Y+/ww4K6X/nAZoT2DCBnQknB+03pcnzjwI1Bo8oWetLBcbcaf9hoB9WrPRNq3KwE+bjB45lnbnWe
 waBhlw4cyWzbD/pd+co9cxBUHAVmNKdRusCQfcLw1siS3uzbB90vaHbUO9ccGU5oNO+E2kNCgJFiV
 xfOF4eAA==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sf-0000E1-TK; Sat, 28 Nov 2020 16:15:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/45] dm: remove the block_device reference in struct
 mapped_device
Date: Sat, 28 Nov 2020 17:14:34 +0100
Message-Id: <20201128161510.347752-10-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
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
 Hannes Reinecke <hare@suse.de>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Get rid of the long-lasting struct block_device reference in
struct mapped_device.  The only remaining user is the freeze code,
where we can trivially look up the block device at freeze time
and release the reference at thaw time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-core.h |  2 --
 drivers/md/dm.c      | 25 ++++++++++++++-----------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index aace147effcacb..086d293c2b036c 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -102,8 +102,6 @@ struct mapped_device {
 	/* kobject and completion */
 	struct dm_kobject_holder kobj_holder;
 
-	struct block_device *bdev;
-
 	struct dm_stats stats;
 
 	/* for blk-mq request-based DM support */
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ab0a8335f098d9..48051db006f30c 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1744,11 +1744,6 @@ static void cleanup_mapped_device(struct mapped_device *md)
 
 	cleanup_srcu_struct(&md->io_barrier);
 
-	if (md->bdev) {
-		bdput(md->bdev);
-		md->bdev = NULL;
-	}
-
 	mutex_destroy(&md->suspend_lock);
 	mutex_destroy(&md->type_lock);
 	mutex_destroy(&md->table_devices_lock);
@@ -1840,10 +1835,6 @@ static struct mapped_device *alloc_dev(int minor)
 	if (!md->wq)
 		goto bad;
 
-	md->bdev = bdget_disk(md->disk, 0);
-	if (!md->bdev)
-		goto bad;
-
 	dm_stats_init(&md->stats);
 
 	/* Populate the mapping, nobody knows we exist yet */
@@ -2384,11 +2375,16 @@ struct dm_table *dm_swap_table(struct mapped_device *md, struct dm_table *table)
  */
 static int lock_fs(struct mapped_device *md)
 {
+	struct block_device *bdev;
 	int r;
 
 	WARN_ON(test_bit(DMF_FROZEN, &md->flags));
 
-	r = freeze_bdev(md->bdev);
+	bdev = bdget_disk(md->disk, 0);
+	if (!bdev)
+		return -ENOMEM;
+	r = freeze_bdev(bdev);
+	bdput(bdev);
 	if (!r)
 		set_bit(DMF_FROZEN, &md->flags);
 	return r;
@@ -2396,9 +2392,16 @@ static int lock_fs(struct mapped_device *md)
 
 static void unlock_fs(struct mapped_device *md)
 {
+	struct block_device *bdev;
+
 	if (!test_bit(DMF_FROZEN, &md->flags))
 		return;
-	thaw_bdev(md->bdev);
+
+	bdev = bdget_disk(md->disk, 0);
+	if (!bdev)
+		return;
+	thaw_bdev(bdev);
+	bdput(bdev);
 	clear_bit(DMF_FROZEN, &md->flags);
 }
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
