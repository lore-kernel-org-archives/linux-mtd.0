Received: from mlbe2k1.cs.myharris.net ([137.237.90.88])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJAwB-0005ql-RR
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 18:41:50 +0000
Message-ID: <4A4121DA.6050802@harris.com>
Date: Tue, 23 Jun 2009 14:41:30 -0400
From: "Steven A. Falco" <sfalco@harris.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [Question] m25p80 driver versus spi clock rate
References: <4A3FEE98.60700@harris.com>
	<8bd0f97a0906221404x7536c6e0m822436dfb61714dc@mail.gmail.com>
In-Reply-To: <8bd0f97a0906221404x7536c6e0m822436dfb61714dc@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> On Mon, Jun 22, 2009 at 16:50, Steven A. Falco wrote:
>> I am trying to figure out how the mtd/devices/m25p80.c driver is supposed
>> to set the spi clock speed.  (Perhaps I'm making a bad assuption even to
>> think that it _should_ set the clock speed.  If so, please say so.)
> 
> it shouldnt.  this is done in the board resources via the speed_hz
> field of the spi_board_info struct on a per-spi device setting.
> -mike

Thank you for the hint.  spi_board_info has a max_speed_hz field - it does
not have a speed_hz field.  The various platforms all seem to set
max_speed_hz, so perhaps that is what you meant to say.

In my case, max_speed_hz is being correctly set, but that doesn't seem to be
enough.  I have traced through the calling hierarchy, and this is what I got:

1) m25p80_read builds a spi_message, and calls spi_sync to do the transfer.

2) spi_sync calls spi_async.  I added some printk, and saw speed_hz=0 and
   max_speed_hz=50000000.  This is consistent with my platform setup (set via
   a dts file).

3) spi_async calls through pointer "transfer" to spi_bitbang_transfer (because
   the PPC4xx driver doesn't set its own transfer handler).

4) spi_bitbang_transfer calls spi_master_get_devdata, then enqueues the work

5) bitbang_work iterates through the queued transfers, and if speed_hz is
   non-zero, bitbang_work calls through setup_transfer to spi_ppc4xx_setupxfer
   which would set the divisor.  But, as noted in step 2, speed_hz=0, so the
   spi bus speed is not set.  Rather, it remains at whatever speed some other
   device chose.

Note that bitbang_work looks at speed_hz, not max_speed_hz.  So, I come back to
the same problem.  Somehow speed_hz must be set in order to make bitbang_work
call setup_transfer, yet the only place that seems to happen is in spidev.

Stefan - I believe you wrote the SPI_PPC4XX driver.  Can you comment on how
this is supposed to work?  My device tree has:

				m25p16@1 {
					compatible = "st,m25p80";
					reg = <1>;
					spi-max-frequency = <50000000>;
				};

				fpdlite@2 {
					compatible = "linux,spidev";
					reg = <2>;
					spi-max-frequency = <200000>;
				};

and the issue is that fpdlite@2 drops the frequency to 200000, but m25p16@1
does not raise the frequency to 50000000.

	Thanks,
	Steve
