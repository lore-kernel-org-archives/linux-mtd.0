Received: from ey-out-1920.google.com ([74.125.78.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M53cY-0002pA-4g
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 20:03:13 +0000
Received: by ey-out-1920.google.com with SMTP id 13so507425eye.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 May 2009 13:03:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A0DA8B1.2060109@boundarydevices.com>
References: <4A0DA8B1.2060109@boundarydevices.com>
Date: Fri, 15 May 2009 22:03:04 +0200
Message-ID: <80b317760905151303n50973aceh588cfa8b96842b7f@mail.gmail.com>
Subject: Re: repost [Fwd: [PATCH 1/5] mtd: nand: move layout structure into
	nand_ecc_ctrl]
From: Richard Genoud <richard.genoud@gmail.com>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

thanks for the repost.

2009/5/15 Troy Kisky <troy.kisky@boundarydevices.com>:
[...]
> Subject:=C2=A0[PATCH 2/5] mtd: nand: Calculate better default ecc layout
> Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
> ---
> =C2=A0drivers/mtd/nand/nand_base.c | =C2=A0186 ++++++++++++++++++++++++++=
----------------
> =C2=A01 files changed, 114 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 2780a9b..6505d87 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
[...]
> @@ -2737,42 +2696,125 @@ int nand_scan_tail(struct mtd_info *mtd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUG();
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0chip->ecc.total =3D chip->ecc.steps * chip->ec=
c.bytes;
> + =C2=A0 =C2=A0 =C2=A0 pr_info("%s ecc.total =3D %d, ecc.steps =3D %d, ec=
c.bytes =3D %d, "
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "ecc.size =3D %d, writ=
esize =3D %d\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, chip->ecc.to=
tal, chip->ecc.steps, chip->ecc.bytes,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chip->ecc.size, mtd->w=
ritesize);
> +try_again:
> + =C2=A0 =C2=A0 =C2=A0 bad_block_marker_offset =3D 0;
you should use NAND_LARGE_BADBLOCK_POS defined in nand.h

> + =C2=A0 =C2=A0 =C2=A0 bad_block_marker_length =3D 2;
> + =C2=A0 =C2=A0 =C2=A0 if (mtd->oobsize =3D=3D 8) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bad_block_marker_offse=
t =3D 5;
same with NAND_SMALL_BADBLOCK_POS

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bad_block_marker_lengt=
h =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 } else if (mtd->oobsize =3D=3D 16) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bad_block_marker_offse=
t =3D 4; =C2=A0 =C2=A0/* length still 2 */
