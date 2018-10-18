Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-000454-R5
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:33 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 08/42] mkfs.ubifs: Implement UBIFS_FLG_ENCRYPTION
Date: Thu, 18 Oct 2018 16:36:44 +0200
Message-Id: <20181018143718.26298-9-richard@nod.at>
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

...and set UBIFS format version

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 13 ++++++++++++-
 ubifs-utils/mkfs.ubifs/ubifs.h      |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index fc1b0cb1f6cc..09c28ab0b6bd 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2357,6 +2357,15 @@ static int finalize_leb_cnt(void)
 	return 0;
 }
=20
+static int ubifs_format_version(void)
+{
+	if (c->double_hash || c->encrypted)
+		return 5;
+
+	/* Default */
+	return 4;
+}
+
 /**
  * write_super - write the super block.
  */
@@ -2379,7 +2388,7 @@ static int write_super(void)
 	sup.jhead_cnt     =3D cpu_to_le32(c->jhead_cnt);
 	sup.fanout        =3D cpu_to_le32(c->fanout);
 	sup.lsave_cnt     =3D cpu_to_le32(c->lsave_cnt);
-	sup.fmt_version   =3D cpu_to_le32(UBIFS_FORMAT_VERSION);
+	sup.fmt_version   =3D cpu_to_le32(ubifs_format_version());
 	sup.default_compr =3D cpu_to_le16(c->default_compr);
 	sup.rp_size       =3D cpu_to_le64(c->rp_size);
 	sup.time_gran     =3D cpu_to_le32(DEFAULT_TIME_GRAN);
@@ -2396,6 +2405,8 @@ static int write_super(void)
 		sup.flags |=3D cpu_to_le32(UBIFS_FLG_SPACE_FIXUP);
 	if (c->double_hash)
 		sup.flags |=3D cpu_to_le32(UBIFS_FLG_DOUBLE_HASH);
+	if (c->encrypted)
+		sup.flags |=3D cpu_to_le32(UBIFS_FLG_ENCRYPTION);
=20
 	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM);
 }
diff --git a/ubifs-utils/mkfs.ubifs/ubifs.h b/ubifs-utils/mkfs.ubifs/ubif=
s.h
index 5a4af997e7bd..c26d0944ac50 100644
--- a/ubifs-utils/mkfs.ubifs/ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/ubifs.h
@@ -410,6 +410,7 @@ struct ubifs_info
 	int big_lpt;
 	int space_fixup;
 	int double_hash;
+	int encrypted;
 	long long lpt_sz;
=20
 	int ltab_lnum;
--=20
2.19.1
