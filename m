Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P16CK-0001hH-RQ
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 23:36:30 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 30DC11B43F8
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 23:29:29 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mkfs.jffs2: use new xasprintf() helper
Date: Wed, 29 Sep 2010 19:30:24 -0400
Message-Id: <1285803024-13572-3-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 mkfs.jffs2.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 1ea3598..528a7fe 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -391,14 +391,14 @@ static struct filesystem_entry *recursive_add_host_directory(
 			continue;
 		}
 
-		asprintf(&hpath, "%s/%s", hostpath, dp->d_name);
+		xasprintf(&hpath, "%s/%s", hostpath, dp->d_name);
 		if (lstat(hpath, &sb)) {
 			perror_msg_and_die("%s", hpath);
 		}
 		if (strcmp(targetpath, "/") == 0) {
-			asprintf(&tpath, "%s%s", targetpath, dp->d_name);
+			xasprintf(&tpath, "%s%s", targetpath, dp->d_name);
 		} else {
-			asprintf(&tpath, "%s/%s", targetpath, dp->d_name);
+			xasprintf(&tpath, "%s/%s", targetpath, dp->d_name);
 		}
 
 		switch (sb.st_mode & S_IFMT) {
@@ -489,7 +489,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 		error_msg_and_die("Device table entries require absolute paths");
 	}
 
-	asprintf(&hostpath, "%s%s", rootdir, name);
+	xasprintf(&hostpath, "%s%s", rootdir, name);
 
 	/* Check if this file already exists... */
 	switch (type) {
@@ -556,8 +556,8 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 					char *dname, *hpath;
 
 					for (i = start; i < count; i++) {
-						asprintf(&dname, "%s%lu", name, i);
-						asprintf(&hpath, "%s/%s%lu", rootdir, name, i);
+						xasprintf(&dname, "%s%lu", name, i);
+						xasprintf(&hpath, "%s/%s%lu", rootdir, name, i);
 						rdev = makedev(major, minor + (i * increment - start));
 						add_host_filesystem_entry(dname, hpath, uid, gid,
 								mode, rdev, parent);
-- 
1.7.2.3
