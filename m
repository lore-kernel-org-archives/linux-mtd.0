Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpI6t-00006F-0o
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 14:12:20 +0000
Date: Tue, 27 May 2014 16:11:08 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] ubifs: respect MS_SILENT mount flag
Message-ID: <20140527141030.GA3130@earthship.local>
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <1401193128.1304.132.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--opJtzjQTFsWo+cga
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
v2: fixed checkpatch.pl issues, not sure about the newline in
    fs/ubifs/commit.c:610 which leaves the single 0 looking a bit
    lonely...

 fs/ubifs/commit.c   |  5 +++--
 fs/ubifs/io.c       | 26 ++++++++++++++++----------
 fs/ubifs/sb.c       |  5 +++--
 fs/ubifs/tnc_misc.c |  4 ++--
 fs/ubifs/ubifs.h    |  2 +-
 5 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index ff82293..936617f 100644
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
@@ -610,7 +610,8 @@ int dbg_check_old_index(struct ubifs_info *c, struct ub=
ifs_zbranch *zroot)
 		list_add_tail(&i->list, &list);
 		/* Read the index node */
 		idx =3D &i->idx;
-		err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs);
+		err =3D ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs
+				      0);
 		if (err)
 			goto out_free;
 		/* Validate index node */
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index e18b988..8c5dea1 100644
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
@@ -988,30 +989,35 @@ int ubifs_read_node(const struct ubifs_info *c, void =
*buf, int type, int len,
 		return err;
=20
 	if (type !=3D ch->node_type) {
-		ubifs_err("bad node type (%d but expected %d)",
-			  ch->node_type, type);
+		if (!silent)
+			ubifs_err("bad node type (%d but expected %d)",
+				  ch->node_type, type);
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
1.9.3


--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJThJzWAAoJECBgbL4bcbCQOhAH/i8k0thNEEO7WXGhFrDX7bAD
mSq1xhz6850LB87NEDe9n+F7gMPye/nmGIDsRFSCBuqVBx2qPcxKJ3VrDpsIsMbC
HGoFlzhi8ibyoVnp0hCkvfoeBVGwXGDgb41MP84aLh6819o4euGDRXDzqsbHydIz
t1RMk3Rh0OUvfES8oiT0GlrQX9PRpptSkm1ZDm24d8IJ4gNpHKn64bMkPvSiBCoS
J/254EAOhn/UJ/BUL2ZS/2A5hChZRtGu1BXOqWxOms3eUmk4tDQ4bIMpxgrFYyOe
w1Kgo6SlV2UKWRSqAUX9aWL0rQwqhi5tBEPWG/dTJ6B3TocmwUHCIwFldEr1j7I=
=Byj8
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
