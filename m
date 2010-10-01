Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1jAT-0003Od-Ee
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 17:13:12 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 09F2E1B4082
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 17:13:07 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2reader: convert to common.h helpers
Date: Fri,  1 Oct 2010 13:14:06 -0400
Message-Id: <1285953246-19729-1-git-send-email-vapier@gentoo.org>
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
 jffs2reader.c |   70 +++++++++++++++++---------------------------------------
 1 files changed, 21 insertions(+), 49 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index 0cdff19..8326971 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -136,10 +136,8 @@ void putblock(char *b, size_t bsize, size_t * rsize,
 {
 	uLongf dlen = n->dsize;
 
-	if (n->isize > bsize || (n->offset + dlen) > bsize) {
-		fprintf(stderr, "File does not fit into buffer!\n");
-		exit(EXIT_FAILURE);
-	}
+	if (n->isize > bsize || (n->offset + dlen) > bsize)
+		errmsg("File does not fit into buffer!");
 
 	if (*rsize < n->isize)
 		bzero(b + *rsize, n->isize - *rsize);
@@ -163,8 +161,7 @@ void putblock(char *b, size_t bsize, size_t * rsize,
 			/* [DYN]RUBIN support required! */
 
 		default:
-			fprintf(stderr, "Unsupported compression method!\n");
-			exit(EXIT_FAILURE);
+			errmsg("Unsupported compression method!");
 	}
 
 	*rsize = n->isize;
@@ -188,7 +185,7 @@ struct dir *putdir(struct dir *dd, struct jffs2_raw_dirent *n)
 
 	if (n->ino) {
 		if (dd == NULL) {
-			d = malloc(sizeof(struct dir));
+			d = xmalloc(sizeof(struct dir));
 			d->type = n->type;
 			memcpy(d->name, n->name, n->nsize);
 			d->nsize = n->nsize;
@@ -208,7 +205,7 @@ struct dir *putdir(struct dir *dd, struct jffs2_raw_dirent *n)
 			}
 
 			if (dd->next == NULL) {
-				dd->next = malloc(sizeof(struct dir));
+				dd->next = xmalloc(sizeof(struct dir));
 				dd->next->type = n->type;
 				memcpy(dd->next->name, n->name, n->nsize);
 				dd->next->nsize = n->nsize;
@@ -344,7 +341,7 @@ void printdir(char *o, size_t size, struct dir *d, char *path, int recurse)
 		}
 		ri = find_raw_inode(o, size, d->ino);
 		if (!ri) {
-			fprintf(stderr, "bug: raw_inode missing!\n");
+			warnmsg("bug: raw_inode missing!");
 			d = d->next;
 			continue;
 		}
@@ -379,11 +376,7 @@ void printdir(char *o, size_t size, struct dir *d, char *path, int recurse)
 
 		if (d->type == DT_DIR && recurse) {
 			char *tmp;
-			tmp = malloc(BUFSIZ);
-			if (!tmp) {
-				fprintf(stderr, "memory exhausted\n");
-				exit(EXIT_FAILURE);
-			}
+			tmp = xmalloc(BUFSIZ);
 			sprintf(tmp, "%s/%s", path, d->name);
 			lsdir(o, size, tmp, recurse);		/* Go recursive */
 			free(tmp);
@@ -817,11 +810,8 @@ void lsdir(char *o, size_t size, char *path, int recurse)
 	dd = resolvepath(o, size, 1, path, &ino);
 
 	if (ino == 0 ||
-			(dd == NULL && ino == 0) || (dd != NULL && dd->type != DT_DIR)) {
-		fprintf(stderr, "%s: %s: No such file or directory\n",
-				PROGRAM_NAME, path);
-		exit(EXIT_FAILURE);
-	}
+			(dd == NULL && ino == 0) || (dd != NULL && dd->type != DT_DIR))
+		errmsg_dir("%s: No such file or directory", path);
 
 	d = collectdir(o, size, ino, d);
 	printdir(o, size, d, path, recurse);
@@ -848,15 +838,11 @@ void catfile(char *o, size_t size, char *path, char *b, size_t bsize,
 
 	dd = resolvepath(o, size, 1, path, &ino);
 
-	if (ino == 0) {
-		fprintf(stderr, "%s: No such file or directory\n", path);
-		exit(EXIT_FAILURE);
-	}
+	if (ino == 0)
+		errmsg_die("%s: No such file or directory", path);
 
-	if (dd == NULL || dd->type != DT_REG) {
-		fprintf(stderr, "%s: Not a regular file\n", path);
-		exit(EXIT_FAILURE);
-	}
+	if (dd == NULL || dd->type != DT_REG)
+		errmsg_die("%s: Not a regular file", path);
 
 	ri = find_raw_inode(o, size, ino);
 	putblock(b, bsize, rsize, ri);
@@ -896,36 +882,22 @@ int main(int argc, char **argv)
 	}
 
 	fd = open(argv[optind], O_RDONLY);
-	if (fd == -1) {
-		fprintf(stderr, "%s: %s\n", argv[optind], strerror(errno));
-		exit(2);
-	}
+	if (fd == -1)
+		sys_errmsg_die("%s", argv[optind]);
 
-	if (fstat(fd, &st)) {
-		fprintf(stderr, "%s: %s\n", argv[optind], strerror(errno));
-		exit(3);
-	}
+	if (fstat(fd, &st))
+		sys_errmsg_die("%s", argv[optind]);
 
-	buf = malloc((size_t) st.st_size);
-	if (buf == NULL) {
-		fprintf(stderr, "%s: memory exhausted\n", argv[optind]);
-		exit(4);
-	}
+	buf = xmalloc((size_t) st.st_size);
 
-	if (read(fd, buf, st.st_size) != (ssize_t) st.st_size) {
-		fprintf(stderr, "%s: %s\n", argv[optind], strerror(errno));
-		exit(5);
-	}
+	if (read(fd, buf, st.st_size) != (ssize_t) st.st_size)
+		sys_errmsg_die("%s", argv[optind]);
 
 	if (dir)
 		lsdir(buf, st.st_size, dir, recurse);
 
 	if (file) {
-		scratch = malloc(SCRATCH_SIZE);
-		if (scratch == NULL) {
-			fprintf(stderr, "%s: memory exhausted\n", argv[optind]);
-			exit(6);
-		}
+		scratch = xmalloc(SCRATCH_SIZE);
 
 		catfile(buf, st.st_size, file, scratch, SCRATCH_SIZE, &ssize);
 		free(scratch);
-- 
1.7.3.1
