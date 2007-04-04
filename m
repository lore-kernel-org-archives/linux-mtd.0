Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HZ3Us-00061f-7a
	for linux-mtd@lists.infradead.org; Wed, 04 Apr 2007 07:17:53 -0400
Subject: [PATCH] [JFFS2] fix read_inode
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Apr 2007 14:17:42 +0300
Message-Id: <1175685462.19966.51.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 4 Apr 2007 13:59:11 +0300
Subject: [PATCH] [JFFS2] fix read_inode

In read inode we have an optimization which prevents one
min. I/O unit (e.g. NAND page) to be read more then once.

Namely, at the beginning we do not know which node type we read,
so we read so we assume we read the directory entry, because it
has the smallest node header. When we read it, we read up to the
next min. I/O unit, just because if later we'll need to read more,
we already have this data.

If it turns out to be that the node is not directory entry, and
we need more data, and we did not read it because it sits in the
next min. I/O unit, we read the whole next (or several next)
min. I/O unit(s). And if it happens to be that we read a data node,
and we've read part of it's data, we calculate partial CRC.
So if later we need to check data CRC, we'll only read the rest
of the data from further min. I/O units and continue CRC checking.

This code was a bit messy and buggy. The bug was that it assumed
relatively large min. I/O unit, so that the largest node header
could overlap only one min. I/O unit boundary.

This parch clean-ups the code a bit and fixes this bug.
The patch was not tested on flash with small ,in. I/O unit, like
NOR-ECC, nut it was tested on NAND with 512 bytes NAND page, so
it at least does not break NAND. It was also tested with mtdram
so it should not break NOR.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/jffs2/readinode.c |   98 +++++++++++++++++-----------------------------=
----
 1 files changed, 33 insertions(+), 65 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 58a0b91..71efefe 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -414,49 +414,38 @@ static inline int read_unknown(struct jffs2_sb_info *=
c, struct jffs2_raw_node_re
  * 	    negative error code on failure.
  */
 static int read_more(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *r=
ef,
-		     int right_size, int *rdlen, unsigned char *buf, unsigned char *bufs=
tart)
+		     int needed_len, int *rdlen, unsigned char *buf)
 {
-	int right_len, err, len;
+	int err, to_read =3D needed_len - *rdlen;
 	size_t retlen;
 	uint32_t offs;
=20
 	if (jffs2_is_writebuffered(c)) {
-		right_len =3D c->wbuf_pagesize - (bufstart - buf);
-		if (right_size + (int)(bufstart - buf) > c->wbuf_pagesize)
-			right_len +=3D c->wbuf_pagesize;
-	} else
-		right_len =3D right_size;
+		int rem =3D to_read % c->wbuf_pagesize;
=20
-	if (*rdlen =3D=3D right_len)
-		return 0;
+		if (rem)
+			to_read +=3D c->wbuf_pagesize - rem;
+	}
=20
 	/* We need to read more data */
 	offs =3D ref_offset(ref) + *rdlen;
-	if (jffs2_is_writebuffered(c)) {
-		bufstart =3D buf + c->wbuf_pagesize;
-		len =3D c->wbuf_pagesize;
-	} else {
-		bufstart =3D buf + *rdlen;
-		len =3D right_size - *rdlen;
-	}
=20
-	dbg_readinode("read more %d bytes\n", len);
+	dbg_readinode("read more %d bytes\n", to_read);
=20
-	err =3D jffs2_flash_read(c, offs, len, &retlen, bufstart);
+	err =3D jffs2_flash_read(c, offs, to_read, &retlen, buf + *rdlen);
 	if (err) {
 		JFFS2_ERROR("can not read %d bytes from 0x%08x, "
-			"error code: %d.\n", len, offs, err);
+			"error code: %d.\n", to_read, offs, err);
 		return err;
 	}
=20
-	if (retlen < len) {
+	if (retlen < to_read) {
 		JFFS2_ERROR("short read at %#08x: %zu instead of %d.\n",
-				offs, retlen, len);
+				offs, retlen, to_read);
 		return -EIO;
 	}
=20
-	*rdlen =3D right_len;
-
+	*rdlen +=3D to_read;
 	return 0;
 }
=20
@@ -479,27 +468,9 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info =
*c, struct jffs2_inode_inf
=20
 	dbg_readinode("ino #%u\n", f->inocache->ino);
=20
-	if (jffs2_is_writebuffered(c)) {
-		/*
-		 * If we have the write buffer, we assume the minimal I/O unit
-		 * is c->wbuf_pagesize. We implement some optimizations which in
-		 * this case and we need a temporary buffer of size =3D
-		 * 2*c->wbuf_pagesize bytes (see comments in read_dnode()).
-		 * Basically, we want to read not only the node header, but the
-		 * whole wbuf (NAND page in case of NAND) or 2, if the node
-		 * header overlaps the border between the 2 wbufs.
-		 */
-		len =3D 2*c->wbuf_pagesize;
-	} else {
-		/*
-		 * When there is no write buffer, the size of the temporary
-		 * buffer is the size of the larges node header.
-		 */
-		len =3D sizeof(union jffs2_node_union);
-	}
-
 	/* FIXME: in case of NOR and available ->point() this
 	 * needs to be fixed. */
+	len =3D sizeof(union jffs2_node_union) + c->wbuf_pagesize;
 	buf =3D kmalloc(len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
@@ -509,8 +480,6 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *=
c, struct jffs2_inode_inf
 	if (!valid_ref && f->inocache->ino !=3D 1)
 		JFFS2_WARNING("Eep. No valid nodes for ino #%u.\n", f->inocache->ino);
 	while (valid_ref) {
-		unsigned char *bufstart;
-
 		/* We can hold a pointer to a non-obsolete node without the spinlock,
 		   but _obsolete_ nodes may disappear at any time, if the block
 		   they're in gets erased. So if we mark 'ref' obsolete while we're
@@ -526,32 +495,31 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info=
 *c, struct jffs2_inode_inf
 		/*
 		 * At this point we don't know the type of the node we're going
 		 * to read, so we do not know the size of its header. In order
-		 * to minimize the amount of flash IO we assume the node has
-		 * size =3D JFFS2_MIN_NODE_HEADER.
+		 * to minimize the amount of flash IO we assume the header is
+		 * of size =3D JFFS2_MIN_NODE_HEADER.
 		 */
+		len =3D JFFS2_MIN_NODE_HEADER;
 		if (jffs2_is_writebuffered(c)) {
+			int end, rem;
+
 			/*
-			 * We treat 'buf' as 2 adjacent wbufs. We want to
-			 * adjust bufstart such as it points to the
-			 * beginning of the node within this wbuf.
+			 * We are about to read JFFS2_MIN_NODE_HEADER bytes,
+			 * but this flash has some minimal I/O unit. It is
+			 * possible that we'll need to read more soon, so read
+			 * up to the next min. I/O unit, in order not to
+			 * re-read the same min. I/O unit twice.
 			 */
-			bufstart =3D buf + (ref_offset(ref) % c->wbuf_pagesize);
-			/* We will read either one wbuf or 2 wbufs. */
-			len =3D c->wbuf_pagesize - (bufstart - buf);
-			if (JFFS2_MIN_NODE_HEADER + (int)(bufstart - buf) > c->wbuf_pagesize) {
-				/* The header spans the border of the first wbuf */
-				len +=3D c->wbuf_pagesize;
-			}
-		} else {
-			bufstart =3D buf;
-			len =3D JFFS2_MIN_NODE_HEADER;
+			end =3D ref_offset(ref) + len;
+			rem =3D end % c->wbuf_pagesize;
+			if (rem)
+				end +=3D c->wbuf_pagesize - rem;
+			len =3D end - ref_offset(ref);
 		}
=20
 		dbg_readinode("read %d bytes at %#08x(%d).\n", len, ref_offset(ref), ref=
_flags(ref));
=20
 		/* FIXME: point() */
-		err =3D jffs2_flash_read(c, ref_offset(ref), len,
-				       &retlen, bufstart);
+		err =3D jffs2_flash_read(c, ref_offset(ref), len, &retlen, buf);
 		if (err) {
 			JFFS2_ERROR("can not read %d bytes from 0x%08x, " "error code: %d.\n", =
len, ref_offset(ref), err);
 			goto free_out;
@@ -563,7 +531,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *=
c, struct jffs2_inode_inf
 			goto free_out;
 		}
=20
-		node =3D (union jffs2_node_union *)bufstart;
+		node =3D (union jffs2_node_union *)buf;
=20
 		/* No need to mask in the valid bit; it shouldn't be invalid */
 		if (je32_to_cpu(node->u.hdr_crc) !=3D crc32(0, node, sizeof(node->u)-4))=
 {
@@ -582,7 +550,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *=
c, struct jffs2_inode_inf
 		case JFFS2_NODETYPE_DIRENT:
=20
 			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent)) {
-				err =3D read_more(c, ref, sizeof(struct jffs2_raw_dirent), &len, buf, =
bufstart);
+				err =3D read_more(c, ref, sizeof(struct jffs2_raw_dirent), &len, buf);
 				if (unlikely(err))
 					goto free_out;
 			}
@@ -602,7 +570,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *=
c, struct jffs2_inode_inf
 		case JFFS2_NODETYPE_INODE:
=20
 			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode)) {
-				err =3D read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf, b=
ufstart);
+				err =3D read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf);
 				if (unlikely(err))
 					goto free_out;
 			}
@@ -621,7 +589,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *=
c, struct jffs2_inode_inf
=20
 		default:
 			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node)) {
-				err =3D read_more(c, ref, sizeof(struct jffs2_unknown_node), &len, buf=
, bufstart);
+				err =3D read_more(c, ref, sizeof(struct jffs2_unknown_node), &len, buf=
);
 				if (unlikely(err))
 					goto free_out;
 			}
--=20
1.4.4.2

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
