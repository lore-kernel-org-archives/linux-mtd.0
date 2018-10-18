Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SC-0002TQ-Pl
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 38/42] mkfs.ubifs: More fscryptctl compatibility
Date: Thu, 18 Oct 2018 16:37:14 +0200
Message-Id: <20181018143718.26298-39-richard@nod.at>
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

fscryptctl reads up to FS_MAX_KEY_SIZE bytes from the source key
to compute the descriptor.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/fscrypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index 29dad1b039e7..3d4bff618050 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -202,7 +202,7 @@ static int load_master_key(const char *key_file, stru=
ct cipher *fsc)
 		return -1;
 	}
=20
-	keysize =3D read(kf, fscrypt_masterkey, fsc->key_length);
+	keysize =3D read(kf, fscrypt_masterkey, FS_MAX_KEY_SIZE);
 	if (keysize < 0) {
 		sys_errmsg("read '%s'", key_file);
 		goto fail;
--=20
2.19.1
