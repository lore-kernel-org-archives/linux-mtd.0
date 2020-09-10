Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD47C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F35E2145D
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xc+HhUFj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qnDaccOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F35E2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ILRkPN0yzdpfUt3FK8n3qG7Zw8iU+vjw5HEro42jHD0=; b=xc+HhUFjvxHbtq9nIR0rKhwyf
	p7vU0DpDiQFeU5748U94216E9a/zFwCfXU/CCMr9IS3buGlEfYwQbIsPU1dL9BBvRAGrj8X1pUYgr
	9xZZ6z+czQ0hjNv2heRwMdlUuMIm+g30XRIOcgy3ufKv4oOLCIkQ1iax1DLhLF/pADqeblvQmSV1E
	3cyNJssqjes5YrxIp0hWzPWSFyDvwTMSmQ6m2c0X/WGef0rxjiA+vubZwjJWxZhdewBa/a5VZZXEw
	Wm4iV6JOqfLIxmADYepnVfke5dmnX1F8ctHSlCLG+Ijp3pijWRSsLE5XysYypAQhesV5yWB1wr6Z1
	Fg+Dfy88g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGNsc-00038l-4A; Thu, 10 Sep 2020 14:48:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsR-00035Y-VK
 for linux-mtd@merlin.infradead.org; Thu, 10 Sep 2020 14:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GZc+J6ND1n6cPOJZ32fVjVSmmANLqKUqlMZxw//aLlg=; b=qnDaccOtti1d5o5Y6nShuZ29+/
 T1Ze6yEfD9DDR0j8mvRqkHcfvi8jVk9iiENuPF5l6mq9EALMCwRnx0YWrH+BCDw5xvaSXd/zutHyS
 ummr6rSV/vSxtHBdvBMT0dt4/XPv8OA3fsWeGbbsfWXy4AWB/DVziFc1dBmgjGNQc35AjQEsVWTWE
 1RcWYz+K7Wg91DV54MLolzspjTdmLv4BC3KSbalV6W1GhBUNgCCFeWrQMO4L/BLcTlkDlJNzHxMB3
 F+ZpqAcrsbvI7+1rR1R1Ggajwj0w+WcQDQ9h2TQp2AHRGsKP93tZ6e2Gy7HD9I4173cyzA0na71aM
 0u32pGlQ==;
Received: from [2001:4bb8:184:af1:3ecc:ac5b:136f:434a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsQ-0006wO-JK; Thu, 10 Sep 2020 14:48:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/12] md: update the optimal I/O size on reshape
Date: Thu, 10 Sep 2020 16:48:25 +0200
Message-Id: <20200910144833.742260-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910144833.742260-1-hch@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The raid5 and raid10 drivers currently update the read-ahead size,
but not the optimal I/O size on reshape.  To prepare for deriving the
read-ahead size from the optimal I/O size make sure it is updated
as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/raid10.c | 22 ++++++++++++++--------
 drivers/md/raid5.c  | 10 ++++++++--
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index e8fa327339171c..9956a04ac13bd6 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3703,10 +3703,20 @@ static struct r10conf *setup_conf(struct mddev *mddev)
 	return ERR_PTR(err);
 }
 
+static void raid10_set_io_opt(struct r10conf *conf)
+{
+	int raid_disks = conf->geo.raid_disks;
+
+	if (!(conf->geo.raid_disks % conf->geo.near_copies))
+		raid_disks /= conf->geo.near_copies;
+	blk_queue_io_opt(conf->mddev->queue, (conf->mddev->chunk_sectors << 9) *
+			 raid_disks);
+}
+
 static int raid10_run(struct mddev *mddev)
 {
 	struct r10conf *conf;
-	int i, disk_idx, chunk_size;
+	int i, disk_idx;
 	struct raid10_info *disk;
 	struct md_rdev *rdev;
 	sector_t size;
@@ -3742,18 +3752,13 @@ static int raid10_run(struct mddev *mddev)
 	mddev->thread = conf->thread;
 	conf->thread = NULL;
 
-	chunk_size = mddev->chunk_sectors << 9;
 	if (mddev->queue) {
 		blk_queue_max_discard_sectors(mddev->queue,
 					      mddev->chunk_sectors);
 		blk_queue_max_write_same_sectors(mddev->queue, 0);
 		blk_queue_max_write_zeroes_sectors(mddev->queue, 0);
-		blk_queue_io_min(mddev->queue, chunk_size);
-		if (conf->geo.raid_disks % conf->geo.near_copies)
-			blk_queue_io_opt(mddev->queue, chunk_size * conf->geo.raid_disks);
-		else
-			blk_queue_io_opt(mddev->queue, chunk_size *
-					 (conf->geo.raid_disks / conf->geo.near_copies));
+		blk_queue_io_min(mddev->queue, mddev->chunk_sectors << 9);
+		raid10_set_io_opt(conf);
 	}
 
 	rdev_for_each(rdev, mddev) {
@@ -4727,6 +4732,7 @@ static void end_reshape(struct r10conf *conf)
 		stripe /= conf->geo.near_copies;
 		if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
 			conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+		raid10_set_io_opt(conf);
 	}
 	conf->fullsync = 0;
 }
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 225380efd1e24f..9a7d1250894ef1 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7232,6 +7232,12 @@ static int only_parity(int raid_disk, int algo, int raid_disks, int max_degraded
 	return 0;
 }
 
+static void raid5_set_io_opt(struct r5conf *conf)
+{
+	blk_queue_io_opt(conf->mddev->queue, (conf->chunk_sectors << 9) *
+			 (conf->raid_disks - conf->max_degraded));
+}
+
 static int raid5_run(struct mddev *mddev)
 {
 	struct r5conf *conf;
@@ -7521,8 +7527,7 @@ static int raid5_run(struct mddev *mddev)
 
 		chunk_size = mddev->chunk_sectors << 9;
 		blk_queue_io_min(mddev->queue, chunk_size);
-		blk_queue_io_opt(mddev->queue, chunk_size *
-				 (conf->raid_disks - conf->max_degraded));
+		raid5_set_io_opt(conf);
 		mddev->queue->limits.raid_partial_stripes_expensive = 1;
 		/*
 		 * We can only discard a whole stripe. It doesn't make sense to
@@ -8115,6 +8120,7 @@ static void end_reshape(struct r5conf *conf)
 						   / PAGE_SIZE);
 			if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
 				conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+			raid5_set_io_opt(conf);
 		}
 	}
 }
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
