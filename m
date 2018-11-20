Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP80v-00087n-Dv
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 15:32:35 +0000
Received: by mail-qk1-f194.google.com with SMTP id 131so3077954qkd.4
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2018 07:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20180625111748.5108-1-robimarko@gmail.com>
 <0da87b07-0c32-31e9-eb0f-0c7a03b7f6db@microchip.com>
In-Reply-To: <0da87b07-0c32-31e9-eb0f-0c7a03b7f6db@microchip.com>
From: Robert Marko <robimarko@gmail.com>
Date: Tue, 20 Nov 2018 16:29:10 +0100
Message-ID: <CAOX2RU6v=e8x5eRX7O9_-MUO6or57tzreZ=rRK4=fyxPWpEwvA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add Winbond w25q128jv support
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Nov 2018 at 16:28, <Tudor.Ambarus@microchip.com> wrote:
>
>
>
> On 06/25/2018 02:17 PM, Robert Marko wrote:
> > Datasheet:
> > http://www.winbond.com/resource-files/w25q128jv%20revf%2003272018%20plus.pdf
> >
> > Testing done on Mikrotik Routerboard  wAP R board.
> > It does not support Dual or Quad modes.
>
> But you have dual and quad read support.

Yes, I did not express myself clearly there.
Flash has support for both Dual and Quad modes, but the board it was
tested on does not.
>
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> Apart of the observation above:
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>
> > ---
> >
> > Changes in v2:
> >       - Correct the title
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index d9c368c44194..3501dddc3167 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1239,6 +1239,11 @@ static const struct flash_info spi_nor_ids[] = {
> >                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> >       },
> > +     {
> > +             "w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256,
> > +                     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> > +                     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> > +     },
> >       { "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
> >       { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
> >       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
> >
