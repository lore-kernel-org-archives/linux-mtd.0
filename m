Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cT8AS-0001z8-3h
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 14:21:53 +0000
Date: Mon, 16 Jan 2017 15:21:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use platform_(set|get)_drvdata
Message-ID: <20170116152130.5c4b01d9@bbrezillon>
In-Reply-To: <20170116130409.2686-1-zajec5@gmail.com>
References: <20170116130409.2686-1-zajec5@gmail.com>
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

On Mon, 16 Jan 2017 14:04:09 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> We have generic place & helpers for storing platform driver data so
> there is no reason for using custom priv pointer.
>=20
> This patch will be followed by cleaning struct bcma_sflash which will go
> through another tree where bcma development happens.

Why not removing the ->priv field from the bcma_sflash struct
definition in this patch?
If it needs to go through a different tree we can ack the patch and let
the other maintainer(s) take the whole series.

Note that ->mtd seems to be unused, and should probably be removed as
well (in a separate patch of course). But I guess you already know that.

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/devices/bcm47xxsflash.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bc=
m47xxsflash.c
> index 514be04..4decd8c 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -284,7 +284,6 @@ static int bcm47xxsflash_bcma_probe(struct platform_d=
evice *pdev)
>  	b47s =3D devm_kzalloc(dev, sizeof(*b47s), GFP_KERNEL);
>  	if (!b47s)
>  		return -ENOMEM;
> -	sflash->priv =3D b47s;
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
> @@ -334,6 +333,8 @@ static int bcm47xxsflash_bcma_probe(struct platform_d=
evice *pdev)
>  	b47s->size =3D sflash->size;
>  	bcm47xxsflash_fill_mtd(b47s, &pdev->dev);
> =20
> +	platform_set_drvdata(pdev, b47s);
> +
>  	err =3D mtd_device_parse_register(&b47s->mtd, probes, NULL, NULL, 0);
>  	if (err) {
>  		pr_err("Failed to register MTD device: %d\n", err);
> @@ -349,8 +350,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_d=
evice *pdev)
> =20
>  static int bcm47xxsflash_bcma_remove(struct platform_device *pdev)
>  {
> -	struct bcma_sflash *sflash =3D dev_get_platdata(&pdev->dev);
> -	struct bcm47xxsflash *b47s =3D sflash->priv;
> +	struct bcm47xxsflash *b47s =3D platform_get_drvdata(pdev);
> =20
>  	mtd_device_unregister(&b47s->mtd);
>  	iounmap(b47s->window);
