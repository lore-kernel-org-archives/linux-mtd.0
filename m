Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67893C63777
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:20:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D342467C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tI0c8yoy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NketMA/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04D342467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rAD95bjA778dJ2daOrinnxnO4mKu/VtbEy2IRNEuygs=; b=tI0c8yoyhm3Y1PGB3Z6bu2Pq2
	Lz/TAkn3JRPRIsu+Qi8iaur2n9O2RBJ/MqjuoPrkYp1VUvJHgaeuy02rz2P+RFJmSZuAnCFfXv8Jb
	tT/EKLjAvZ1nYZcCc32qaD9soCBwU+tKamPDfN453COoJxRN6sFkbbgA7etfkV7poGg4khe7JqzvQ
	NNqVKuDccEyayZLxX3GTNkAtF7tTKtfmYi/3dtHdz98lIvCacQct8vZjZGStRLkKLEMpwm9H5ae4R
	zL0a1sx5lCocpoUJMAmbtoiwpRNirsrpuNoKUfI5Y1pHh3jyp0geGG9r4ZgMMAyXmk57UjnNHggvN
	QdbwHnHzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2wo-0002px-9f; Sat, 28 Nov 2020 16:19:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2t4-0000s8-Cj
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=58eRvABQ9wcBaVUecn4OAyBZ+Jv++aJOLsdqKdGeutg=; b=NketMA/qS9o3GPr2SbKJRQmdNq
 pAtkMDydyPF3ecFOIsS4NbLEEDFNmefQuMBkQit3GpjJKLRxXm8pnvFD3NCyW3+kflIhNBh8C8DQe
 xjLrMJaAC6hNsYGzFNl9IuapwYcRhReMChdfv7HMgFZ83JP5Vvy0UlYixykYMDKlwKmewLdOSSqz5
 mWwZTizFMMlajZWalQr1vYwESDdaWv1WfnpDRlFB9bw8SHbYfmfCPt9+0qfRcmknoOqPtopPUzHDS
 q+yt+4ZSx0spCtDL7PPF2dD49DtamtSjr+HzjaHpeftqqv6Le/xaG5EzHCP3xl2FTNzfXoAZ1vx6x
 o5IaGSkA==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2t2-0000Iy-4Q; Sat, 28 Nov 2020 16:15:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 22/45] block: move bdput() to the callers of __blkdev_get
Date: Sat, 28 Nov 2020 17:14:47 +0100
Message-Id: <20201128161510.347752-23-hch@lst.de>
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

This will allow for a more symmetric calling convention going forward.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/block_dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 0c533ac92e2492..a2d5050c97ee08 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1462,6 +1462,7 @@ static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
 			if (!(disk->flags & GENHD_FL_UP) ||
 			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
 				__blkdev_put(whole, mode, 1);
+				bdput(whole);
 				ret = -ENXIO;
 				goto out_clear;
 			}
@@ -1744,9 +1745,10 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
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
@@ -1796,6 +1798,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
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
