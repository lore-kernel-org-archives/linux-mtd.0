Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ACAEE49AD
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6j5idQ4LSJ/STupdOA4JeM6y95AyozNnUETVGamrZeY=; b=YOpZi/I+9+Z6Zf
	1dJZi/YBwlcTWsgHI/i2+9i6qw/NY3Hxj5ZN/Z3QX1OO1Yz+gjWxNiZoKdChG+Ib6hRIC53FQZa5o
	+ZyQmkbMrlIxsr59nRo20f3MY7rAsvegB+fEerkjHk2PS1YeUbozKtzo42bCW466hPkSZkkl3cBNQ
	+lQIpqoxsLLxI7RAsqkKOXiVOMZN3U/wM/2YKsuiDuYWpU+xUO1PRgGCOSu7DyVGgRPdqvqs6ZByx
	NVWhpUuHlz49Dtm1w3j7p/KA4YCgua6qxwHEeaAh+v/Zed0BYaCl5Tr4vchP+KIlv58F3psyrX0ZL
	iG8Fuj7C4WpqoQNLj5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXMi-005Wcw-06;
	Fri, 25 Aug 2023 14:00:44 +0000
Received: from out-243.mta1.migadu.com ([2001:41d0:203:375::f3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXMe-005WbR-1h
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 14:00:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692972039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8n142m+ckTq2ok9t7Tm2FnSZDGwRTGaDgQRQd0QVrs=;
	b=pz2+RJXny/FRc9X5ZHvo0v2sP0AhNIbG6GqEDC3f4IgSNhM3HBNVDwOESMUSOR4IEMUxcQ
	QeB+zNMG6saCP+3Ee3iNvTaLm94PmwVrh29h0zPxcQxdxo6uNrunXvw2MGBXff+gKAxGGD
	nCmOsY1G1aaOlGneScmRPtSGG9/rCYg=
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
Subject: [PATCH 12/29] xfs: enforce GFP_NOIO implicitly during nowait time update
Date: Fri, 25 Aug 2023 21:54:14 +0800
Message-Id: <20230825135431.1317785-13-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070040_708205_1EC86366 
X-CRM114-Status: GOOD (  10.08  )
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

Enforce GFP_NOIO logic implicitly by set pflags if we are in nowait
time update process. Nowait semantics means no waiting for IO,
therefore GFP_NOIO is needed.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_iops.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index bf1d4c31f009..5fa391083de9 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1037,6 +1037,8 @@ xfs_vn_update_time(
 	int			log_flags = XFS_ILOG_TIMESTAMP;
 	struct xfs_trans	*tp;
 	int			error;
+	int			old_pflags;
+	bool			nowait = flags & S_NOWAIT;
 
 	trace_xfs_update_time(ip);
 
@@ -1049,13 +1051,18 @@ xfs_vn_update_time(
 		log_flags |= XFS_ILOG_CORE;
 	}
 
+	if (nowait)
+		old_pflags = memalloc_noio_save();
+
 	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);
 	if (error)
-		return error;
+		goto out;
 
-	if (flags & S_NOWAIT) {
-		if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
-			return -EAGAIN;
+	if (nowait) {
+		if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL)) {
+			error = -EAGAIN;
+			goto out;
+		}
 	} else {
 		xfs_ilock(ip, XFS_ILOCK_EXCL);
 	}
@@ -1069,7 +1076,12 @@ xfs_vn_update_time(
 
 	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
 	xfs_trans_log_inode(tp, ip, log_flags);
-	return xfs_trans_commit(tp);
+	error = xfs_trans_commit(tp);
+
+out:
+	if (nowait)
+		memalloc_noio_restore(old_pflags);
+	return error;
 }
 
 STATIC int
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
