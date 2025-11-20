Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F33FCF8548
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EntNBP6BaunZcY7IAMOO1/+9gZ353DXwloG05HEGgg0=; b=uBiUleN1ii/vWF
	5jzfphHyrqRKxdTu/sFnpP+o3AdoFI+KS+1OsdT3QaMTd5CYy+Id05Z9PMpC2Fl4U0MkpGTM1PAdq
	w452lzzI3v7rzZnK0X+t1OkloOC+SgOwmTkxZ5W13Nz+McoN8TDKfnMrhBSnfK3BZbcFwM3xR5BCT
	HZtXe3ONxlhJ7+bqIiaOi5SP+EZl1SqISbKv+3gvvAVCdo6ZeDvrN2zlL5+Z/f57zfWMqUzWQPAoE
	5FFWE1oTc/DtJ2QTV7Gd173sJ8UOsxGNCHUSd+cZWA6BJRLTjrbq8k0Lllu2zeyyY2pnhBY+0DDCi
	MVm/UFMpWHliJRixwY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUN-00000006Erc-3BKt;
	Thu, 20 Nov 2025 06:49:55 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUM-00000006EoQ-0JMD;
	Thu, 20 Nov 2025 06:49:54 +0000
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
Subject: [PATCH 06/16] orangefs: use inode_update_timestamps directly
Date: Thu, 20 Nov 2025 07:47:27 +0100
Message-ID: <20251120064859.2911749-7-hch@lst.de>
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

Orangefs has no i_version handling and __orangefs_setattr already
explicitly marks the inode dirty.  So instead of the using
the flags return value from generic_update_time, just call the
lower level inode_update_timestamps helper directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/orangefs/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index a01400cd41fd..55f6c8026812 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -878,7 +878,9 @@ int orangefs_update_time(struct inode *inode, int flags)
 
 	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
 	    get_khandle_from_ino(inode));
-	flags = generic_update_time(inode, flags);
+
+	flags = inode_update_timestamps(inode, flags);
+
 	memset(&iattr, 0, sizeof iattr);
         if (flags & S_ATIME)
 		iattr.ia_valid |= ATTR_ATIME;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
