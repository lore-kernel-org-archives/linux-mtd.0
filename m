Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aVIBO-0006S6-4y
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2016 12:23:14 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0]
 ident=Debian-exim)
 by metis.ext.pengutronix.de with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
 (Exim 4.80) (envelope-from <sha@pengutronix.de>) id 1aVIB2-0003FG-BB
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2016 13:22:52 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.84)
 (envelope-from <sha@pengutronix.de>) id 1aVIB2-00065F-22
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2016 13:22:52 +0100
Date: Mon, 15 Feb 2016 13:22:52 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Multiple NANDs on non contiguous chip selects, how?
Message-ID: <20160215122251.GE19372@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have a i.MX6 board here which has two NAND chips connected to CS0 and
CS2 on the same controller. The current code in nand_scan_ident iterates
over the chip selects and bails out when there's nothing found on a chip
select. This means the current code never finds the chip on CS2 since it
already bails out after probing the empty CS1.

Any preferences how this should be handled? I could implement a i.MX6
specific mapping function, possibly initialized from the device tree, to
map the real chip selects to contiguous chip selects for the NAND layer.

Normally such a function should not be needed since we could autodetect
if a chip select has a device connected or not, so the NAND layer could
handle this without driver intervention, but is that what we want?

Any ideas/opinions?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
