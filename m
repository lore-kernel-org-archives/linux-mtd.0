Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiSHi-0000co-Dd
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 13:20:59 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [v2] Add i.MX51 support to mxc_nand
Date: Mon,  9 Aug 2010 15:20:44 +0200
Message-Id: <1281360053-8386-1-git-send-email-s.hauer@pengutronix.de>
Cc: Baruch Siach <baruch@tkos.co.il>, John Ogness <john.ogness@linutronix.de>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In this series I swapped the "fix correct_data function" with the
"support 8bit ecc" patch as suggested by Baruch. Also, I integrated
the patches sent by John Ogness. John, I hope I addressed all your
patches, it would be good if you could test them on 16bit flash as
you seem to be the only one having a board with such a flash.

Sascha
