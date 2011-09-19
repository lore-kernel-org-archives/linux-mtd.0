Received: from mga11.intel.com ([192.55.52.93])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5bzr-0001sx-EL
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:26:48 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 5/7] jffs2reader: use const char * for path variables
Date: Mon, 19 Sep 2011 14:25:22 +0300
Message-Id: <1a9cfb004ee69f7b94e6e7407d8b3d4f37ca8aa3.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
Cc: Alexey Dokuchaev <danfe@nsu.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch brings const char * type for path variables. It allows to eliminate
compiler warning.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 jffs2reader.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index 52f8d34..c0d118c 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -106,7 +106,7 @@ int target_endian = __BYTE_ORDER;
 
 void putblock(char *, size_t, size_t *, struct jffs2_raw_inode *);
 struct dir *putdir(struct dir *, struct jffs2_raw_dirent *);
-void printdir(char *o, size_t size, struct dir *d, char *path,
+void printdir(char *o, size_t size, struct dir *d, const char *path,
 		int recurse);
 void freedir(struct dir *);
 
@@ -116,12 +116,12 @@ struct jffs2_raw_dirent *resolvedirent(char *, size_t, uint32_t, uint32_t,
 struct jffs2_raw_dirent *resolvename(char *, size_t, uint32_t, char *, uint8_t);
 struct jffs2_raw_dirent *resolveinode(char *, size_t, uint32_t);
 
-struct jffs2_raw_dirent *resolvepath0(char *, size_t, uint32_t, char *,
+struct jffs2_raw_dirent *resolvepath0(char *, size_t, uint32_t, const char *,
 		uint32_t *, int);
-struct jffs2_raw_dirent *resolvepath(char *, size_t, uint32_t, char *,
+struct jffs2_raw_dirent *resolvepath(char *, size_t, uint32_t, const char *,
 		uint32_t *);
 
-void lsdir(char *, size_t, char *, int);
+void lsdir(char *, size_t, const char *, int);
 void catfile(char *, size_t, char *, char *, size_t, size_t *);
 
 int main(int, char **);
@@ -299,7 +299,7 @@ const char *mode_string(int mode)
    d       - dir struct
  */
 
-void printdir(char *o, size_t size, struct dir *d, char *path, int recurse)
+void printdir(char *o, size_t size, struct dir *d, const char *path, int recurse)
 {
 	char m;
 	char *filetime;
@@ -678,7 +678,7 @@ struct jffs2_raw_dirent *resolveinode(char *o, size_t size, uint32_t ino)
  */
 
 struct jffs2_raw_dirent *resolvepath0(char *o, size_t size, uint32_t ino,
-		char *p, uint32_t * inos, int recc)
+		const char *p, uint32_t * inos, int recc)
 {
 	struct jffs2_raw_dirent *dir = NULL;
 
@@ -794,7 +794,7 @@ struct jffs2_raw_dirent *resolvepath0(char *o, size_t size, uint32_t ino,
  */
 
 struct jffs2_raw_dirent *resolvepath(char *o, size_t size, uint32_t ino,
-		char *p, uint32_t * inos)
+		const char *p, uint32_t * inos)
 {
 	return resolvepath0(o, size, ino, p, inos, 0);
 }
@@ -807,7 +807,7 @@ struct jffs2_raw_dirent *resolvepath(char *o, size_t size, uint32_t ino,
    p       - path to be resolved
  */
 
-void lsdir(char *o, size_t size, char *path, int recurse)
+void lsdir(char *o, size_t size, const char *path, int recurse)
 {
 	struct jffs2_raw_dirent *dd;
 	struct dir *d = NULL;
-- 
1.7.5.4
