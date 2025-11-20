Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D29ECF64BB
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoLo8om9JSqlW71/fuL9cNc+i7QAf3NkYEfZQlJoZwg=; b=bgK65mv7Qmacu0
	BziX2dvXX07Kg7Ze0joV8oFLwpw9v03znkLIQSjKUJJzj7I71nHRb7lfrB7quyoLcz8OiajUAayeM
	1WwJKNFZLXKn/rAgOoYkPfftV2hIeD8vJtA6R3Tk2LG/qDMB22msCaqZPadEeCnZY1GI+FWWPRnAH
	gZS2rfLvVDMvuT7E1GefgYSkpTiIdezJlD0uAglWgj+KHLNMzYFCFWv/fe8vPVg1scycP0OU8r3Rl
	xGB3gHRHuPKuzrWhI54CJSRHT4eipoJpxuVkQIwp47sfg9RkkoYs+TXA9HdiIRerBQheojFUmP3/H
	PewQxdRL4DBskIsXy23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUA-00000006Elm-0PiT;
	Thu, 20 Nov 2025 06:49:42 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyU9-00000006Ein-02Nc;
	Thu, 20 Nov 2025 06:49:41 +0000
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
Subject: [PATCH 04/16] btrfs: use vfs_utimes to update file timestamps
Date: Thu, 20 Nov 2025 07:47:25 +0100
Message-ID: <20251120064859.2911749-5-hch@lst.de>
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

Btrfs updates the device node timestamps for block device special files
when it stop using the device.

Commit 8f96a5bfa150 ("btrfs: update the bdev time directly when closing")
switch that update from the correct layering to directly call the
low-level helper on the bdev inode.  This is wrong and got fixed in
commit 54fde91f52f5 ("btrfs: update device path inode time instead of
bd_inode") by updating the file system inode instead of the bdev inode,
but this kept the incorrect bypassing of the VFS interfaces and file
system ->update_times method.  Fix this by using the propet vfs_utimes
interface.

Fixes: 8f96a5bfa150 ("btrfs: update the bdev time directly when closing")
Fixes: 54fde91f52f5 ("btrfs: update device path inode time instead of bd_inode")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/volumes.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 2bec544d8ba3..259e8b0496df 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -2002,14 +2002,11 @@ static int btrfs_add_dev_item(struct btrfs_trans_handle *trans,
 static void update_dev_time(const char *device_path)
 {
 	struct path path;
-	int ret;
 
-	ret = kern_path(device_path, LOOKUP_FOLLOW, &path);
-	if (ret)
-		return;
-
-	inode_update_time(d_inode(path.dentry), S_MTIME | S_CTIME | S_VERSION);
-	path_put(&path);
+	if (!kern_path(device_path, LOOKUP_FOLLOW, &path)) {
+		vfs_utimes(&path, NULL);
+		path_put(&path);
+	}
 }
 
 static int btrfs_rm_dev_item(struct btrfs_trans_handle *trans,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
