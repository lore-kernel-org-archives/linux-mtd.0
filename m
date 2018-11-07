Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUKj-0002It-NP
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 20:21:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at, hs@denx.de,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/2] mkfs.ubifs: Fix IV selection
Date: Wed,  7 Nov 2018 21:21:07 +0100
Message-Id: <20181107202108.13734-1-richard@nod.at>
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

We need to check for AES being in 128-cbc mode and not 256-cbc.
fscrypt supports only 128-cbc and 256-xts so far.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index 9c6073ec00f9..cd68e372601f 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -152,7 +152,7 @@ static ssize_t encrypt_block(const void *plaintext, s=
ize_t size,
 	iv.index =3D cpu_to_le64(block_index);
 	memset(iv.padding, 0, sizeof(iv.padding));
=20
-	if (cipher =3D=3D EVP_aes_256_cbc()) {
+	if (cipher =3D=3D EVP_aes_128_cbc()) {
 		tweak =3D alloca(ivsize);
 		gen_essiv_salt(&iv, FS_IV_SIZE, key, key_len, tweak);
 	} else {
--=20
2.19.1
