Received: from mga01.intel.com ([192.55.52.88])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5c05-0001ub-79
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:27:02 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 6/7] jffs2reader: print ctime only by user's request
Date: Mon, 19 Sep 2011 14:25:23 +0300
Message-Id: <f63c1c847cc67d9e7d091a9005c900b01c723208.1316431431.git.andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Alexey Dokuchaev <danfe@nsu.ru>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 jffs2reader.c |   36 +++++++++++++++++++++---------------
 1 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index c0d118c..238e617 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -107,7 +107,7 @@ int target_endian = __BYTE_ORDER;
 void putblock(char *, size_t, size_t *, struct jffs2_raw_inode *);
 struct dir *putdir(struct dir *, struct jffs2_raw_dirent *);
 void printdir(char *o, size_t size, struct dir *d, const char *path,
-		int recurse);
+		int recurse, int want_ctime);
 void freedir(struct dir *);
 
 struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, uint32_t ino);
@@ -121,7 +121,7 @@ struct jffs2_raw_dirent *resolvepath0(char *, size_t, uint32_t, const char *,
 struct jffs2_raw_dirent *resolvepath(char *, size_t, uint32_t, const char *,
 		uint32_t *);
 
-void lsdir(char *, size_t, const char *, int);
+void lsdir(char *, size_t, const char *, int, int);
 void catfile(char *, size_t, char *, char *, size_t, size_t *);
 
 int main(int, char **);
@@ -299,7 +299,8 @@ const char *mode_string(int mode)
    d       - dir struct
  */
 
-void printdir(char *o, size_t size, struct dir *d, const char *path, int recurse)
+void printdir(char *o, size_t size, struct dir *d, const char *path, int recurse,
+		int want_ctime)
 {
 	char m;
 	char *filetime;
@@ -366,12 +367,14 @@ void printdir(char *o, size_t size, struct dir *d, const char *path, int recurse
 			printf("%9ld ", (long)je32_to_cpu(ri->dsize));
 		}
 		d->name[d->nsize]='\0';
-		if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {
-			/* hh:mm if less than 6 months old */
-			printf("%6.6s %5.5s %s/%s%c", filetime + 4, filetime + 11, path, d->name, m);
-		} else {
-			printf("%6.6s %4.4s %s/%s%c", filetime + 4, filetime + 20, path, d->name, m);
+		if (want_ctime) {
+			if (age < 3600L * 24 * 365 / 2 && age > -15 * 60)
+				/* hh:mm if less than 6 months old */
+				printf("%6.6s %5.5s ", filetime + 4, filetime + 11);
+			else
+				printf("%6.6s %4.4s ", filetime + 4, filetime + 20);
 		}
+		printf("%s/%s%c", path, d->name, m);
 		if (d->type == DT_LNK) {
 			char symbuf[1024];
 			size_t symsize;
@@ -385,7 +388,7 @@ void printdir(char *o, size_t size, struct dir *d, const char *path, int recurse
 			char *tmp;
 			tmp = xmalloc(BUFSIZ);
 			sprintf(tmp, "%s/%s", path, d->name);
-			lsdir(o, size, tmp, recurse);		/* Go recursive */
+			lsdir(o, size, tmp, recurse, want_ctime);	/* Go recursive */
 			free(tmp);
 		}
 
@@ -807,7 +810,7 @@ struct jffs2_raw_dirent *resolvepath(char *o, size_t size, uint32_t ino,
    p       - path to be resolved
  */
 
-void lsdir(char *o, size_t size, const char *path, int recurse)
+void lsdir(char *o, size_t size, const char *path, int recurse, int want_ctime)
 {
 	struct jffs2_raw_dirent *dd;
 	struct dir *d = NULL;
@@ -821,7 +824,7 @@ void lsdir(char *o, size_t size, const char *path, int recurse)
 		errmsg_die("%s: No such file or directory", path);
 
 	d = collectdir(o, size, ino, d);
-	printdir(o, size, d, path, recurse);
+	printdir(o, size, d, path, recurse, want_ctime);
 	freedir(d);
 }
 
@@ -861,7 +864,7 @@ void catfile(char *o, size_t size, char *path, char *b, size_t bsize,
 
 int main(int argc, char **argv)
 {
-	int fd, opt, recurse = 0;
+	int fd, opt, recurse = 0, want_ctime = 0;
 	struct stat st;
 
 	char *scratch, *dir = NULL, *file = NULL;
@@ -869,7 +872,7 @@ int main(int argc, char **argv)
 
 	char *buf;
 
-	while ((opt = getopt(argc, argv, "rd:f:")) > 0) {
+	while ((opt = getopt(argc, argv, "rd:f:t")) > 0) {
 		switch (opt) {
 			case 'd':
 				dir = optarg;
@@ -880,6 +883,9 @@ int main(int argc, char **argv)
 			case 'r':
 				recurse++;
 				break;
+			case 't':
+				want_ctime++;
+				break;
 			default:
 				fprintf(stderr,
 						"Usage: %s <image> [-d|-f] < path >\n",
@@ -901,7 +907,7 @@ int main(int argc, char **argv)
 		sys_errmsg_die("%s", argv[optind]);
 
 	if (dir)
-		lsdir(buf, st.st_size, dir, recurse);
+		lsdir(buf, st.st_size, dir, recurse, want_ctime);
 
 	if (file) {
 		scratch = xmalloc(SCRATCH_SIZE);
@@ -911,7 +917,7 @@ int main(int argc, char **argv)
 	}
 
 	if (!dir && !file)
-		lsdir(buf, st.st_size, "/", 1);
+		lsdir(buf, st.st_size, "/", 1, want_ctime);
 
 
 	free(buf);
-- 
1.7.5.4
