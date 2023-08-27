Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD01C83F01
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Aug 2023 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aw/AyHRuc0v0HSzuGnXyUu91YhcaugEjqfz25uNOl+c=; b=m/Iq3LeeJU+qk2
	f2dFQW0hJiUD6YJdZBklEOh2ijgacEv8Y36yNRCKqp6El4ANCO4WkG919PzgonRI5tJEwaoEj/3Dh
	vE82R4hk4i934msccSmSHrsKCuudIzSjkfAP+7CVYFjXr1tCotnEIHy+TcwXGnN42RhItkcKIFWe0
	cvi6DMDNFgeFPHwm8sUaGWP+1h9KI9rPok1hfbAdLe+SWmR3ushExm/Lnb6XdataT3419SWPOshp8
	My2iNbNLKgeOtuC90Q1uS4NXYs82vyZP/v3+cp/Fntowdx/0YMke+up7+uSeH1uTcr0UOqMtkxRer
	FbglEDB/Km+EjsUCMagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaFvW-0086Yi-1x;
	Sun, 27 Aug 2023 13:35:38 +0000
Received: from out-242.mta1.migadu.com ([95.215.58.242])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaFvT-0086Xh-1C
	for linux-mtd@lists.infradead.org;
	Sun, 27 Aug 2023 13:35:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1693143333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CL8wzJoAbQ75iZcN0EHSqoGXIWt+IFMvEgcKIhs6zqE=;
	b=BRJIOv0sJCNWH9arCNNuOEeHNgvBAsJDXsD/9ROslY/E3EvWdOi7NTa+04JucH099rNnul
	4aa7v7DjXCaaQfzVNr38jK1tfhfTVUIcRN9rZkXC1mcdwty8x7yMXlzmlXd+zl6Ur2HPps
	a6OaK6jfFgLdJwLH2JKSlhPncqJxHqY=
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
Subject: [PATCH 10/11] vfs: trylock inode->i_rwsem in iterate_dir() to support nowait
Date: Sun, 27 Aug 2023 21:28:34 +0800
Message-Id: <20230827132835.1373581-11-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_063535_548348_820DD4AF 
X-CRM114-Status: UNSURE (   9.81  )
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

Trylock inode->i_rwsem in iterate_dir() to support nowait semantics and
error out -EAGAIN when there is contention.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/readdir.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/readdir.c b/fs/readdir.c
index 6469f076ba6e..664ecd9665a1 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -43,6 +43,8 @@ int iterate_dir(struct file *file, struct dir_context *ctx)
 	struct inode *inode = file_inode(file);
 	bool shared = false;
 	int res = -ENOTDIR;
+	bool nowait;
+
 	if (file->f_op->iterate_shared)
 		shared = true;
 	else if (!file->f_op->iterate)
@@ -52,16 +54,22 @@ int iterate_dir(struct file *file, struct dir_context *ctx)
 	if (res)
 		goto out;
 
-	if (shared)
-		res = down_read_killable(&inode->i_rwsem);
-	else
-		res = down_write_killable(&inode->i_rwsem);
-	if (res)
+	nowait = ctx->flags & DIR_CONTEXT_F_NOWAIT;
+	if (nowait) {
+		res = shared ? down_read_trylock(&inode->i_rwsem) :
+			       down_write_trylock(&inode->i_rwsem);
+		if (!res)
+			res = -EAGAIN;
+	} else {
+		res = shared ? down_read_killable(&inode->i_rwsem) :
+			       down_write_killable(&inode->i_rwsem);
+	}
+	if (res < 0)
 		goto out;
 
 	res = -ENOENT;
 	if (!IS_DEADDIR(inode)) {
-		res = file_accessed(file, ctx->flags & DIR_CONTEXT_F_NOWAIT);
+		res = file_accessed(file, nowait);
 		if (res == -EAGAIN)
 			goto out_unlock;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
