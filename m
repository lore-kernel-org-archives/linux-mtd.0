Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LaY20-0001qQ-LY
	for linux-mtd@lists.infradead.org; Fri, 20 Feb 2009 16:15:19 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RESEND PATCH 0/2] mtd-ram: add of-support
Date: Fri, 20 Feb 2009 17:15:10 +0100
Message-Id: <1235146512-15170-1-git-send-email-w.sang@pengutronix.de>
Cc: dwmw2@infradead.org, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

as we needed an of-mtd-ram driver to support SRAM on the
phyCORE-MPC5200B-IO, I did the following:

Patch 1: refactor plat-ram.c to have generic probe and remove routines

Patch 2: use the new routines for an of-driver

It works fine here with and without OF. Any chance this can be scheduled
for 2.6.30?

Regards,

   Wolfram
