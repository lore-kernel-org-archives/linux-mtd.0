Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecRgB-0001uW-OC
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 08:05:41 +0000
Date: Fri, 19 Jan 2018 09:05:18 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][V2] mtd: nand: marvell: remove redundant variable
 'oob_len'
Message-ID: <20180119090518.619e3d44@xps13>
In-Reply-To: <20180119075954.15009-1-colin.king@canonical.com>
References: <20180119075954.15009-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, 19 Jan 2018 07:59:54 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable oob_len is assigned and never read, hence it is redundant and
> can be removed.
>=20
> Cleans up clang warnings:
>=20
> drivers/mtd/nand/marvell_nand.c:1356:6: warning: Value stored to 'oob_len'
> during its initialization is never read
> drivers/mtd/nand/marvell_nand.c:1369:4: warning: Value stored to 'oob_len'
> is never read
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/marvell_nand.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_n=
and.c
> index 4bd53b360277..f15ab37edf4e 100644
> --- a/drivers/mtd/nand/marvell_nand.c
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -1353,7 +1353,6 @@ static int marvell_nfc_hw_ecc_bch_write_page_raw(st=
ruct mtd_info *mtd,
>  	int data_len =3D lt->data_bytes;
>  	int spare_len =3D lt->spare_bytes;
>  	int ecc_len =3D lt->ecc_bytes;
> -	int oob_len =3D spare_len + ecc_len;
>  	int spare_offset =3D 0;
>  	int ecc_offset =3D (lt->full_chunk_cnt * lt->spare_bytes) +
>  		lt->last_spare_bytes;
> @@ -1366,7 +1365,6 @@ static int marvell_nfc_hw_ecc_bch_write_page_raw(st=
ruct mtd_info *mtd,
>  			data_len =3D lt->last_data_bytes;
>  			spare_len =3D lt->last_spare_bytes;
>  			ecc_len =3D lt->last_ecc_bytes;
> -			oob_len =3D spare_len + ecc_len;
>  		}
> =20
>  		/* Point to the column of the next chunk */


Acked-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Thanks,
Miqu=C3=A8l
