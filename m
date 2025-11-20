Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A0CCF8548
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9i4scs+A7pAdeECBr1w3P8H2DYZGLowkyuW4CevcI/M=; b=TPs8eTFYKGL5oq
	PgXMhBU7ap7O79WPkRIIfvQTIvJVdChrgfuX3uFlyHaSKYj9EGaAfEP1QYzdUIAZINapbVlRAour9
	a5L0pYSJCmyCEakzicag52eWH/mG5/m4XU5HhVcQc8tAhjsZdCjtQLucMmRgk1im0Fo+UxvFZ1lM2
	1Lfjv7RkgNnEbvRwqPvhkMD4smH4XjbV0g0xHAmNB1gydRB5ZpIUWgUiiiOilMp9sFVDXgj2gQQFQ
	4l3Niw4NMEsyfxmxcgXsCKJWh3krUrPF1cFc0PwO0aD43eeazz5ZCcVn6YBx1LDMjiOkNvZRIfCUL
	ddC2S6gtQ5tt1vAX7pRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUH-00000006Eou-1p6d;
	Thu, 20 Nov 2025 06:49:49 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUF-00000006ElW-0NA4;
	Thu, 20 Nov 2025 06:49:47 +0000
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
Subject: [PATCH 05/16] btrfs: fix the comment on btrfs_update_time
Date: Thu, 20 Nov 2025 07:47:26 +0100
Message-ID: <20251120064859.2911749-6-hch@lst.de>
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

Since commit e41f941a2311 ("Btrfs: move over to use ->update_time") this
is not a copy of the high-level file_update_time helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 6282911e536f..05f6d272c5d7 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -6291,8 +6291,8 @@ static int btrfs_dirty_inode(struct btrfs_inode *inode)
 }
 
 /*
- * This is a copy of file_update_time.  We need this so we can return error on
- * ENOSPC for updating the inode in the case of file write and mmap writes.
+ * We need our own ->update_time so that we can return error on ENOSPC for
+ * updating the inode in the case of file write and mmap writes.
  */
 static int btrfs_update_time(struct inode *inode, int flags)
 {
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
