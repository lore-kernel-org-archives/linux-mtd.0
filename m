Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SJ-0005K4-T9
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 42/42] mkfs.ubifs: Use AES-256-XTS as default
Date: Thu, 18 Oct 2018 16:37:18 +0200
Message-Id: <20181018143718.26298-43-richard@nod.at>
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

AES-128-CBC should only being used when 256-XTS is too slow
on low end hardware.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index a60d392bbc81..5847b352038a 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -766,7 +766,7 @@ static int get_options(int argc, char**argv)
 		c->encrypted =3D 1;
=20
 		if (cipher_name =3D=3D NULL)
-			cipher_name =3D "AES-128-CBC";
+			cipher_name =3D "AES-256-XTS";
=20
 		root_fctx =3D init_fscrypt_context(cipher_name, fscrypt_flags,
 						key_file, key_desc);
--=20
2.19.1
