Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0DCC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:12:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E3821D7E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VJx6atGa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pD29czXU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E3821D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=owcmsaFbnZWDz3hDHBBjq+aR0vE4XzsscChrsUrSttw=; b=VJx6atGaDcFaJ4vmg+tR2nApe
	pGDCXjkEmuNqlvZu1x5FlBM78mzxxWc7t6vgq9P0zmcig/wq4ylIE7suz50e/9CJ6twPfFNgY8Gqf
	StfqxfD+71jhYJqsno7DCtxX4wZ240LAAF3br0nxsZGphwwkm/eb0jxmQeF3uQxa5kZAlboMSmXs8
	ZB1b+M5/otn8ZfwXpBUx0+6oPdPm0f/hi9pSMUUL+xSxNs8nYngNJsk7YrZui0ClwF88deTuA9QhA
	PnQ6hTRs59wLRLc9oNu7gqVqDQnj7X98JxOjhLHhjeF17s049WOhLKFj/Yd6RXSspAV0r4lAhw06P
	2gJCJxfYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH44-0000Ki-W1; Thu, 26 Nov 2020 13:12:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzF-00085I-H6
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Bme5TLsLFPob464lUA3WbC3cRcGjsnB3bNEoo7Ro4xo=; b=pD29czXUGx7/JOI4aMyEeWQSMv
 N1pSrnLkpYZ1vq8lC0yj+QgDREYrZk8VsWtw25yH+LOOzsfPs12mfVambko3CQU5GmLhQd+ADpITR
 NimIO8kPlWXa1Ia40xiB690MR+b5inhHr9jscb7BELxpkGdihO6KSv4PW4H+bkyq/lvvorRsTObAn
 Z9+1XFVjPvzDzKPe4mnNvFUtdTeoIJI+do7cSsBSktZYaHDBuk98oBX5ks+o27ANd3JuHjqbQ/zPV
 JT3vxOZ0JJZMxIPsjC2wmWnt/UCdnXQTIIFNjhYzNw52BemG06yiDmkrywPn4RYaymOzpQ9HDY4rz
 q2zpyhig==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzE-00041Y-0x; Thu, 26 Nov 2020 13:07:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 19/44] block: refactor __blkdev_put
Date: Thu, 26 Nov 2020 14:03:57 +0100
Message-Id: <20201126130422.92945-20-hch@lst.de>
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

Reorder the code to have one big section for the last close, and to use
bdev_is_partition.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Tejun Heo <tj@kernel.org>
---
 fs/block_dev.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index d707ab376da86e..41c50cfba864e2 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1738,22 +1738,22 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 		WARN_ON_ONCE(bdev->bd_holders);
 		sync_blockdev(bdev);
 		kill_bdev(bdev);
-
 		bdev_write_inode(bdev);
-	}
-	if (bdev->bd_contains == bdev) {
-		if (disk->fops->release)
+
+		if (!bdev_is_partition(bdev) && disk->fops->release)
 			disk->fops->release(disk, mode);
-	}
-	if (!bdev->bd_openers) {
+
 		disk_put_part(bdev->bd_part);
 		bdev->bd_part = NULL;
 		bdev->bd_disk = NULL;
-		if (bdev != bdev->bd_contains)
+		if (bdev_is_partition(bdev))
 			victim = bdev->bd_contains;
 		bdev->bd_contains = NULL;
 
 		put_disk_and_module(disk);
+	} else {
+		if (!bdev_is_partition(bdev) && disk->fops->release)
+			disk->fops->release(disk, mode);
 	}
 	mutex_unlock(&bdev->bd_mutex);
 	bdput(bdev);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
