Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89747C63777
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:34:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1573246CA
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:34:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M8tJZSiZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IDwA6p9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1573246CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rJHSS00c/aU9TdvZ/bUHP5tMW7sOAk3SnI4QjnVD7iQ=; b=M8tJZSiZDU3An/l3vR7j6WYO4
	9LCVjpaf6FSoSjIsEifaYpEm30hg9lpk95mYx7eD5F6kGVOSq0iL6QjsS2FbqyUfEtzV2fIbXj3qL
	BRZYeyFoInOQBzZXT8+de1X01yb3j5zM/e3niVUS14VBsCxPZtuojiXl44759oUvtc1wG40mdC5RS
	djkI8ZKWs1auM6YGKkgNrv70GyJoRFShwZaY1fJUi42Ac5YwQfklzWn5NnOEvuwpxNCY7VGE60xGQ
	RnM5udyWKbh4m27R80GJwypITWZhd/ZHGKGMUxB2gFOYTGw/q8vk6LMUTZCWCA5joi6ZKbDig17L5
	60ccYDKMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj3AS-0001uJ-Q8; Sat, 28 Nov 2020 16:33:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj3AR-0001tf-7F
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=VyfohpMJJf6/tds88ua6YS72KF9FS+Hs1ZQ7QStrR3Y=; b=IDwA6p9bZuaf7fipocqaiu3Hk4
 LwXYpP3EoHe2rRWbxDhQy4QH9jZLqJvqjCREkvHMDveRtVqVSTFqX9VO1GtGBwFOyDnLP9WGvlXjv
 aS6zqv3VeaiqoFfB7zyP/X5oSmC4fUl73a8Pnfugsk+PJlLhZVAO9C/Qw8sF5hVnsdW4Z7tuGFZWR
 FdVWPdz9dkgREhnVP2/Cv1UX6Kycst1grHDz8SsuRShjzMMA/TYvl6M/PQTwa+WBSebR0BA8CxHZ3
 l9EcZo0H537CiL5gxiZOA2TqySJLzkaDfEhf8BT1oqO/UxGwEJlB8E6Kys4smGWGxpqR2nP6ZkHjg
 w+7LzHEQ==;
Received: from 089144198196.atnat0007.highway.a1.net ([89.144.198.196]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj3AP-0001cK-DH; Sat, 28 Nov 2020 16:33:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 41/45] block: pass a block_device to invalidate_partition
Date: Sat, 28 Nov 2020 17:15:06 +0100
Message-Id: <20201128161510.347752-42-hch@lst.de>
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
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pass the block_device actually needed instead of looking it up using
bdget_disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 block/genhd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 835393b7101ace..28ced566c07bb7 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -795,14 +795,8 @@ void device_add_disk_no_queue_reg(struct device *parent, struct gendisk *disk)
 }
 EXPORT_SYMBOL(device_add_disk_no_queue_reg);
 
-static void invalidate_partition(struct gendisk *disk, int partno)
+static void invalidate_partition(struct block_device *bdev)
 {
-	struct block_device *bdev;
-
-	bdev = bdget_disk(disk, partno);
-	if (!bdev)
-		return;
-
 	fsync_bdev(bdev);
 	__invalidate_device(bdev, true);
 
@@ -811,7 +805,6 @@ static void invalidate_partition(struct gendisk *disk, int partno)
 	 * up any more even if openers still hold references to it.
 	 */
 	remove_inode_hash(bdev->bd_inode);
-	bdput(bdev);
 }
 
 /**
@@ -856,12 +849,12 @@ void del_gendisk(struct gendisk *disk)
 	disk_part_iter_init(&piter, disk,
 			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
 	while ((part = disk_part_iter_next(&piter))) {
-		invalidate_partition(disk, part->bdev->bd_partno);
+		invalidate_partition(part->bdev);
 		delete_partition(part);
 	}
 	disk_part_iter_exit(&piter);
 
-	invalidate_partition(disk, 0);
+	invalidate_partition(disk->part0);
 	set_capacity(disk, 0);
 	disk->flags &= ~GENHD_FL_UP;
 	up_write(&bdev_lookup_sem);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
