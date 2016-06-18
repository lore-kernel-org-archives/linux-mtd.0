Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEETa-0000xW-1E
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 11:31:47 +0000
Date: Sat, 18 Jun 2016 13:31:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Hans de Goede
 <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, Aleksei Mamlin
 <mamlinav@gmail.com>
Subject: Re: [PATCH v2 05/15] mtd: nand: add manufacturer specific
 initialization/detection steps
Message-ID: <20160618133121.1f4ae8f8@bbrezillon>
In-Reply-To: <576512F5.7050506@nod.at>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465390849-13199-6-git-send-email-boris.brezillon@free-electrons.com>
 <576512F5.7050506@nod.at>
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

On Sat, 18 Jun 2016 11:23:01 +0200
Richard Weinberger <richard@nod.at> wrote:

> Boris,
>=20
> Am 08.06.2016 um 15:00 schrieb Boris Brezillon:
> > A lot of NANDs are implementing generic features in a non-generic way,
> > or are providing advanced auto-detection logic where the NAND ID bytes
> > meaning changes with the NAND generation.
> >=20
> > Providing this vendor specific initialization step will allow us to get
> > rid of the full ids in the nand_ids table or all the vendor specific
> > cases added over the time in the generic NAND ID decoding logic.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 42 ++++++++++++++++++++++++++++++++----=
------
> >  include/linux/mtd/nand.h     | 36 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 95e9a8e..0a7d1c6 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3580,7 +3580,7 @@ static int nand_get_bits_per_cell(u8 cellinfo)
> >   * chip. The rest of the parameters must be decoded according to gener=
ic or
> >   * manufacturer-specific "extended ID" decoding patterns.
> >   */
> > -static void nand_decode_ext_id(struct nand_chip *chip)
> > +void nand_decode_ext_id(struct nand_chip *chip)
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> >  	int extid, id_len =3D chip->id.len;
> > @@ -3705,6 +3705,7 @@ static void nand_decode_ext_id(struct nand_chip *=
chip)
> > =20
> >  	}
> >  }
> > +EXPORT_SYMBOL_GPL(nand_decode_ext_id);
> > =20
> >  /*
> >   * Old devices have chip data hardcoded in the device ID table. nand_d=
ecode_id
> > @@ -3815,7 +3816,7 @@ static int nand_detect(struct nand_chip *chip, st=
ruct nand_flash_dev *type)
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> >  	int busw;
> > -	int i, maf_idx;
> > +	int i, maf_idx, ret;
> >  	u8 *id_data =3D chip->id.data;
> >  	u8 maf_id, dev_id;
> > =20
> > @@ -3856,6 +3857,14 @@ static int nand_detect(struct nand_chip *chip, s=
truct nand_flash_dev *type)
> > =20
> >  	chip->id.len =3D nand_id_len(id_data, 8);
> > =20
> > +	/* Try to identify manufacturer */
> > +	for (maf_idx =3D 0; nand_manuf_ids[maf_idx].id !=3D 0x0; maf_idx++) {
> > +		if (nand_manuf_ids[maf_idx].id =3D=3D maf_id)
> > +			break;
> > +	}
> > +
> > +	chip->manufacturer.ops =3D nand_manuf_ids[maf_idx].ops;
> > + =20
>=20
> Instead of checking on every access whether chip->manufacturer.ops is pre=
sent, just
> assign a nop field.
> i.e.
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 55f3ab8..aadebe7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3703,6 +3703,10 @@ static int nand_detect(struct nand_chip *chip, str=
uct nand_flash_dev *type)
>=20
>  	chip->manufacturer.ops =3D nand_manuf_ids[maf_idx].ops;
>=20
> +	if (!chip->manufacturer.ops)
> +		/* assign no operations */
> +		chip->manufacturer.ops =3D nand_manuf_ids[0].ops;
> +
>  	if (!type)
>  		type =3D nand_flash_ids;
>=20
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index f1476ff..cdd26af 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -173,6 +173,8 @@ extern const struct nand_manufacturer_ops micron_nand=
_manuf_ops;
>  extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
>  extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
>=20
> +static const struct nand_manufacturer_ops no_ops;
> +
>  struct nand_manufacturers nand_manuf_ids[] =3D {
>  	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
>  	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
> @@ -188,7 +190,7 @@ struct nand_manufacturers nand_manuf_ids[] =3D {
>  	{NAND_MFR_SANDISK, "SanDisk"},
>  	{NAND_MFR_INTEL, "Intel"},
>  	{NAND_MFR_ATO, "ATO"},
> -	{0x0, "Unknown"}
> +	{0x0, "Unknown", &no_ops}
>  };
>=20
>  EXPORT_SYMBOL(nand_manuf_ids);
>=20

Sorry, but I don't see any added value in adding this no_ops instance.
The NULL value is supposed to represent no_ops.
That's not like this path was critical: it's only call once during NAND
initialization.


How about adding the following helpers instead:

static inline bool nand_has_manufacturer_ops(struct nand_chip * chip)
{
	return chip->manufacturer.ops !=3D NULL;
}

static inline void nand_manufacturer_detect(struct nand_chip * chip)
{
	if (!chip->manufacturer.ops ||=C2=A0chip->manufacturer.ops->detect)
		return;

	chip->manufacturer.ops->detect(chip);
}

static inline int nand_manufacturer_init(struct nand_chip * chip)
{
	if (!chip->manufacturer.ops ||=C2=A0chip->manufacturer.ops->init)
		return 0;

	return chip->manufacturer.ops->init(chip);
}

>=20
> >  	if (!type)
> >  		type =3D nand_flash_ids;
> > =20
> > @@ -3903,8 +3912,14 @@ static int nand_detect(struct nand_chip *chip, s=
truct nand_flash_dev *type)
> >  	chip->chipsize =3D (uint64_t)type->chipsize << 20;
> > =20
> >  	if (!type->pagesize) {
> > -		/* Decode parameters from extended ID */
> > -		nand_decode_ext_id(chip);
> > +		/*
> > +		 * Try manufacturer detection if available and use
> > +		 * nand_decode_ext_id() otherwise.
> > +		 */
> > +		if (chip->manufacturer.ops->detect) =20
>=20
> You need to check here for chip->manufacturer.ops first.

Correct.
