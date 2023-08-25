Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E651BC3DA6F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51cCjUhFrLLWUNYBtRFSjtrcNPpO96AWNFI2P/swWxI=; b=H9RMGO5KsQA5+E
	iGo9jZGCzv1bl+neut/7dhCtEsCwnfPmFeXtik386AoZwXr4jgc0jqAdNlBulr6/OPHRKkh+vGnnX
	+RVsdNn+wwYTtL7Ri1yY8LgAsP7Ns4YZMZlSL+OUvPodSOSMC5wJeztGXSsyXF+ZfyZ+lTn8GgRLA
	5xmmpQdPAa0f0X1BFXfUBwztDFBKRk7EWM9sqPOmDUxNT2jA9RciKOPW+w1PEVjm7oLqvWoXjf7+j
	GIEaWdIQ8Nv2R72W0Y4n0uyUl2oNYSeOyNuMHZrQ5D/eM8n36ETdw7EsEfQFOaPuVZiefiOyg7bwf
	vs07uJuCxubXIbVDYOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXOe-005XJf-2r;
	Fri, 25 Aug 2023 14:02:44 +0000
Received: from out-244.mta1.migadu.com ([2001:41d0:203:375::f4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXOb-005XHp-2t
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 14:02:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692972160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IHqyAGVDJ58osMbe/1AdWvJDmRup4/lFC37whRevKc=;
	b=Eb4iAdgTR0TpdbPqUzDwHbHxPEh5V68LsiBX5YVrmluxRTdzMTEqMqKrZvLhm9MDpgg3K/
	D2eTyYZZZ+bfvHLihjIIZJ2OKJ2cQ07lnUU3TLxQlV7ixmfK6NG3WLuhhK+cGvea8pFBoo
	CGGtOLVSVaB7g8RjjJfuG0O31ub2h9Y=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Cc: Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>,
	Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-mm@kvack.org,
	linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: [PATCH 17/29] xfs: make xfs_trans_ijoin() error out -EAGAIN
Date: Fri, 25 Aug 2023 21:54:19 +0800
Message-Id: <20230825135431.1317785-18-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070242_080618_C18921A1 
X-CRM114-Status: GOOD (  12.96  )
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

From: Hao Xu <howeyxu@tencent.com>

Change return value of xfs_trans_ijoin() to error out -EAGAIN.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_trans_inode.c | 13 +++++++++----
 fs/xfs/xfs_iops.c               |  4 +++-
 fs/xfs/xfs_trans.h              |  2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index e7a8f63c8975..7bda62bad90a 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -23,7 +23,7 @@
  * The inode must be locked, and it cannot be associated with any transaction.
  * If lock_flags is non-zero the inode will be unlocked on transaction commit.
  */
-void
+int
 xfs_trans_ijoin(
 	struct xfs_trans	*tp,
 	struct xfs_inode	*ip,
@@ -32,9 +32,12 @@ xfs_trans_ijoin(
 	struct xfs_inode_log_item *iip;
 
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
-	if (ip->i_itemp == NULL)
-		xfs_inode_item_init(ip, ip->i_mount,
-				    tp->t_flags & XFS_TRANS_NOWAIT);
+	if (ip->i_itemp == NULL) {
+		int ret = xfs_inode_item_init(ip, ip->i_mount,
+					      tp->t_flags & XFS_TRANS_NOWAIT);
+		if (ret == -EAGAIN)
+			return ret;
+	}
 	iip = ip->i_itemp;
 
 	ASSERT(iip->ili_lock_flags == 0);
@@ -44,6 +47,8 @@ xfs_trans_ijoin(
 	/* Reset the per-tx dirty context and add the item to the tx. */
 	iip->ili_dirty_flags = 0;
 	xfs_trans_add_item(tp, &iip->ili_item);
+
+	return 0;
 }
 
 /*
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 47b4fd5f8f5c..034a8fea1f8e 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1075,7 +1075,9 @@ xfs_vn_update_time(
 	if (flags & S_ATIME)
 		inode->i_atime = *now;
 
-	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
+	error = xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
+	if (error)
+		goto out;
 	xfs_trans_log_inode(tp, ip, log_flags);
 	error = xfs_trans_commit(tp);
 
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 6e3646d524ce..f2c05884c4b6 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -226,7 +226,7 @@ bool		xfs_trans_ordered_buf(xfs_trans_t *, struct xfs_buf *);
 void		xfs_trans_dquot_buf(xfs_trans_t *, struct xfs_buf *, uint);
 void		xfs_trans_inode_alloc_buf(xfs_trans_t *, struct xfs_buf *);
 void		xfs_trans_ichgtime(struct xfs_trans *, struct xfs_inode *, int);
-void		xfs_trans_ijoin(struct xfs_trans *, struct xfs_inode *, uint);
+int		xfs_trans_ijoin(struct xfs_trans *, struct xfs_inode *, uint);
 void		xfs_trans_log_buf(struct xfs_trans *, struct xfs_buf *, uint,
 				  uint);
 void		xfs_trans_dirty_buf(struct xfs_trans *, struct xfs_buf *);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
