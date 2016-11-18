Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7gx9-0006qI-Na
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 11:03:33 +0000
Received: by mail-oi0-x244.google.com with SMTP id v84so10034924oie.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2016 03:03:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161118101203.18992-1-ash.benz@bk.ru>
References: <20161118101203.18992-1-ash.benz@bk.ru>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 18 Nov 2016 12:03:08 +0100
Message-ID: <CACna6rxYHGpm7y6kKFYA0nC-K6thwuAehFNX+3bDY2phr61BvA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: add Macronix mx25u25635f to list of known
 devices.
To: Ash Benz <ash.benz@bk.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On 18 November 2016 at 11:12, Ash Benz <ash.benz@bk.ru> wrote:
> Signed-off-by: Ash Benz <ash.benz@bk.ru>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index d0fc165..171adb3 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -872,6 +872,7 @@ static const struct flash_info spi_nor_ids[] =3D {
>         { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>         { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> +       { "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, 0) },
>         { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>         { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_=
READ) },
>         { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_=
READ) },

Please keep this list sorted.

Are you sure this chip doesn't support 4 k sections? Datasheets says:
"Equal Sectors with 4K byte each, or Equal Blocks with 32K byte each
or Equal Blocks with 64K byte each "

--=20
Rafa=C5=82

On 18 November 2016 at 11:12, Ash Benz <ash.benz@bk.ru> wrote:
> Signed-off-by: Ash Benz <ash.benz@bk.ru>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index d0fc165..171adb3 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -872,6 +872,7 @@ static const struct flash_info spi_nor_ids[] =3D {
>         { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>         { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> +       { "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, 0) },
>         { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>         { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_=
READ) },
>         { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_=
READ) },
> --
> 2.10.2
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Rafa=C5=82
