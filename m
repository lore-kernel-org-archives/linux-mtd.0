Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKwh1-0002aQ-S4
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 15:21:09 +0000
Date: Thu, 8 Jan 2009 16:21:02 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: mtd device names
Message-ID: <20090108152102.GH8021@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Juergen Beisert <jbe@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

Some time ago I posted a NAND driver for Freescale i.MX SoCs which already
went upstream.

After doing a nand_scan I did a

	mtd->name = DRIVER_NAME;

With the result that the NAND device showed up as mxc_nand. While
merging upstream this line was removed, so now NAND devices show up as
"NAND 64MiB 3,3V 8-bit". Using this string with command line partitions
is really inconvenient. Because of the whitespaces you need proper
quoting in the command line (try this in U-Boot). In addition one needs
to change the environment for different NAND chips.

What's the reason this line was removed? Any chance to revert it?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
