Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DB5E6B26A
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ny0VuhjkPtLqPEebUyG/z3x0S2/U/gekRQLYME6WS3s=; b=Mjv3TN000iIr6H
	arxmA5mo4N3sScaXrmFyZ27Fb0LzGIfPJKDeetQ8TTU1ggdHuRElMAgxyxI36r8H9Kt1hGZmFaCq7
	DXbzbLvVHwzB9ur797x3Rgp91ZU042k9aLgornrTSQvbh9Q8XWHxLzskB3RQwvBkX7ZaRjr2s/WTl
	4SXVrrVMvpZeFJaKTknmj63Y1I0nbJh+mcSDay3k/4EHMumRMJ3qVLA7w0b19MvnOrKZc0HRAw5FU
	4gYuqPLRACVRUnVfb4h1IE8ubkQ+5v3EfSTvvCj+o/avojN9pTEVOpFxXz9xFjGdhKDZR+wR1jLMJ
	mV5Owd3HrQGRGs9Gks2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQQ-0000000EJA2-2Vsu;
	Tue, 23 Dec 2025 00:38:54 +0000
Received: from s58.ghokkaidofl2.vectant.ne.jp ([202.215.7.58] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQO-0000000EJ5E-16w0;
	Tue, 23 Dec 2025 00:38:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>,
	Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: [PATCH 09/11] fat: enable non-blocking timestamp updates
Date: Tue, 23 Dec 2025 09:37:52 +0900
Message-ID: <20251223003756.409543-10-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223003756.409543-1-hch@lst.de>
References: <20251223003756.409543-1-hch@lst.de>
MIME-Version: 1.0
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

As fat dosn't implement ->dirty_inode, nothing in fat_update_time can
block, and fat can thus trivially implement non-blocking timestamp
updates.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/fat/misc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index 5df3193c35f9..950da09f0961 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -346,9 +346,6 @@ int fat_update_time(struct inode *inode, int flags)
 	if (inode->i_ino == MSDOS_ROOT_INO)
 		return 0;
 
-	if (flags & S_NOWAIT)
-		return -EAGAIN;
-
 	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
 		fat_truncate_time(inode, NULL, flags);
 		if (inode->i_sb->s_flags & SB_LAZYTIME)
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
