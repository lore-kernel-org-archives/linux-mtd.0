Received: from dpmailmta03-29.doteasy.com ([65.61.219.49]
	helo=dpmailmta03.doteasy.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kt8Nu-0001LI-SG
	for linux-mtd@lists.infradead.org; Thu, 23 Oct 2008 22:10:27 +0000
Received: from dpsmartmail36.doteasy.com ([192.168.101.36])
	by dpmailrp04.doteasy.com (8.13.8/8.13.8/Debian-3) with ESMTP id
	m9NMANIf001886
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2008 15:10:24 -0700
From: "Peter Ma" <pma@mediamatech.com>
To: <linux-mtd@lists.infradead.org>
Subject: Micron NAND Rev D: initial reset
Date: Thu, 23 Oct 2008 15:10:02 -0700
Message-ID: <BDE9ED4C970C44469B8BC19E9AF7D67B@petebook>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: pma@mediamatech.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, there...

I am trying to add mtd/nand driver support for the Micron MT29F2G08AADWP
(Revision D) on 2.6.26.  

According to Micron, the difference (aside from ID code) between Rev D and
the popular Rev C, is that the Rev D requires a RESET command to be issued
after power-up and before any other command is issued.

I am just diving into the nand driver, but I thought I would ask if there is
a good place to issue that RESET after power-up.

I do not see a specific "nand_reset()" function in nand_base.c  I assume I
need to create this function, then have it called within the platform driver
probe, just before the first command (nand_scan_ident).

Or is there a more generic way to go about this?  And if so, I assume
inserting a RESET command like this would be transparent to other NAND
chips?

Thanks & Regards,
Pete

________________________________________________________________
Peter W.W. Ma                | email:  pma@mediamatech.com
Principal                    | tel:    +1 778 839-7865
Mediama Technologies         | fax:    +1 604 433-2465
 
