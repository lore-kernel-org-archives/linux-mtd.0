Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRyWn-0007QJ-2i
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2017 09:52:11 +0000
Received: by mail-ot0-x22f.google.com with SMTP id 73so6883388otj.0
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2017 01:51:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
References: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 13 Jan 2017 10:51:47 +0100
Message-ID: <CACna6rzM6HXz6kGYjcyej5t1adKS_haemAKch7qqu=qcDK60pw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: don't claim mr25h40 to be JEDEC compatible
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>,
 Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
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

On 13 January 2017 at 10:35, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Commit edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40") made it
> possible to use a mr25h40 by writing
>
>         compatible =3D "mr25h40", "jedec,spi-nor";
>
> in a device tree. This chip however isn't JEDEC compatible however, so
> change the chip string and add a compatible entry to bless
>
>         compatible =3D "mr25h40-nonjedec";
>
> as the right way.
>
> Fixes: edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/devices/m25p80.c  | 1 +
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd28034..bd0c335692d2 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -304,6 +304,7 @@ static const struct spi_device_id m25p_ids[] =3D {
>         {"m25p05-nonjedec"},    {"m25p10-nonjedec"},    {"m25p20-nonjedec=
"},
>         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec=
"},
>         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjede=
c"},
> +       {"mr25h40-nonjedec"},
>
>         { },
>  };
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index bbdbbd763c9d..3a8042fe44f0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -825,7 +825,7 @@ static const struct flash_info spi_nor_ids[] =3D {
>         /* Everspin */
>         { "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE =
| SPI_NOR_NO_FR) },
>         { "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE =
| SPI_NOR_NO_FR) },
> -       { "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE =
| SPI_NOR_NO_FR) },
> +       { "mr25h40-nonjedec",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_=
NO_ERASE | SPI_NOR_NO_FR) },
>
>         /* Fujitsu */
>         { "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE)=
 },

It seems every flash for which we use CAT25_INFO should be named with
-nonjedec suffix.

Names mr25h10, mr25h40, cat25c11, cat25c03 cat25c09, cat25c17 and
cat25128 are not even part of m25p80 (or any other driver). Is it
possible to use them at all? Maybe we should just rename all these
entries?

--=20
Rafa=C5=82
