Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhqK9-00058O-LH
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 05:57:31 +0000
Date: Tue, 24 Jul 2018 07:57:17 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Bert Kenward <bkenward@solarflare.com>,
 linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] mtd: lpddr: use mtd_device_register()
Message-ID: <20180724075717.0f5cf3d4@bbrezillon>
In-Reply-To: <20180721115510.24078-1-zajec5@gmail.com>
References: <20180721115510.24078-1-zajec5@gmail.com>
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

On Sat, 21 Jul 2018 13:55:09 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This driver doesn't specify parsers so it can use that little helper.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied this one to mtd/next.

> ---
>  drivers/mtd/lpddr/lpddr2_nvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nv=
m.c
> index 5d73db2a496d..c950c880ad59 100644
> --- a/drivers/mtd/lpddr/lpddr2_nvm.c
> +++ b/drivers/mtd/lpddr/lpddr2_nvm.c
> @@ -476,7 +476,7 @@ static int lpddr2_nvm_probe(struct platform_device *p=
dev)
>  		return -EINVAL;
>  	}
>  	/* Parse partitions and register the MTD device */
> -	return mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
> +	return mtd_device_register(mtd, NULL, 0);
>  }
> =20
>  /*
