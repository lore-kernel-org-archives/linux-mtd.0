Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SC-0002Rg-Pr
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 32/42] mkfs.ubifs: Correctly use iv lengths in aes-cts mode
Date: Thu, 18 Oct 2018 16:37:08 +0200
Message-Id: <20181018143718.26298-33-richard@nod.at>
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

The key length can be very long, for example in xts mode.
So we have to use the right sizes for block and iv lengths.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/crypto.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index bd3273767a5b..8d113f198bb2 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -207,32 +207,32 @@ static ssize_t encrypt_cbc_cts(const void *plaintex=
t, size_t size,
=20
 	memset(iv, 0, ivsize);
=20
-	diff =3D size % key_len;
+	diff =3D size % ivsize;
=20
 	if (diff) {
-		padded_size =3D size - diff + key_len;
+		padded_size =3D size - diff + ivsize;
 		padded =3D size > 256 ? malloc(padded_size) : alloca(padded_size);
=20
 		memcpy(padded, plaintext, size);
 		memset(padded + size, 0, padded_size - size);
=20
 		ret =3D do_encrypt(cipher, padded, padded_size, key, key_len,
-				 iv, sizeof(iv), ciphertext);
+				 iv, ivsize, ciphertext);
=20
 		if (size > 256)
 			free(padded);
 	} else {
 		ret =3D do_encrypt(cipher, plaintext, size, key, key_len,
-				 iv, sizeof(iv), ciphertext);
+				 iv, ivsize, ciphertext);
 	}
=20
 	if (ret < 0)
 		return ret;
=20
-	count =3D ret / key_len;
+	count =3D ret / ivsize;
=20
 	if (count > 1)
-		block_swap(ciphertext, count - 2, count - 1, key_len);
+		block_swap(ciphertext, count - 2, count - 1, ivsize);
=20
 	return size;
 }
--=20
2.19.1
