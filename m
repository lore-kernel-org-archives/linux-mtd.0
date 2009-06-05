Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCYBE-000775-Ue
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 12:05:55 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH V2 0/2] mtd/maps/mtd-ram: Make driver usable for the device
	tree
Date: Fri,  5 Jun 2009 14:05:12 +0200
Message-Id: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
Cc: devicetree-discuss@ozlabs.org, albrecht.dress@arcor.de,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-mtd@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this is the new series to adapt the mtd-ram-driver for use with the device
tree. All comments have been addressed and it has been tested on a
phyCORE-MPC5200B-IO (with latest linus-git).

Albrecht: As you used the patches recently, maybe you want to ack them?

Looking forward to comments, especially on the binding. Thanks!

Regards,

   Wolfram
