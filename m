Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E73CDE00F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 06:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dC0SsjiK8fVRlqwztUZNO9XVeEgbU6yzbQ2SGcF1Z1s=; b=Iz7kuXrYa78gC2
	iXvB7XsbzlJKwHKPyuM0q2oPoS0ety9+Y6N61OudtJ+2It2PKmffMwygE1G3JWeDoma2jWighARXP
	+Htv3q1Bv3Yrit8bjE8fMozPw799OV5dXds9IhOMndFK2sws30hw5kvBrvrpLTo3GiDi+/bc8Uorq
	xcC+tUmxHgiteoY5GtkgEA/BlIqoNVWBbdV/rcKbudHvBgrdYaR1ZpFRcaxl2ZlOhEYvcc76EJiL+
	nB3egDHjTstkavXSSL8d40BcM8ejvlii3EEgF/R/CRGXUJFwHQIindoVBL9mx6CSUgVm8nlUoAIc8
	8CEPEWTXdxE7gXPC0IZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnGv-0000000BeSm-3Wn5;
	Fri, 14 Nov 2025 06:27:01 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnGu-0000000BeR1-1lrp;
	Fri, 14 Nov 2025 06:27:01 +0000
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
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: [PATCH 02/14] fs: lift the FMODE_NOCMTIME check into file_update_time_flags
Date: Fri, 14 Nov 2025 07:26:05 +0100
Message-ID: <20251114062642.1524837-3-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114062642.1524837-1-hch@lst.de>
References: <20251114062642.1524837-1-hch@lst.de>
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

FMODE_NOCMTIME used to be just a hack for the legacy XFS handle-based
"invisible I/O", but commit e5e9b24ab8fa ("nfsd: freeze c/mtime updates
with outstanding WRITE_ATTRS delegation") started using it from
generic callers.

I'm not sure other file systems are actually read for this in general,
so the above commit should get a closer look, but for it to make any
sense, file_update_time needs to respect the flag.

Lift the check from file_modified_flags to file_update_time so that
users of file_update_time inherit the behavior and so that all the
checks are done in one place.

Fixes: e5e9b24ab8fa ("nfsd: freeze c/mtime updates with outstanding WRITE_ATTRS delegation")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 4884ffa931e7..24dab63844db 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2320,6 +2320,8 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
 	/* First try to exhaust all avenues to not sync */
 	if (IS_NOCMTIME(inode))
 		return 0;
+	if (unlikely(file->f_mode & FMODE_NOCMTIME))
+		return 0;
 
 	now = current_time(inode);
 
@@ -2391,8 +2393,6 @@ static int file_modified_flags(struct file *file, int flags)
 	ret = file_remove_privs_flags(file, flags);
 	if (ret)
 		return ret;
-	if (unlikely(file->f_mode & FMODE_NOCMTIME))
-		return 0;
 	return file_update_time_flags(file, flags);
 }
 
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
