Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT7kp-0003Kw-BB
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 13:55:25 +0000
Received: by mail-oi0-x244.google.com with SMTP id u143so12502708oif.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 05:55:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170116133503.13887-1-u.kleine-koenig@pengutronix.de>
References: <20170116133503.13887-1-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 16 Jan 2017 14:55:01 +0100
Message-ID: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: add dt support for Everspin MRAMs
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>,
 Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
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

On 16 January 2017 at 14:35, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> in the list of supported spi IDs. This makes it possible to add these
> using for example:
>
>         compatible =3D "everspin,mr25h40";
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> independent of the decision if -nonjedec is ok for m25p, this is needed
> to make Everspin's MRAMs work.
>
> Best regards
> Uwe
>
>  drivers/mtd/devices/m25p80.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] =3D {
>         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec=
"},
>         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjede=
c"},
>
> +       /* Everspin MRAMs without JEDEC support */
> +       { "mr25h256" }, /* 256 kib, 40 MHz */

A trivial thing: I think it should be Kib
https://en.wikipedia.org/wiki/Binary_prefix

--=20
Rafa=C5=82
