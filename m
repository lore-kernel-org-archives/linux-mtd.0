Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4E1EE49BA
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64+5nxZ65ZhCxyXr2qkgvfJC1Obw14Z2BA+C5MF2uFE=; b=GTgh/kmOmAZ8nA
	HragW9o/CaFPPsPtGXnKPUo4XyIt81BJETb8eJINfHtJ4J9eF434xQrruefeKiWWNgYLvyZlu2bVM
	v9ybu64era0Dx8TRQgXhkmXfhjxA+MvPQwpi8BMKd1+HxCXnw4qhANtqydS6EtsyCQ6sL8AeWhRWd
	FvRUN5r5UoE8TejGP3Pg+TwJWevWtvlE9JqocGzu/Mwn0wxUDFDloFBM/nQYZZs+mOYhtFFlMZlrG
	bgjqbLKcuLPtUsfGysOLn/IC3MhcO6PgE2WS6sp3Lxqhf9s2LGLcTEsbRZIX0cEFjRHbBexN3PSLR
	/EbXfD1dEyoJucEjcO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXOE-005X71-13;
	Fri, 25 Aug 2023 14:02:18 +0000
Received: from out-245.mta1.migadu.com ([2001:41d0:203:375::f5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXOC-005X6E-0W
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 14:02:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692972134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWqxpxLv+BWdZ1zPLCWWiPjW3gW3QR8GdaNCgbqB+rA=;
	b=W3mJ9hHH5VKigloC5U9bTjeZXL1WzXE+if57PbkgslJR/vwxXv7urAz03rnLzn8z8erL5h
	VCpx6iOsBDC23kpw8k8XGE0qr0cLxvBRgKj1NfrV6YtEtntJMub0qfyQ1aHr3mZsH0O0dL
	P836PFFsTuNux9i0jwQOVu5ehTDOpZM=
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
Subject: [PATCH 16/29] xfs: add nowait parameter for xfs_inode_item_init()
Date: Fri, 25 Aug 2023 21:54:18 +0800
Message-Id: <20230825135431.1317785-17-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070216_343907_DA2100A1 
X-CRM114-Status: GOOD (  11.66  )
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

Add nowait parameter for xfs_inode_item_init() to support nowait
semantics.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_trans_inode.c |  3 ++-
 fs/xfs/xfs_inode_item.c         | 12 ++++++++----
 fs/xfs/xfs_inode_item.h         |  3 ++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index cb4796b6e693..e7a8f63c8975 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -33,7 +33,8 @@ xfs_trans_ijoin(
 
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
 	if (ip->i_itemp == NULL)
-		xfs_inode_item_init(ip, ip->i_mount);
+		xfs_inode_item_init(ip, ip->i_mount,
+				    tp->t_flags & XFS_TRANS_NOWAIT);
 	iip = ip->i_itemp;
 
 	ASSERT(iip->ili_lock_flags == 0);
diff --git a/fs/xfs/xfs_inode_item.c b/fs/xfs/xfs_inode_item.c
index 91c847a84e10..1742920bb4ce 100644
--- a/fs/xfs/xfs_inode_item.c
+++ b/fs/xfs/xfs_inode_item.c
@@ -825,21 +825,25 @@ static const struct xfs_item_ops xfs_inode_item_ops = {
 /*
  * Initialize the inode log item for a newly allocated (in-core) inode.
  */
-void
+int
 xfs_inode_item_init(
 	struct xfs_inode	*ip,
-	struct xfs_mount	*mp)
+	struct xfs_mount	*mp,
+	bool			nowait)
 {
 	struct xfs_inode_log_item *iip;
+	gfp_t gfp_flags = GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL);
 
 	ASSERT(ip->i_itemp == NULL);
-	iip = ip->i_itemp = kmem_cache_zalloc(xfs_ili_cache,
-					      GFP_KERNEL | __GFP_NOFAIL);
+	iip = ip->i_itemp = kmem_cache_zalloc(xfs_ili_cache, gfp_flags);
+	if (!iip)
+		return -EAGAIN;
 
 	iip->ili_inode = ip;
 	spin_lock_init(&iip->ili_lock);
 	xfs_log_item_init(mp, &iip->ili_item, XFS_LI_INODE,
 						&xfs_inode_item_ops);
+	return 0;
 }
 
 /*
diff --git a/fs/xfs/xfs_inode_item.h b/fs/xfs/xfs_inode_item.h
index 377e06007804..7ba6f8a6b243 100644
--- a/fs/xfs/xfs_inode_item.h
+++ b/fs/xfs/xfs_inode_item.h
@@ -42,7 +42,8 @@ static inline int xfs_inode_clean(struct xfs_inode *ip)
 	return !ip->i_itemp || !(ip->i_itemp->ili_fields & XFS_ILOG_ALL);
 }
 
-extern void xfs_inode_item_init(struct xfs_inode *, struct xfs_mount *);
+extern int xfs_inode_item_init(struct xfs_inode *ip, struct xfs_mount *mp,
+			       bool nowait);
 extern void xfs_inode_item_destroy(struct xfs_inode *);
 extern void xfs_iflush_abort(struct xfs_inode *);
 extern void xfs_iflush_shutdown_abort(struct xfs_inode *);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
