Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6x-0002Vi-Fo
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:21 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEJ028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:06 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/30] UBIFS: introduce debugfs helpers
Date: Thu,  9 Jun 2011 12:04:59 +0300
Message-Id: <1307610310-28691-20-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Separate out pieces of code from the debugfs file read/write functions and
create separate 'interpret_user_input()'/'provide_user_output()' helpers. These
helpers will be needed in one of the following patches, so this is just a
preparational change.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   76 +++++++++++++++++++++++++++++++++++++++--------------
 1 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 515658c..91ac72c 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2820,13 +2820,39 @@ static int dfs_file_open(struct inode *inode, struct file *file)
 	return nonseekable_open(inode, file);
 }
 
+/**
+ * provide_user_output - provide output to the user reading a debugfs file.
+ * @val: boolean value for the answer
+ * @u: the buffer to store the answer at
+ * @count: size of the buffer
+ * @ppos: position in the @u output buffer
+ *
+ * This is a simple helper function which stores @val boolean value in the user
+ * buffer when the user reads one of UBIFS debugfs files. Returns amount of
+ * bytes written to @u in case of success and a negative error code in case of
+ * failure.
+ */
+static int provide_user_output(int val, char __user *u, size_t count,
+			       loff_t *ppos)
+{
+	char buf[3];
+
+	if (val)
+		buf[0] = '1';
+	else
+		buf[0] = '0';
+	buf[1] = '\n';
+	buf[2] = 0x00;
+
+	return simple_read_from_buffer(u, count, ppos, buf, 2);
+}
+
 static ssize_t dfs_file_read(struct file *file, char __user *u, size_t count,
 			     loff_t *ppos)
 {
 	struct dentry *dent = file->f_path.dentry;
 	struct ubifs_info *c = file->private_data;
 	struct ubifs_debug_info *d = c->dbg;
-	char buf[3];
 	int val;
 
 	if (dent == d->dfs_chk_gen)
@@ -2844,14 +2870,33 @@ static ssize_t dfs_file_read(struct file *file, char __user *u, size_t count,
 	else
 		return -EINVAL;
 
-	if (val)
-		buf[0] = '1';
-	else
-		buf[0] = '0';
-	buf[1] = '\n';
-	buf[2] = 0x00;
+	return provide_user_output(val, u, count, ppos);
+}
 
-	return simple_read_from_buffer(u, count, ppos, buf, 2);
+/**
+ * interpret_user_input - interpret user debugfs file input.
+ * @u: user-provided buffer with the input
+ * @count: buffer size
+ *
+ * This is a helper function which interpret user input to a boolean UBIFS
+ * debugfs file. Returns %0 or %1 in case of success and a negative error code
+ * in case of failure.
+ */
+static int interpret_user_input(const char __user *u, size_t count)
+{
+	size_t buf_size;
+	char buf[8];
+
+	buf_size = min_t(size_t, count, (sizeof(buf) - 1));
+	if (copy_from_user(buf, u, buf_size))
+		return -EFAULT;
+
+	if (buf[0] == '1')
+		return 1;
+	else if (buf[0] == '0')
+		return 0;
+
+	return -EINVAL;
 }
 
 static ssize_t dfs_file_write(struct file *file, const char __user *u,
@@ -2860,8 +2905,6 @@ static ssize_t dfs_file_write(struct file *file, const char __user *u,
 	struct ubifs_info *c = file->private_data;
 	struct ubifs_debug_info *d = c->dbg;
 	struct dentry *dent = file->f_path.dentry;
-	size_t buf_size;
-	char buf[8];
 	int val;
 
 	/*
@@ -2883,16 +2926,9 @@ static ssize_t dfs_file_write(struct file *file, const char __user *u,
 		return count;
 	}
 
-	buf_size = min_t(size_t, count, (sizeof(buf) - 1));
-	if (copy_from_user(buf, u, buf_size))
-		return -EFAULT;
-
-	if (buf[0] == '1')
-		val = 1;
-	else if (buf[0] == '0')
-		val = 0;
-	else
-		return -EINVAL;
+	val = interpret_user_input(u, count);
+	if (val < 0)
+		return val;
 
 	if (dent == d->dfs_chk_gen)
 		d->chk_gen = val;
-- 
1.7.2.3
