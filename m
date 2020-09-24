Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B051BC47425
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4933623772
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FyCwqzm9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UB5YCNux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4933623772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yOPlSQoiNRIeHIZ14m68mBjNXpZfQnfrxMJs84xfSrI=; b=FyCwqzm9ESomnvXBbFX/UqNWo
	l1g1yRXXNYAvlH+qyrCHKhHQvPRZdH7a0bVBM5huCDg9jmBRfS3rH5kx+zf9nsRVxyY5jitWkRDZx
	lH4maIB9jWpZ1moT5CUzDNjazRNaX7N5I10YwUVu+gZI+BPO+kwyQRtjFG3askyp/sRPuG0BZiBS+
	7SxQM9RWg5AI/m3s9rHqoRiZRW70bpuXi32ixYiUIXAVs+7CuHcQr1kIpdy0drAPGWy6SHdQyHPW8
	h5Giq30YJoktKdenDxT8FENzRs//igTchVrPNzeBjNSHtQ88oysQgiIilUhxKsbIlE7IePPYflNti
	mUVSUgTBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLL7R-00059q-7u; Thu, 24 Sep 2020 06:52:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6g-0004n6-23
 for linux-mtd@merlin.infradead.org; Thu, 24 Sep 2020 06:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=II635vFBb1VUrIhyKQTtXi4VWoh2O6zcRcSXRwzfbpE=; b=UB5YCNux+TI+Jd2fEhNidjhyLu
 +l8iEWNXmg4pFLWzuPahIMrMUofCGV65UTxU6uo1NhymBoOVb6qFu2/kxIRrQBd2g1A+Xf0Uo1sjW
 SHgbk+Xz3KCUR+2pPM1zX8sh6e/H/z1geRWceWC29DEfpPYwoyOFKxI7T+I0s4R70dg7WArCrepOt
 7ORCNPllmUEVtrmaPLotpLq84FrXddqSbrYASJjiF/VqQfPIPxq8HqElgMQudxqx54XO/Ij+IKLZg
 xrN/S7FZ9KtN/uJceMAK47PKvJ/Agvg5hkjvWPtoted9OLRZihbK+1QG/DSIF0XdCgYu+8gPwoXMS
 UkRcBaEQ==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6e-0001Ar-PP; Thu, 24 Sep 2020 06:51:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/13] bdi: remove BDI_CAP_CGROUP_WRITEBACK
Date: Thu, 24 Sep 2020 08:51:35 +0200
Message-Id: <20200924065140.726436-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924065140.726436-1-hch@lst.de>
References: <20200924065140.726436-1-hch@lst.de>
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
 Justin Sanders <justin@coraid.com>, Jan Kara <jack@suse.cz>,
 Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Just checking SB_I_CGROUPWB for cgroup writeback support is enough.
Either the file system allocates its own bdi (e.g. btrfs), in which case
it is known to support cgroup writeback, or the bdi comes from the block
layer, which always supports cgroup writeback.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-core.c            | 1 -
 fs/btrfs/disk-io.c          | 1 -
 include/linux/backing-dev.h | 8 +++-----
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 865d39e5be2b28..1cc4fa6bc7fe1f 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -538,7 +538,6 @@ struct request_queue *blk_alloc_queue(int node_id)
 	if (!q->stats)
 		goto fail_stats;
 
-	q->backing_dev_info->capabilities = BDI_CAP_CGROUP_WRITEBACK;
 	q->node = node_id;
 
 	atomic_set(&q->nr_active_requests_shared_sbitmap, 0);
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 047934cea25efa..e24927bddd5829 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3091,7 +3091,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
 		goto fail_sb_buffer;
 	}
 
-	sb->s_bdi->capabilities |= BDI_CAP_CGROUP_WRITEBACK;
 	sb->s_bdi->ra_pages *= btrfs_super_num_devices(disk_super);
 	sb->s_bdi->ra_pages = max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
 
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 0b06b2d26c9aa3..52583b6f2ea05d 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -123,7 +123,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
  * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
  * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
  *
- * BDI_CAP_CGROUP_WRITEBACK: Supports cgroup-aware writeback.
  * BDI_CAP_SYNCHRONOUS_IO: Device is so fast that asynchronous IO would be
  *			   inefficient.
  */
@@ -233,9 +232,9 @@ int inode_congested(struct inode *inode, int cong_bits);
  * inode_cgwb_enabled - test whether cgroup writeback is enabled on an inode
  * @inode: inode of interest
  *
- * cgroup writeback requires support from both the bdi and filesystem.
- * Also, both memcg and iocg have to be on the default hierarchy.  Test
- * whether all conditions are met.
+ * Cgroup writeback requires support from the filesystem.  Also, both memcg and
+ * iocg have to be on the default hierarchy.  Test whether all conditions are
+ * met.
  *
  * Note that the test result may change dynamically on the same inode
  * depending on how memcg and iocg are configured.
@@ -247,7 +246,6 @@ static inline bool inode_cgwb_enabled(struct inode *inode)
 	return cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
 		cgroup_subsys_on_dfl(io_cgrp_subsys) &&
 		bdi_cap_account_dirty(bdi) &&
-		(bdi->capabilities & BDI_CAP_CGROUP_WRITEBACK) &&
 		(inode->i_sb->s_iflags & SB_I_CGROUPWB);
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
