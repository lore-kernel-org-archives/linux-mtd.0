Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmZtf-0002p3-ON
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 04:12:08 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <david@sigma-star.at>, <dedekind1@gmail.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 06/27] ubifs: cut off the dependence from devtable to
 mkfs.ubifs.h
Date: Thu, 15 Oct 2015 12:04:29 +0800
Message-ID: <1444881890-4012-7-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Refactor the devtable related definitions in mkfs.ubifs.h
to a new devtable.h

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/mkfs.ubifs/devtable.c   |  3 +-
 ubifs-utils/mkfs.ubifs/devtable.h   | 55 +++++++++++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h | 54 +-----------------------------------
 3 files changed, 58 insertions(+), 54 deletions(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/devtable.h

diff --git a/ubifs-utils/mkfs.ubifs/devtable.c b/ubifs-utils/mkfs.ubifs/devtable.c
index dee035d..1fc0256 100644
--- a/ubifs-utils/mkfs.ubifs/devtable.c
+++ b/ubifs-utils/mkfs.ubifs/devtable.c
@@ -44,7 +44,8 @@
  * for more information about what the device table is.
  */
 
-#include "mkfs.ubifs.h"
+#include "ubifs_common.h"
+#include "devtable.h"
 #include "hashtable/hashtable.h"
 #include "hashtable/hashtable_itr.h"
 
diff --git a/ubifs-utils/mkfs.ubifs/devtable.h b/ubifs-utils/mkfs.ubifs/devtable.h
new file mode 100644
index 0000000..987d4d4
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/devtable.h
@@ -0,0 +1,55 @@
+#include "ubifs_common.h"
+
+/**
+ * struct path_htbl_element - an element of the path hash table.
+ * @path: the UBIFS path the element describes (the key of the element)
+ * @name_htbl: one more (nested) hash table containing names of all
+ *             files/directories/device nodes which should be created at this
+ *             path
+ *
+ * See device table handling for more information.
+ */
+struct path_htbl_element {
+	const char *path;
+	struct hashtable *name_htbl;
+};
+
+/**
+ * struct name_htbl_element - an element in the name hash table
+ * @name: name of the file/directory/device node (the key of the element)
+ * @mode: accsess rights and file type
+ * @uid: user ID
+ * @gid: group ID
+ * @major: device node major number
+ * @minor: device node minor number
+ *
+ * This is an element of the name hash table. Name hash table sits in the path
+ * hash table elements and describes file names which should be created/changed
+ * at this path.
+ */
+struct name_htbl_element {
+	const char *name;
+	unsigned int mode;
+	unsigned int uid;
+	unsigned int gid;
+	dev_t dev;
+};
+
+extern struct ubifs_info info_;
+
+struct hashtable_itr;
+
+int parse_devtable(const char *tbl_file);
+struct path_htbl_element *devtbl_find_path(const char *path);
+struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
+					   const char *name);
+int override_attributes(struct stat *st, struct path_htbl_element *ph_elt,
+			struct name_htbl_element *nh_elt);
+struct name_htbl_element *
+first_name_htbl_element(struct path_htbl_element *ph_elt,
+			struct hashtable_itr **itr);
+struct name_htbl_element *
+next_name_htbl_element(struct path_htbl_element *ph_elt,
+			struct hashtable_itr **itr);
+void free_devtable_info(void);
+
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
index ba646a6..1963e12 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -34,6 +34,7 @@
 #include "key.h"
 #include "lpt.h"
 #include "compr.h"
+#include "devtable.h"
 #include "io.h"
 
 /*
@@ -50,57 +51,4 @@
 #error MKFS_UBIFS_COMPR_ZLIB != UBIFS_COMPR_ZLIB
 #endif
 
-/**
- * struct path_htbl_element - an element of the path hash table.
- * @path: the UBIFS path the element describes (the key of the element)
- * @name_htbl: one more (nested) hash table containing names of all
- *             files/directories/device nodes which should be created at this
- *             path
- *
- * See device table handling for more information.
- */
-struct path_htbl_element {
-	const char *path;
-	struct hashtable *name_htbl;
-};
-
-/**
- * struct name_htbl_element - an element in the name hash table
- * @name: name of the file/directory/device node (the key of the element)
- * @mode: accsess rights and file type
- * @uid: user ID
- * @gid: group ID
- * @major: device node major number
- * @minor: device node minor number
- *
- * This is an element of the name hash table. Name hash table sits in the path
- * hash table elements and describes file names which should be created/changed
- * at this path.
- */
-struct name_htbl_element {
-	const char *name;
-	unsigned int mode;
-	unsigned int uid;
-	unsigned int gid;
-	dev_t dev;
-};
-
-extern struct ubifs_info info_;
-
-struct hashtable_itr;
-
-int parse_devtable(const char *tbl_file);
-struct path_htbl_element *devtbl_find_path(const char *path);
-struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
-					   const char *name);
-int override_attributes(struct stat *st, struct path_htbl_element *ph_elt,
-			struct name_htbl_element *nh_elt);
-struct name_htbl_element *
-first_name_htbl_element(struct path_htbl_element *ph_elt,
-			struct hashtable_itr **itr);
-struct name_htbl_element *
-next_name_htbl_element(struct path_htbl_element *ph_elt,
-		       struct hashtable_itr **itr);
-void free_devtable_info(void);
-
 #endif
-- 
1.8.4.2
