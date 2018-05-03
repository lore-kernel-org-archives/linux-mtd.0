Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE9B8-0003Kv-CI
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 08:01:28 +0000
Date: Thu, 3 May 2018 10:01:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Richard Weinberger
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op
Message-ID: <20180503100114.16d573dc@xps13>
In-Reply-To: <20180503090348.0c10b00f@bbrezillon>
References: <20180503022128.10702-1-chris.packham@alliedtelesis.co.nz>
 <a40b0454ea78494983c909fd6b2c08c8@svr-chch-ex1.atlnz.lc>
 <20180503090348.0c10b00f@bbrezillon>
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

Hi Boris, Chris,

> > > diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/r=
aw/marvell_nand.c
> > > index 1d779a35ac8e..e4b964fd40d8 100644
> > > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > > @@ -1074,7 +1074,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page=
(struct nand_chip *chip,
> > >   		return ret;
> > >  =20
> > >   	ret =3D marvell_nfc_wait_op(chip,
> > > -				  chip->data_interface.timings.sdr.tPROG_max);
> > > +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> > >   	return ret;
> > >   }
> > >  =20
> > > @@ -1494,7 +1494,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(st=
ruct mtd_info *mtd,
> > >   	}
> > >  =20
> > >   	ret =3D marvell_nfc_wait_op(chip,
> > > -				  chip->data_interface.timings.sdr.tPROG_max);
> > > +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> > >  =20

[...]

> > The old pxa3xx driver had hard coded 200ms delays. These delays now wor=
k=20
> > out to 1ms which seems every bit as wrong as 600000000ms. =20

When the 'keep-config' property is populated, the
->setup_data_interface() hook of the driver is not shown to the core,
which leads to not "updating" the timings like tPROG_max.

While it worked with the old driver that hardcoded this delay, this
might not work anymore with the current driver because it expects
timings.sdr.tPROG_max to be !=3D 0 (and PSEC_TO_MSEC(0) also returns 0).

This is probably something to fix.

Regards,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
