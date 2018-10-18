Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-00046v-QZ
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 13/42] mkfs.ubifs: Add dummy setup for crypto
Date: Thu, 18 Oct 2018 16:36:49 +0200
Message-Id: <20181018143718.26298-14-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 7deca96e7953..a43b2a1620b1 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2720,6 +2720,12 @@ static int init(void)
 	sz =3D sizeof(struct inum_mapping *) * HASH_TABLE_SIZE;
 	hash_table =3D xzalloc(sz);
=20
+	//TODO make this a parameter
+	root_fctx =3D init_fscrypt_context();
+	print_fscrypt_master_key_descriptor(root_fctx);
+	c->double_hash =3D 1;
+	c->encrypted =3D 1;
+
 	err =3D init_compression();
 	if (err)
 		return err;
--=20
2.19.1
