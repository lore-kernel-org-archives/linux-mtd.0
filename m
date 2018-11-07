Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUKj-0002Iu-Ms
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 20:21:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at, hs@denx.de,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] mkfs.ubifs: Store compr_size in correct endianness.
Date: Wed,  7 Nov 2018 21:21:08 +0100
Message-Id: <20181107202108.13734-2-richard@nod.at>
In-Reply-To: <20181107202108.13734-1-richard@nod.at>
References: <20181107202108.13734-1-richard@nod.at>
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

compr_size has to be in LE16.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/fscrypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index 6d2b650d626d..118c11c5a4ca 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -125,7 +125,7 @@ int encrypt_data_node(struct fscrypt_context *fctx, u=
nsigned int block_no,
 	void *inbuf, *outbuf, *crypt_key;
 	size_t ret, pad_len =3D round_up(length, FS_CRYPTO_BLOCK_SIZE);
=20
-	dn->compr_size =3D length;
+	dn->compr_size =3D cpu_to_le16(length);
=20
 	inbuf =3D xzalloc(pad_len);
 	outbuf =3D xzalloc(pad_len);
--=20
2.19.1
