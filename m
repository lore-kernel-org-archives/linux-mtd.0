Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1caft4-00041o-J3
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 09:47:08 +0000
Date: Mon, 6 Feb 2017 10:46:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Kalle Valo <kvalo@codeaurora.org>, linux-mtd@lists.infradead.org,
 linux-wireless@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] mtd: bcm47xxsflash: use platform_(set|get)_drvdata
Message-ID: <20170206104643.414b7aab@bbrezillon>
In-Reply-To: <20170116162818.12094-1-zajec5@gmail.com>
References: <20170116162818.12094-1-zajec5@gmail.com>
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

On Mon, 16 Jan 2017 17:28:18 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> We have generic place & helpers for storing platform driver data so
> there is no reason for using custom priv pointer.
>=20
> This allows cleaning up struct bcma_sflash from unneeded fields.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Kalle: This is mtd focused patch, so I guess it should go through mtd tre=
e. Do
>        you find bcma change important enough to care to Ack it? :)
> ---
>  drivers/mtd/devices/bcm47xxsflash.c         | 6 +++---
>  include/linux/bcma/bcma_driver_chipcommon.h | 3 ---
>  2 files changed, 3 insertions(+), 6 deletions(-)
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
> diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/=
bcma/bcma_driver_chipcommon.h
> index b20e3d5..2f1c690 100644
> --- a/include/linux/bcma/bcma_driver_chipcommon.h
> +++ b/include/linux/bcma/bcma_driver_chipcommon.h
> @@ -593,9 +593,6 @@ struct bcma_sflash {
>  	u32 blocksize;
>  	u16 numblocks;
>  	u32 size;
> -
> -	struct mtd_info *mtd;
> -	void *priv;
>  };
>  #endif
> =20
