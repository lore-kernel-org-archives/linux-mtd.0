Received: from mail.sysgo.com ([176.9.12.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIEbD-0006mI-Sh
 for linux-mtd@lists.infradead.org; Tue, 06 Jun 2017 13:32:45 +0000
From: David Engraf <david.engraf@sysgo.com>
To: linux-mtd@lists.infradead.org
Cc: David Engraf <david.engraf@sysgo.com>
Subject: [PATCH] mkfs.ubifs: Allow root entry in device table
Date: Tue,  6 Jun 2017 15:31:58 +0200
Message-Id: <20170606133158.6973-1-david.engraf@sysgo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When using a local root folder the permissions, user and group settings
are taken from the local folder. These permissions might be incorrect if
the folder has been created for the local user. Creating an UBIFS image
on my local system resulted in the following output on the target:

drwx------   17 1000     1000   1264 Jan  1 00:00 .
drwx------   17 1000     1000   1264 Jan  1 00:00 ..
drwxr-xr-x    2 root     root   9104 May 30  2017 bin
drwxr-xr-x    7 root     root   2760 Jan  1 00:00 dev
...

mkfs.ubifs aborts with an error message when the device table contains
a root entry. This patch allows setting the root folder permissions,
user and group to overwrite local configurations.
---
 ubifs-utils/mkfs.ubifs/devtable.c   |  8 ++++----
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/devtable.c b/ubifs-utils/mkfs.ubifs/devtable.c
index 3b46abc..10faaca 100644
--- a/ubifs-utils/mkfs.ubifs/devtable.c
+++ b/ubifs-utils/mkfs.ubifs/devtable.c
@@ -146,16 +146,16 @@ static int interpret_table_entry(const char *line)
 		increment, count);
 
 	len = strnlen(buf, 1024);
+	if (len == 0)
+		return err_msg("empty path");
 	if (len == 1024)
 		return err_msg("too long path");
 
-	if (!strcmp(buf, "/"))
+	if (buf[0] != '/')
 		return err_msg("device table entries require absolute paths");
-	if (buf[1] == '\0')
-		return err_msg("root directory cannot be created");
 	if (strstr(buf, "//"))
 		return err_msg("'//' cannot be used in the path");
-	if (buf[len - 1] == '/')
+	if (len > 1 && buf[len - 1] == '/')
 		return err_msg("do not put '/' at the end");
 
 	if (strstr(buf, "/./") || strstr(buf, "/../") ||
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index a60052d..52ed511 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1823,6 +1823,8 @@ static int write_data(void)
 {
 	int err;
 	mode_t mode = S_IFDIR | S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
+	struct path_htbl_element *ph_elt;
+	struct name_htbl_element *nh_elt;
 
 	if (root) {
 		err = stat(root, &root_st);
@@ -1835,6 +1837,17 @@ static int write_data(void)
 		root_st.st_mode = mode;
 	}
 
+	/*
+	 * Check for root entry and update permissions if it exists. This will
+	 * also remove the entry from the device table list.
+	 */
+	ph_elt = devtbl_find_path("/");
+	if (ph_elt) {
+		nh_elt = devtbl_find_name(ph_elt, "");
+		if (nh_elt && override_attributes(&root_st, ph_elt, nh_elt))
+			return -1;
+	}
+
 	head_flags = 0;
 
 	err = create_inum_attr(UBIFS_ROOT_INO, root);
-- 
2.11.0
