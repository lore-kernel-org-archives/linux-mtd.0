Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDE62-00022s-9h
 for linux-mtd@lists.infradead.org; Mon, 19 Jan 2015 15:18:31 +0000
Received: by mail-la0-f43.google.com with SMTP id q1so14096305lam.2
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2015 07:18:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1418766416-6446-1-git-send-email-zajec5@gmail.com>
References: <1418766416-6446-1-git-send-email-zajec5@gmail.com>
Date: Mon, 19 Jan 2015 16:18:05 +0100
Message-ID: <CACna6rxh_Y2+tY3mea2NDXq7nd3TZ85Q0CZv1Om3xkoVbUp42A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: support for (GigaDevice) GD25Q128B
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 December 2014 at 22:46, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wr=
ote:
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index 0f8ec3c..ebcc97a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -538,6 +538,7 @@ static const struct spi_device_id spi_nor_ids[] =3D {
>         /* GigaDevice */
>         { "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
>         { "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
> +       { "gd25q128",   INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
>
>         /* Intel/Numonyx -- xxxs33b */
>         { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> --
> 1.8.4.5

Hey Brian,

Could I bring a bit of your attention to this trivial patch, please? :)

--=20
Rafa=C5=82
