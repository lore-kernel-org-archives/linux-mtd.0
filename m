Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC31AC43219
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 04:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZdLTfRtjTIGdw2WQXHWyWg4aKx0NpIE3yMjTfdbD0M=; b=zE+/WTW5G6i472
	gOHduAr4yPw4M1ppE1H+9jKeEizLdJMBGNIwUo7KuZywCR3igmFT6HjDo5B8vdOrQD1RonvemFnns
	91QpWYJC0M8lQOevAlEew510b5Oo8i63FVHageWNvP/t0VKxfZhpoSJMAMf6MQEp35P1zUaMgJzSe
	kypRgGhVh8hDJwdSDPtmUA+ES/2i91XkxnA1FDXgWv/CbUk6uEemQMGEcAWWvNP0omlT2sMB8g9N5
	8Vy8tuksKayEpBahHZSPH5Yl698OKANL1n1AVFxgOjo/uaJd+r4dTicy08q6GXgRtUGM8h4168lfN
	6QIUf3bF/hqwM1X12zvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfE29-008TP9-5A; Fri, 15 Apr 2022 04:58:13 +0000
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxy-008PKU-DT; Fri, 15 Apr 2022 04:53:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: [PATCH 16/27] block: use bdev_alignment_offset in
 part_alignment_offset_show
Date: Fri, 15 Apr 2022 06:52:47 +0200
Message-Id: <20220415045258.199825-17-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace the open coded offset calculation with the proper helper.
This is an ABI change in that the -1 for a misaligned partition is
properly propagated, which can be considered a bug fix and matches
what is done on the whole device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/partitions/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block/partitions/core.c b/block/partitions/core.c
index 2ef8dfa1e5c85..240b3fff521e4 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -200,11 +200,7 @@ static ssize_t part_ro_show(struct device *dev,
 static ssize_t part_alignment_offset_show(struct device *dev,
 					  struct device_attribute *attr, char *buf)
 {
-	struct block_device *bdev = dev_to_bdev(dev);
-
-	return sprintf(buf, "%u\n",
-		queue_limit_alignment_offset(&bdev_get_queue(bdev)->limits,
-				bdev->bd_start_sect));
+	return sprintf(buf, "%u\n", bdev_alignment_offset(dev_to_bdev(dev)));
 }
 
 static ssize_t part_discard_alignment_show(struct device *dev,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
