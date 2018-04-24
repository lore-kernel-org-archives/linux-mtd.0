Received: from mail1.bemta8.messagelabs.com ([216.82.243.202])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAqup-0006po-3O
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 05:55:01 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>
Subject: mtd: cfi_cmdset_0002: Read data 3 times to check write operation
 status
Date: Tue, 24 Apr 2018 05:54:43 +0000
Message-ID: <TY1PR01MB09540E30A53D361D54CEA16EDC880@TY1PR01MB0954.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Let us consult to change mtd cfi_cmdset_0002 to read data 3 times as below =
patch.
Can we change the mtd cfi_cmdset_0002 driver like this?
If any comment or concern please let us know.

>From d924822c996b9c0eccc815e5018a0c3ea6077137 Mon Sep 17 00:00:00 2001
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Date: Tue, 24 Apr 2018 13:26:37 +0900
Subject: [PATCH 2/2] mtd: cfi_cmdset_0002: Read data 3 times to check write
 operation status

Cypress S29GLxxxP flash is needed to read data 3 times to check DQ6 toggles=
.
Actually the read data is sometimes changed by the 3rd reading.
Also this is caused on other flash device also.
The flash write failure is possible to be caused by the error.
To resolve the issue change the read number of times to 3 from 2.
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 56aa6b75213d..dc7667ff134a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -743,12 +743,13 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_i=
nfo *mtd)
  */
 static int __xipram chip_ready(struct map_info *map, unsigned long addr)
 {
-	map_word d, t;
+	map_word r1, r2, r3;
=20
-	d =3D map_read(map, addr);
-	t =3D map_read(map, addr);
+	r1 =3D map_read(map, addr);
+	r2 =3D map_read(map, addr);
+	r3 =3D map_read(map, addr);
=20
-	return map_word_equal(map, d, t);
+	return map_word_equal(map, r1, r2) && map_word_equal(map, r2, r3);
 }
=20
 /*
--=20
2.16.1

Regards,
Ikegami
