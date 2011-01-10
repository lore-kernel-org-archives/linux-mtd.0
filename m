Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PcSRB-0003be-2M
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 00:50:13 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1PcSR3-0008JV-NB
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 01:50:06 +0100
Received: from S01060013461abac3.gv.shawcable.net ([24.108.1.199])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jan 2011 01:50:05 +0100
Received: from jbarlow by S01060013461abac3.gv.shawcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jan 2011 01:50:05 +0100
To: linux-mtd@lists.infradead.org
From: J Barlow <jbarlow@ivl.com>
Subject: What if the UBI flasher can't skip all-FF pages?
Date: Mon, 10 Jan 2011 22:47:05 +0000 (UTC)
Message-ID: <loom.20110110T205414-506@post.gmane.org>
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

Hi everyone,

I am developing an embedded system with a NAND flash.  We're intending to 
program all of the NAND flashes in a factory programmer.  I've read "how the UBI 
flash should work" and I suspect that the UBI flasher doesn't work that way.  
Specifically, I'm pretty sure it doesn't know how to skip pages containing only 
FFs.  Unfortunately, the flasher's software is proprietary, not to mention only 
available in Chinese.  It might well work as expected, but testing this would 
also be difficult and expensive since the flasher is in a factory in China. 

I believe that UBIFS is doing the right thing.  I blame the flasher, but I don't 
think I can do anything about it.

I'd prefer to use UBIFS as a writable root file system, if possible.  But maybe 
this won't work in my situation.

Is there any reasonable way to let UBIFS know all pages have been programmed 
initially?  For example, maybe I could deliberate replace all-FF pages with all-
00 pages in the flashed image.  Or will that just cause UBI/UBIFS to find 
corrupt empty space and fail?  Or perhaps someone could direct me how to make a 
patch that would help with UBIFS/UBI/ubinize with this specific situation.  It 
does seem like other people have run into problems with poorly written flashers 
problem, and in some cases like mine changing the flasher is not an option.

Also, if I use a read-only UBIFS in a dynamic UBI volume, will UBIFS ever 
attempt to double-program an all-FF page?  I would imagine if I used a read-only 
UBIFS in a static UBI volume I won't have trouble -- except that I also need to 
update the firmware.  Is it possible to ubiupdatevol a static UBI volume, or do 
I need something more aggressive to modify a static UBI volume?


Thanks.
J Barlow
