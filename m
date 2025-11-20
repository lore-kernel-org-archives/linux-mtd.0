Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9573FCF64BB
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=am8Jsapl+ABTtdcUtigtMK+pRjvArMIiNU7Dc8ZlPzE=; b=VBJs+egk1Bx+x2
	qLAK0PwaApRZOmla6mKLWZpmA/RMkRsRpfD7UDGUVIF1WJuHlzEl4dhF327voldMfufDAbUY2vg0w
	xqKU37XJvDdoqHo3jgFNcO6DPvYRuJz5LJBsAe5cQGf4IDmrNhUFX0CJ0n8rQWlhL/dFqqdqzaQUC
	3KCRukVLh0QjaSr6fupmC6YwFHdnl+nfcPW8dkSBluakju8wB8mxk2a360WqhTMFK039VVomV9zVi
	5UdoR2c2WoCBvgs6LTgtSncilq5hOYByNZJoGCiOgB9IwcZuI0aIt3qUIcRJ/PsCfIynr4QbQP/Un
	h2iXYGQmrpM9g5w+wAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUl-00000006F6c-2d2Q;
	Thu, 20 Nov 2025 06:50:19 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUk-00000006F1Q-0Ta3;
	Thu, 20 Nov 2025 06:50:18 +0000
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
Subject: [PATCH 09/16] fs: exit early in generic_update_time when there is no work
Date: Thu, 20 Nov 2025 07:47:30 +0100
Message-ID: <20251120064859.2911749-10-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120064859.2911749-1-hch@lst.de>
References: <20251120064859.2911749-1-hch@lst.de>
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

Exit early if not attributes are to be updated, to avoid a spurious call
to __mark_inode_dirty which can turn into a fairly expensive no-op due to
the extra checks and locking.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/inode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/inode.c b/fs/inode.c
index 15a8b2cf78ef..cda78f76e1dd 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2110,6 +2110,9 @@ int generic_update_time(struct inode *inode, int flags)
 	int updated = inode_update_timestamps(inode, flags);
 	int dirty_flags = 0;
 
+	if (!updated)
+		return 0;
+
 	if (updated & (S_ATIME|S_MTIME|S_CTIME))
 		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
 	if (updated & S_VERSION)
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
