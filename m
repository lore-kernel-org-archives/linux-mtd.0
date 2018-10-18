Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SJ-0005Jm-T6
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 39/42] mkfs.ubifs: Move RAND_poll to crypto.c
Date: Thu, 18 Oct 2018 16:37:15 +0200
Message-Id: <20181018143718.26298-40-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/crypto.c     | 1 +
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index 50a09b53ebfe..9c6073ec00f9 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -330,6 +330,7 @@ static struct cipher ciphers[] =3D {
 int crypto_init(void)
 {
 	ERR_load_crypto_strings();
+	RAND_poll();
 	return 0;
 }
=20
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index f8d8e52f1bae..e4204dae07cb 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2841,8 +2841,6 @@ int main(int argc, char *argv[])
 	if (crypto_init())
 		return -1;
=20
-	RAND_poll();
-
 	err =3D get_options(argc, argv);
 	if (err)
 		return err;
--=20
2.19.1
