Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCssB-0001Zd-M4
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 12:20:42 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3LCKaj3002208
	for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2011 15:20:36 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] UBIFS: use ro_mount instead of MS_RDONLY
Date: Thu, 21 Apr 2011 15:23:55 +0300
Message-Id: <1303388635-28296-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303388635-28296-1-git-send-email-dedekind1@gmail.com>
References: <1303388635-28296-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

We have our own flags indicating R/O mode, and c->ro_mode is equivalent
to MS_RDONLY. Let's be consistent and use UBIFS flags everywhere.
This patch is just a minor cleanup.

Additionally, add a comment that we are surprised with VFS behavior -
as a reminder to look at this some day.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/file.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 3594aae..adce3b7 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1312,7 +1312,11 @@ int ubifs_fsync(struct file *file, int datasync)
 
 	dbg_gen("syncing inode %lu", inode->i_ino);
 
-	if (inode->i_sb->s_flags & MS_RDONLY)
+	if (c->ro_mount)
+		/*
+		 * For some really strange reasons VFS does not filter out
+		 * 'fsync()' for R/O mounted file-systems as per 2.6.39.
+		 */
 		return 0;
 
 	/*
-- 
1.7.2.3
