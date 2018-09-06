Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1GS-0006LC-Tc
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 20:52:34 +0000
Date: Thu, 6 Sep 2018 22:51:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>, linux-mtd@lists.infradead.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] mtd: nand: esmt: retrieve ecc requirements from 5th
 id byte
Message-ID: <20180906225158.1a209c56@xps13>
In-Reply-To: <20180906224422.4be710c8@bbrezillon>
References: <20180906084922.14845-1-marcel@ziswiler.com>
 <20180906084922.14845-2-marcel@ziswiler.com>
 <20180906224422.4be710c8@bbrezillon>
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

Hi Marcel,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 6 Sep 2018
22:44:22 +0200:

> On Thu,  6 Sep 2018 10:49:22 +0200
> Marcel Ziswiler <marcel@ziswiler.com> wrote:
>=20
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >=20
> > This patch enables support to read the ECC level from the NAND flash
> > using ESMT SLC NAND ID byte 5 information as documented e.g. in the
> > following data sheet:
> >=20
> > https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F59L1G81LA(2Y).pdf
> >=20
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >=20
> > ---
> >=20
> >  drivers/mtd/nand/raw/nand_esmt.c | 46 ++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 drivers/mtd/nand/raw/nand_esmt.c
> >=20
> > diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/na=
nd_esmt.c
> > new file mode 100644
> > index 000000000000..360d351ac043
> > --- /dev/null
> > +++ b/drivers/mtd/nand/raw/nand_esmt.c
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2018 Toradex AG
> > + *
> > + * Author: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > + */
> > +
> > +#include <linux/mtd/rawnand.h>
> > +
> > +static void esmt_nand_decode_id(struct nand_chip *chip)
> > +{
> > +	nand_decode_ext_id(chip);
> > +
> > +	/* Extract ECC requirements from 5th id byte. */
> > +	if (chip->id.len >=3D 5 && nand_is_slc(chip)) {
> > +		chip->ecc_step_ds =3D 512;
> > +		switch (chip->id.data[4] & 0x3) {
> > +		case 0x0:
> > +			chip->ecc_strength_ds =3D 4;
> > +			break;
> > +		case 0x1:
> > +			chip->ecc_strength_ds =3D 2;
> > +			break;
> > +		case 0x2:
> > +			chip->ecc_strength_ds =3D 1;
> > +			break;
> > +		default:
> > +			WARN(1, "Could not get ECC info");
> > +			chip->ecc_step_ds =3D 0;
> > +			break;
> > +		}
> > +	}
> > +}
> > +
> > +static int esmt_nand_init(struct nand_chip *chip)
> > +{
> > +	if (nand_is_slc(chip))
> > +		chip->bbt_options |=3D NAND_BBT_SCAN2NDPAGE;
> > +
> > +	return 0;
> > +}
> > +
> > +const struct nand_manufacturer_ops esmt_nand_manuf_ops =3D {
> > +	.detect =3D esmt_nand_decode_id,
> > +	.init =3D esmt_nand_init,
> > +}; =20
>=20
> Looks like you forgot to hook the new esmt_nand_manuf_ops to the ESMT
> entry (in the nand_manufacturer table), so as is, the patch is not
> exactly adding support for ECC req parsing ;-).

I missed that.

Will drop both patches from nand/next, waiting for a v2 (please also
reorder the macros in patch 1 as suggested).

Thanks,
Miqu=C3=A8l
