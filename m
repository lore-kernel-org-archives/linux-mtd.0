Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPh51-0006aJ-9U
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2009 17:41:33 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: mtd-ram: add of-support
Date: Wed, 21 Jan 2009 18:41:23 +0100
Message-Id: <1232559685-2268-1-git-send-email-w.sang@pengutronix.de>
Cc: linuxppc-dev@ozlabs.org, ben-linux@fluff.org
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

Patch 1:
  refactor plat-ram.c to have generic probe and remove
  routines

Patch 2:
  use the new routines for an of-driver

Looking forward to comments. (Sidenote: Converting all these platform
drivers to support of is really tiring, sigh. Isn't there any other
way?)

Kind regards,

   Wolfram
