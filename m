Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQUuc-0007kh-4A
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 09:39:27 +0000
From: Ritesh Harjani <riteshh@codeaurora.org>
To: linux-mtd@lists.infradead.org, richard@nod.at,
 david.oberhollenzer@sigma-star.at
Cc: Ritesh Harjani <riteshh@codeaurora.org>
Subject: [RFC PATCH 1/2] mkfs.ubifs: add_xattr is not depending on host XATTR
 support
Date: Wed,  6 Jun 2018 15:08:59 +0530
Message-Id: <1528277940-30919-2-git-send-email-riteshh@codeaurora.org>
In-Reply-To: <1528277940-30919-1-git-send-email-riteshh@codeaurora.org>
References: <1528277940-30919-1-git-send-email-riteshh@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add_xattr adds the xattr to the ubifs image and has nothing
to do with host XATTR support.

Now that we are adding support where selinux interfaces
may use this API even when host OS(where ubi/ubifs image
is being created) does not support XATTR -so remove it
from WITHOUT_XATTR #ifdef.

Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 80 ++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 6323dd4..2333dde 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1007,46 +1007,6 @@ static int add_node(union ubifs_key *key, char *name, void *node, int len)
 	return 0;
 }
 
-#ifdef WITHOUT_XATTR
-static inline int create_inum_attr(ino_t inum, const char *name)
-{
-	(void)inum;
-	(void)name;
-
-	return 0;
-}
-
-static inline int inode_add_xattr(struct ubifs_ino_node *host_ino,
-				  const char *path_name, struct stat *st, ino_t inum)
-{
-	(void)host_ino;
-	(void)path_name;
-	(void)st;
-	(void)inum;
-
-	return 0;
-}
-#else
-static int create_inum_attr(ino_t inum, const char *name)
-{
-	char *str;
-	int ret;
-
-	if (!do_create_inum_attr)
-		return 0;
-
-	ret = asprintf(&str, "%llu", (unsigned long long)inum);
-	if (ret < 0)
-		return -1;
-
-	ret = lsetxattr(name, "user.image-inode-number", str, ret, 0);
-
-	free(str);
-
-	return ret;
-}
-
-
 static int add_xattr(struct stat *st, ino_t inum, const void *data,
 		     unsigned int data_len, struct qstr *nm)
 {
@@ -1117,6 +1077,46 @@ out:
 	return ret;
 }
 
+#ifdef WITHOUT_XATTR
+static inline int create_inum_attr(ino_t inum, const char *name)
+{
+	(void)inum;
+	(void)name;
+
+	return 0;
+}
+
+static inline int inode_add_xattr(struct ubifs_ino_node *host_ino,
+				  const char *path_name,
+				  struct stat *st, ino_t inum)
+{
+	(void)host_ino;
+	(void)path_name;
+	(void)st;
+	(void)inum;
+
+	return 0;
+}
+#else
+static int create_inum_attr(ino_t inum, const char *name)
+{
+	char *str;
+	int ret;
+
+	if (!do_create_inum_attr)
+		return 0;
+
+	ret = asprintf(&str, "%llu", (unsigned long long)inum);
+	if (ret < 0)
+		return ret;
+
+	ret = lsetxattr(name, "user.image-inode-number", str, ret, 0);
+
+	free(str);
+
+	return ret;
+}
+
 static int inode_add_xattr(struct ubifs_ino_node *host_ino,
 			   const char *path_name, struct stat *st, ino_t inum)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
a Linux Foundation Collaborative Project.
