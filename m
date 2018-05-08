Received: from mail1.bemta8.messagelabs.com ([216.82.243.204])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG50s-0000kZ-Co
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 15:58:52 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: Change definition naming to retry write
 operation
Date: Tue, 8 May 2018 15:58:34 +0000
Message-ID: <TY1PR01MB0954BFEE0FC7B301D19D5F3CDC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

The definition can be used for other write operations also.
So change the naming to MAX_WRITE_RETRIES from MAX_WORD_RETRIES.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 56aa6b75213d..28b07336bda3 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -42,7 +42,7 @@
 #define AMD_BOOTLOC_BUG
 #define FORCE_WORD_WRITE 0
=20
-#define MAX_WORD_RETRIES 3
+#define MAX_WRITE_RETRIES 3
=20
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
@@ -1646,7 +1646,7 @@ static int __xipram do_write_oneword(struct map_info =
*map, struct flchip *chip,
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
=20
-		if (++retry_cnt <=3D MAX_WORD_RETRIES)
+		if (++retry_cnt <=3D MAX_WRITE_RETRIES)
 			goto retry;
=20
 		ret =3D -EIO;
@@ -2105,7 +2105,7 @@ static int do_panic_write_oneword(struct map_info *ma=
p, struct flchip *chip,
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
-		if (++retry_cnt <=3D MAX_WORD_RETRIES)
+		if (++retry_cnt <=3D MAX_WRITE_RETRIES)
 			goto retry;
=20
 		ret =3D -EIO;
--=20
2.16.1
