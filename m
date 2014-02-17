Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFIxU-0002ls-4u
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 07:49:44 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v3 2/3] mtd: nand: omap: fix ecclayout->oobfree->offset
Date: Mon, 17 Feb 2014 07:49:13 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA80F7C@DBDE04.ent.ti.com>
References: <1392622885-8415-1-git-send-email-pekon@ti.com>
 <1392622885-8415-3-git-send-email-pekon@ti.com>
In-Reply-To: <1392622885-8415-3-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>, "Balbi, Felipe" <balbi@ti.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

removing  stable@vger.kernel.org from CC list.
(git send-email --suppress-cc=3Dcc din't work for me)

>From: Gupta, Pekon
>
>1) In current implementation, ecclayout->oobfree->offset is calculated wit=
h
> respect to ecclayout->eccpos[0] which is incorrect because ECC bytes may =
not
> be stored contiguously in OOB.
> So, this patch calculates ecclayout->oobfree->offset with respect to last
> ECC byte-position 'eccpos[ecclayout->eccbytes-1]'.
>
>2) ECC layout of some ecc-schemes expects reserved-markers at specific ecc=
pos[]
> which should not be over-written by any file-system metadata.
> So this patch aligns oobfree->offset taking into account of such markers.
>
>CC: <stable@vger.kernel.org> # 3.13.x+
>Tested-by: Enric Balletbo i Serra <eballetbo@gmail.com>
>Tested-by: Stefan Roese <sr@denx.de>
>Signed-off-by: Pekon Gupta <pekon@ti.com>
>---
> drivers/mtd/nand/omap2.c | 25 +++++++++++++++----------
> 1 file changed, 15 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>index 34ef941..58685ab 100644
>--- a/drivers/mtd/nand/omap2.c
>+++ b/drivers/mtd/nand/omap2.c
>@@ -1832,8 +1832,9 @@ static int omap_nand_probe(struct platform_device *p=
dev)
> 			oob_index		=3D 1;
> 		for (i =3D 0; i < ecclayout->eccbytes; i++, oob_index++)
> 			ecclayout->eccpos[i]	=3D oob_index;
>-		ecclayout->oobfree->offset	=3D ecclayout->eccpos[0] +
>-							ecclayout->eccbytes;
>+		/* no reserved-marker in ecclayout for this ecc-scheme */
>+		ecclayout->oobfree->offset	=3D
>+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
> 		break;
>
> 	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
>@@ -1856,8 +1857,9 @@ static int omap_nand_probe(struct platform_device *p=
dev)
> 			if (((i + 1) % nand_chip->ecc.bytes) =3D=3D 0)
> 				oob_index++;
> 		}
>-		ecclayout->oobfree->offset	=3D ecclayout->eccpos[0] +
>-							ecclayout->eccbytes;
>+		/* include reserved-marker in ecclayout->oobfree calculation */
>+		ecclayout->oobfree->offset	=3D 1 +
>+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
> 		/* software bch library is used for locating errors */
> 		nand_chip->ecc.priv		=3D nand_bch_init(mtd,
> 							nand_chip->ecc.size,
>@@ -1894,8 +1896,9 @@ static int omap_nand_probe(struct platform_device *p=
dev)
> 		oob_index			=3D BADBLOCK_MARKER_LENGTH;
> 		for (i =3D 0; i < ecclayout->eccbytes; i++, oob_index++)
> 			ecclayout->eccpos[i]	=3D oob_index;
>-		ecclayout->oobfree->offset	=3D ecclayout->eccpos[0] +
>-							ecclayout->eccbytes;
>+		/* reserved marker already included in ecclayout->eccbytes */
>+		ecclayout->oobfree->offset	=3D
>+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
> 		/* This ECC scheme requires ELM H/W block */
> 		if (is_elm_present(info, pdata->elm_of_node, BCH4_ECC) < 0) {
> 			pr_err("nand: error: could not initialize ELM\n");
>@@ -1929,8 +1932,9 @@ static int omap_nand_probe(struct platform_device *p=
dev)
> 			if (((i + 1) % nand_chip->ecc.bytes) =3D=3D 0)
> 				oob_index++;
> 		}
>-		ecclayout->oobfree->offset	=3D ecclayout->eccpos[0] +
>-							ecclayout->eccbytes;
>+		/* include reserved-marker in ecclayout->oobfree calculation */
>+		ecclayout->oobfree->offset	=3D 1 +
>+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
> 		/* software bch library is used for locating errors */
> 		nand_chip->ecc.priv		=3D nand_bch_init(mtd,
> 							nand_chip->ecc.size,
>@@ -1974,8 +1978,9 @@ static int omap_nand_probe(struct platform_device *p=
dev)
> 		oob_index			=3D BADBLOCK_MARKER_LENGTH;
> 		for (i =3D 0; i < ecclayout->eccbytes; i++, oob_index++)
> 			ecclayout->eccpos[i]	=3D oob_index;
>-		ecclayout->oobfree->offset	=3D ecclayout->eccpos[0] +
>-							ecclayout->eccbytes;
>+		/* reserved marker already included in ecclayout->eccbytes */
>+		ecclayout->oobfree->offset	=3D
>+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
> 		break;
> #else
> 		pr_err("nand: error: CONFIG_MTD_NAND_OMAP_BCH not enabled\n");
>--
>1.8.5.1.163.gd7aced9


With regards, pekon
