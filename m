Received: from mail127.messagelabs.com ([216.82.250.115])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PcQMD-0000X0-0L
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2011 22:36:58 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: David Brownell <david-b@pacbell.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "spi-devel-general@lists.sourceforge.net"
	<spi-devel-general@lists.sourceforge.net>
Date: Mon, 10 Jan 2011 16:36:50 -0600
Subject: RE: [PATCH] mtd: sst25l: fix reads with broken spi-masters
Message-ID: <0D753D10438DA54287A00B027084269764CDF41635@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269764CDF4146A@AUSP01VMBX24.collaborationhost.net>
	<909411.87280.qm@web180312.mail.gq1.yahoo.com>
In-Reply-To: <909411.87280.qm@web180312.mail.gq1.yahoo.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Grant Likely <grant.likely@secretlab.ca>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, January 10, 2011 3:20 PM, David Brownell wrote:
> --- On Mon, 1/10/11, H Hartley Sweeten <hartleys@visionengravers.com> wro=
te:
> NAK.  I'm surprised you even thought to submit
> such a clearly-wrong patch.
>
> The bug is in the SPI master driver, and thus
> so should the fix be.  Or make your system use
> the GPIO based SPI master driver.

Sorry.

The bug _is_ in the spi peripheral on the ep93xx.

Unfortunately, hardware does exist that uses the SFRMOUT signal as part of
the chip select to access the device.  The only way to get this signal to
do anything is by using the spi peripheral.  The SFRMOUT signal cannot be
accessed using GPIO so the GPIO based SPI master driver is not an option.

If the SFRMOUT signal is _not_ used in the chip select logic then everythin=
g
works fine.

But... If it's a NAK.. It's a NAK...  I'll try to figure out a way to handl=
e
this in the SPI master driver.

Regards,
Hartley
