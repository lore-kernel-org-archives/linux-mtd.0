Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939FEC433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323D321D81
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3p+NCzF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p/a/cIBT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 323D321D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/syQirmH7BIbZjOWJ+FodV0etPaUISGwyk1dWONnJDw=; b=H3p+NCzFs3nBJNiUX+kWGLPxU
	JPoPXI6lfUUFf/z1tRGzYAXyr9RVvbCdr5rvNZ07/yDxBMU+eslc1jFNq9MNWCaaWhUzu1n0uwouU
	HAkbifEbv32AhwBHlXHicz0SY2MG+n1vBT4GsB5SK0Dak4sFJu3OgehpmmReBVF0WcF+kB7OpCU9t
	lAJ4AU85p6MdiJOehOeJUbO8LFbR+d+C8HG+4XOzcpu20YfIxpQ4p2HYpHZ4+dW0rtx9+o7BfE9g1
	E9kzyF8Qbu1ejmXjceXpmYBgxbLvzp/dY7WyKdAgd24jqDCTsIB/JsxARTlCnyJ2SF5dwpBtrTCyM
	sqlvnYZ7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGNsV-00036Q-7L; Thu, 10 Sep 2020 14:48:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsQ-00035C-H9
 for linux-mtd@merlin.infradead.org; Thu, 10 Sep 2020 14:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7ulqiSDL0ogF88UJRGSXYrWIBhfsEtKnjgdPpH8j7+E=; b=p/a/cIBTVNCnq9FDSFOgQ+do5P
 XPs27m0/+6NZHzFP53ZY3wJJbA3lM5k+4VejJQFaewDhWokK3wBtFr3zoGPoQVydI+8s/v7cthkEC
 2Zbhs8WXwY5yZ9n+cC23LGTQarTHwbnsiawp72UUt4MDzxhYGycrPYUGUFM22EiSm8SGWxmMCzVsv
 HMlK5E7sf+3SIFm+y7VAkdhpCxCzZUJjdIW/7fyYnmaevN33DugSw41ov/gVrznyzWrp++HMlJVNT
 E7XBGlzTNesfBKvxZZxJOz3C4N9eBaexaIT7CGzd35CncAEK6zUozHSaRnTEjHUWWlH0K0zgnQsSv
 P3VZCdNA==;
Received: from [2001:4bb8:184:af1:3ecc:ac5b:136f:434a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsP-0006wG-5g; Thu, 10 Sep 2020 14:48:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/12] bdi: initialize ->ra_pages and ->io_pages in bdi_init
Date: Thu, 10 Sep 2020 16:48:24 +0200
Message-Id: <20200910144833.742260-5-hch@lst.de>
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
Cc: David Sterba <dsterba@suse.com>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Set up a readahead size by default, as very few users have a good
reason to change it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]
---
 block/blk-core.c      | 2 --
 drivers/mtd/mtdcore.c | 2 ++
 fs/9p/vfs_super.c     | 6 ++++--
 fs/afs/super.c        | 1 -
 fs/btrfs/disk-io.c    | 1 -
 fs/fuse/inode.c       | 1 -
 fs/nfs/super.c        | 9 +--------
 fs/ubifs/super.c      | 2 ++
 fs/vboxsf/super.c     | 2 ++
 mm/backing-dev.c      | 2 ++
 10 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 093649bd252e71..18c092f8d69175 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -538,8 +538,6 @@ struct request_queue *blk_alloc_queue(int node_id)
 	if (!q->stats)
 		goto fail_stats;
 
-	q->backing_dev_info->ra_pages = VM_READAHEAD_PAGES;
-	q->backing_dev_info->io_pages = VM_READAHEAD_PAGES;
 	q->backing_dev_info->capabilities = BDI_CAP_CGROUP_WRITEBACK;
 	q->node = node_id;
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7d930569a7dfb7..b5e5d3140f578e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2196,6 +2196,8 @@ static struct backing_dev_info * __init mtd_bdi_init(char *name)
 	bdi = bdi_alloc(NUMA_NO_NODE);
 	if (!bdi)
 		return ERR_PTR(-ENOMEM);
+	bdi->ra_pages = 0;
+	bdi->io_pages = 0;
 
 	/*
 	 * We put '-0' suffix to the name to get the same name format as we
diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
index 74df32be4c6a52..e34fa20acf612e 100644
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@ -80,8 +80,10 @@ v9fs_fill_super(struct super_block *sb, struct v9fs_session_info *v9ses,
 	if (ret)
 		return ret;
 
-	if (v9ses->cache)
-		sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
+	if (!v9ses->cache) {
+		sb->s_bdi->ra_pages = 0;
+		sb->s_bdi->io_pages = 0;
+	}
 
 	sb->s_flags |= SB_ACTIVE | SB_DIRSYNC;
 	if (!v9ses->cache)
diff --git a/fs/afs/super.c b/fs/afs/super.c
index b552357b1d1379..3a40ee752c1e3f 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -456,7 +456,6 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
 	ret = super_setup_bdi(sb);
 	if (ret)
 		return ret;
-	sb->s_bdi->ra_pages	= VM_READAHEAD_PAGES;
 
 	/* allocate the root inode and dentry */
 	if (as->dyn_root) {
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index f6bba7eb1fa171..047934cea25efa 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3092,7 +3092,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
 	}
 
 	sb->s_bdi->capabilities |= BDI_CAP_CGROUP_WRITEBACK;
-	sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
 	sb->s_bdi->ra_pages *= btrfs_super_num_devices(disk_super);
 	sb->s_bdi->ra_pages = max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index bba747520e9b08..17b00670fb539e 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1049,7 +1049,6 @@ static int fuse_bdi_init(struct fuse_conn *fc, struct super_block *sb)
 	if (err)
 		return err;
 
-	sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
 	/* fuse does it's own writeback accounting */
 	sb->s_bdi->capabilities = BDI_CAP_NO_ACCT_WB | BDI_CAP_STRICTLIMIT;
 
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 7a70287f21a2c1..f943e37853fa25 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -1200,13 +1200,6 @@ static void nfs_get_cache_cookie(struct super_block *sb,
 }
 #endif
 
-static void nfs_set_readahead(struct backing_dev_info *bdi,
-			      unsigned long iomax_pages)
-{
-	bdi->ra_pages = VM_READAHEAD_PAGES;
-	bdi->io_pages = iomax_pages;
-}
-
 int nfs_get_tree_common(struct fs_context *fc)
 {
 	struct nfs_fs_context *ctx = nfs_fc2context(fc);
@@ -1251,7 +1244,7 @@ int nfs_get_tree_common(struct fs_context *fc)
 					     MINOR(server->s_dev));
 		if (error)
 			goto error_splat_super;
-		nfs_set_readahead(s->s_bdi, server->rpages);
+		s->s_bdi->io_pages = server->rpages;
 		server->super = s;
 	}
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a2420c900275a8..fbddb2a1c03f5e 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2177,6 +2177,8 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 				   c->vi.vol_id);
 	if (err)
 		goto out_close;
+	sb->s_bdi->ra_pages = 0;
+	sb->s_bdi->io_pages = 0;
 
 	sb->s_fs_info = c;
 	sb->s_magic = UBIFS_SUPER_MAGIC;
diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
index 8fe03b4a0d2b03..8e3792177a8523 100644
--- a/fs/vboxsf/super.c
+++ b/fs/vboxsf/super.c
@@ -167,6 +167,8 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
 	err = super_setup_bdi_name(sb, "vboxsf-%d", sbi->bdi_id);
 	if (err)
 		goto fail_free;
+	sb->s_bdi->ra_pages = 0;
+	sb->s_bdi->io_pages = 0;
 
 	/* Turn source into a shfl_string and map the folder */
 	size = strlen(fc->source) + 1;
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 8e8b00627bb2d8..2dac3be6127127 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -746,6 +746,8 @@ struct backing_dev_info *bdi_alloc(int node_id)
 		kfree(bdi);
 		return NULL;
 	}
+	bdi->ra_pages = VM_READAHEAD_PAGES;
+	bdi->io_pages = VM_READAHEAD_PAGES;
 	return bdi;
 }
 EXPORT_SYMBOL(bdi_alloc);
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
