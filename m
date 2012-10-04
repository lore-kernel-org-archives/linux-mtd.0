From: "Philip, Avinash" <avinashphilip@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: RE: [PATCH 3/4] ARM: OMAP2: gpmc: Add support for BCH ECC scheme
Date: Thu, 4 Oct 2012 08:03:42 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9B4902@DBDE01.ent.ti.com>
References: <1349274589-11389-1-git-send-email-avinashphilip@ti.com>
 <1349274589-11389-4-git-send-email-avinashphilip@ti.com>
 <20121003185458.GA27502@parrot.com>
In-Reply-To: <20121003185458.GA27502@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 04, 2012 at 00:24:58, Ivan Djelic wrote:
> On Wed, Oct 03, 2012 at 03:29:48PM +0100, Philip, Avinash wrote:
> > Add support for BCH ECC scheme to gpmc driver and also enabling multi
> > sector read/write. This helps in doing single shot NAND page read and
> > write.
> >=20
> > ECC engine configurations
> > BCH 4 bit support
> > 1. write =3D> ECC engine configured in wrap mode 6 and with ecc_size0 a=
s 32.
> > 2. read  =3D> ECC engine configured in wrap mode 1 and with ecc_size0 a=
s
> > 13 and ecc_size1 as 1.
> >=20
> > BCH 8 bit support
> > 1. write =3D> ECC engine configured in wrap mode 6 and with ecc_size0 a=
s 32.
> > 2. read  =3D> ECC engine configured in wrap mode 1 and with ecc_size0 a=
s
> > 26 and ecc_size1 as 2.
> >=20
> > Note: For BCH8 ECC bytes set to 14 to make compatible with RBL.
> >=20
>=20
> Hi Philip,
>=20
> I have a few comments/questions below,
>=20
> (...)
> > diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> > index 72428bd..c9bc3cf 100644
> > --- a/arch/arm/mach-omap2/gpmc.c
> > +++ b/arch/arm/mach-omap2/gpmc.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/mtd/nand.h>
> > =20
> >  #include <asm/mach-types.h>
> >  #include <plat/gpmc.h>
> > @@ -83,6 +84,18 @@
> >  #define ENABLE_PREFETCH		(0x1 << 7)
> >  #define DMA_MPU_MODE		2
> > =20
> > +/* GPMC ecc engine settings for read */
> > +#define BCH_WRAPMODE_1		1	/* BCH wrap mode 6 */
>=20
> Comment should say "mode 1".

Ok I will correct it.

>=20
> (...)
> >  /**
> > + * gpmc_calculate_ecc_bch	- Generate ecc bytes per block of 512 data b=
ytes for entire page
> > + * @cs:  chip select number
> > + * @dat: The pointer to data on which ECC is computed
> > + * @ecc: The ECC output buffer
> > + */
> > +int gpmc_calculate_ecc_bch(int cs, const u_char *dat, u_char *ecc)
> > +{
> > +	int i, eccbchtsel;
> > +	u32 nsectors, reg, bch_val1, bch_val2, bch_val3, bch_val4;
> > +
> > +	if (gpmc_ecc_used !=3D cs)
> > +		return -EINVAL;
> > +
> > +	/* read number of sectors for ecc to be calculated */
> > +	nsectors =3D ((gpmc_read_reg(GPMC_ECC_CONFIG) >> 4) & 0x7) + 1;
> > +	/*
> > +	 * find BCH scheme used
> > +	 * 0 -> BCH4
> > +	 * 1 -> BCH8
> > +	 */
> > +	eccbchtsel =3D ((gpmc_read_reg(GPMC_ECC_CONFIG) >> 12) & 0x3);
> > +
> > +	/* update ecc bytes for entire page */
> > +	for (i =3D 0; i < nsectors; i++) {
> > +
> > +		reg =3D GPMC_ECC_BCH_RESULT_0 + 16 * i;
> > +
> > +		/* Read hw-computed remainder */
> > +		bch_val1 =3D gpmc_read_reg(reg + 0);
> > +		bch_val2 =3D gpmc_read_reg(reg + 4);
> > +		if (eccbchtsel) {
> > +			bch_val3 =3D gpmc_read_reg(reg + 8);
> > +			bch_val4 =3D gpmc_read_reg(reg + 12);
> > +		}
> > +
> > +		if (eccbchtsel) {
> > +			/* BCH8 ecc scheme */
> > +			*ecc++ =3D (bch_val4 & 0xFF);
> > +			*ecc++ =3D ((bch_val3 >> 24) & 0xFF);
> > +			*ecc++ =3D ((bch_val3 >> 16) & 0xFF);
> > +			*ecc++ =3D ((bch_val3 >> 8) & 0xFF);
> > +			*ecc++ =3D (bch_val3 & 0xFF);
> > +			*ecc++ =3D ((bch_val2 >> 24) & 0xFF);
> > +			*ecc++ =3D ((bch_val2 >> 16) & 0xFF);
> > +			*ecc++ =3D ((bch_val2 >> 8) & 0xFF);
> > +			*ecc++ =3D (bch_val2 & 0xFF);
> > +			*ecc++ =3D ((bch_val1 >> 24) & 0xFF);
> > +			*ecc++ =3D ((bch_val1 >> 16) & 0xFF);
> > +			*ecc++ =3D ((bch_val1 >> 8) & 0xFF);
> > +			*ecc++ =3D (bch_val1 & 0xFF);
> > +			/* 14th byte of ecc not used */
> > +			*ecc++ =3D 0;
> > +		} else {
> > +			/* BCH4 ecc scheme */
> > +			*ecc++ =3D ((bch_val2 >> 12) & 0xFF);
> > +			*ecc++ =3D ((bch_val2 >> 4) & 0xFF);
> > +			*ecc++ =3D (((bch_val2 & 0xF) << 4) |
> > +					((bch_val1 >> 28) & 0xF));
> > +			*ecc++ =3D ((bch_val1 >> 20) & 0xFF);
> > +			*ecc++ =3D ((bch_val1 >> 12) & 0xFF);
> > +			*ecc++ =3D ((bch_val1 >> 4) & 0xFF);
> > +			*ecc++ =3D ((bch_val1 & 0xF) << 4);
> > +		}
> > +	}
> > +
> > +	gpmc_ecc_used =3D -EINVAL;
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(gpmc_calculate_ecc_bch);
>=20
> Here you introduce a function very similar to gpmc_calculate_ecc_bch4 and
> gpmc_calculate_ecc_bch8, but without the added benefit (IMHO) of the cons=
tant
> polynomial that allows to get an ecc sequence of 0xFFs for a buffer fille=
d with
> 0xFFs. Why ?

I don't exactly understand what we benefitted/achieve. In my observation,
this API does spare area also written with 0xFF if data area is 0xFFs.
So the area looks like erased page again.

> If using the ELM prevents you from reusing gpmc_calculate_ecc_bch[48], co=
uld you explain in which way ?

When using gpmc_calculate_ecc_bch[48], calculated ecc values modified.
The read sequence we following is
Read 512 byte -> read ECC bytes from spare area
Now the calculated ECC will be zero if no error is reported. In case of err=
or, a syndrome
Polynomial is reported. In either case modifying will corrupt the data.

This is valid if we are writing a page with 0xFF also. But this time we wer=
e filling a valid
ecc in spare area not 0xFF as in gpmc_calculate_ecc_bch[48].

Additionally to make compatible with RBL ECC layout (14 byte), we were sett=
ing ecc[13] as zero.

Thanks
Avinash =20

>=20
> Best regards,
> --
> Ivan
>=20
