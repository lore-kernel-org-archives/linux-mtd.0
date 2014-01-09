Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1Bf6-00068l-GP
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 09:12:35 +0000
Received: by mail-pd0-f180.google.com with SMTP id q10so2944996pdj.39
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2014 01:12:01 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
Date: Thu, 9 Jan 2014 10:12:00 +0100
Message-ID: <CAMuHMdXWZU=i9hY_p-oAVHhBskgcbZazLKi8QMLQ+p+t9opyMg@mail.gmail.com>
Subject: m25p80 quad support questions
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sourav, Brian,

I'm working on adding QSPI support to a SPI master driver, so I'm very
interested in your work to add quad read support to m25p80.
Thanks for that!

However, I have a few questions/comments:

1. Up to version 2 of "drivers: mtd: m25p80: Add quad read support",
the driver set rx_nbits to indicate it wants to use Quad SPI transfers:

+ t[1].rx_nbits = flash->quad_read ? SPI_NBITS_QUAD : 1;

(http://patchwork.ozlabs.org/patch/286109/).

However, this is not present in later versions, nor in the current version
in -next.

It's my understanding the default (single transfer mode) will be used if
rx_nbits is zero, cfr. drivers/spi/spi.c:__spi_async():

                if (xfer->tx_buf && !xfer->tx_nbits)
                        xfer->tx_nbits = SPI_NBITS_SINGLE;
                if (xfer->rx_buf && !xfer->rx_nbits)
                        xfer->rx_nbits = SPI_NBITS_SINGLE;

Does it really use quad transfers without setting rx_nbits to SPI_NBITS_QUAD?

2. IMHO checking for Quad support in the SPI master (master->mode_bits)
and in the SPI FLASH chip is not sufficient. A quad-capable SPI FLASH
may be wired to a quad-capable SPI master using 4-wire mode, either
physically or through pin control.
So I think we need a m25p,quad-read property in DT.

Thanks for your answers!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
