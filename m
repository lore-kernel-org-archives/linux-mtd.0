Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwCN6-0007H1-F3
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 13:20:25 +0000
From: Marek Vasut <marex@denx.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
Date: Tue, 31 Jul 2012 15:20:17 +0200
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <50178A45.3000406@parrot.com>
In-Reply-To: <50178A45.3000406@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201207311520.17450.marex@denx.de>
Cc: Scott Wood <scottwood@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Matthieu CASTET,

> Hi,
>=20
> for ONFI flash (like this micron one) the information should be extracted
> form the ONFI table (programs_per_page IIRC)
>=20
> This should be better than relying on the SOC driver for setting this
> flags.
>=20
> Does the gpmi driver set this flag because it do not support partial write
> ?

Yes

> In this case why it doesn't set  chip->ecc.steps to 1 ?

Can you elabore how exactly will that help please?

> Matthieu
>=20
> Brian Norris a =E9crit :
> > The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. =
It
> > silently masks off at least one flag that might be set by the driver
> > (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly
> > others.
> >=20
> > Really, as long as driver writers exercise a small amount of care with
> > NAND_* options, this mask is not necessary at all. Thus, kill it.
> >=20
> >>From Huang Shijie:
> > "I tested this patch on imx6q-arm2 board with Micron MT29F32G08QAA.
> > it works fine, thanks."
> >=20
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Tested-by: Huang Shijie <shijie8@gmail.com>
> > Cc: Marek Vasut <marex@denx.de>
> > ---
> > Hello Artem/David,
> >=20
> > GPMI NAND has needed this patch for some time, and I think it was agreed
> > on by a few. I'm resending to get acknowledgment from a maintainer.
> >=20
> >  drivers/mtd/nand/nand_base.c | 7 ++-----
> >  include/linux/mtd/nand.h     | 3 ---
> >  2 files changed, 2 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index ead301a..996cc48 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2909,8 +2909,6 @@ static int nand_flash_detect_onfi(struct mtd_info
> > *mtd, struct nand_chip *chip,
> >=20
> >  	if (le16_to_cpu(p->features) & 1)
> >  =09
> >  		*busw =3D NAND_BUSWIDTH_16;
> >=20
> > -	chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
> > -
> >=20
> >  	pr_info("ONFI flash detected\n");
> >  	return 1;
> > =20
> >  }
> >=20
> > @@ -3074,9 +3072,8 @@ static struct nand_flash_dev
> > *nand_get_flash_type(struct mtd_info *mtd,
> >=20
> >  			mtd->erasesize <<=3D ((id_data[3] & 0x03) << 1);
> >  	=09
> >  		}
> >  =09
> >  	}
> >=20
> > -	/* Get chip options, preserve non chip based options */
> > -	chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
> > -	chip->options |=3D type->options & NAND_CHIPOPTIONS_MSK;
> > +	/* Get chip options */
> > +	chip->options |=3D type->options;
> >=20
> >  	/*
> >  =09
> >  	 * Check if chip is not a Samsung device. Do not clear the
> >=20
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 6dce5a7..eeb7015 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -206,9 +206,6 @@ typedef enum {
> >=20
> >  #define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode =3D=3D NAND_ECC_SOFT)=
 \
> > =20
> >  					&& (chip->page_shift > 9))
> >=20
> > -/* Mask to zero out the chip options, which come from the id table */
> > -#define NAND_CHIPOPTIONS_MSK	0x0000ffff
> > -
> >=20
> >  /* Non chip related options */
> >  /* This option skips the bbt scan during initialization. */
> >  #define NAND_SKIP_BBTSCAN	0x00010000

Best regards,
Marek Vasut
