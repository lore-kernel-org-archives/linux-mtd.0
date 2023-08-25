Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02830C71133
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOgyO4vt/TwW5uaK4S1bqbHpC5xgs+LbhYkjToyCazg=; b=dEzz5dH893qRFf
	uTFwI8g/NBuIYA4cWnmRBv0/KZdNyT6MzRahCaJlI0IhfdIZATvChfN+hJWE/+7QGiw06xNwTT/qA
	AqcVgoglsUFjuy6Mf+QdYfyTYSPLMES3gvDYwp5AEwqGDjRRz5vs7RFo2RueRsx+iRDe4AXzDtsp0
	RfmUmI76vrPNMSs7OYhkWVTLjU6P5KuUydTFd7YNYE2gg0NV2julIaGUZfA/FMdxcHLXlpql3cnPg
	z652pS4Bx+0HomuxEII6RjHTEKRt3Bu2x1v7faoQyuxKwIjJebNlHDTiCWxjSydMbtGVU2WG1wlsA
	TKV8t41/NQVsXieG8Whg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXP4-005XQz-1c;
	Fri, 25 Aug 2023 14:03:10 +0000
Received: from out-246.mta1.migadu.com ([95.215.58.246])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXP1-005XOj-2f
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 14:03:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692972185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTb/druvnHmAZS3W1u50TERu+WCPGmDec9gQaqemBTg=;
	b=F3s/OJUcPEY5Zlidje3R3yeS51LSjhWu/qJIZQ5RlOJtYZFuPHsEDcjE4qLEmmAUjn6Noq
	1FuuA0oBiaR8ILzLTnrrBydu7XR0r/KR3HJXB7nZmLWLG0jXn8HNnNNNLFYiSbQJ1kLBWH
	sWlvtA/UHWBfhR+BdKG+F5ETxQfMgq0=
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
Subject: [PATCH 18/29] xfs: set XBF_NOWAIT for xfs_buf_read_map if necessary
Date: Fri, 25 Aug 2023 21:54:20 +0800
Message-Id: <20230825135431.1317785-19-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070308_012953_CF76FFB9 
X-CRM114-Status: UNSURE (   6.64  )
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

Set XBF_NOWAIT for xfs_buf_read_map() if necessary.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_trans_buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
index 6549e50d852c..016371f58f26 100644
--- a/fs/xfs/xfs_trans_buf.c
+++ b/fs/xfs/xfs_trans_buf.c
@@ -286,6 +286,8 @@ xfs_trans_read_buf_map(
 		return 0;
 	}
 
+	if (tp && (tp->t_flags & XFS_TRANS_NOWAIT))
+		flags |= XBF_NOWAIT;
 	error = xfs_buf_read_map(target, map, nmaps, flags, &bp, ops,
 			__return_address);
 	switch (error) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
