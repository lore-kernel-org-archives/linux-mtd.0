Received: from mail1.bemta8.messagelabs.com ([216.82.243.198])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGMIw-00054k-R9
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 10:26:52 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: Change erase functions to retry for
 error
Date: Wed, 9 May 2018 10:26:22 +0000
Message-ID: <TY1PR01MB0954B6574DFF6E51E48C1F8DDC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB0954474CBDBF98D0E3D3E648DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508132037.152cc581@bbrezillon>
 <TY1PR01MB095425A96233A864806D0635DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508191144.5d8412b6@bbrezillon>
 <d0371e65130a1d64b66031d3f1ed73707ce3f079.camel@infinera.com>
 <TY1PR01MB09546705E1858D6924243F0ADC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB09546705E1858D6924243F0ADC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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
 drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 56aa6b75213d..f522a856526a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -43,6 +43,7 @@
 #define FORCE_WORD_WRITE 0
=20
 #define MAX_WORD_RETRIES 3
+#define MAX_ERASE_RETRY 3
=20
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
@@ -2240,6 +2241,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
+	int retry_cnt =3D 0;
=20
 	adr =3D cfi->addr_unlock1;
=20
@@ -2257,6 +2259,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
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
@@ -2310,6 +2313,9 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
=20
+		if (++retry_cnt <=3D MAX_ERASE_RETRY)
+			goto retry;
+
 		ret =3D -EIO;
 	}
=20
@@ -2329,6 +2335,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 	unsigned long timeo =3D jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
+	int retry_cnt =3D 0;
=20
 	adr +=3D chip->start;
=20
@@ -2346,6 +2353,7 @@ static int __xipram do_erase_oneblock(struct map_info=
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
@@ -2402,6 +2410,9 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
=20
+		if (++retry_cnt <=3D MAX_ERASE_RETRY)
+			goto retry;
+
 		ret =3D -EIO;
 	}
=20
--=20
2.16.1
