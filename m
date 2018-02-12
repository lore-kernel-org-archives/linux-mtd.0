Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1el8xK-000220-DF
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 07:55:19 +0000
Date: Mon, 12 Feb 2018 08:54:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>, Vignesh R <vigneshr@ti.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 4/6] spi: ti-qspi: Implement the spi_mem interface
Message-ID: <20180212085442.42109296@xps13>
In-Reply-To: <20180211181819.31513336@bbrezillon>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-5-boris.brezillon@bootlin.com>
 <20180211161706.31d0bdc8@xps13>
 <20180211181819.31513336@bbrezillon>
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

Hi Boris,


> > > @@ -566,6 +567,62 @@ static int ti_qspi_spi_flash_read(struct spi_dev=
ice *spi,
> > >  	return ret;
> > >  }
> > > =20
> > > +static int ti_qspi_exec_mem_op(struct spi_mem *mem,
> > > +			       const struct spi_mem_op *op)
> > > +{
> > > +	struct ti_qspi *qspi =3D spi_master_get_devdata(mem->spi->master);
> > > +	int i, ret =3D 0;
> > > +	u32 from =3D 0;
> > > +
> > > +	/* Only optimize read path. */
> > > +	if (!op->data.nbytes || op->data.dir !=3D SPI_MEM_DATA_IN ||
> > > +	    !op->addr.nbytes || op->addr.nbytes > 4)
> > > +		return -ENOTSUPP;
> > > +
> > > +	for (i =3D 0; i < op->addr.nbytes; i++) {
> > > +		from <<=3D 8;
> > > +		from |=3D op->addr.buf[i];
> > > +	}
> > > +
> > > +	/* Address exceeds MMIO window size, fall back to regular mode. */ =
  =20
> >=20
> > I don't understand how do you fall back to regular mode? =20
>=20
> If you look at spi_mem_exec_op() you'll see that if the controller
> ->exec_op() returns -ENOTSUPP, the function will try to execute the =20
> operation using the regular spi_sync() API. I'll try to make it clearer
> in my next iteration.

Ok, I mixed the functions in my head and this answers the below
question as well.

>=20
> > Moreover if the
> > purpose of adding this function is to remove spi_flash_read(). =20
>=20
> Sorry, I don't get that one. Yes, the spi_mem_ops interface is here to
> replace the ->spi_flash_xx() one, and that's exactly what I'm doing
> here: porting the existing implementation to the new interface, keeping
> the exact same limitations (only read path is optimized, and the request
> has to fall in the iomem range mapped by the driver).
>=20

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
