Received: from zproxy.gmail.com ([64.233.162.205])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQcUV-0003gh-Bw
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2005 04:13:49 +0100
Received: by zproxy.gmail.com with SMTP id 14so808817nzn
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 20:13:29 -0700 (PDT)
Message-ID: <b1c6420f0510142013q68d95bfak59086ca9a1887240@mail.gmail.com>
Date: Sat, 15 Oct 2005 12:13:29 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [PATCH 3/4] util/jffs2reader catfile fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is another bug fix for util/jffs2reader.c.

Please review and apply if it is ok.
Thanks.


[PATCH 3/4] util/jffs2reader catfile fix

jffs2reader only writes out the newest raw inode of a file for -f option.
This patch makes it to write out all the raw inodes of the file.
New collect_raw_inodes function collects all the inodes for a file
in version ascending order. The catfile function now uses it and
is able to output entire contents of a file.

This patch depends on:
[PATCH 1/4] util/jffs2reader compile fix

Signed-off-by: Suzuki Takashi <suzuki.takashi@gmail.com>


--- jffs2reader.c.printsize=092005-10-10 17:55:17.000000000 +0900
+++ jffs2reader.c=092005-10-10 18:22:02.000000000 +0900
@@ -87,7 +87,14 @@
 #include <linux/jffs2.h>
 #include <mtd/jffs2-user.h>

+#ifdef DEBUG
+#define dprintf(...) printf (__VA_ARGS__)
+#else /* not DEBUG */
+#define dprintf(...)
+#endif /* not DEBUG */
+
 #define SCRATCH_SIZE (5*1024*1024)
+#define SCRATCH_NUM  (64)

 #ifndef MAJOR
 /* FIXME:  I am using illicit insider knowledge of
@@ -117,6 +124,7 @@ void printdir(char *o, size_t size, stru
 void freedir(struct dir *);

 struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, uint32_t ino)=
;
+struct jffs2_raw_inode **collect_raw_inodes(char *o, size_t size,
uint32_t ino, int *);
 struct jffs2_raw_dirent *resolvedirent(char *, size_t, uint32_t, uint32_t,
 =09=09=09=09=09=09=09=09=09   char *, uint8_t);
 struct jffs2_raw_dirent *resolvename(char *, size_t, uint32_t, char
*, uint8_t);
@@ -420,7 +428,7 @@ void freedir(struct dir *d)
 =09}
 }

-/* collects directory/file nodes in version order. */
+/* searches the newest directory/file nodes. */

 /*
   f       - file flag.
@@ -491,6 +499,67 @@ struct jffs2_raw_inode *find_raw_inode(c
 =09return NULL;
 }

+/* collects directory/file nodes in version order. */
+
+/*
+  o       - filesystem image pointer
+  size    - size of filesystem image
+  ino     - inode to compare against. see f.
+  *num    - number of raw inodes (result)
+
+  return value: a pointer to jffs2_raw_inode array and should be freed lat=
er.
+*/
+
+struct jffs2_raw_inode **collect_raw_inodes(char *o, size_t size,
uint32_t ino, int *num)
+{
+=09/* aligned! */
+=09union jffs2_node_union *n =3D (union jffs2_node_union *) o;
+=09union jffs2_node_union *e =3D (union jffs2_node_union *) (o + size);
+
+=09struct jffs2_raw_inode **ri =3D NULL;
+=09int i, count =3D 0, bufnum =3D 0;
+=09uint32_t ver;
+
+=09do {
+=09=09while (n < e && je16_to_cpu (n->u.magic) !=3D JFFS2_MAGIC_BITMASK)
+=09=09=09n =3D (union jffs2_node_union *) ((char *) n + 4);
+
+=09=09if (n < e && je16_to_cpu (n->u.magic) =3D=3D JFFS2_MAGIC_BITMASK) {
+=09=09=09if (je16_to_cpu (n->u.nodetype) =3D=3D JFFS2_NODETYPE_INODE &&
+=09=09=09=09je32_to_cpu (n->i.ino) =3D=3D ino) {
+=09=09=09=09/* XXX crc check */
+
+=09=09=09=09if (bufnum <=3D count) {
+=09=09=09=09=09bufnum +=3D SCRATCH_NUM;
+=09=09=09=09=09ri =3D realloc(ri, sizeof(struct jffs2_raw_inode *) * bufnu=
m);
+=09=09=09=09=09if (ri =3D=3D NULL) {
+=09=09=09=09=09=09fprintf(stderr, "memory exhausted\n");
+=09=09=09=09=09=09exit(EXIT_FAILURE);
+=09=09=09=09=09}
+=09=09=09=09}
+
+=09=09=09=09ver =3D je32_to_cpu (n->i.version);
+
+=09=09=09=09for (i =3D 0; i < count; i++) {
+=09=09=09=09=09if (ver < je32_to_cpu (ri[i]->version)) {
+=09=09=09=09=09=09memmove(&ri[i + 1], &ri[i],
+=09=09=09=09=09=09=09=09sizeof(struct jffs2_raw_inode *) * (count - i));
+=09=09=09=09=09=09break;
+=09=09=09=09=09}
+=09=09=09=09}
+
+=09=09=09=09ri[i] =3D &(n->i);
+=09=09=09=09count++;
+=09=09=09}
+=09=09}
+
+=09=09n =3D (union jffs2_node_union *) ((char *) n + ((je32_to_cpu
(n->u.totlen) + 3) & ~3));
+=09} while (n < e);
+
+=09*num =3D count;
+=09return ri;
+}
+
 /* collects dir struct for selected inode */

 /*
@@ -853,8 +922,9 @@ void catfile(char *o, size_t size, char
 =09=09=09 size_t * rsize)
 {
 =09struct jffs2_raw_dirent *dd;
-=09struct jffs2_raw_inode *ri;
+=09struct jffs2_raw_inode **rip;
 =09uint32_t ino;
+=09int i, count;

 =09dd =3D resolvepath(o, size, 1, path, &ino);

@@ -868,8 +938,23 @@ void catfile(char *o, size_t size, char
 =09=09exit(EXIT_FAILURE);
 =09}

-=09ri =3D find_raw_inode(o, size, ino);
-=09putblock(b, bsize, rsize, ri);
+=09rip =3D collect_raw_inodes(o, size, ino, &count);
+
+=09dprintf(" ver   isize   offset    csize    dsize      ctime      mtime\=
n");
+
+=09for (i =3D 0; i < count; i++) {
+=09=09struct jffs2_raw_inode *ri =3D rip[i];
+=09=09dprintf ("%4u %8u %8u %8u %8u %10u %10u\n",
+=09=09=09=09 je32_to_cpu (ri->version), je32_to_cpu (ri->isize),
+=09=09=09=09 je32_to_cpu (ri->offset),
+=09=09=09=09 je32_to_cpu (ri->csize), je32_to_cpu (ri->dsize),
+=09=09=09=09 je32_to_cpu (ri->ctime), je32_to_cpu (ri->mtime));
+=09=09putblock(b, bsize, rsize, ri);
+=09};
+
+=09fflush (stdout);
+
+=09free (rip);

 =09write(1, b, *rsize);
 }

--
Suzuki Takashi
