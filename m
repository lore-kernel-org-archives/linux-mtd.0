Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RC-00043a-Ls
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:12 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 04/42] mkfs.ubifs: Implement UBIFS_FLG_DOUBLE_HASH
Date: Thu, 18 Oct 2018 16:36:40 +0200
Message-Id: <20181018143718.26298-5-richard@nod.at>
In-Reply-To: <20181018143718.26298-1-richard@nod.at>
References: <20181018143718.26298-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 13 +++++++++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h |  2 ++
 ubifs-utils/mkfs.ubifs/ubifs.h      |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index fd6538c6d4e1..e7acf17f6c96 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1436,6 +1436,14 @@ static int add_symlink_inode(const char *path_name=
, struct stat *st, ino_t inum,
 	return add_inode(st, inum, buf, len, flags, path_name);
 }
=20
+static void set_dent_cookie(struct ubifs_dent_node *dent)
+{
+	if (c->double_hash)
+		RAND_bytes((void *)&dent->cookie, sizeof(dent->cookie));
+	else
+		dent->cookie =3D 0;
+}
+
 /**
  * add_dent_node - write a directory entry node.
  * @dir_inum: target inode number of directory
@@ -1469,6 +1477,7 @@ static int add_dent_node(ino_t dir_inum, const char=
 *name, ino_t inum,
 	dent->nlen =3D cpu_to_le16(dname.len);
 	memcpy(dent->name, dname.name, dname.len);
 	dent->name[dname.len] =3D '\0';
+	set_dent_cookie(dent);
=20
 	len =3D UBIFS_DENT_NODE_SZ + dname.len + 1;
=20
@@ -2268,6 +2277,8 @@ static int write_super(void)
 		sup.flags |=3D cpu_to_le32(UBIFS_FLG_BIGLPT);
 	if (c->space_fixup)
 		sup.flags |=3D cpu_to_le32(UBIFS_FLG_SPACE_FIXUP);
+	if (c->double_hash)
+		sup.flags |=3D cpu_to_le32(UBIFS_FLG_DOUBLE_HASH);
=20
 	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM);
 }
@@ -2630,6 +2641,8 @@ int main(int argc, char *argv[])
 	if (crypto_init())
 		return -1;
=20
+	RAND_poll();
+
 	err =3D get_options(argc, argv);
 	if (err)
 		return err;
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.h
index 132119167fa5..aa032392155b 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -46,6 +46,8 @@
 #include <uuid.h>
 #include <sys/file.h>
=20
+#include <openssl/rand.h>
+
 #include <mtd/ubifs-media.h>
=20
 /* common.h requires the PROGRAM_NAME macro */
diff --git a/ubifs-utils/mkfs.ubifs/ubifs.h b/ubifs-utils/mkfs.ubifs/ubif=
s.h
index 2f080a8ce708..5a4af997e7bd 100644
--- a/ubifs-utils/mkfs.ubifs/ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/ubifs.h
@@ -330,6 +330,7 @@ struct ubifs_znode
  * @nhead_offs: offset of LPT head
  * @big_lpt: flag that LPT is too big to write whole during commit
  * @space_fixup: flag indicating that free space in LEBs needs to be cle=
aned up
+ * @double_hash: flag indicating that we can do lookups by hash
  * @lpt_sz: LPT size
  *
  * @ltab_lnum: LEB number of LPT's own lprops table
@@ -408,6 +409,7 @@ struct ubifs_info
 	int nhead_offs;
 	int big_lpt;
 	int space_fixup;
+	int double_hash;
 	long long lpt_sz;
=20
 	int ltab_lnum;
--=20
2.19.1
