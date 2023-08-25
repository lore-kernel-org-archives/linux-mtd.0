Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FC5C3DA6F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuwL+hfnNeTSW0QzYMOxJo7IdRggQMBgJlwuQkFp7ZU=; b=4oCK2mh8t1u8GP
	/bgMW56ccpZsDrIBmSqw9hT9nujobIHpz4QrqTu/sdJwOuSS16196tZ0KPO4iOx43IBgcAoJSzPYM
	S2qsr2ef2fVG2H1zj4+vIbvapjzQad96Y64loGhAQK2Tze57L1PgTry5WaLYabbEL74q3rvbspPD1
	3nE0LS6haMCG3G4yUIj4ek9nlMFthq6X0dWM9cs13RtmPVMLft3hsHrGkOWsqzoEWfzL4fZGQrk7W
	FZP+JXebE+FB6BoxeZNgHzc2YUIdDYavy1JquUsDb15hYTHUjsEsuQqHKacoyzFgos46PwVVLEbhY
	6vyr7nA1jEhMPs7Itjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXPH-005XVK-0C;
	Fri, 25 Aug 2023 14:03:23 +0000
Received: from out-253.mta1.migadu.com ([2001:41d0:203:375::fd])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXPE-005XUQ-29
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 14:03:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692972199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oO47LbY0b5fVyG7D8YYQFkwRO57XM5uT3mfj/DxMSkA=;
	b=j1kjownAAX9hJfB2BxApQkooYMrevfaPLxvPystRVIJaNfbMrYunmfkjCazr0ChWhlvVjY
	lRX7+a9ciN0hwgjNK4X5Fb69aObVTB6DVFK6AZND7C0g5qPAW+vA7D+a0HhCiOEWDX9QRj
	DdPtV8aYlp/xMHVmKP0gIoyMuJWp9/M=
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
Subject: [PATCH 19/29] xfs: support nowait memory allocation in _xfs_buf_alloc()
Date: Fri, 25 Aug 2023 21:54:21 +0800
Message-Id: <20230825135431.1317785-20-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070320_870519_A76B4FB0 
X-CRM114-Status: UNSURE (   8.34  )
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

Choose different gfp flags to support nowait memory allocation in
_xfs_buf_alloc().

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 9f84bc3b802c..8b800ce28996 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -220,9 +220,14 @@ _xfs_buf_alloc(
 	struct xfs_buf		*bp;
 	int			error;
 	int			i;
+	bool			nowait = flags & XBF_NOWAIT;
+	gfp_t			gfp_flags = GFP_NOFS |
+					    (nowait ? 0 : __GFP_NOFAIL);
 
 	*bpp = NULL;
-	bp = kmem_cache_zalloc(xfs_buf_cache, GFP_NOFS | __GFP_NOFAIL);
+	bp = kmem_cache_zalloc(xfs_buf_cache, gfp_flags);
+	if (!bp)
+		return -EAGAIN;
 
 	/*
 	 * We don't want certain flags to appear in b_flags unless they are
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
