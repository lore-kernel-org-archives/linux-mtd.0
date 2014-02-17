Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFIyW-0002qQ-LY
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 07:50:50 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v3 3/3] mtd: nand: omap: fix ecclayout->oobfree->length
Date: Mon, 17 Feb 2014 07:50:18 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA80FB9@DBDE04.ent.ti.com>
References: <1392622885-8415-1-git-send-email-pekon@ti.com>
 <1392622885-8415-4-git-send-email-pekon@ti.com>
In-Reply-To: <1392622885-8415-4-git-send-email-pekon@ti.com>
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
(git send-email --suppress-cc=3Dcc din't work, may be it should have been -=
-supress-cc=3Dbodycc)

>From: Gupta, Pekon
>
>This patch excludes reserved-marker byte-position from oobfree->length
>calculation. Thus all bytes from oobfree->offset till end of OOB are free.
>
>CC: <stable@vger.kernel.org> # 3.13.x+
>Signed-off-by: Pekon Gupta <pekon@ti.com>
>---
> drivers/mtd/nand/omap2.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>index 58685ab..bf642ce 100644
>--- a/drivers/mtd/nand/omap2.c
>+++ b/drivers/mtd/nand/omap2.c
>@@ -1994,9 +1994,8 @@ static int omap_nand_probe(struct platform_device *p=
dev)
> 		goto return_error;
> 	}
>
>-	/* populate remaining ECC layout data */
>-	ecclayout->oobfree->length =3D mtd->oobsize - (BADBLOCK_MARKER_LENGTH +
>-							ecclayout->eccbytes);
>+	/* all OOB bytes from oobfree->offset till end off OOB are free */
>+	ecclayout->oobfree->length =3D mtd->oobsize - ecclayout->oobfree->offset=
;
> 	/* check if NAND device's OOB is enough to store ECC signatures */
> 	if (mtd->oobsize < (ecclayout->eccbytes + BADBLOCK_MARKER_LENGTH)) {
> 		pr_err("not enough OOB bytes required =3D %d, available=3D%d\n",
>--
>1.8.5.1.163.gd7aced9


with regards, pekon
