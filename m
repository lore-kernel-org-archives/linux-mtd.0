Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EB2C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:14:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A16521D46
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LEoVW+h5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MQmIXKif"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A16521D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Gv9ElDQoZQmjY0UMNsOgRGkV4VrCbIK4kC//gRlSXs=; b=LEoVW+h5mwEK8YjskIiAQtw3R
	sgzS/R9ZefZgvz1OXVksyQnq09wIUOneXKdu7EbR4chDiT7kLV9seIsGjUT3Ubpu13asLjihtxH2V
	ycHRIVqFySB0t0672fuekB1PKogO+Vc0MeESEPnbWF47i1KH2mPKgA4MlByLkCxlz817u/FxvQ6D8
	nQZ4Mm1KGchgJ/b1LNgoqIOCkA2B3SMm08uKUx2Ov6jhxrV4f6SCovixin+NEkkcCC1UcKEQQdmi6
	gMHbMzJ6Wvj6P1gwl2+r9mbmQOV3IgfFNLPehuFjEpvA8n4/V6vYuLQS6LaSSZnFP/tUVOGI7JF9+
	3l+h5wJWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH5G-0000eU-NX; Thu, 26 Nov 2020 13:13:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzS-0008A0-AN
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tTzT8jq2JcyLxT+MVTv6IpSRH5wR3ADhzhpNBZQZp9A=; b=MQmIXKifz0KnTEIu7IEqIGZAjZ
 0XBYWs2SAQyChCu395vtRAVsj/re3eaOi/QBvDSAf9psqAsgo74Pf2LS6Q7WPQNJx15BMKG58tLW8
 QzhlOD99YeD8TVIb1aMUEXLQJuS5b2J7sNRDL+ufV2WeuvYwq7FGQqpBnmqXafhkhi5tiTEQlI9tR
 0uEQd6SVwBwBjGR7GunTUdnxjvZG/WOId3d3MmtCgRNuvTIhhSYlEsSrfumK/53T5+8lWuvjfou4O
 wjP6L9mQU2DFzSU0nfeVthDDJk1YF8HTgY1jQekup7mN3j1YDZ23KrrA7bXQlu9v0+4vZDe1ecvPJ
 S35gY1cA==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzQ-00044E-Kl; Thu, 26 Nov 2020 13:07:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 28/44] block: initialize struct block_device in bdev_alloc
Date: Thu, 26 Nov 2020 14:04:06 +0100
Message-Id: <20201126130422.92945-29-hch@lst.de>
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
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Don't play tricks with slab constructors as bdev structures tends to not
get reused very much, and this makes the code a lot less error prone.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Tejun Heo <tj@kernel.org>
---
 fs/block_dev.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index f180ac0e87844f..58e8532d8580a1 100644
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
@@ -873,12 +864,17 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	mapping_set_gfp_mask(&inode->i_data, GFP_USER);
 
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
