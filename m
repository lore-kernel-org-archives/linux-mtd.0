Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524D5C79F61
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpO25TH21n0ph81WB4doXO9y+LwAhiPAEapq/QjeMMc=; b=Em8RMUO0BJdIBN
	Rqu09pGzO0G4V5sfMnKEpspdakKzN5jVXaeUQ6vjNeOMkjy5/rNfKYSgXzlc+4uVu05ZoBhjbUlAS
	Q66wXN9g4aY0guYNwCqvvVbuNaS20hht6mCwBDWCkUPcrrRBEFnrV5OjK89QbyKMXNUxWaNlvZ3dx
	RzmYljKuXGHeuIpHV9NE+NbalF3nVG90gcmXc/3iBBuZXj91Jm0Aey8PvCmv2BCWzL2sCPfDTXpWf
	CTQ8FbMtCUB9kL4Ps0J9pzXQjVARs9cztu4uWbEIEU1/y3f5MsQXjyd8M5ejIcvg+ML3R+7Q0wWWU
	5aTREvMHRVmob9+Gi0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXRG-005YPH-0x;
	Fri, 25 Aug 2023 14:05:26 +0000
Received: from out-248.mta1.migadu.com ([95.215.58.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXRD-005YOF-2X
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 14:05:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692972321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/Nd9xxoGpB2Y5m9xwXDJRTcGKza/1aMnRr8dKaa6VQ=;
	b=KEbezTf0obDqS0d0+ZY03Au9A3+XAlHMaifao/gSyVuoHlKJlTUkwmI81DvHZmrTrUQaLF
	sGTDWP5rChj2LFxWYHnJBky5ZudbW2OzCc+00JgxX/lbJXlYqo7/5HQVTOk8DmfuG/wY54
	UCC6hfeA7Mu6K3Y30dgBdV885aCoMfc=
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
Subject: [PATCH 25/29] xfs: support nowait for xfs_buf_item_init()
Date: Fri, 25 Aug 2023 21:54:27 +0800
Message-Id: <20230825135431.1317785-26-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070524_192545_B3FAB349 
X-CRM114-Status: GOOD (  15.41  )
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

support nowait for xfs_buf_item_init() and error out -EAGAIN to
_xfs_trans_bjoin() when it would block.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf_item.c         |  9 +++++++--
 fs/xfs/xfs_buf_item.h         |  2 +-
 fs/xfs/xfs_buf_item_recover.c |  2 +-
 fs/xfs/xfs_trans_buf.c        | 16 +++++++++++++---
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
index 023d4e0385dd..b1e63137d65b 100644
--- a/fs/xfs/xfs_buf_item.c
+++ b/fs/xfs/xfs_buf_item.c
@@ -827,7 +827,8 @@ xfs_buf_item_free_format(
 int
 xfs_buf_item_init(
 	struct xfs_buf	*bp,
-	struct xfs_mount *mp)
+	struct xfs_mount *mp,
+	bool   nowait)
 {
 	struct xfs_buf_log_item	*bip = bp->b_log_item;
 	int			chunks;
@@ -847,7 +848,11 @@ xfs_buf_item_init(
 		return 0;
 	}
 
-	bip = kmem_cache_zalloc(xfs_buf_item_cache, GFP_KERNEL | __GFP_NOFAIL);
+	bip = kmem_cache_zalloc(xfs_buf_item_cache,
+				GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL));
+	if (!bip)
+		return -EAGAIN;
+
 	xfs_log_item_init(mp, &bip->bli_item, XFS_LI_BUF, &xfs_buf_item_ops);
 	bip->bli_buf = bp;
 
diff --git a/fs/xfs/xfs_buf_item.h b/fs/xfs/xfs_buf_item.h
index 4d8a6aece995..b1daf8988280 100644
--- a/fs/xfs/xfs_buf_item.h
+++ b/fs/xfs/xfs_buf_item.h
@@ -47,7 +47,7 @@ struct xfs_buf_log_item {
 	struct xfs_buf_log_format __bli_format;	/* embedded in-log header */
 };
 
-int	xfs_buf_item_init(struct xfs_buf *, struct xfs_mount *);
+int	xfs_buf_item_init(struct xfs_buf *bp, struct xfs_mount *mp, bool nowait);
 void	xfs_buf_item_done(struct xfs_buf *bp);
 void	xfs_buf_item_relse(struct xfs_buf *);
 bool	xfs_buf_item_put(struct xfs_buf_log_item *);
diff --git a/fs/xfs/xfs_buf_item_recover.c b/fs/xfs/xfs_buf_item_recover.c
index 43167f543afc..aa64d5a499d6 100644
--- a/fs/xfs/xfs_buf_item_recover.c
+++ b/fs/xfs/xfs_buf_item_recover.c
@@ -429,7 +429,7 @@ xlog_recover_validate_buf_type(
 		struct xfs_buf_log_item	*bip;
 
 		bp->b_flags |= _XBF_LOGRECOVERY;
-		xfs_buf_item_init(bp, mp);
+		xfs_buf_item_init(bp, mp, false);
 		bip = bp->b_log_item;
 		bip->bli_item.li_lsn = current_lsn;
 	}
diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
index 016371f58f26..a1e4f2e8629a 100644
--- a/fs/xfs/xfs_trans_buf.c
+++ b/fs/xfs/xfs_trans_buf.c
@@ -57,13 +57,14 @@ xfs_trans_buf_item_match(
  * If the buffer does not yet have a buf log item associated with it,
  * then allocate one for it.  Then add the buf item to the transaction.
  */
-STATIC void
+STATIC int
 _xfs_trans_bjoin(
 	struct xfs_trans	*tp,
 	struct xfs_buf		*bp,
 	int			reset_recur)
 {
 	struct xfs_buf_log_item	*bip;
+	int ret;
 
 	ASSERT(bp->b_transp == NULL);
 
@@ -72,7 +73,11 @@ _xfs_trans_bjoin(
 	 * it doesn't have one yet, then allocate one and initialize it.
 	 * The checks to see if one is there are in xfs_buf_item_init().
 	 */
-	xfs_buf_item_init(bp, tp->t_mountp);
+	ret = xfs_buf_item_init(bp, tp->t_mountp,
+				tp->t_flags & XFS_TRANS_NOWAIT);
+	if (ret < 0)
+		return ret;
+
 	bip = bp->b_log_item;
 	ASSERT(!(bip->bli_flags & XFS_BLI_STALE));
 	ASSERT(!(bip->__bli_format.blf_flags & XFS_BLF_CANCEL));
@@ -92,6 +97,7 @@ _xfs_trans_bjoin(
 	xfs_trans_add_item(tp, &bip->bli_item);
 	bp->b_transp = tp;
 
+	return 0;
 }
 
 void
@@ -309,7 +315,11 @@ xfs_trans_read_buf_map(
 	}
 
 	if (tp) {
-		_xfs_trans_bjoin(tp, bp, 1);
+		error = _xfs_trans_bjoin(tp, bp, 1);
+		if (error) {
+			xfs_buf_relse(bp);
+			return error;
+		}
 		trace_xfs_trans_read_buf(bp->b_log_item);
 	}
 	ASSERT(bp->b_ops != NULL || ops == NULL);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
