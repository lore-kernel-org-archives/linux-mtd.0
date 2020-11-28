Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58ECC63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:19:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 521722467C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uF9khaWG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YCL5FH8M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 521722467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BxQeGdRP0SVFhta5k3HCZrULBIsmcr/KHl9RmZOCAeU=; b=uF9khaWG0sbzjgfhreCMCMeZF
	JoZFAwo2S05TW9lAsDA3JE47ejtxRZ3BFTCptw0k8+WbxjCydHaiAPbt98hFiDlOVboNtQooWqDJn
	Mo93hJWj0Sx9zlLavWojC3Y7DzLryPsKNs/p6dwoYRW9zXXshLF6kKq+RQTggMVo8fDDv4Ql4Wh4V
	0OMGx8dIQMPUcHOsb3Agiy5QlHxrdKdBEwnB6d32U47g5BHbXq1U2BNf9NJUBX1JyeUwb0WPi48y0
	FXaVFZJv/PEyAqJUoOIR4K3tH7gMq1aN8GjXXaq9N30+R6R7GmoQ1glDDl/ezH4h9+Gnfb/MF4X1U
	UkkLkn/DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2wF-0002XA-AJ; Sat, 28 Nov 2020 16:19:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2t0-0000r5-P4
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=vZ+otfYsHp/5sXLwka7CjsX7ANnZwDehRGIR4ErlsRo=; b=YCL5FH8MEXmod6g3jd1iMhvYAp
 r+bAbhViZpySQ0LZ/4JWGmSi9cw+X5fkO6HG9IeN5Nviz2tqj2MtFnQUpczX1hjQln47u+pCl1W/o
 r8Wl7DeAHeHOTcBCxvqF6ux0ARYgITzWcjIlR1flsFzf6uYZ2HKWMcU9FIYUDN5XdFlefe0Pkq9rD
 V5IPZryzeFJg416Ba+u4n1dnP/CQ6nTtjDsG7DTRYjJAi/4zyRJgYFOH+udtU0EKVQlAvrcXzv+Pw
 +Gpp8a8dnYj2O0GN5CbPdwHF5rbNpeCR9b6Ggu7ZoPyWMrWOn3wIODIRZGPtaNnoPm/zh1C80d+5c
 vJn6pwGA==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sy-0000Hf-23; Sat, 28 Nov 2020 16:15:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 20/45] block: refactor __blkdev_put
Date: Sat, 28 Nov 2020 17:14:45 +0100
Message-Id: <20201128161510.347752-21-hch@lst.de>
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
index 962fabe8a67b83..6016777b648336 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1742,22 +1742,22 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
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
