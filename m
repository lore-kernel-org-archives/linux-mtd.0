Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rv-0004KQ-9a
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:40:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 19/42] mkfs.ubifs: Free all index entry names
Date: Thu, 18 Oct 2018 16:36:55 +0200
Message-Id: <20181018143718.26298-20-richard@nod.at>
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

...and make valgrind memcheck happy

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 8aba668f8e28..66ca061cc225 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1253,7 +1253,7 @@ static int add_xattr(struct ubifs_ino_node *host_in=
o, struct stat *st, ino_t inu
 	if (data_len)
 		memcpy(&ino->data, data, data_len);
=20
-	ret =3D add_node(&nkey, nm.name, nm.len, ino, UBIFS_INO_NODE_SZ + data_=
len) ;
+	ret =3D add_node(&nkey, NULL, 0, ino, UBIFS_INO_NODE_SZ + data_len);
=20
 out:
 	free(xent);
@@ -1447,7 +1447,7 @@ static int set_fscrypt_context(struct ubifs_ino_nod=
e *host_ino, ino_t inum,
 			       struct fscrypt_context *fctx)
 {
 	return add_xattr(host_ino, host_st, inum,
-			 UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT,
+			 xstrdup(UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT),
 			 fctx, sizeof(*fctx));
 }
=20
@@ -2470,8 +2470,10 @@ static int write_index(void)
 	}
=20
 	/* Free stuff */
-	for (i =3D 0; i < idx_cnt; i++)
+	for (i =3D 0; i < idx_cnt; i++) {
+		free(idx_ptr[i]->name);
 		free(idx_ptr[i]);
+	}
 	free(idx_ptr);
 	free(idx);
=20
--=20
2.19.1
