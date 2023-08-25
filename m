Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1071AC3DA6F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEq0tE/SUDrjPwpbjqNSY74AblyldJHEqCndL15Q+d4=; b=zwRrVtUAeLuAtx
	q181Jpa9pJZuUHGv2fWqqKQGEQ5WbaH+S589Km2zUSKaL45bqTnuvUynWLtgkcXBgN1YuS8p4Vewq
	BOHOEiSKQCv453WqtAXG/gOkCwQtclfEYBwZXDCugcEcZ9nWTqTXRNWVvQLukdzMPb84Hvdalmc6f
	rgSG3zpEy/jZYvCyPHwXl6S+dt8D/NfWRziu6+cD0Uj2iSCy9GK9T4wt3ZAwFpVy3xpIK2dmB3eEn
	SsQSEHwsRhDcT8Pj3weOn/k/ktv7YByf3vpRDrVw0NU4qJ0YLsKanDaBa3uCFG+10hD+ZznfI3j86
	vyU3MYs1Smkg10+mbykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXPY-005XdS-2T;
	Fri, 25 Aug 2023 14:03:40 +0000
Received: from out-248.mta1.migadu.com ([2001:41d0:203:375::f8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXPW-005XbY-1o
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 14:03:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692972214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T6ViUZBPx7ad0ZahN3iXc6h6e/WwSaru8OskP5bAugQ=;
	b=ES2TiCn948OXPBoEBgWTcBO0RS4z23ivDrdXlTdAtaw6PThdxWDWOdUDMqwN5Zn7WD+dyR
	mB9Bpqj2y+SXbSPXBOj6qNtlf9PRruM/6AA9li5Lcnl6yPomOz6TlD4q7SN/nyqOvAgxMU
	ufKXd8FiPwyCFvbnzPL8RetLQf6iEEM=
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
Subject: [PATCH 20/29] xfs: distinguish error type of memory allocation failure for nowait case
Date: Fri, 25 Aug 2023 21:54:22 +0800
Message-Id: <20230825135431.1317785-21-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070338_739906_47C49516 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

Previously, if we fail to get the memory we need, -ENOMEM is returned.
It can be -EAGAIN now since we support nowait now. Return the latter
when it is the case. Involved functions are:  _xfs_buf_map_pages(),
xfs_buf_get_maps(), xfs_buf_alloc_kmem() and xfs_buf_alloc_pages().

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 8b800ce28996..a6e6e64ff940 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -192,7 +192,7 @@ xfs_buf_get_maps(
 	bp->b_maps = kmem_zalloc(map_count * sizeof(struct xfs_buf_map),
 				KM_NOFS);
 	if (!bp->b_maps)
-		return -ENOMEM;
+		return bp->b_flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 	return 0;
 }
 
@@ -339,7 +339,7 @@ xfs_buf_alloc_kmem(
 
 	bp->b_addr = kmem_alloc(size, kmflag_mask);
 	if (!bp->b_addr)
-		return -ENOMEM;
+		return flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 
 	if (((unsigned long)(bp->b_addr + size - 1) & PAGE_MASK) !=
 	    ((unsigned long)bp->b_addr & PAGE_MASK)) {
@@ -363,6 +363,7 @@ xfs_buf_alloc_pages(
 {
 	gfp_t		gfp_mask = __GFP_NOWARN;
 	long		filled = 0;
+	bool		nowait = flags & XBF_NOWAIT;
 
 	if (flags & XBF_READ_AHEAD)
 		gfp_mask |= __GFP_NORETRY;
@@ -377,7 +378,7 @@ xfs_buf_alloc_pages(
 		bp->b_pages = kzalloc(sizeof(struct page *) * bp->b_page_count,
 					gfp_mask);
 		if (!bp->b_pages)
-			return -ENOMEM;
+			return nowait ? -EAGAIN : -ENOMEM;
 	}
 	bp->b_flags |= _XBF_PAGES;
 
@@ -451,7 +452,7 @@ _xfs_buf_map_pages(
 		memalloc_nofs_restore(nofs_flag);
 
 		if (!bp->b_addr)
-			return -ENOMEM;
+			return flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 	}
 
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
