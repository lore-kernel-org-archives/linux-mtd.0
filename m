Received: from zproxy.gmail.com ([64.233.162.194])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQcSa-0003A6-LD
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2005 04:11:51 +0100
Received: by zproxy.gmail.com with SMTP id 14so808659nzn
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 20:11:42 -0700 (PDT)
Message-ID: <b1c6420f0510142011i28bee950s3827e341452430ba@mail.gmail.com>
Date: Sat, 15 Oct 2005 12:11:40 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [PATCH 1/4] util/jffs2reader compile fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

This is a patch for util/jffs2reader.c to make it built
against the current cvs.

Please review and apply if it is ok.
Thanks.


[PATCH 1/4] util/jffs2reader compile fix

jffs2reader cannot be built against the current cvs (it's disabled now).
This patch fixes it using <mtd/jffs2-user.h> and
adds endian conversion options.
It also fix lvalue casts to be compiled with recent GCC.

Signed-off-by: Suzuki Takashi <suzuki.takashi@gmail.com>


Index: Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/util/Makefile,v
retrieving revision 1.59
diff -u -p -r1.59 Makefile
--- Makefile=097 Sep 2005 08:34:57 -0000=091.59
+++ Makefile=0910 Oct 2005 07:31:58 -0000
@@ -16,7 +16,7 @@ TARGETS =3D ftl_format flash_erase flash_e
 =09jffs2dump \
 =09nftldump nftl_format docfdisk \
 =09rfddump rfdformat \
-=09sumtool #jffs2reader
+=09sumtool jffs2reader

 SYMLINKS =3D

Index: jffs2reader.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/util/jffs2reader.c,v
retrieving revision 1.5
diff -u -p -r1.5 jffs2reader.c
--- jffs2reader.c=098 Feb 2002 00:51:52 -0000=091.5
+++ jffs2reader.c=0910 Oct 2005 07:31:59 -0000
@@ -44,6 +44,12 @@
  *      *) Made it show symlink targets
  *  -Erik, 13 September 2001
  *
+ *********
+ *  This is NOT the original software.
+ *  This software was also altered October 2005. Changes are
+ *  Copyright (C) 2005 Suzuki Takashi <suzuki dot takashi at gmail dot com=
>.
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


-#define DIRENT_INO(dirent) ((dirent)!=3DNULL?(dirent)->ino:0)
-#define DIRENT_PINO(dirent) ((dirent)!=3DNULL?(dirent)->pino:0)
+#define DIRENT_INO(dirent) ((dirent)!=3DNULL?je32_to_cpu ((dirent)->ino):0=
)
+#define DIRENT_PINO(dirent) ((dirent)!=3DNULL?je32_to_cpu ((dirent)->pino)=
:0)
+
+int target_endian =3D __BYTE_ORDER;

 struct dir {
 =09struct dir *next;
@@ -121,8 +130,6 @@ struct jffs2_raw_dirent *resolvepath(cha
 void lsdir(char *, size_t, char *, int);
 void catfile(char *, size_t, char *, char *, size_t, size_t *);

-int main(int, char **);
-
 /* writes file node into buffer, to the proper position. */
 /* reading all valid nodes in version order reconstructs the file. */

@@ -136,30 +143,30 @@ int main(int, char **);
 void putblock(char *b, size_t bsize, size_t * rsize,
 =09=09=09  struct jffs2_raw_inode *n)
 {
-=09uLongf dlen =3D n->dsize;
+=09uLongf dlen =3D je32_to_cpu (n->dsize);

-=09if (n->isize > bsize || (n->offset + dlen) > bsize) {
+=09if (je32_to_cpu (n->isize) > bsize || (je32_to_cpu (n->offset) +
dlen) > bsize) {
 =09=09fprintf(stderr, "File does not fit into buffer!\n");
 =09=09exit(EXIT_FAILURE);
 =09}

-=09if (*rsize < n->isize)
-=09=09bzero(b + *rsize, n->isize - *rsize);
+=09if (*rsize < je32_to_cpu (n->isize))
+=09=09bzero(b + *rsize, je32_to_cpu (n->isize) - *rsize);

 =09switch (n->compr) {
 =09case JFFS2_COMPR_ZLIB:
-=09=09uncompress((Bytef *) b + n->offset, &dlen,
+=09=09uncompress((Bytef *) b + je32_to_cpu (n->offset), &dlen,
 =09=09=09=09   (Bytef *) ((char *) n) + sizeof(struct jffs2_raw_inode),
-=09=09=09=09   (uLongf) n->csize);
+=09=09=09=09   (uLongf) je32_to_cpu (n->csize));
 =09=09break;

 =09case JFFS2_COMPR_NONE:
-=09=09memcpy(b + n->offset,
+=09=09memcpy(b + je32_to_cpu (n->offset),
 =09=09=09   ((char *) n) + sizeof(struct jffs2_raw_inode), dlen);
 =09=09break;

 =09case JFFS2_COMPR_ZERO:
-=09=09bzero(b + n->offset, dlen);
+=09=09bzero(b + je32_to_cpu (n->offset), dlen);
 =09=09break;

 =09=09/* [DYN]RUBIN support required! */
@@ -169,7 +176,7 @@ void putblock(char *b, size_t bsize, siz
 =09=09exit(EXIT_FAILURE);
 =09}

-=09*rsize =3D n->isize;
+=09*rsize =3D je32_to_cpu (n->isize);
 }

 /* adds/removes directory node into dir struct. */
@@ -188,13 +195,13 @@ struct dir *putdir(struct dir *dd, struc

 =09o =3D dd;

-=09if (n->ino) {
+=09if (je32_to_cpu (n->ino)) {
 =09=09if (dd =3D=3D NULL) {
 =09=09=09d =3D malloc(sizeof(struct dir));
 =09=09=09d->type =3D n->type;
 =09=09=09memcpy(d->name, n->name, n->nsize);
 =09=09=09d->nsize =3D n->nsize;
-=09=09=09d->ino =3D n->ino;
+=09=09=09d->ino =3D je32_to_cpu (n->ino);
 =09=09=09d->next =3D NULL;

 =09=09=09return d;
@@ -204,7 +211,7 @@ struct dir *putdir(struct dir *dd, struc
 =09=09=09if (n->nsize =3D=3D dd->nsize &&
 =09=09=09=09!memcmp(n->name, dd->name, n->nsize)) {
 =09=09=09=09dd->type =3D n->type;
-=09=09=09=09dd->ino =3D n->ino;
+=09=09=09=09dd->ino =3D je32_to_cpu (n->ino);

 =09=09=09=09return o;
 =09=09=09}
@@ -214,7 +221,7 @@ struct dir *putdir(struct dir *dd, struc
 =09=09=09=09dd->next->type =3D n->type;
 =09=09=09=09memcpy(dd->next->name, n->name, n->nsize);
 =09=09=09=09dd->next->nsize =3D n->nsize;
-=09=09=09=09dd->next->ino =3D n->ino;
+=09=09=09=09dd->next->ino =3D je32_to_cpu (n->ino);
 =09=09=09=09dd->next->next =3D NULL;

 =09=09=09=09return o;
@@ -351,17 +358,18 @@ void printdir(char *o, size_t size, stru
 =09=09=09continue;
 =09=09}

-=09=09filetime =3D ctime((const time_t *) &(ri->ctime));
-=09=09age =3D time(NULL) - ri->ctime;
-=09=09printf("%s %-4d %-8d %-8d ", mode_string(ri->mode),
-=09=09=09   1, ri->uid, ri->gid);
+=09=09age =3D je32_to_cpu (ri->ctime);
+=09=09filetime =3D ctime(&age);
+=09=09age =3D time(NULL) - je32_to_cpu (ri->ctime);
+=09=09printf("%s %-4d %-8d %-8d ", mode_string(jemode_to_cpu (ri->mode)),
+=09=09=09   1, je16_to_cpu (ri->uid), je16_to_cpu (ri->gid));
 =09=09if ( d->type=3D=3DDT_BLK || d->type=3D=3DDT_CHR ) {
 =09=09=09dev_t rdev;
 =09=09=09size_t devsize;
 =09=09=09putblock((char*)&rdev, sizeof(rdev), &devsize, ri);
 =09=09=09printf("%4d, %3d ", (int)MAJOR(rdev), (int)MINOR(rdev));
 =09=09} else {
-=09=09=09printf("%9ld ", (long)ri->dsize);
+=09=09=09printf("%9ld ", (long)je32_to_cpu (ri->dsize));
 =09=09}
 =09=09d->name[d->nsize]=3D'\0';
 =09=09if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {
@@ -447,12 +455,12 @@ struct jffs2_raw_inode *find_raw_inode(c
 =09lr =3D n;

 =09do {
-=09=09while (n < e && n->u.magic !=3D JFFS2_MAGIC_BITMASK)
-=09=09=09((char *) n) +=3D 4;
+=09=09while (n < e && je16_to_cpu (n->u.magic) !=3D JFFS2_MAGIC_BITMASK)
+=09=09=09n =3D (union jffs2_node_union *) ((char *) n + 4);

-=09=09if (n < e && n->u.magic =3D=3D JFFS2_MAGIC_BITMASK) {
-=09=09=09if (n->u.nodetype =3D=3D JFFS2_NODETYPE_INODE &&
-=09=09=09=09n->i.ino =3D=3D ino && (v =3D n->i.version) > vcur) {
+=09=09if (n < e && je16_to_cpu (n->u.magic) =3D=3D JFFS2_MAGIC_BITMASK) {
+=09=09=09if (je16_to_cpu (n->u.nodetype) =3D=3D JFFS2_NODETYPE_INODE &&
+=09=09=09=09je32_to_cpu (n->i.ino) =3D=3D ino && (v =3D je32_to_cpu (n->i.=
version)) > vcur) {
 =09=09=09=09/* XXX crc check */

 =09=09=09=09if (vmaxt < v)
@@ -466,7 +474,7 @@ struct jffs2_raw_inode *find_raw_inode(c
 =09=09=09=09=09return (&(n->i));
 =09=09=09}

-=09=09=09((char *) n) +=3D ((n->u.totlen + 3) & ~3);
+=09=09=09n =3D (union jffs2_node_union *) ((char *) n + ((je32_to_cpu
(n->u.totlen) + 3) & ~3));
 =09=09} else
 =09=09=09n =3D (union jffs2_node_union *) o;=09/* we're at the end, rewind=
 to
the beginning */

@@ -515,12 +523,12 @@ struct dir *collectdir(char *o, size_t s
 =09lr =3D n;

 =09do {
-=09=09while (n < e && n->u.magic !=3D JFFS2_MAGIC_BITMASK)
-=09=09=09((char *) n) +=3D 4;
+=09=09while (n < e && je16_to_cpu (n->u.magic) !=3D JFFS2_MAGIC_BITMASK)
+=09=09=09n =3D (union jffs2_node_union *) ((char *) n + 4);

-=09=09if (n < e && n->u.magic =3D=3D JFFS2_MAGIC_BITMASK) {
-=09=09=09if (n->u.nodetype =3D=3D JFFS2_NODETYPE_DIRENT &&
-=09=09=09=09=09n->d.pino =3D=3D ino && (v =3D n->d.version) > vcur) {
+=09=09if (n < e && je16_to_cpu (n->u.magic) =3D=3D JFFS2_MAGIC_BITMASK) {
+=09=09=09if (je16_to_cpu (n->u.nodetype) =3D=3D JFFS2_NODETYPE_DIRENT &&
+=09=09=09=09=09je32_to_cpu (n->d.pino) =3D=3D ino && (v =3D je32_to_cpu
(n->d.version)) > vcur) {
 =09=09=09=09/* XXX crc check */

 =09=09=09=09if (vmaxt < v)
@@ -539,7 +547,7 @@ struct dir *collectdir(char *o, size_t s
 =09=09=09=09}
 =09=09=09}

-=09=09=09((char *) n) +=3D ((n->u.totlen + 3) & ~3);
+=09=09=09n =3D (union jffs2_node_union *) ((char *) n + ((je32_to_cpu
(n->u.totlen) + 3) & ~3));
 =09=09} else
 =09=09=09n =3D (union jffs2_node_union *) o;=09/* we're at the end, rewind=
 to
the beginning */

@@ -553,7 +561,7 @@ struct dir *collectdir(char *o, size_t s

 =09=09=09=09lr =3D n =3D
 =09=09=09=09=09(union jffs2_node_union *) (((char *) mp) +
-=09=09=09=09=09=09=09=09=09=09=09=09((mp->u.totlen + 3) & ~3));
+=09=09=09=09=09=09=09=09=09=09=09=09((je32_to_cpu (mp->u.totlen) + 3) & ~3=
));

 =09=09=09=09vcur =3D vmin;
 =09=09=09}
@@ -602,14 +610,14 @@ struct jffs2_raw_dirent *resolvedirent(c
 =09n =3D (union jffs2_node_union *) o;

 =09do {
-=09=09while (n < e && n->u.magic !=3D JFFS2_MAGIC_BITMASK)
-=09=09=09((char *) n) +=3D 4;
+=09=09while (n < e && je16_to_cpu (n->u.magic) !=3D JFFS2_MAGIC_BITMASK)
+=09=09=09n =3D (union jffs2_node_union *) ((char *) n + 4);

-=09=09if (n < e && n->u.magic =3D=3D JFFS2_MAGIC_BITMASK) {
-=09=09=09if (n->u.nodetype =3D=3D JFFS2_NODETYPE_DIRENT &&
-=09=09=09=09(!ino || n->d.ino =3D=3D ino) &&
-=09=09=09=09(v =3D n->d.version) > vmax &&
-=09=09=09=09(!pino || (n->d.pino =3D=3D pino &&
+=09=09if (n < e && je16_to_cpu (n->u.magic) =3D=3D JFFS2_MAGIC_BITMASK) {
+=09=09=09if (je16_to_cpu (n->u.nodetype) =3D=3D JFFS2_NODETYPE_DIRENT &&
+=09=09=09=09(!ino || je32_to_cpu (n->d.ino) =3D=3D ino) &&
+=09=09=09=09(v =3D je32_to_cpu (n->d.version)) > vmax &&
+=09=09=09=09(!pino || (je32_to_cpu (n->d.pino) =3D=3D pino &&
 =09=09=09=09=09=09   nsize =3D=3D n->d.nsize &&
 =09=09=09=09=09=09   !memcmp(name, n->d.name, nsize)))) {
 =09=09=09=09/* XXX crc check */
@@ -620,7 +628,7 @@ struct jffs2_raw_dirent *resolvedirent(c
 =09=09=09=09}
 =09=09=09}

-=09=09=09((char *) n) +=3D ((n->u.totlen + 3) & ~3);
+=09=09=09n =3D (union jffs2_node_union *) ((char *) n + ((je32_to_cpu
(n->u.totlen) + 3) & ~3));
 =09=09} else
 =09=09=09return dd;
 =09} while (1);
@@ -878,7 +886,7 @@ int main(int argc, char **argv)

 =09char *buf;

-=09while ((opt =3D getopt(argc, argv, "rd:f:")) > 0) {
+=09while ((opt =3D getopt(argc, argv, "rd:f:lb")) > 0) {
 =09=09switch (opt) {
 =09=09case 'd':
 =09=09=09dir =3D optarg;
@@ -889,6 +897,12 @@ int main(int argc, char **argv)
 =09=09case 'r':
 =09=09=09recurse++;
 =09=09=09break;
+=09=09case 'l':
+=09=09=09target_endian =3D __LITTLE_ENDIAN;
+=09=09=09break;
+=09=09case 'b':
+=09=09=09target_endian =3D __BIG_ENDIAN;
+=09=09=09break;
 =09=09default:
 =09=09=09fprintf(stderr,
 =09=09=09=09=09"Usage: jffs2reader <image> [-d|-f] < path > \n");

--
Suzuki Takashi
