Received: from 216-237-3-220.orange.nextweb.net ([216.237.3.220]
	helo=OCEX01.SolarFlarecom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JD2jV-0003zk-B4
	for linux-mtd@lists.infradead.org; Thu, 10 Jan 2008 19:06:35 +0000
Message-ID: <47866921.40904@solarflare.com>
Date: Thu, 10 Jan 2008 18:51:13 +0000
From: Robert Stonehouse <rstonehouse@solarflare.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, Steve Pope <spope@solarflare.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The company I work for (Solarflare Communications) produces a 10Gbit
network adapter and PHYs. We have a network driver (sfc.ko) which we are
currently in the process of submitting to linux-netdev.

One part of this is an MTD driver (sfc_mtd.ko) that gives access to the
EEPROM and flash parts on all our board designs. These should be useful
externally  e.g. programming the flash would be useful for people that want
to flash a PXE image onto the board for network booting.

One unusual aspect is that the MTD driver relies on HW initialisation from
the main network driver (as the registers needed to access the flash and
EEPROM are within a shared PCI BAR). There is a small API (that is named
driverlink in the code) that allows the sfc_mtd driver to detect when a
Solarflare NIC is present and to shutdown when it is removed.

In the last submission that we made to linux-netdev it was requested that
people knowledgeable about MTD drivers look over the code ... so I am sure
  I am in the right place

The thread mentioned was:
     http://marc.info/?l=linux-netdev&m=119825632209357&w=2

The complete network driver is a little too large to post to the list so:
     https://support.solarflare.com/netdev/4/net-2.6.25-sfc-2.2.0038.tgz
And for verification there is:
     https://support.solarflare.com/netdev/4/MD5SUMS

drivers/net/sfc/mtd.c contains the body of the MTD code. As the network
driver uses SPI itself (to read config data from the EEPROM) the MTD driver
uses the same access routines (in falcon.c and spi.h). falcon.c fills in a
struct efx_spi_device which includes function pointers for SPI reads and
writes an well as sizing info and this can be read after a NIC has been
detected, initialised and advertised to driverlink clients.

I would be very interested if anyone has the time to review this.

Many thanks

-- 
Rob Stonehouse
