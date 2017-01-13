Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cS7lK-00054P-Sz
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2017 19:43:48 +0000
Date: Fri, 13 Jan 2017 19:42:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: don't claim mr25h40 to be JEDEC compatible
Message-ID: <20170113194226.GH2472@leverpostej>
References: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
 <CAMuHMdXJi9hJrY0ZV37gejp2XC6fkuLF7i7BqX4CUYTB7j_q1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXJi9hJrY0ZV37gejp2XC6fkuLF7i7BqX4CUYTB7j_q1A@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 13, 2017 at 07:42:34PM +0100, Geert Uytterhoeven wrote:
> Hi Uwe,
> 
> CC devicetree
> 
> On Fri, Jan 13, 2017 at 10:35 AM, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > Commit edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40") made it
> > possible to use a mr25h40 by writing
> >
> >         compatible = "mr25h40", "jedec,spi-nor";
> 
> No vendor prefix?
> 
> >
> > in a device tree. This chip however isn't JEDEC compatible however, so
> > change the chip string and add a compatible entry to bless
> >
> >         compatible = "mr25h40-nonjedec";
> >
> > as the right way.
> 
> This whole "-nonjedec" business looks wrong to me.
> If the device is called "mr25h40", its compatible value should be
> "everspin,mr25h40". Adding some (in)compatibility indicator violates the
> spirit of compatible values, IMHO.

Agreed on all counts.

The compatible string should specify the vendor and device, any
compliance details should either be known for that string or derived
from other properties.

IIUC this is following an existing pattern, which we should deprecate
(retaining support for those strings so old DTBs work).

Thanks,
Mark.

> 
> > Fixes: edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40")
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/mtd/devices/m25p80.c  | 1 +
> >  drivers/mtd/spi-nor/spi-nor.c | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 9cf7fcd28034..bd0c335692d2 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -304,6 +304,7 @@ static const struct spi_device_id m25p_ids[] = {
> >         {"m25p05-nonjedec"},    {"m25p10-nonjedec"},    {"m25p20-nonjedec"},
> >         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec"},
> >         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjedec"},
> > +       {"mr25h40-nonjedec"},
> >
> >         { },
> >  };
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index bbdbbd763c9d..3a8042fe44f0 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -825,7 +825,7 @@ static const struct flash_info spi_nor_ids[] = {
> >         /* Everspin */
> >         { "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> >         { "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> > -       { "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> > +       { "mr25h40-nonjedec",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> >
> >         /* Fujitsu */
> >         { "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
> > --
> > 2.11.0
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
