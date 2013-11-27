From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 2/4] mtd: spi-nor: add a new data structrue spi_nor{}
Date: Wed, 27 Nov 2013 10:32:13 +0100
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA4EEF0@DBDE04.ent.ti.com>
 <52957690.60102@freescale.com>
In-Reply-To: <52957690.60102@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201311271032.13259.marex@denx.de>
Cc: "broonie@linaro.org" <broonie@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Poddar, Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
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

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B411=E6=9C=8826=E6=97=A5 19:42, Gupta, Pekon =E5=86=
=99=E9=81=93:
> >> From: Huang Shijie [mailto:b32955@freescale.com]
> >=20
> > [...]
> >=20
> >> +#define	MAX_CMD_SIZE		6
> >> +
> >> +enum read_type {
> >> +	M25P80_NORMAL =3D 0,
> >> +	M25P80_FAST,
> >> +	M25P80_QUAD,
> >> +};
> >=20
> > Sorry. no 'M25P80' suffix here this is spi-nor.h :-)
>=20
> ok. thanks. :)
>=20
> >> +
> >> +struct spi_nor {
> >> +	struct mutex		lock;
> >> +	struct mtd_info		mtd;
> >=20
> > mtd_info should not be present here. Rather it should be other way round
> > 'mtd_info->priv =3D (struct spi_nor *) spi_nor;
>=20
> put the mtd here can make code simple,

The MTD API functions will pass you the struct mtd_info anyway, so you will=
 need=20
to implement mtdinfo_to_yourdriverdata() function, no need for duplication.

> do David/Brian have any comment about this?
> If all object to put the mtd here, i will change it.
>=20
> >> +	struct device		*dev;
> >=20
> > Again, spi_nor would be a MTD device, not a new type of device on its
> > own. Thus you should use, mtd_info->dev.
>=20
> this dev pointer is not from the mtd_info->dev, it from the spi_device
> or other spi nor device .

So this is your own device pointer or ... what kind of device pointer?
[...]

Best regards,
Marek Vasut
