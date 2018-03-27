Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0u71-0002BO-U6
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 19:18:29 +0000
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: update documentation of mtd_device_parse_register()
Date: Tue, 27 Mar 2018 21:18:14 +0200
Message-ID: <11374740.7K3gF4UMb0@blindfold>
In-Reply-To: <20180327133647.15110-1-zajec5@gmail.com>
References: <20180327133647.15110-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 27. M=C3=A4rz 2018, 15:36:47 CEST schrieb Rafa=C5=82 Mi=C5=82e=
cki:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> In the commit 2c77c57d22adb ("mtd: move code adding master MTD out of
> mtd_add_device_partitions()") behavior of mtd_device_parse_register()
> has very slightly changed. It's a pretty non-significant order change
> to match updated function behavior.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/mtdcore.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index f25d65ea7149..20d5262c5b5c 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -673,14 +673,13 @@ static void mtd_set_dev_defaults(struct mtd_info *m=
td)
>   * 'parse_mtd_partitions()') and MTD device and partitions registering. =
It
>   * basically follows the most common pattern found in many MTD drivers:
>   *
> - * * It first tries to probe partitions on MTD device @mtd using parsers
> + * * If the MTD_PARTITIONED_MASTER option is set, then the device as a w=
hole is
> + *   registered first.
> + * * Then It tries to probe partitions on MTD device @mtd using parsers
>   *   specified in @types (if @types is %NULL, then the default list of p=
arsers
>   *   is used, see 'parse_mtd_partitions()' for more information). If non=
e are
>   *   found this functions tries to fallback to information specified in
>   *   @parts/@nr_parts.
> - * * If any partitioning info was found, this function registers the fou=
nd
> - *   partitions. If the MTD_PARTITIONED_MASTER option is set, then the d=
evice
> - *   as a whole is registered first.
>   * * If no partitions were found this function just registers the MTD de=
vice
>   *   @mtd and exits.
>   *
>=20

Thanks for taking care of docs. :-)

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
