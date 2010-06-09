Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMNJa-0005qe-0Z
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:35:39 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OMNJV-0001vY-P2
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 17:35:34 +0200
Received: from amg-holding.md ([89.28.62.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2010 17:35:33 +0200
Received: from egorkat by amg-holding.md with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2010 17:35:33 +0200
To: linux-mtd@lists.infradead.org
From: Egorkat <egorkat@gmail.com>
Subject: Re: modprobe nftl hangs
Date: Wed, 9 Jun 2010 15:35:22 +0000 (UTC)
Message-ID: <loom.20100609T173244-749@post.gmane.org>
References: <loom.20100608T165617-407@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

and also - nftl_format /dev/mtd0
version 1.24 2005/11/07 11:15:13 gleixner
Phase 1. Checking and erasing Erase Zones from 0x00000000 to 0x02000000
Skipping bad zone (factory marked) #0 @ 0x0
Skipping bad zone (factory marked) #1 @ 0x4000
Skipping bad zone (factory marked) #2 @ 0x8000
Skipping bad zone (factory marked) #3 @ 0xc000
Skipping bad zone (factory marked) #4 @ 0x10000
Skipping bad zone (factory marked) #5 @ 0x14000
         Erasing Zone #210 @ 0x348000: Erase failed (Input/output error)
        Checking Zone #2047 @ 0x1ffc000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase Unit

after it - modprobe nftl hangs and dmesg shows this -
NFTL Media Headers at 0x0 and 0x8000 disagree.
NFTL Media Headers at 0x0 and 0xc000 disagree.
NFTL Media Headers at 0x0 and 0x10000 disagree.
NFTL Media Headers at 0x0 and 0x14000 disagree.
NFTL Media Headers at 0x0 and 0x18000 disagree.
NFTL Media Headers at 0x0 and 0x1c000 disagree.
Formatting block 2
Formatting block 5
Formatting block 6
Formatting block 7

thats it... no luck no /dev/nftla...
