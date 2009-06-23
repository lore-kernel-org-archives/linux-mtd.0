Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJDED-0002zF-B2
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 21:08:36 +0000
From: David Brownell <david-b@pacbell.net>
To: "Steven A. Falco" <sfalco@harris.com>
Subject: Re: [Question] m25p80 driver versus spi clock rate
Date: Tue, 23 Jun 2009 14:08:26 -0700
References: <4A3FEE98.60700@harris.com>
	<200906231256.19736.david-b@pacbell.net>
	<4A413BB2.8060704@harris.com>
In-Reply-To: <4A413BB2.8060704@harris.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906231408.26912.david-b@pacbell.net>
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 23 June 2009, Steven A. Falco wrote:
> David Brownell wrote:
> > I just looked at that code, and didn't see any obvious issue.
> > It relies on initial setup to be correct, and then restores it
> > after any per-transfer override.

Summary of the key point below:  it does rely on that, but when
used with this ppc4xx driver that setup isn't getting done.

 
> I have an m25p16 spi flash and an Atmel AVR on the spi bus.  These are
> specified in a device tree (DTS file) - the m25p16 has a max frequency
> of 50 MHz, and the AVR has a max frequency of 250 KHz.  When the kernel
> boots, the m25p16 is registered to the m25p80 driver, and the AVR is
> registered to the spidev (userland) driver.
> 
> As the devices are added, I see spi_ppc4xx_setup called for each one.
> The first device discovered happens to be the m25p16, and so the bus
> speed is first set to 50 MHz.  Next, the AVR happens to be discovered
> and the bus is set to 250 KHz.
> 
> The max_speed_hz is set correctly for each device.  But, since the AVR
> is listed second in the device tree, the spi bus winds up at the slower
> clock rate of 250 KHz.  At this point, no actual transfers have been
> done - we are just talking about initialization.

Note the conceptual problem goof there too:  until a transfer to
some device is active, talking about "bus speed" is meaningless.


> If I now access the m25p16 device, we go through the calling hierarchy
> from my previous email.  As I said, speed_hz is 0, because m25p80
> doesn't set it, max_speed_hz is 50 MHz as set by spi_ppc4xx_setup,
> and the bus is still running at 250 KHz as described above.
> 
> bitbang_work never calls spi_ppc4xx_setupxfer, because speed_hz is 0.
> So the transfer that should have happened at 50 MHz happens at 250 KHz.
> 
> > 
> > Maybe the problem is that the OF-to-SPI linkage is still borked.
> > Is it ensuring spi_setup() was called at device setup time?
> > 
> 
> The linkage appears correct - max_speed_hz is set correctly for each
> device.  The problem is that bitbang_work won't call spi_ppc4xx_setupxfer
> unless speed_hz is non-zero, and m25p80 has no way to alter speed_hz.

Or alternatively:  that bitbang_work is missing an initial
call to setup_xfer before the loop *starts* its work...

I think the issue is that few other users have used this
code with multiple devices, which had such mismatches in
device speed that they would have noticed this bug.

See if the below patch resolves this issue.

- Dave


---
 drivers/spi/spi_bitbang.c |   22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

--- a/drivers/spi/spi_bitbang.c
+++ b/drivers/spi/spi_bitbang.c
@@ -258,6 +258,11 @@ static void bitbang_work(struct work_str
 	struct spi_bitbang	*bitbang =
 		container_of(work, struct spi_bitbang, work);
 	unsigned long		flags;
+	int			do_setup = -1;
+	int			(*setup_transfer)(struct spi_device *,
+					struct spi_transfer *);
+
+	setup_transfer = bitbang->setup_transfer;
 
 	spin_lock_irqsave(&bitbang->lock, flags);
 	bitbang->busy = 1;
@@ -269,8 +274,6 @@ static void bitbang_work(struct work_str
 		unsigned		tmp;
 		unsigned		cs_change;
 		int			status;
-		int			(*setup_transfer)(struct spi_device *,
-						struct spi_transfer *);
 
 		m = container_of(bitbang->queue.next, struct spi_message,
 				queue);
@@ -286,19 +289,19 @@ static void bitbang_work(struct work_str
 		tmp = 0;
 		cs_change = (spi != bitbang->exclusive);
 		status = 0;
-		setup_transfer = NULL;
 
 		list_for_each_entry (t, &m->transfers, transfer_list) {
 
-			/* override or restore speed and wordsize */
-			if (t->speed_hz || t->bits_per_word) {
-				setup_transfer = bitbang->setup_transfer;
+			/* override speed or wordsize? */
+			if (t->speed_hz || t->bits_per_word)
+				do_setup = 1;
+
+			/* init or override transfer params */
+			if (do_setup != 0) {
 				if (!setup_transfer) {
 					status = -ENOPROTOOPT;
 					break;
 				}
-			}
-			if (setup_transfer) {
 				status = setup_transfer(spi, t);
 				if (status < 0)
 					break;
@@ -362,8 +365,9 @@ static void bitbang_work(struct work_str
 		m->status = status;
 
 		/* restore speed and wordsize */
-		if (setup_transfer)
+		if (do_setup == 1)
 			setup_transfer(spi, NULL);
+		do_setup = 0;
 
 		/* normally deactivate chipselect ... unless no error and
 		 * cs_change has hinted that the next message will probably
