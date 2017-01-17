Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTTdO-0005K4-5P
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 13:17:11 +0000
Received: by mail-ot0-x243.google.com with SMTP id f9so9151715otd.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 05:16:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
 <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 17 Jan 2017 14:16:48 +0100
Message-ID: <CACna6rwSZH8697px46KitcsFTROhqAQa2Cm2-RCTH=L_5nQFYg@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
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

On 17 January 2017 at 12:03, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> in the list of supported spi IDs. This makes it possible to add these
> using for example:
>
>         compatible =3D "everspin,mr25h40";

(...)

> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Do=
cumentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 2c91c03e7eb0..3e920ec5c4d3 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -14,6 +14,8 @@ Required properties:
>                   at25df641
>                   at26df081a
>                   mr25h256
> +                 mr25h10
> +                 mr25h40
>                   mx25l4005a
>                   mx25l1606e
>                   mx25l6405d

Uh, this is getting a never-ending-story...
If these chipsets don't support JEDEC, should we keep them in jedec,spi-nor=
.txt?

--=20
Rafa=C5=82
