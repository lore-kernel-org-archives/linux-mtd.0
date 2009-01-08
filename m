Received: from vpn.static.83-173-204-231.cybernet.ch ([83.173.204.231]
	helo=localhost.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKibR-00084I-4U
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 00:18:25 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] [MTD] [NAND] pxa3xx_nand.c: PXA3xx NAND driver patch
	series
Date: Thu,  8 Jan 2009 01:06:37 +0100
Message-Id: <1231373200-19248-1-git-send-email-marcel@ziswiler.com>
Cc: eric.y.miao@gmail.com, Marcel Ziswiler <marcel@ziswiler.com>,
	LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series fixes non DMA mode operation, cleans up coding style and
fixes compilation without MTD partitioning support.
