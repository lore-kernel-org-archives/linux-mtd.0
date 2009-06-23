Received: from mlbe2k1.cs.myharris.net ([137.237.90.88])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJCek-0006EW-6L
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 20:31:56 +0000
Message-ID: <4A413BB2.8060704@harris.com>
Date: Tue, 23 Jun 2009 16:31:46 -0400
From: "Steven A. Falco" <sfalco@harris.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [Question] m25p80 driver versus spi clock rate
References: <4A3FEE98.60700@harris.com> <4A4121DA.6050802@harris.com>
	<8bd0f97a0906231146y7e050d01l3c24c9606b4b4bcd@mail.gmail.com>
	<200906231256.19736.david-b@pacbell.net>
In-Reply-To: <200906231256.19736.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

David Brownell wrote:
> On Tuesday 23 June 2009, Mike Frysinger wrote:
>> On Tue, Jun 23, 2009 at 14:41, Steven A. Falco wrote:
>>> Mike Frysinger wrote:
>>>> On Mon, Jun 22, 2009 at 16:50, Steven A. Falco wrote:
>>> Note that bitbang_work looks at speed_hz, not max_speed_hz.  So, I come back to
>>> the same problem.  Somehow speed_hz must be set in order to make bitbang_work
>>> call setup_transfer, yet the only place that seems to happen is in spidev.
>> sounds like the bitbang SPI bus driver is broken.  if speed_hz is 0,
>> then the bus driver should fall back to the max_speed_hz from the spi
>> resources.
> 
> I just looked at that code, and didn't see any obvious issue.
> It relies on initial setup to be correct, and then restores it
> after any per-transfer override.

I have an m25p16 spi flash and an Atmel AVR on the spi bus.  These are
specified in a device tree (DTS file) - the m25p16 has a max frequency
of 50 MHz, and the AVR has a max frequency of 250 KHz.  When the kernel
boots, the m25p16 is registered to the m25p80 driver, and the AVR is
registered to the spidev (userland) driver.

As the devices are added, I see spi_ppc4xx_setup called for each one.
The first device discovered happens to be the m25p16, and so the bus
speed is first set to 50 MHz.  Next, the AVR happens to be discovered
and the bus is set to 250 KHz.

The max_speed_hz is set correctly for each device.  But, since the AVR
is listed second in the device tree, the spi bus winds up at the slower
clock rate of 250 KHz.  At this point, no actual transfers have been
done - we are just talking about initialization.

If I now access the m25p16 device, we go through the calling hierarchy
from my previous email.  As I said, speed_hz is 0, because m25p80
doesn't set it, max_speed_hz is 50 MHz as set by spi_ppc4xx_setup,
and the bus is still running at 250 KHz as described above.

bitbang_work never calls spi_ppc4xx_setupxfer, because speed_hz is 0.
So the transfer that should have happened at 50 MHz happens at 250 KHz.

> 
> Maybe the problem is that the OF-to-SPI linkage is still borked.
> Is it ensuring spi_setup() was called at device setup time?
> 

The linkage appears correct - max_speed_hz is set correctly for each
device.  The problem is that bitbang_work won't call spi_ppc4xx_setupxfer
unless speed_hz is non-zero, and m25p80 has no way to alter speed_hz.

I could reverse the order of the devices in the DTS file.  But then,
the bus would be initialized to 50 MHz.  Now, when I try to access
the AVR, and assuming I don't override the speed from userland, I will have
speed_hz=0, max_speed_hz=250 KHz, and the bus at 50 MHz.  Again, bitbang_work
won't call spi_ppc4xx_setupxfer because speed_hz=0, and the transaction will
fail, because the bus is at 50 MHz when it should be at 250 KHz.

This patch would fix it, by forcing bitbang_work to always set up the
transfer.  What do you think?

--- spi_bitbang.c.orig	2009-06-23 16:21:43.000000000 -0400
+++ spi_bitbang.c	2009-06-23 16:22:21.000000000 -0400
@@ -302,13 +302,10 @@
 
 		list_for_each_entry (t, &m->transfers, transfer_list) {
 
-			/* override or restore speed and wordsize */
-			if (t->speed_hz || t->bits_per_word) {
-				setup_transfer = bitbang->setup_transfer;
-				if (!setup_transfer) {
-					status = -ENOPROTOOPT;
-					break;
-				}
+			setup_transfer = bitbang->setup_transfer;
+			if (!setup_transfer) {
+				status = -ENOPROTOOPT;
+				break;
 			}
 			if (setup_transfer) {
 				status = setup_transfer(spi, t);
