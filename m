Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q1gTE-0006BS-KN
	for linux-mtd@lists.infradead.org; Mon, 21 Mar 2011 14:52:37 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2LEqYF7022702
	for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2011 16:52:34 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBIFS: make debugfs files non-seekable
Date: Mon, 21 Mar 2011 16:55:15 +0200
Message-Id: <1300719315-32168-1-git-send-email-dedekind1@gmail.com>
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

Turn the debufs files UBIFS maintains into non-seekable. Indeed, none
of them is supposed to be seek'ed.

Do this by making the '.lseek()' handler to be 'no_llseek()' and by
using 'nonseekable_open()' in the '.open()' operation.

This does mean an API break but this debugging API is only used by a couple
of test scripts which do not rely in the 'llseek()' operation.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 01c2b02..32b93f3 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2753,7 +2753,7 @@ void dbg_debugfs_exit(void)
 static int open_debugfs_file(struct inode *inode, struct file *file)
 {
 	file->private_data = inode->i_private;
-	return 0;
+	return nonseekable_open(inode, file);
 }
 
 static ssize_t write_debugfs_file(struct file *file, const char __user *buf,
@@ -2783,7 +2783,7 @@ static const struct file_operations dfs_fops = {
 	.open = open_debugfs_file,
 	.write = write_debugfs_file,
 	.owner = THIS_MODULE,
-	.llseek = default_llseek,
+	.llseek = no_llseek,
 };
 
 /**
-- 
1.7.2.3
