Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsWtB-0002LP-SP
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 11:30:54 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [PATCH 2/2] UBIFS: fix a horrid bug
Date: Fri, 28 Jun 2013 14:15:15 +0300
Message-Id: <1372418115-16713-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1372418115-16713-1-git-send-email-dedekind1@gmail.com>
References: <1372418115-16713-1-git-send-email-dedekind1@gmail.com>
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Al Viro pointed me to the fact that '->readdir()' and '->llseek()' have no
mutual exclusion, which means the 'ubifs_dir_llseek()' can be run while we are
in the middle of 'ubifs_readdir()'.

This means that 'file->private_data' can be freed while 'ubifs_readdir()' uses
it, and this is a very bad bug: not only 'ubifs_readdir()' can return garbage,
but this may corrupt memory and lead to all kinds of problems like crashes an
security holes.

This patch fixes the problem by using the 'file->f_version' field, which
'->llseek()' always unconditionally sets to zero. We set it to 1 in
'ubifs_readdir()' and whenever we detect that it became 0, we know there was a
seek and it is time to clear the state saved in 'file->private_data'.

I tested this patch by writing a user-space program which runds readdir and
seek in parallell. I could easily crash the kernel without these patches, but
could not crash it with these patches.

Cc: stable@vger.kernel.org
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Tested-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/dir.c |   30 +++++++++++++++++++++++++++---
 1 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 8e587af..605af51 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -365,6 +365,24 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 		 */
 		return 0;
 
+	if (file->f_version == 0) {
+		/*
+		 * The file was seek'ed, which means that @file->private_data
+		 * is now invalid. This may also be just the first
+		 * 'ubifs_readdir()' invocation, in which case
+		 * @file->private_data is NULL, and the below code is
+		 * basically a no-op.
+		 */
+		kfree(file->private_data);
+		file->private_data = NULL;
+	}
+
+	/*
+	 * 'generic_file_llseek()' unconditionally sets @file->f_version to
+	 * zero, and we use this for detecting whether the file was seek'ed.
+	 */
+	file->f_version = 1;
+
 	/* File positions 0 and 1 correspond to "." and ".." */
 	if (pos == 0) {
 		ubifs_assert(!file->private_data);
@@ -438,6 +456,14 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 		file->f_pos = pos = key_hash_flash(c, &dent->key);
 		file->private_data = dent;
 		cond_resched();
+
+		if (file->f_version == 0)
+			/*
+			 * The file was seek'ed meanwhile, lets return and start
+			 * reading direntries from the new position on the next
+			 * invocation.
+			 */
+			return 0;
 	}
 
 out:
@@ -448,15 +474,13 @@ out:
 
 	kfree(file->private_data);
 	file->private_data = NULL;
+	/* 2 is a special value indicating that there are no more direntries */
 	file->f_pos = 2;
 	return 0;
 }
 
-/* If a directory is seeked, we have to free saved readdir() state */
 static loff_t ubifs_dir_llseek(struct file *file, loff_t offset, int whence)
 {
-	kfree(file->private_data);
-	file->private_data = NULL;
 	return generic_file_llseek(file, offset, whence);
 }
 
-- 
1.7.7.6
