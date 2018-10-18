Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rv-0005Id-U7
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:56 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 18/42] mkfs.ubifs: Make sure we catch nodes that should or
 should not have name
Date: Thu, 18 Oct 2018 16:36:54 +0200
Message-Id: <20181018143718.26298-19-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/key.h        | 10 ++++++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
index c18e35e8f0a3..2de530b813a2 100644
--- a/ubifs-utils/mkfs.ubifs/key.h
+++ b/ubifs-utils/mkfs.ubifs/key.h
@@ -209,4 +209,14 @@ static inline int keys_cmp(const union ubifs_key *ke=
y1,
 	return 0;
 }
=20
+/**
+ * key_type - get key type.
+ * @c: UBIFS file-system description object
+ * @key: key to get type of
+ */
+static inline int key_type(const union ubifs_key *key)
+{
+	return key->u32[1] >> UBIFS_S_KEY_BLOCK_BITS;
+}
+
 #endif /* !__UBIFS_KEY_H__ */
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index b402945924ac..8aba668f8e28 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1161,6 +1161,14 @@ static int add_node(union ubifs_key *key, char *na=
me, int name_len, void *node,
 {
 	int err, lnum, offs;
=20
+	if (key_type(key) =3D=3D UBIFS_DENT_KEY || key_type(key) =3D=3D UBIFS_X=
ENT_KEY) {
+		if (!name)
+			return err_msg("Directory entry or xattr without name!");
+	} else {
+		if (name)
+			return err_msg("Name given for non dir/xattr node!");
+	}
+
 	prepare_node(node, len);
=20
 	err =3D reserve_space(len, &lnum, &offs);
--=20
2.19.1
