Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OhNMX-0002Gj-15
	for linux-mtd@lists.infradead.org; Fri, 06 Aug 2010 13:53:29 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Add i.MX51 support to mxc_nand
Date: Fri,  6 Aug 2010 15:53:03 +0200
Message-Id: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

The following series adds v3 (found on i.MX51) support to the i.MX nand
controller. auto mode is not supported, but if I understand correctly
the auto mode is only of use when more than one nand chip is connected.
Without the auto mode the v3 controller behaves very similar to the v2
controller, but unfortunately it has a completely different register
layout. For this reason this series has some preparation patches before
the v3 support is added as the last patch.

This series conflicts with the series John Ogness recently posted, so
it has probably to be reworked a bit.

I'll post the nand platform support for i.MX51 in a seperate series.

Sascha
