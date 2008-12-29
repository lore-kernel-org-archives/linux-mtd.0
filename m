Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LHPwy-0006lO-DX
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 21:47:01 +0000
Date: Mon, 29 Dec 2008 21:46:51 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 0/3] [MTD] NAND: common driver for ts78xx/ts72xx platforms
Message-ID: <20081229214647.GF3381@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been sitting on this driver for a while so it's long overdue that 
I actually attempt to get it tidied up and in a state usable for others.

These patches add support for the NAND found in technologic systems ARM 
boards[1].  The platform specific parts (IO address and parititoning 
schemes) have been movied into platform specific files whilst the driver 
it's self can be used as a complete replacement for the ts7200.c NAND 
driver.

N.B. the ts78xx patch you will be unable to apply as it depends on some 
	yet to be mainline'd code.  It's inclusion here is just so you 
	can see how the same driver is used on multiple platforms

N.B.2 I have been unable to test directly the ts72xx platform as Ido not 
	own the hardware, I only have a ts7800.  Seems to compile 
	though with no problems. :)

Cheers

Alex

[1] http://www.embeddedarm.com/products/arm-sbc.php

-- 
Alexander Clouter
.sigmonster says: Don't sweat it -- it's only ones and zeros.
                  		-- P. Skelly
