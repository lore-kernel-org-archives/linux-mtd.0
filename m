Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gToTj-0003wg-Fg
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 13:41:41 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at, richard@nod.at,
 David Gstir <david@sigma-star.at>
Subject: [PATCH] mkfs.ubifs: fix default cipher in help output
Date: Mon,  3 Dec 2018 14:40:46 +0100
Message-Id: <20181203134046.16708-1-david@sigma-star.at>
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

AES-256-XTS is the default since dd0d9c623e22 ("mkfs.ubifs: Use AES-256-X=
TS as default"),
we want that to be correctly reflected in the help output as well.

Signed-off-by: David Gstir <david@sigma-star.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 666dfe6231a2..6e11ec8649c2 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -237,7 +237,7 @@ static const char *helptext =3D
 "-P, --padding=3DNUM        specify padding policy for encrypting filena=
mes\n"
 "                         (default =3D 4).\n"
 "-C, --cipher=3DNAME        Specify cipher to use for file level encrypt=
ion\n"
-"                         (default is \"AES-128-CBC\").\n"
+"                         (default is \"AES-256-XTS\").\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilob=
ytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
--=20
2.16.4
