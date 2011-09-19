Received: from mga11.intel.com ([192.55.52.93])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5bzH-0001lp-1H
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:26:12 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/7] jffs2reader: eliminate compiler errors
Date: Mon, 19 Sep 2011 14:25:19 +0300
Message-Id: <44e5a23d776bc650f9b605911f09deb438506c05.1316431431.git.andriy.shevchenko@linux.intel.com>
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

There are many errors like "error: invalid operands to binary". This patch
converts the values to the proper types.

Signed-off-by: Alexey Dokuchaev <danfe@nsu.ru>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 jffs2reader.c |   77 +++++++++++++++++++++++++++++----------------------------
 1 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index 11f841d..1fc9e74 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -88,9 +88,8 @@ BUGS:
 #define MINOR(dev) ((dev)&0xff)
 #endif
 
-
-#define DIRENT_INO(dirent) ((dirent)!=NULL?(dirent)->ino:0)
-#define DIRENT_PINO(dirent) ((dirent)!=NULL?(dirent)->pino:0)
+#define DIRENT_INO(dirent) ((dirent)!=NULL?je32_to_cpu((dirent)->ino):0)
+#define DIRENT_PINO(dirent) ((dirent)!=NULL?je32_to_cpu((dirent)->pino):0)
 
 struct dir {
 	struct dir *next;
@@ -135,28 +134,28 @@ int main(int, char **);
 void putblock(char *b, size_t bsize, size_t * rsize,
 		struct jffs2_raw_inode *n)
 {
-	uLongf dlen = n->dsize;
+	uLongf dlen = je32_to_cpu(n->dsize);
 
-	if (n->isize > bsize || (n->offset + dlen) > bsize)
+	if (je32_to_cpu(n->isize) > bsize || (je32_to_cpu(n->offset) + dlen) > bsize)
 		errmsg_die("File does not fit into buffer!");
 
-	if (*rsize < n->isize)
-		bzero(b + *rsize, n->isize - *rsize);
+	if (*rsize < je32_to_cpu(n->isize))
+		bzero(b + *rsize, je32_to_cpu(n->isize) - *rsize);
 
 	switch (n->compr) {
 		case JFFS2_COMPR_ZLIB:
-			uncompress((Bytef *) b + n->offset, &dlen,
+			uncompress((Bytef *) b + je32_to_cpu(n->offset), &dlen,
 					(Bytef *) ((char *) n) + sizeof(struct jffs2_raw_inode),
-					(uLongf) n->csize);
+					(uLongf) je32_to_cpu(n->csize));
 			break;
 
 		case JFFS2_COMPR_NONE:
-			memcpy(b + n->offset,
+			memcpy(b + je32_to_cpu(n->offset),
 					((char *) n) + sizeof(struct jffs2_raw_inode), dlen);
 			break;
 
 		case JFFS2_COMPR_ZERO:
-			bzero(b + n->offset, dlen);
+			bzero(b + je32_to_cpu(n->offset), dlen);
 			break;
 
 			/* [DYN]RUBIN support required! */
@@ -165,7 +164,7 @@ void putblock(char *b, size_t bsize, size_t * rsize,
 			errmsg_die("Unsupported compression method!");
 	}
 
-	*rsize = n->isize;
+	*rsize = je32_to_cpu(n->isize);
 }
 
 /* adds/removes directory node into dir struct. */
@@ -184,13 +183,13 @@ struct dir *putdir(struct dir *dd, struct jffs2_raw_dirent *n)
 
 	o = dd;
 
-	if (n->ino) {
+	if (je32_to_cpu(n->ino)) {
 		if (dd == NULL) {
 			d = xmalloc(sizeof(struct dir));
 			d->type = n->type;
 			memcpy(d->name, n->name, n->nsize);
 			d->nsize = n->nsize;
-			d->ino = n->ino;
+			d->ino = je32_to_cpu(n->ino);
 			d->next = NULL;
 
 			return d;
@@ -200,7 +199,7 @@ struct dir *putdir(struct dir *dd, struct jffs2_raw_dirent *n)
 			if (n->nsize == dd->nsize &&
 					!memcmp(n->name, dd->name, n->nsize)) {
 				dd->type = n->type;
-				dd->ino = n->ino;
+				dd->ino = je32_to_cpu(n->ino);
 
 				return o;
 			}
@@ -210,7 +209,7 @@ struct dir *putdir(struct dir *dd, struct jffs2_raw_dirent *n)
 				dd->next->type = n->type;
 				memcpy(dd->next->name, n->name, n->nsize);
 				dd->next->nsize = n->nsize;
-				dd->next->ino = n->ino;
+				dd->next->ino = je32_to_cpu(n->ino);
 				dd->next->next = NULL;
 
 				return o;
@@ -301,6 +300,7 @@ void printdir(char *o, size_t size, struct dir *d, char *path, int recurse)
 	char *filetime;
 	time_t age;
 	struct jffs2_raw_inode *ri;
+	jint32_t mode;
 
 	if (!path)
 		return;
@@ -348,16 +348,17 @@ void printdir(char *o, size_t size, struct dir *d, char *path, int recurse)
 		}
 
 		filetime = ctime((const time_t *) &(ri->ctime));
-		age = time(NULL) - ri->ctime;
-		printf("%s %-4d %-8d %-8d ", mode_string(ri->mode),
-				1, ri->uid, ri->gid);
+		age = time(NULL) - je32_to_cpu(ri->ctime);
+		mode.v32 = ri->mode.m;
+		printf("%s %-4d %-8d %-8d ", mode_string(je32_to_cpu(mode)),
+				1, je16_to_cpu(ri->uid), je16_to_cpu(ri->gid));
 		if ( d->type==DT_BLK || d->type==DT_CHR ) {
 			dev_t rdev;
 			size_t devsize;
 			putblock((char*)&rdev, sizeof(rdev), &devsize, ri);
 			printf("%4d, %3d ", (int)MAJOR(rdev), (int)MINOR(rdev));
 		} else {
-			printf("%9ld ", (long)ri->dsize);
+			printf("%9ld ", (long)je32_to_cpu(ri->dsize));
 		}
 		d->name[d->nsize]='\0';
 		if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {
@@ -439,12 +440,12 @@ struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, uint32_t ino)
 	lr = n;
 
 	do {
-		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
+		while (n < e && je16_to_cpu(n->u.magic) != JFFS2_MAGIC_BITMASK)
 			((char *) n) += 4;
 
-		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-			if (n->u.nodetype == JFFS2_NODETYPE_INODE &&
-					n->i.ino == ino && (v = n->i.version) > vcur) {
+		if (n < e && je16_to_cpu(n->u.magic) == JFFS2_MAGIC_BITMASK) {
+			if (je16_to_cpu(n->u.nodetype) == JFFS2_NODETYPE_INODE &&
+				je32_to_cpu(n->i.ino) == ino && (v = je32_to_cpu(n->i.version)) > vcur) {
 				/* XXX crc check */
 
 				if (vmaxt < v)
@@ -458,7 +459,7 @@ struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, uint32_t ino)
 					return (&(n->i));
 			}
 
-			((char *) n) += ((n->u.totlen + 3) & ~3);
+			((char *) n) += ((je32_to_cpu(n->u.totlen) + 3) & ~3);
 		} else
 			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
 
@@ -507,12 +508,12 @@ struct dir *collectdir(char *o, size_t size, uint32_t ino, struct dir *d)
 	lr = n;
 
 	do {
-		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
+		while (n < e && je16_to_cpu(n->u.magic) != JFFS2_MAGIC_BITMASK)
 			((char *) n) += 4;
 
-		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-			if (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
-					n->d.pino == ino && (v = n->d.version) > vcur) {
+		if (n < e && je16_to_cpu(n->u.magic) == JFFS2_MAGIC_BITMASK) {
+			if (je16_to_cpu(n->u.nodetype) == JFFS2_NODETYPE_DIRENT &&
+				je32_to_cpu(n->d.pino) == ino && (v = je32_to_cpu(n->d.version)) > vcur) {
 				/* XXX crc check */
 
 				if (vmaxt < v)
@@ -531,7 +532,7 @@ struct dir *collectdir(char *o, size_t size, uint32_t ino, struct dir *d)
 				}
 			}
 
-			((char *) n) += ((n->u.totlen + 3) & ~3);
+			((char *) n) += ((je32_to_cpu(n->u.totlen) + 3) & ~3);
 		} else
 			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
 
@@ -545,7 +546,7 @@ struct dir *collectdir(char *o, size_t size, uint32_t ino, struct dir *d)
 
 				lr = n =
 					(union jffs2_node_union *) (((char *) mp) +
-							((mp->u.totlen + 3) & ~3));
+							((je32_to_cpu(mp->u.totlen) + 3) & ~3));
 
 				vcur = vmin;
 			}
@@ -594,14 +595,14 @@ struct jffs2_raw_dirent *resolvedirent(char *o, size_t size,
 	n = (union jffs2_node_union *) o;
 
 	do {
-		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
+		while (n < e && je16_to_cpu(n->u.magic) != JFFS2_MAGIC_BITMASK)
 			((char *) n) += 4;
 
-		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-			if (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
-					(!ino || n->d.ino == ino) &&
-					(v = n->d.version) > vmax &&
-					(!pino || (n->d.pino == pino &&
+		if (n < e && je16_to_cpu(n->u.magic) == JFFS2_MAGIC_BITMASK) {
+			if (je16_to_cpu(n->u.nodetype) == JFFS2_NODETYPE_DIRENT &&
+					(!ino || je32_to_cpu(n->d.ino) == ino) &&
+					(v = je32_to_cpu(n->d.version)) > vmax &&
+					(!pino || (je32_to_cpu(n->d.pino) == pino &&
 							   nsize == n->d.nsize &&
 							   !memcmp(name, n->d.name, nsize)))) {
 				/* XXX crc check */
@@ -612,7 +613,7 @@ struct jffs2_raw_dirent *resolvedirent(char *o, size_t size,
 				}
 			}
 
-			((char *) n) += ((n->u.totlen + 3) & ~3);
+			((char *) n) += ((je32_to_cpu(n->u.totlen) + 3) & ~3);
 		} else
 			return dd;
 	} while (1);
-- 
1.7.5.4
