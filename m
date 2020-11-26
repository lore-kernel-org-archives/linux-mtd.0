Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA07C63777
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:12:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D8621D46
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xo7M+F95";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JWcPR2Cz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D8621D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=STli9jI8kf95tCu+mYg87b9bG0ytOqXFr5aIT81bhGk=; b=Xo7M+F95o7JahcpMaMThTH5in
	36sby8tb4ale+PId7ayLbUahl5kObt8kk8jmZ6lRd6Ol/v/uAvjmQtjgi3j8osHWoBgMkI1MsYY+b
	35Lwih7nxGUxibCce+6Mpl+dQFaALRUiZYKyWCQeVx5FFQF1hNig9nDJl8v2WTySQ5QHCdvNvgdC4
	aPrIqemFXKjH28DpqysE/dJO6wck/HreLlbBE3XgbC0on/LirdP6j84+v5pwlHoVRzW5IsiL3S5Ra
	guu0XV+ZzSi6QrbF++i8V7szwU+uiP2N1C46JFw6A/RhZ0nmaUPfjS6vEYfhoSysM/4saLApt4dWn
	xOq0tHXSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH4B-0000MJ-D8; Thu, 26 Nov 2020 13:12:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzI-00085r-HY
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5gqSfUEPjcqcvSOENSbeIw4Q7nJzcUAFuskTYoCv0hA=; b=JWcPR2Czk6lpE+7kEj6vIMT2+/
 4nicpsqgBYNWPrgpWKio4K0jeCe98Uc0g0V9XvFN5/UOpUTdPX8bCSz599ECAiNsDa9IJUPuHehU9
 MwG78A+rwJdIl84DsbRHcZAsiL6DIfCCmgvr8NKINemzjL99+qQIjGMo2ugbnW7FuELEJ/QAJ7922
 aVEnYZjGfu+QFdUK0bXGpy16LW0SS4/NZuDX+KSRtGaN32GdP7RGL6vQfCLc/lGeMv41tUfghfTD2
 YLBhFsDW/u+tArfinK1HJR9C1dufWvDt7yaV8HXH5KfxNloQgg9nLcNaHylzqSwgSzK3/n/NPrBf6
 EnNEM4Ow==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzG-000424-OK; Thu, 26 Nov 2020 13:07:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 21/44] block: move bdput() to the callers of __blkdev_get
Date: Thu, 26 Nov 2020 14:03:59 +0100
Message-Id: <20201126130422.92945-22-hch@lst.de>
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

This will allow for a more symmetric calling convention going forward.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 86a61a2141f642..d0783c55a0ce65 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1458,6 +1458,7 @@ static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
 			if (!(disk->flags & GENHD_FL_UP) ||
 			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
 				__blkdev_put(whole, mode, 1);
+				bdput(whole);
 				ret = -ENXIO;
 				goto out_clear;
 			}
@@ -1740,9 +1741,10 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 			disk->fops->release(disk, mode);
 	}
 	mutex_unlock(&bdev->bd_mutex);
-	bdput(bdev);
-	if (victim)
+	if (victim) {
 		__blkdev_put(victim, mode, 1);
+		bdput(victim);
+	}
 }
 
 void blkdev_put(struct block_device *bdev, fmode_t mode)
@@ -1792,6 +1794,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 	mutex_unlock(&bdev->bd_mutex);
 
 	__blkdev_put(bdev, mode, 0);
+	bdput(bdev);
 	put_disk_and_module(disk);
 }
 EXPORT_SYMBOL(blkdev_put);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
