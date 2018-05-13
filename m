Received: from mail-eopbgr00131.outbound.protection.outlook.com
 ([40.107.0.131] helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHieO-0006p9-Tg
 for linux-mtd@lists.infradead.org; Sun, 13 May 2018 04:30:27 +0000
From: "Wan, Jane (Nokia - US/Sunnyvale)" <jane.wan@nokia.com>
To: "Boris.Brezillon@bootlin.com" <Boris.Brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jagdish.gediya@nxp.com"
 <jagdish.gediya@nxp.com>, "shreeya.patel23498@gmail.com"
 <shreeya.patel23498@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bos, Ties
 (Nokia - US/Sunnyvale)" <ties.bos@nokia.com>, "Wan, Jane (Nokia -
 US/Sunnyvale)" <jane.wan@nokia.com>
Subject: [PATCH v7] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
Date: Sun, 13 May 2018 04:30:02 +0000
Message-ID: <VI1PR07MB1615A02B23D992E84A3B333F819D0@VI1PR07MB1615.eurprd07.prod.outlook.com>
Content-Language: en-US
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

Per ONFI specification (Rev. 4.0), if all parameter pages have invalid CRC =
values, the bit-wise majority may be used to recover the contents of the pa=
rameter pages from the parameter page copies present.

Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
---
v7: change debug print messages
v6: support the cases that srcbufs are not contiguous
v5: make the bit-wise majority functon generic
v4: move the bit-wise majority code in a separate function
v3: fix warning message detected by kbuild test robot
v2: rebase the changes on top of v4.17-rc1
=20
drivers/mtd/nand/raw/nand_base.c |   50 ++++++++++++++++++++++++++++++++++-=
---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_b=
ase.c
index 72f3a89..b43b784 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5087,6 +5087,35 @@ static int nand_flash_detect_ext_param_page(struct n=
and_chip *chip,
 }
=20
 /*
+ * Recover data with bit-wise majority
+ */
+static void nand_bit_wise_majority(const void **srcbufs,
+				   unsigned int nsrcbufs,
+				   void *dstbuf,
+				   unsigned int bufsize)
+{
+	int i, j, k;
+
+	for (i =3D 0; i < bufsize; i++) {
+		u8 cnt, val;
+
+		val =3D 0;
+		for (j =3D 0; j < 8; j++) {
+			cnt =3D 0;
+			for (k =3D 0; k < nsrcbufs; k++) {
+				const u8 *srcbuf =3D srcbufs[k];
+
+				if (srcbuf[i] & BIT(j))
+					cnt++;
+			}
+			if (cnt > nsrcbufs / 2)
+				val |=3D BIT(j);
+		}
+		((u8 *)dstbuf)[i] =3D val;
+	}
+}
+
+/*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwi=
se.
  */
 static int nand_flash_detect_onfi(struct nand_chip *chip)
@@ -5102,7 +5131,7 @@ static int nand_flash_detect_onfi(struct nand_chip *c=
hip)
 		return 0;
=20
 	/* ONFI chip: allocate a buffer to hold its parameter page */
-	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
+	p =3D kzalloc((sizeof(*p) * 3), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
=20
@@ -5113,21 +5142,32 @@ static int nand_flash_detect_onfi(struct nand_chip =
*chip)
 	}
=20
 	for (i =3D 0; i < 3; i++) {
-		ret =3D nand_read_data_op(chip, p, sizeof(*p), true);
+		ret =3D nand_read_data_op(chip, &p[i], sizeof(*p), true);
 		if (ret) {
 			ret =3D 0;
 			goto free_onfi_param_page;
 		}
=20
-		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
+		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254) =3D=3D
 				le16_to_cpu(p->crc)) {
+			if (i)
+				memcpy(p, &p[i], sizeof(*p));
 			break;
 		}
 	}
=20
 	if (i =3D=3D 3) {
-		pr_err("Could not find valid ONFI parameter page; aborting\n");
-		goto free_onfi_param_page;
+		const void *srcbufs[3] =3D {p, p + 1, p + 2};
+
+		pr_warn("Could not find a valid ONFI parameter page, trying bit-wise maj=
ority to recover it\n");
+		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
+				       sizeof(*p));
+
+		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) !=3D
+				le16_to_cpu(p->crc)) {
+			pr_err("ONFI parameter recovery failed, aborting\n");
+			goto free_onfi_param_page;
+		}
 	}
=20
 	/* Check version */
--=20
1.7.9.5
