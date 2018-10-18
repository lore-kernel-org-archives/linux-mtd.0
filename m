Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SC-0002TJ-Pp
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 37/42] mkfs.ubifs: Fix key descriptor printing
Date: Thu, 18 Oct 2018 16:37:13 +0200
Message-Id: <20181018143718.26298-38-richard@nod.at>
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

normsg() sucks.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/fscrypt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index ce6e2fc29ce0..29dad1b039e7 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -69,11 +69,11 @@ void print_fscrypt_master_key_descriptor(struct fscry=
pt_context *fctx)
 {
 	int i;
=20
-	normsg_cont("fscrypt master key descriptor: ");
+	normsg_cont("fscrypt master key descriptor: 0x");
 	for (i =3D 0; i < FS_KEY_DESCRIPTOR_SIZE; i++) {
-		normsg_cont("%02x", fctx->master_key_descriptor[i]);
+		printf("%02x", fctx->master_key_descriptor[i]);
 	}
-	normsg("");
+	printf("\n");
 }
=20
 unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx,
--=20
2.19.1
