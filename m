Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT4jD-0005jN-Bx
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 10:41:35 +0000
Date: Mon, 16 Jan 2017 11:40:59 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: don't claim mr25h40 to be JEDEC compatible
Message-ID: <20170116104059.cz2ypa5ixvvtfeqc@pengutronix.de>
References: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
 <CAMuHMdXJi9hJrY0ZV37gejp2XC6fkuLF7i7BqX4CUYTB7j_q1A@mail.gmail.com>
 <20170113194226.GH2472@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170113194226.GH2472@leverpostej>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, Jan 13, 2017 at 07:42:27PM +0000, Mark Rutland wrote:
> On Fri, Jan 13, 2017 at 07:42:34PM +0100, Geert Uytterhoeven wrote:
> > CC devicetree
thanks

> > 
> > On Fri, Jan 13, 2017 at 10:35 AM, Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > Commit edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40") made it
> > > possible to use a mr25h40 by writing
> > >
> > >         compatible = "mr25h40", "jedec,spi-nor";
> > 
> > No vendor prefix?
> > 
> > >
> > > in a device tree. This chip however isn't JEDEC compatible however, so
> > > change the chip string and add a compatible entry to bless
> > >
> > >         compatible = "mr25h40-nonjedec";
> > >
> > > as the right way.
> > 
> > This whole "-nonjedec" business looks wrong to me.
> > If the device is called "mr25h40", its compatible value should be
> > "everspin,mr25h40". Adding some (in)compatibility indicator violates the
> > spirit of compatible values, IMHO.
> 
> Agreed on all counts.
> 
> The compatible string should specify the vendor and device, any
> compliance details should either be known for that string or derived
> from other properties.
> 
> IIUC this is following an existing pattern, which we should deprecate
> (retaining support for those strings so old DTBs work).

Looking at drivers/mtd/spi-nor/spi-nor.c there is in the spi_nor_ids
array:

	...
        { "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
	...
        { "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },

and similar entries for the other M25P members. So I guess these chips
couldn't do JEDEC at the beginning, then got feature updates but no new
name. So "m25p05-nonjedec" is fine as compatibility string?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
