Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rv-0004Mk-8b
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:40:33 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 23/42] mkfs.ubifs: Make encryption dependend on
 (not-yet-existant) command line options
Date: Thu, 18 Oct 2018 16:36:59 +0200
Message-Id: <20181018143718.26298-24-richard@nod.at>
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

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 8be84ca1e99c..5be390e93da9 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -217,6 +217,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
=20
+//TODO: add options for double hash and encryption
 static const char *optstring =3D "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:=
j:UQqa";
=20
 static const struct option longopts[] =3D {
@@ -654,6 +655,8 @@ static int get_options(int argc, char**argv)
 	c->max_leb_cnt =3D -1;
 	c->max_bud_bytes =3D -1;
 	c->log_lebs =3D -1;
+	c->double_hash =3D 0;
+	c->encrypted =3D 0;
=20
 	while (1) {
 		opt =3D getopt_long(argc, argv, optstring, longopts, &i);
@@ -2826,15 +2829,16 @@ static int init(void)
 	sz =3D sizeof(struct inum_mapping *) * HASH_TABLE_SIZE;
 	hash_table =3D xzalloc(sz);
=20
-	//TODO make this a parameter
-	RAND_bytes((void *)master_key_descriptor, FS_KEY_DESCRIPTOR_SIZE);
-	RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+	if (c->encrypted) {
+		RAND_bytes((void *)master_key_descriptor,
+				FS_KEY_DESCRIPTOR_SIZE);
+		RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
=20
-	root_fctx =3D init_fscrypt_context(FS_POLICY_FLAGS_PAD_4,
-					master_key_descriptor, nonce);
-	print_fscrypt_master_key_descriptor(root_fctx);
-	c->double_hash =3D 1;
-	c->encrypted =3D 1;
+		root_fctx =3D init_fscrypt_context(FS_POLICY_FLAGS_PAD_4,
+						master_key_descriptor, nonce);
+		print_fscrypt_master_key_descriptor(root_fctx);
+		c->double_hash =3D 1;
+	}
=20
 	err =3D init_compression();
 	if (err)
--=20
2.19.1
