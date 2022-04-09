Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7E4C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 05:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMHyLKXoNS09ij+idKo9Vp7hhiBhbEBqNaYvvZKP5xk=; b=G9m3o++qcgGw4q
	NJlCwvF41folFZ/3Q8v5wVeAHZIo4UYtzjfKaLCQknUI2MlY0Ai4WDIpu4o43QWORzj/2r5hSOxNw
	h2n5V9AODNayQYq6b+OyGRH8Q0JuGARq6974b+zsvUrriSxI9bB8WIOffu38mPlFoJdR1it655V/K
	y32KMDH69KIk57sRHUJYodyhHw1DmNIVhp64jJgHNsiSP8DH6CH+T5oN/TBt+qYrpwnp47tsxlr5+
	8E5ctO8gixxLEEQI1k7dn3//rUYMIQA6z1W3papZBiuKqNfcIpxlRjOADpsOxeycIBqsecmKP/fVZ
	DJ4YqwTg0tk1Bg9tvqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd3Ub-002EMd-JS; Sat, 09 Apr 2022 05:18:37 +0000
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd35G-0021rI-Lh; Sat, 09 Apr 2022 04:52:27 +0000
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
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
Subject: [PATCH 27/27] direct-io: remove random prefetches
Date: Sat,  9 Apr 2022 06:50:43 +0200
Message-Id: <20220409045043.23593-28-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
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

Randomly poking into block device internals for manual prefetches isn't
exactly a very maintainable thing to do.  And none of the performance
criticil direct I/O implementations still use this library function
anyway, so just drop it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/direct-io.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index aef06e607b405..840752006f601 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -1115,11 +1115,10 @@ static inline int drop_refcount(struct dio *dio)
  * individual fields and will generate much worse code. This is important
  * for the whole file.
  */
-static inline ssize_t
-do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
-		      struct block_device *bdev, struct iov_iter *iter,
-		      get_block_t get_block, dio_iodone_t end_io,
-		      dio_submit_t submit_io, int flags)
+ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
+		struct block_device *bdev, struct iov_iter *iter,
+		get_block_t get_block, dio_iodone_t end_io,
+		dio_submit_t submit_io, int flags)
 {
 	unsigned i_blkbits = READ_ONCE(inode->i_blkbits);
 	unsigned blkbits = i_blkbits;
@@ -1334,29 +1333,6 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
 	kmem_cache_free(dio_cache, dio);
 	return retval;
 }
-
-ssize_t __blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
-			     struct block_device *bdev, struct iov_iter *iter,
-			     get_block_t get_block,
-			     dio_iodone_t end_io, dio_submit_t submit_io,
-			     int flags)
-{
-	/*
-	 * The block device state is needed in the end to finally
-	 * submit everything.  Since it's likely to be cache cold
-	 * prefetch it here as first thing to hide some of the
-	 * latency.
-	 *
-	 * Attempt to prefetch the pieces we likely need later.
-	 */
-	prefetch(&bdev->bd_disk->part_tbl);
-	prefetch(bdev->bd_disk->queue);
-	prefetch((char *)bdev->bd_disk->queue + SMP_CACHE_BYTES);
-
-	return do_blockdev_direct_IO(iocb, inode, bdev, iter, get_block,
-				     end_io, submit_io, flags);
-}
-
 EXPORT_SYMBOL(__blockdev_direct_IO);
 
 static __init int dio_init(void)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
