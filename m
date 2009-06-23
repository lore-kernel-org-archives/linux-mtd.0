Received: from smtp101.sbc.mail.gq1.yahoo.com ([67.195.15.60])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJC6S-0001Gm-PE
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 19:56:31 +0000
From: David Brownell <david-b@pacbell.net>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [Question] m25p80 driver versus spi clock rate
Date: Tue, 23 Jun 2009 12:56:19 -0700
References: <4A3FEE98.60700@harris.com> <4A4121DA.6050802@harris.com>
	<8bd0f97a0906231146y7e050d01l3c24c9606b4b4bcd@mail.gmail.com>
In-Reply-To: <8bd0f97a0906231146y7e050d01l3c24c9606b4b4bcd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200906231256.19736.david-b@pacbell.net>
Cc: Stefan Roese <sr@denx.de>, "Steven A. Falco" <sfalco@harris.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 23 June 2009, Mike Frysinger wrote:
> On Tue, Jun 23, 2009 at 14:41, Steven A. Falco wrote:
> > Mike Frysinger wrote:
> >> On Mon, Jun 22, 2009 at 16:50, Steven A. Falco wrote:
> >>> I am trying to figure out how the mtd/devices/m25p80.c driver is supposed
> >>> to set the spi clock speed.  (Perhaps I'm making a bad assuption even to
> >>> think that it _should_ set the clock speed.  If so, please say so.)
> >>
> >> it shouldnt.  this is done in the board resources via the speed_hz
> >> field of the spi_board_info struct on a per-spi device setting.
> >
> > Thank you for the hint.  spi_board_info has a max_speed_hz field - it does
> > not have a speed_hz field.  The various platforms all seem to set
> > max_speed_hz, so perhaps that is what you meant to say.

Right.  A chip might support a much faster rate than is
achievable on a given board.  That's why setting the speed
limit is one of the duties of the board-specific setup code.


> > In my case, max_speed_hz is being correctly set, but that doesn't seem to be
> > enough.  I have traced through the calling hierarchy, and this is what I got:
> >
> > 1) m25p80_read builds a spi_message, and calls spi_sync to do the transfer.
> >
> > 2) spi_sync calls spi_async.  I added some printk, and saw speed_hz=0 and
> >   max_speed_hz=50000000.  This is consistent with my platform setup (set via
> >   a dts file).

What code are you talking about then?  Not the m25p80 code,
which just depends on platform code to have done its job.


> > 3) spi_async calls through pointer "transfer" to spi_bitbang_transfer (because
> >   the PPC4xx driver doesn't set its own transfer handler).
> >
> > 4) spi_bitbang_transfer calls spi_master_get_devdata, then enqueues the work
> >
> > 5) bitbang_work iterates through the queued transfers, and if speed_hz is
> >   non-zero, bitbang_work calls through setup_transfer to spi_ppc4xx_setupxfer
> >   which would set the divisor.  But, as noted in step 2, speed_hz=0, so the
> >   spi bus speed is not set.  Rather, it remains at whatever speed some other
> >   device chose.
> >
> > Note that bitbang_work looks at speed_hz, not max_speed_hz.  So, I come back to
> > the same problem.  Somehow speed_hz must be set in order to make bitbang_work
> > call setup_transfer, yet the only place that seems to happen is in spidev.
> 
> sounds like the bitbang SPI bus driver is broken.  if speed_hz is 0,
> then the bus driver should fall back to the max_speed_hz from the spi
> resources.

I just looked at that code, and didn't see any obvious issue.
It relies on initial setup to be correct, and then restores it
after any per-transfer override.

Maybe the problem is that the OF-to-SPI linkage is still borked.
Is it ensuring spi_setup() was called at device setup time?

- Dave




> -mike
> 
> 
