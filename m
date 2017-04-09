Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxDet-0001En-FO
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 14:17:41 +0000
Date: Sun, 9 Apr 2017 16:17:17 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, David
 Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Dinh
 Nguyen <dinguyen@kernel.org>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Graham Moore
 <grmoore@opensource.altera.com>, Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v3 33/37] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170409161717.0f59bc9d@bbrezillon>
In-Reply-To: <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Mar 2017 17:15:04 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Some NAND controllers are using DMA engine requiring a specific
> buffer alignment.  The core provides no guarantee on the nand_buffers
> pointers, which forces some drivers to allocate their own buffers
> and pass the NAND_OWN_BUFFERS flag.
>=20
> Rework the nand_buffers allocation logic to allocate each buffer
> independently.  This should make most NAND controllers/DMA engine
> happy, and allow us to get rid of these custom buf allocation in
> NAND controller drivers.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
> Changes in v3:
>   - Reword git-log
>=20
> Changes in v2:
>   - Newly added
>=20
>  drivers/mtd/nand/nand_base.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index f828ad7..e9d3195 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4613,13 +4613,25 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	}
> =20
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
> -		nbuf =3D kzalloc(sizeof(*nbuf) + mtd->writesize
> -				+ mtd->oobsize * 3, GFP_KERNEL);
> +		nbuf =3D kzalloc(sizeof(*nbuf), GFP_KERNEL);
>  		if (!nbuf)
>  			return -ENOMEM;
> -		nbuf->ecccalc =3D (uint8_t *)(nbuf + 1);
> -		nbuf->ecccode =3D nbuf->ecccalc + mtd->oobsize;
> -		nbuf->databuf =3D nbuf->ecccode + mtd->oobsize;
> +		nbuf->ecccalc =3D kmalloc(mtd->oobsize, GFP_KERNEL);
> +		if (!nbuf->ecccalc) {
> +			ret =3D -EINVAL;
> +			goto err_free;

You have a memory leak here, because chip->buffers =3D nbuf is only done
after all allocations have succeeded.

> +		}
> +		nbuf->ecccode =3D kmalloc(mtd->oobsize, GFP_KERNEL);
> +		if (!nbuf->ecccode) {
> +			ret =3D -EINVAL;

			ret =3D -ENOMEM;

I have the following fixup patch, let me know if you're okay with it
and I'll squash it in the original commit.

Thanks,

Boris

--->8---
=46rom 7903e4c997da101bc0f15016936116c4bb9db78c Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Sun, 9 Apr 2017 16:14:36 +0200
Subject: [PATCH] fixup! mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset

---
 drivers/mtd/nand/nand_base.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 23a415d1f124..ed49a1d634b0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4501,7 +4501,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 {
 	struct nand_chip *chip =3D mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
-	struct nand_buffers *nbuf;
+	struct nand_buffers *nbuf =3D NULL;
 	int ret;
=20
 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
@@ -4518,20 +4518,23 @@ int nand_scan_tail(struct mtd_info *mtd)
 		nbuf =3D kzalloc(sizeof(*nbuf), GFP_KERNEL);
 		if (!nbuf)
 			return -ENOMEM;
+
 		nbuf->ecccalc =3D kmalloc(mtd->oobsize, GFP_KERNEL);
 		if (!nbuf->ecccalc) {
-			ret =3D -EINVAL;
+			ret =3D -ENOMEM;
 			goto err_free;
 		}
+
 		nbuf->ecccode =3D kmalloc(mtd->oobsize, GFP_KERNEL);
 		if (!nbuf->ecccode) {
-			ret =3D -EINVAL;
+			ret =3D -ENOMEM;
 			goto err_free;
 		}
+
 		nbuf->databuf =3D kmalloc(mtd->writesize + mtd->oobsize,
 					GFP_KERNEL);
 		if (!nbuf->databuf) {
-			ret =3D -EINVAL;
+			ret =3D -ENOMEM;
 			goto err_free;
 		}
=20
@@ -4773,11 +4776,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Build bad block table */
 	return chip->scan_bbt(mtd);
 err_free:
-	if (!(chip->options & NAND_OWN_BUFFERS)) {
-		kfree(chip->buffers->databuf);
-		kfree(chip->buffers->ecccode);
-		kfree(chip->buffers->ecccalc);
-		kfree(chip->buffers);
+	if (nbuf) {
+		kfree(nbuf->databuf);
+		kfree(nbuf->ecccode);
+		kfree(nbuf->ecccalc);
+		kfree(nbuf);
 	}
 	return ret;
 }
@@ -4829,7 +4832,7 @@ void nand_cleanup(struct nand_chip *chip)
=20
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-	if (!(chip->options & NAND_OWN_BUFFERS)) {
+	if (!(chip->options & NAND_OWN_BUFFERS) && chip->buffers) {
 		kfree(chip->buffers->databuf);
 		kfree(chip->buffers->ecccode);
 		kfree(chip->buffers->ecccalc);
--=20
2.7.4
