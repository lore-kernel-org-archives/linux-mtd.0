Received: from mail1.bemta12.messagelabs.com ([216.82.251.8])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI29R-0003bf-01
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 01:19:47 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "PACKHAM
 Chris" <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Subject: [PATCH v4 2/2] mtd: cfi_cmdset_0002: Change erase functions to retry
 for error
Date: Mon, 14 May 2018 01:19:32 +0000
Message-ID: <TY1PR01MB0954C113C63CCBFB98F329C8DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

For the word write functions it is retried for error.
But it is not implemented to retry for the erase functions.
To make sure for the erase functions change to retry as same.

This is needed to prevent the flash erase error caused only once.
It was caused by the error case of chip_good() in the do_erase_oneblock().
Also it was confirmed on the MACRONIX flash device MX29GL512FHT2I-11G.
But the error issue behavior is not able to reproduce at this moment.
The flash controller is parallel Flash interface integrated on BCM53003.

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
 drivers/mtd/chips/cfi_cmdset_0002.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index b69f30b0303c..33af432926b8 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2240,6 +2240,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
+	int retry_cnt =3D 0;
=20
 	adr =3D cfi->addr_unlock1;
=20
@@ -2257,6 +2258,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
=20
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
@@ -2310,6 +2312,9 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
+		if (++retry_cnt <=3D MAX_RETRIES)
+			goto retry;
+
 		ret =3D -EIO;
 	}
=20
@@ -2329,6 +2334,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 	unsigned long timeo =3D jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
+	int retry_cnt =3D 0;
=20
 	adr +=3D chip->start;
=20
@@ -2346,6 +2352,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
=20
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
@@ -2402,6 +2409,9 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
+		if (++retry_cnt <=3D MAX_RETRIES)
+			goto retry;
+
 		ret =3D -EIO;
 	}
=20
--=20
2.16.1
