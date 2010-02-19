Received: from av10-1-sn2.hy.skanova.net ([81.228.8.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NiVBw-0003YE-GW
	for linux-mtd@lists.infradead.org; Fri, 19 Feb 2010 15:55:00 +0000
Received: from smtp4-2-sn2.hy.skanova.net (smtp4-2-sn2.hy.skanova.net
	[81.228.8.93])
	by av10-1-sn2.hy.skanova.net (Postfix) with ESMTP id E559B37F03
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Feb 2010 16:54:49 +0100 (CET)
Received: from 'mail.unternet.org' (81-235-183-210-no20.tbcn.telia.com
	[81.235.183.210])
	by smtp4-2-sn2.hy.skanova.net (Postfix) with ESMTP id C6E2537E4A
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Feb 2010 16:54:49 +0100 (CET)
Received: from router.unternet.org ([192.168.1.1] helo=[192.168.1.108])
	by 'mail.unternet.org' with esmtpa (Exim 4.71)
	(envelope-from <frank@unternet.org>) id 1NiVBp-0001vZ-9e
	for linux-mtd@lists.infradead.org; Fri, 19 Feb 2010 16:54:49 +0100
Message-ID: <4B7EB448.8090402@unternet.org>
Date: Fri, 19 Feb 2010 16:54:48 +0100
From: Frank de Lange <frank@unternet.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI bootloader support, any progress?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hiya,

I'm in the process of reviving a piece of dot-bomb history in the form 
of a Virgin WebPlayer [1]. The thing is based around a Geode GLlv@200MHz 
+ CS5530 and a 48 MB M-Systems DOC. When launched it ran a modified 
Redhat Linux distribution. Video and sound were handled through 
VSA-emulated drivers so performance was not super.

This webplayer - one of four around here - has been used on a canoe 
expedition over the Yukon [2], after that as a dialup server and for the 
last 5 years as a file/print/web/mail server. This task has now been 
taken over by something slightly more beefy so it is looking for a new 
task. It will spend the foreseeable time as an NX terminal with some 
local processing capability intended mainly for my 5 y old daughter.

After a week of hacking the thing now runs a native framebuffer, native 
X server and native audio and performs like it never did. It does still 
run from a harddrive though, one of the first batch of 'magical pixie 
dust' 20 GB travelstar drives which has been in continuous use for ten 
years now. The plan is to move the salient bits to the DOC and get rid 
of the drive. Moving the bits is easy but booting the thing will be 
harder given that I plan to use UBIFS.

The DOC was supported in LILO so it still runs a patched, ancient LILO 
21.7. Grub can be made to see the DOC with a bit of work so that would 
also be an option. The problem lies in UBI and UBIFS... this is not 
supported in either. Das U-Boot supports UBI but not this board. Porting 
it to the board is feasible - especially since I ignore all VSA stuff - 
but more work than I care for.

The question then is whether there has been any progress in getting 
bootloader support for UBI. I have searched the archives and looked at 
the code but not found what I'm looking for: potential working 
bootloader (grub/lilo/something similar) support for UBI on nand mtd 
devices. Has anyone started implementing (read-only) UBI support in GRUB 
or another similar BIOS-loaded bootloader?

I have also considered Linuxbios/Coreboot. That might be an option for 
the long term but short-term I'd like to use the existing BIOS and just 
replace the harddrive with the DOC. So... any pointers?

TIA//Frank
  [1] http://en.wikipedia.org/wiki/Virgin_Webplayer
  [2] http://www.unternet.org/imagine/yukon/index.html
