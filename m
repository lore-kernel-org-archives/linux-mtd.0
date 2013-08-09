Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7dLG-0001Gb-1q
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 03:26:18 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: fixup kerneldoc, rename parameter
Date: Fri, 9 Aug 2013 03:25:51 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9F22DA@DBDE04.ent.ti.com>
References: <1376007742-19392-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1376007742-19392-1-git-send-email-computersforpeace@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thanks for review.. And few more thoughts and queries which came to my mind
while writing down subpage-write support. I think its time to address those=
 also.

> First, the function argument is 'offset' not 'column'.
>=20
> Second, the 'data_buf' name is inconsistent with the rest of this file.
> Just use 'buf'.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Gupta, Pekon <pekon@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8f04fb0..49ca737 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1980,13 +1980,14 @@ static int nand_write_page_hwecc(struct mtd_info =
*mtd, struct nand_chip *chip,
>   * nand_write_subpage_hwecc - [REPLACABLE] hardware ECC based subpage wr=
ite
>   * @mtd:       mtd info structure
>   * @chip:      nand chip info structure
> - * @column:    column address of subpage within the page
> + * @offset:    column address of subpage within the page
>   * @data_len:  data length
> + * @buf:       data buffer
>   * @oob_required: must write chip->oob_poi to OOB
>   */
>  static int nand_write_subpage_hwecc(struct mtd_info *mtd,
>                                 struct nand_chip *chip, uint32_t offset,
> -                               uint32_t data_len, const uint8_t *data_bu=
f,
> +                               uint32_t data_len, const uint8_t *buf,
>                                 int oob_required)
>  {
>         uint8_t *oob_buf  =3D chip->oob_poi;
> @@ -2005,20 +2006,20 @@ static int nand_write_subpage_hwecc(struct mtd_in=
fo *mtd,
>                 chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
>=20
>                 /* write data (untouched subpages already masked by 0xFF)=
 */
> -               chip->write_buf(mtd, data_buf, ecc_size);
> +               chip->write_buf(mtd, buf, ecc_size);
>=20
>                 /* mask ECC of un-touched subpages by padding 0xFF */
>                 if ((step < start_step) || (step > end_step))
>                         memset(ecc_calc, 0xff, ecc_bytes);

[Pekon]: In above implementation ..
even though only single subpage data needs to be written, still whole
page is programmed with other 'untouched' subpage data masked with 0xFF.
This is not the efficient way, as it does not give any performance benefit.
Is it possible tht specific sub-pages inside a page can be addressed, read =
& written
independently?
I have not found any NAND devices supporting subpages (partial pages),
and having a separate command 'SUBPAGE_PROGRAM' in addition to PAGE_PROGRAM=
.

If indepedent subpage programming was allowed (as per actual subpage defini=
tion),
and there was a independent NAND command SUBPAGE_PROGRAM then,
we could just just change mtd->writesize =3D=3D subpage_size (partial-page-=
size),
and then eveything should work seemlessly.. correct ?

>                 else
> -                       chip->ecc.calculate(mtd, data_buf, ecc_calc);
> +                       chip->ecc.calculate(mtd, buf, ecc_calc);
>=20
>                 /* mask OOB of un-touched subpages by padding 0xFF */
>                 /* if oob_required, preserve OOB metadata of written subp=
age */
>                 if (!oob_required || (step < start_step) || (step > end_s=
tep))
>                         memset(oob_buf, 0xff, oob_bytes);
>=20
[Pekon]: same it the case for OOB data, untouched OOB bits are masked with =
0xFF.
Also File-systems storing their metadata in OOB area might have some proble=
m with using=20
subpages, because currently our ECC layouts are not uniformly distributed a=
cross subpage
boundaries. Though this is also the problem with ECC also.
Hence going forward, I would suggest to have at-least _ecc_bytes_ eqully di=
stributed
and aligned to subpage boundaries .. thoughts ??

> -               data_buf +=3D ecc_size;
> +               buf +=3D ecc_size;
>                 ecc_calc +=3D ecc_bytes;
>                 oob_buf  +=3D oob_bytes;
>         }
> --
> 1.8.1.2
>=20

with regards, pekon=
