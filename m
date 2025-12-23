Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61F8E6B26A
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 00:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJ51x5+btwDr5o/EE9Olk3ckAEX9o3dANoGFQ26iBmM=; b=FL6FVd0HMnbqZ0
	TFx6nQBsUrRh6zHcoXYfE8W/J4E5QJcHZWIEkRQXzKQOQhjqxvZJeeJf32MV+ZfrCsRWfvFDW2QPn
	oze/AUCDm2/LmTWZyvkjq5ZV0qBJ1IYVBYf0LylugOaEFaFs5du66G1XFD6SO9m92vas0nge545cj
	kWM1XTzDIRWdbWkWkEGxwlZrEAIHlEhsZXGZkrAo843am+rstj+74qEpm8GGs83GKbv1MbUqBkNbA
	ESp7NRaO9pGKZ63VLGW4DPtO8jGPVxIcP36a1eXajfqpvcmSO8WKHv+ZuMj0HVX6BdY718AYouNm5
	P7OGMsQmcnd/4+WgoJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQ0-0000000EIqq-1z6Q;
	Tue, 23 Dec 2025 00:38:28 +0000
Received: from s58.ghokkaidofl2.vectant.ne.jp ([202.215.7.58] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqPy-0000000EIoY-2kcy;
	Tue, 23 Dec 2025 00:38:26 +0000
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
Subject: [PATCH 04/11] fs: delay the actual timestamp updates in inode_update_timestamps
Date: Tue, 23 Dec 2025 09:37:47 +0900
Message-ID: <20251223003756.409543-5-hch@lst.de>
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

Perform the actual updates of the inode timestamp at the very end of
inode_update_timestamps after finishing all checks.  This prepares for
adding non-blocking timestamp updates where we might bail out instead of
performing this updates if the update would block.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/inode.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 876641a6e478..19f50bdb6f7d 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2109,10 +2109,8 @@ int inode_update_timestamps(struct inode *inode, int flags)
 		now = inode_set_ctime_current(inode);
 		if (!timespec64_equal(&now, &ctime))
 			updated |= S_CTIME;
-		if (!timespec64_equal(&now, &mtime)) {
-			inode_set_mtime_to_ts(inode, now);
+		if (!timespec64_equal(&now, &mtime))
 			updated |= S_MTIME;
-		}
 		if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, updated))
 			updated |= S_VERSION;
 	} else {
@@ -2122,11 +2120,14 @@ int inode_update_timestamps(struct inode *inode, int flags)
 	if (flags & S_ATIME) {
 		struct timespec64 atime = inode_get_atime(inode);
 
-		if (!timespec64_equal(&now, &atime)) {
-			inode_set_atime_to_ts(inode, now);
+		if (!timespec64_equal(&now, &atime))
 			updated |= S_ATIME;
-		}
 	}
+
+	if (updated & S_MTIME)
+		inode_set_mtime_to_ts(inode, now);
+	if (updated & S_ATIME)
+		inode_set_atime_to_ts(inode, now);
 	return updated;
 }
 EXPORT_SYMBOL(inode_update_timestamps);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
