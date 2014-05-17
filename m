Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlTqx-0005qa-UD
 for linux-mtd@lists.infradead.org; Sat, 17 May 2014 01:56:00 +0000
Date: Sat, 17 May 2014 03:55:50 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: respect MS_SILENT mount flag
Message-ID: <20140517015541.GA6399@earthship.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When attempting to mount a non-ubifs formatted volume, lots of error
messages (including a stack dump) are thrown to the kernel log even if
the MS_SILENT mount flag is set.
Fix this by introducing an additional parameter in ubifs_read_node and
use it to pass down the MS_SILENT flag in ubifs_read_sb_node.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 fs/ubifs/commit.c   |  4 ++--
 fs/ubifs/io.c       | 23 ++++++++++++++---------
 fs/ubifs/sb.c       |  5 +++--
 fs/ubifs/tnc_misc.c |  4 ++--
 fs/ubifs/ubifs.h    |  2 +-
 5 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index ff82293..865d13f 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -542,7 +542,7 @@ int dbg_old_index_check_init(struct ubifs_info *c, stru=
ct ubifs_zbranch *zroot)
 	if (!idx)
 		return -ENOMEM;
=20
-	err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs);
+	err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs, 0);
 	if (err)
 		goto out;
=20
@@ -610,7 +610,7 @@ int dbg_check_old_index(struct ubifs_info *c, struct ub=
ifs_zbranch *zroot)
 		list_add_tail(&i->list, &list);
 		/* Read the index node */
 		idx =3D &i->idx;
-		err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs);
+		err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs, 0);
 		if (err)
 			goto out_free;
 		/* Validate index node */
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index e18b988..51c4072 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -912,7 +912,7 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void =
*buf, int type, int len,
 	if (!overlap) {
 		/* We may safely unlock the write-buffer and read the data */
 		spin_unlock(&wbuf->lock);
-		return ubifs_read_node(c, buf, type, len, lnum, offs);
+		return ubifs_read_node(c, buf, type, len, lnum, offs, 0);
 	}
=20
 	/* Don't read under wbuf */
@@ -966,13 +966,14 @@ out:
  * @len: node length (not aligned)
  * @lnum: logical eraseblock number
  * @offs: offset within the logical eraseblock
+ * @silent: suppress error messages
  *
  * This function reads a node of known type and and length, checks it and
  * stores in @buf. Returns zero in case of success, %-EUCLEAN if CRC misma=
tched
  * and a negative error code in case of failure.
  */
 int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int l=
en,
-		    int lnum, int offs)
+		    int lnum, int offs, int silent)
 {
 	int err, l;
 	struct ubifs_ch *ch =3D buf;
@@ -988,30 +989,34 @@ int ubifs_read_node(const struct ubifs_info *c, void =
*buf, int type, int len,
 		return err;
=20
 	if (type !=3D ch->node_type) {
-		ubifs_err("bad node type (%d but expected %d)",
+		if (!silent) ubifs_err("bad node type (%d but expected %d)",
 			  ch->node_type, type);
 		goto out;
 	}
=20
 	err =3D ubifs_check_node(c, buf, lnum, offs, 0, 0);
 	if (err) {
-		ubifs_err("expected node type %d", type);
+		if (!silent)
+			ubifs_err("expected node type %d", type);
 		return err;
 	}
=20
 	l =3D le32_to_cpu(ch->len);
 	if (l !=3D len) {
-		ubifs_err("bad node length %d, expected %d", l, len);
+		if (!silent)
+			ubifs_err("bad node length %d, expected %d", l, len);
 		goto out;
 	}
=20
 	return 0;
=20
 out:
-	ubifs_err("bad node at LEB %d:%d, LEB mapping status %d", lnum, offs,
-		  ubi_is_mapped(c->ubi, lnum));
-	ubifs_dump_node(c, buf);
-	dump_stack();
+	if (!silent) {
+		ubifs_err("bad node at LEB %d:%d, LEB mapping status %d", lnum,
+			  offs, ubi_is_mapped(c->ubi, lnum));
+		ubifs_dump_node(c, buf);
+		dump_stack();
+	}
 	return -EINVAL;
 }
=20
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4c37607..b46847d 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -482,14 +482,15 @@ failed:
 struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c)
 {
 	struct ubifs_sb_node *sup;
-	int err;
+	int silent, err;
=20
 	sup =3D kmalloc(ALIGN(UBIFS_SB_NODE_SZ, c->min_io_size), GFP_NOFS);
 	if (!sup)
 		return ERR_PTR(-ENOMEM);
=20
+	silent =3D !!(c->vfs_sb->s_flags & MS_SILENT);
 	err =3D ubifs_read_node(c, sup, UBIFS_SB_NODE, UBIFS_SB_NODE_SZ,
-			      UBIFS_SB_LNUM, 0);
+			      UBIFS_SB_LNUM, 0, silent);
 	if (err) {
 		kfree(sup);
 		return ERR_PTR(err);
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index f6bf899..e128689 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -280,7 +280,7 @@ static int read_znode(struct ubifs_info *c, int lnum, i=
nt offs, int len,
 	if (!idx)
 		return -ENOMEM;
=20
-	err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs);
+	err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs, 0);
 	if (err < 0) {
 		kfree(idx);
 		return err;
@@ -472,7 +472,7 @@ int ubifs_tnc_read_node(struct ubifs_info *c, struct ub=
ifs_zbranch *zbr,
 					   zbr->lnum, zbr->offs);
 	else
 		err =3D ubifs_read_node(c, node, type, zbr->len, zbr->lnum,
-				      zbr->offs);
+				      zbr->offs, 0);
=20
 	if (err) {
 		dbg_tnck(key, "key ");
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index e8c8cfe..85fdd11 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1481,7 +1481,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, =
void *buf, int len);
 int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs);
 int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf);
 int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int l=
en,
-		    int lnum, int offs);
+		    int lnum, int offs, int silent);
 int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int=
 len,
 			 int lnum, int offs);
 int ubifs_write_node(struct ubifs_info *c, void *node, int len, int lnum,
--=20
1.9.2


--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTdsGdAAoJECBgbL4bcbCQ4QEH/AxScPE4TTYBCqpOsCQ8pMPc
/3RyecG2lU69ERFwQ1tK+I91RiPHakQfKUylEziJ2V/UGB6bpfTuDnXhVyQ3ta3V
6xoQjDL3AGsNR8bcDJ1alXpkvqo71H94kTtGyFzX9AsstdlUMHevjW7Uk2bz6D4l
gb0HcnYGkbdv7ePLVayJNq6cbCLjT05DEEC3WBvaVxSOqZn+wDn/3+e7BL5wepMu
37JSk29Kkb2h7gN467fNSroKI2W0e0P7lzw33BRmcpjFWs0odKjNMis94V9g4vKC
Dxf1je8+9rNOAvJt60WjYr6POoH0sXxtewvkQuX2vNj/2fLludRIXDwkZ/1hulA=
=fakZ
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
