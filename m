Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhsu5-0003EN-TS
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 08:42:47 +0000
Date: Tue, 24 Jul 2018 10:42:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Bert Kenward <bkenward@solarflare.com>,
 linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] mtd: spi-nor: intel-spi: use mtd_device_register()
Message-ID: <20180724104224.0f66f93d@bbrezillon>
In-Reply-To: <20180721115510.24078-2-zajec5@gmail.com>
References: <20180721115510.24078-1-zajec5@gmail.com>
 <20180721115510.24078-2-zajec5@gmail.com>
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

On Sat, 21 Jul 2018 13:55:10 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This driver doesn't specify parsers so it can use that little helper.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied to spi-nor/next.

> ---
>  drivers/mtd/spi-nor/intel-spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-=
spi.c
> index d2cbfc27826e..af0a22019516 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -908,7 +908,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
>  	if (!ispi->writeable || !writeable)
>  		ispi->nor.mtd.flags &=3D ~MTD_WRITEABLE;
> =20
> -	ret =3D mtd_device_parse_register(&ispi->nor.mtd, NULL, NULL, &part, 1);
> +	ret =3D mtd_device_register(&ispi->nor.mtd, &part, 1);
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
