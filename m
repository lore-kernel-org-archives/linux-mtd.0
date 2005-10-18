Received: from zproxy.gmail.com ([64.233.162.195])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERruE-0005ge-UH
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 09:53:36 -0400
Received: by zproxy.gmail.com with SMTP id s18so1100347nze
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Oct 2005 06:53:29 -0700 (PDT)
Message-ID: <4354FE49.6030407@gmail.com>
Date: Tue, 18 Oct 2005 22:53:13 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <b1c6420f0510142011i28bee950s3827e341452430ba@mail.gmail.com>
	<200510180901.03326.hs4233@mail.mn-solutions.de>
In-Reply-To: <200510180901.03326.hs4233@mail.mn-solutions.de>
Content-Type: multipart/mixed; boundary="------------010002010601080704060207"
Subject: Re: [PATCH 1/4] util/jffs2reader compile fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010002010601080704060207
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Holger Schurig wrote:
> You did not attach your patch, but put it inline into your e-mail. So you 
> cannot do "Save Attachment", which would do all the de-MIME-ification. If I 
> save the whole e-mail, I get this output:

Sorry.
I didn't notice that the mailer encoded the whole message
with quoted-printable.
This time I attached the patch.

Thanks.

--
Suzuki Takashi

--------------010002010601080704060207
Content-Type: text/plain;
 name="jffs2reader.compile.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2reader.compile.patch"

Index: Makefile
===================================================================
RCS file: /home/cvs/mtd/util/Makefile,v
retrieving revision 1.59
diff -u -p -r1.59 Makefile
--- Makefile	7 Sep 2005 08:34:57 -0000	1.59
+++ Makefile	10 Oct 2005 07:31:58 -0000
@@ -16,7 +16,7 @@ TARGETS = ftl_format flash_erase flash_e
 	jffs2dump \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
-	sumtool #jffs2reader 
+	sumtool jffs2reader
 
 SYMLINKS = 
 
Index: jffs2reader.c
===================================================================
RCS file: /home/cvs/mtd/util/jffs2reader.c,v
retrieving revision 1.5
diff -u -p -r1.5 jffs2reader.c
--- jffs2reader.c	8 Feb 2002 00:51:52 -0000	1.5
+++ jffs2reader.c	10 Oct 2005 07:31:59 -0000
@@ -44,6 +44,12 @@
  *      *) Made it show symlink targets
  *  -Erik, 13 September 2001
  *
+ *********
+ *  This is NOT the original software.
+ *  This software was also altered October 2005. Changes are
+ *  Copyright (C) 2005 Suzuki Takashi <suzuki dot takashi at gmail dot com>.
+ *
+ *
  * $Id: jffs2reader.c,v 1.5 2002/02/08 00:51:52 dwmw2 Exp $
 */
 
@@ -79,6 +85,7 @@
 #include <dirent.h>
 #include <zlib.h>
 #include <linux/jffs2.h>
+#include <mtd/jffs2-user.h>
 
 #define SCRATCH_SIZE (5*1024*1024)
 
@@ -90,8 +97,10 @@
 #endif
 
 
-#define DIRENT_INO(dirent) ((dirent)!=NULL?(dirent)->ino:0)
-#define DIRENT_PINO(dirent) ((dirent)!=NULL?(dirent)->pino:0)
+#define DIRENT_INO(dirent) ((dirent)!=NULL?je32_to_cpu ((dirent)->ino):0)
+#define DIRENT_PINO(dirent) ((dirent)!=NULL?je32_to_cpu ((dirent)->pino):0)
+
+int target_endian = __BYTE_ORDER;
 
 struct dir {
 	struct dir *next;
@@ -121,8 +130,6 @@ struct jffs2_raw_dirent *resolvepath(cha
 void lsdir(char *, size_t, char *, int);
 void catfile(char *, size_t, char *, char *, size_t, size_t *);
 
-int main(int, char **);
-
 /* writes file node into buffer, to the proper position. */
 /* reading all valid nodes in version order reconstructs the file. */
 
@@ -136,30 +143,30 @@ int main(int, char **);
 void putblock(char *b, size_t bsize, size_t * rsize,
 			  struct jffs2_raw_inode *n)
 {
-	uLongf dlen = n->dsize;
+	uLongf dlen = je32_to_cpu (n->dsize);
 
-	if (n->isize > bsize || (n->offset + dlen) > bsize) {
+	if (je32_to_cpu (n->isize) > bsize || (je32_to_cpu (n->offset) + dlen) > bsize) {
 		fprintf(stderr, "File does not fit into buffer!\n");
 		exit(EXIT_FAILURE);
 	}
 
-	if (*rsize < n->isize)
-		bzero(b + *rsize, n->isize - *rsize);
+	if (*rsize < je32_to_cpu (n->isize))
+		bzero(b + *rsize, je32_to_cpu (n->isize) - *rsize);
 
 	switch (n->compr) {
 	case JFFS2_COMPR_ZLIB:
-		uncompress((Bytef *) b + n->offset, &dlen,
+		uncompress((Bytef *) b + je32_to_cpu (n->offset), &dlen,
 				   (Bytef *) ((char *) n) + sizeof(struct jffs2_raw_inode),
-				   (uLongf) n->csize);
+				   (uLongf) je32_to_cpu (n->csize));
 		break;
 
 	case JFFS2_COMPR_NONE:
-		memcpy(b + n->offset,
+		memcpy(b + je32_to_cpu (n->offset),
 			   ((char *) n) + sizeof(struct jffs2_raw_inode), dlen);
 		break;
 
 	case JFFS2_COMPR_ZERO:
-		bzero(b + n->offset, dlen);
+		bzero(b + je32_to_cpu (n->offset), dlen);
 		break;
 
 		/* [DYN]RUBIN support required! */
@@ -169,7 +176,7 @@ void putblock(char *b, size_t bsize, siz
 		exit(EXIT_FAILURE);
 	}
 
-	*rsize = n->isize;
+	*rsize = je32_to_cpu (n->isize);
 }
 
 /* adds/removes directory node into dir struct. */
@@ -188,13 +195,13 @@ struct dir *putdir(struct dir *dd, struc
 
 	o = dd;
 
-	if (n->ino) {
+	if (je32_to_cpu (n->ino)) {
 		if (dd == NULL) {
 			d = malloc(sizeof(struct dir));
 			d->type = n->type;
 			memcpy(d->name, n->name, n->nsize);
 			d->nsize = n->nsize;
-			d->ino = n->ino;
+			d->ino = je32_to_cpu (n->ino);
 			d->next = NULL;
 
 			return d;
@@ -204,7 +211,7 @@ struct dir *putdir(struct dir *dd, struc
 			if (n->nsize == dd->nsize &&
 				!memcmp(n->name, dd->name, n->nsize)) {
 				dd->type = n->type;
-				dd->ino = n->ino;
+				dd->ino = je32_to_cpu (n->ino);
 
 				return o;
 			}
@@ -214,7 +221,7 @@ struct dir *putdir(struct dir *dd, struc
 				dd->next->type = n->type;
 				memcpy(dd->next->name, n->name, n->nsize);
 				dd->next->nsize = n->nsize;
-				dd->next->ino = n->ino;
+				dd->next->ino = je32_to_cpu (n->ino);
 				dd->next->next = NULL;
 
 				return o;
@@ -351,17 +358,18 @@ void printdir(char *o, size_t size, stru
 			continue;
 		}
 
-		filetime = ctime((const time_t *) &(ri->ctime));
-		age = time(NULL) - ri->ctime;
-		printf("%s %-4d %-8d %-8d ", mode_string(ri->mode),
-			   1, ri->uid, ri->gid);
+		age = je32_to_cpu (ri->ctime);
+		filetime = ctime(&age);
+		age = time(NULL) - je32_to_cpu (ri->ctime);
+		printf("%s %-4d %-8d %-8d ", mode_string(jemode_to_cpu (ri->mode)),
+			   1, je16_to_cpu (ri->uid), je16_to_cpu (ri->gid));
 		if ( d->type==DT_BLK || d->type==DT_CHR ) {
 			dev_t rdev;
 			size_t devsize;
 			putblock((char*)&rdev, sizeof(rdev), &devsize, ri);
 			printf("%4d, %3d ", (int)MAJOR(rdev), (int)MINOR(rdev));
 		} else {
-			printf("%9ld ", (long)ri->dsize);
+			printf("%9ld ", (long)je32_to_cpu (ri->dsize));
 		}
 		d->name[d->nsize]='\0';
 		if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {
@@ -447,12 +455,12 @@ struct jffs2_raw_inode *find_raw_inode(c
 	lr = n;
 
 	do {
-		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
-			((char *) n) += 4;
+		while (n < e && je16_to_cpu (n->u.magic) != JFFS2_MAGIC_BITMASK)
+			n = (union jffs2_node_union *) ((char *) n + 4);
 
-		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-			if (n->u.nodetype == JFFS2_NODETYPE_INODE &&
-				n->i.ino == ino && (v = n->i.version) > vcur) {
+		if (n < e && je16_to_cpu (n->u.magic) == JFFS2_MAGIC_BITMASK) {
+			if (je16_to_cpu (n->u.nodetype) == JFFS2_NODETYPE_INODE &&
+				je32_to_cpu (n->i.ino) == ino && (v = je32_to_cpu (n->i.version)) > vcur) {
 				/* XXX crc check */
 
 				if (vmaxt < v)
@@ -466,7 +474,7 @@ struct jffs2_raw_inode *find_raw_inode(c
 					return (&(n->i));
 			}
 
-			((char *) n) += ((n->u.totlen + 3) & ~3);
+			n = (union jffs2_node_union *) ((char *) n + ((je32_to_cpu (n->u.totlen) + 3) & ~3));
 		} else
 			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
 
@@ -515,12 +523,12 @@ struct dir *collectdir(char *o, size_t s
 	lr = n;
 
 	do {
-		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
-			((char *) n) += 4;
+		while (n < e && je16_to_cpu (n->u.magic) != JFFS2_MAGIC_BITMASK)
+			n = (union jffs2_node_union *) ((char *) n + 4);
 
-		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-			if (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
-					n->d.pino == ino && (v = n->d.version) > vcur) {
+		if (n < e && je16_to_cpu (n->u.magic) == JFFS2_MAGIC_BITMASK) {
+			if (je16_to_cpu (n->u.nodetype) == JFFS2_NODETYPE_DIRENT &&
+					je32_to_cpu (n->d.pino) == ino && (v = je32_to_cpu (n->d.version)) > vcur) {
 				/* XXX crc check */
 
 				if (vmaxt < v)
@@ -539,7 +547,7 @@ struct dir *collectdir(char *o, size_t s
 				}
 			}
 
-			((char *) n) += ((n->u.totlen + 3) & ~3);
+			n = (union jffs2_node_union *) ((char *) n + ((je32_to_cpu (n->u.totlen) + 3) & ~3));
 		} else
 			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
 
@@ -553,7 +561,7 @@ struct dir *collectdir(char *o, size_t s
 
 				lr = n =
 					(union jffs2_node_union *) (((char *) mp) +
-												((mp->u.totlen + 3) & ~3));
+												((je32_to_cpu (mp->u.totlen) + 3) & ~3));
 
 				vcur = vmin;
 			}
@@ -602,14 +610,14 @@ struct jffs2_raw_dirent *resolvedirent(c
 	n = (union jffs2_node_union *) o;
 
 	do {
-		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
-			((char *) n) += 4;
+		while (n < e && je16_to_cpu (n->u.magic) != JFFS2_MAGIC_BITMASK)
+			n = (union jffs2_node_union *) ((char *) n + 4);
 
-		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-			if (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
-				(!ino || n->d.ino == ino) &&
-				(v = n->d.version) > vmax &&
-				(!pino || (n->d.pino == pino &&
+		if (n < e && je16_to_cpu (n->u.magic) == JFFS2_MAGIC_BITMASK) {
+			if (je16_to_cpu (n->u.nodetype) == JFFS2_NODETYPE_DIRENT &&
+				(!ino || je32_to_cpu (n->d.ino) == ino) &&
+				(v = je32_to_cpu (n->d.version)) > vmax &&
+				(!pino || (je32_to_cpu (n->d.pino) == pino &&
 						   nsize == n->d.nsize &&
 						   !memcmp(name, n->d.name, nsize)))) {
 				/* XXX crc check */
@@ -620,7 +628,7 @@ struct jffs2_raw_dirent *resolvedirent(c
 				}
 			}
 
-			((char *) n) += ((n->u.totlen + 3) & ~3);
+			n = (union jffs2_node_union *) ((char *) n + ((je32_to_cpu (n->u.totlen) + 3) & ~3));
 		} else
 			return dd;
 	} while (1);
@@ -878,7 +886,7 @@ int main(int argc, char **argv)
 
 	char *buf;
 
-	while ((opt = getopt(argc, argv, "rd:f:")) > 0) {
+	while ((opt = getopt(argc, argv, "rd:f:lb")) > 0) {
 		switch (opt) {
 		case 'd':
 			dir = optarg;
@@ -889,6 +897,12 @@ int main(int argc, char **argv)
 		case 'r':
 			recurse++;
 			break;
+		case 'l':
+			target_endian = __LITTLE_ENDIAN;
+			break;
+		case 'b':
+			target_endian = __BIG_ENDIAN;
+			break;
 		default:
 			fprintf(stderr,
 					"Usage: jffs2reader <image> [-d|-f] < path > \n");

--------------010002010601080704060207--
