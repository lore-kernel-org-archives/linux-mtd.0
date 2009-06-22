Received: from mlbe2k1.cs.myharris.net ([137.237.90.88])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIqTc-0006rm-6r
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 20:51:05 +0000
Message-ID: <4A3FEE98.60700@harris.com>
Date: Mon, 22 Jun 2009 16:50:32 -0400
From: "Steven A. Falco" <sfalco@harris.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [Question] m25p80 driver versus spi clock rate
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to figure out how the mtd/devices/m25p80.c driver is supposed
to set the spi clock speed.  (Perhaps I'm making a bad assuption even to
think that it _should_ set the clock speed.  If so, please say so.)

I have three spi devices on a ppc400epx: two m25p16 chips and one Atmel
AVR uP.  The Atmel is handled from user-space, via spidev.  I am setting
the spi_ioc_transfer "speed_hz" parameter, and I see spidev change the
clock rate as I would expect.

However, m25p80.c doesn't seem to touch the clock rate.  Perhaps this is
because the PPC440epx uses "open firmware" device trees to specify the
speed and the m25p80 driver is not an OF driver.  Or as I said above,
perhaps the m25p80 driver isn't even supposed to set the clock rate.

The Atmel we are using cannot have its spi bus run faster than 250 KHz,
while the m25p16 devices can run up to 75 MHz (although the PPC440epx
tops out at 16.6 MHz).  So it is essential that I flip the clock rate
back and forth to maximize performance of the m25p16's while allowing
the Atmel to work.

So, if someone could comment on how the clock speed should be set, I
would appreciate it.  Clearly, I can put in a hack, but I'd rather
follow the existing intent.

	Thanks,
	Steve
