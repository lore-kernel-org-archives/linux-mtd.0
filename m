Received: from aleph1.demon.co.uk
	([158.152.9.127] helo=court.aleph1.co.uk ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Avoi-0001O3-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 17:51:57 +0100
Date: Thu, 23 May 2002 17:47:48 +0100 (BST)
From: Wookey <wookey@aleph1.co.uk>
Subject: YAFFS - new nand flash journalling fs
To: linux-mtd@lists.infradead.org, YAFFS list <yaffs@toby-churchill.org>
Message-ID: <Marcel-1.50-0523164748-c72h+Ty@chewy.aleph1.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hereby announcing a new option for those using NAND flash.

YAFFS - Yet Another Flash Filing System
---------------------------------------

This FS is designed for NAND rather than NOR and thus has some advantages
over JFFS(2). It's RAM footprint is a lot smaller (which matters when you
have lots of flash) and boot times should be much faster. The main thing you
don't get at the moment is compression, but then with NAND you've usually got
a lot more space to play in.

The FS is GPLed, and the work has been done by Aleph One (in the form of
Charles Manning), for Toby Churchill Ltd, and Brightstar Engineering have
helped pay for the development too.

Info, specs, design notes, history, mailing list and status available here:
http://www.aleph1.co.uk/armlinux/projects/yaffs/index.html

Version 0.1 now released, and is available via public cvs:
http://www.aleph1.co.uk/armlinux/cvsuse.html

At this stage everything is _extremely_ new. It has been tested farily well
with a RAM-based emulation (which lets you mess with it on your development
machine or one for which you don't actually _have_ the NAND yet), but the
real MTD interface, which should work on flash hardware with an MTD
interface, is essentially untested at this moment - please have a go at it
and use the yaffs mailing list to report what you find.

mkyaffs, how-to docs and an MTD patch are also provided.

Enjoy.

Wookey
-- 
Aleph One Ltd, Bottisham, CAMBRIDGE, CB5 9BA, UK  Tel +44 (0) 1223 811679
work: http://www.aleph1.co.uk/     play: http://www.chaos.org.uk/~wookey/
