Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W173-0007yC-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 19:09:13 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14W172-0007y6-00
	for mtd@infradead.org; Thu, 22 Feb 2001 19:09:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: jffs-dev@axis.com, bjorn.wesen@axis.com
Cc: mtd@infradead.org, linux@handhelds.org, nico@cam.org
Reply-To: jffs-dev@axis.com, dwmw2@infradead.org
Subject: JFFS2 Request For Testing.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Feb 2001 19:08:14 +0000
Message-ID: <8382.982868894@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've got JFFS2 to the stage where it's passing dbench runs and the GC looks
reasonably OK. The design is basically the result of the discussion we were
having a few weeks ago (on the jffs-dev list) - I don't think anything's
particularly different from what we were talking about. 

Please take a look and comment, and preferably test it. Instructions on 
getting it from CVS are on http://www.linux-mtd.infradead.org/ and it'll 
turn up in ftp.uk.linux.org:/pub/people/dwmw2/mtd/cvs at about 11pm tonight.

For easy testing on a PC, turn on CONFIG_MTD_MTDRAM and test it on ram, 
instead of real flash.

There's free beer for the first person who tells me why I need the 
invalidate_inode_pages() in jffs2_file_release() when no other filesystem 
seems to need it, or why it sometimes gets stuck on unmount, in 
__wait_on_page() called from invalidate_inodes(). I suspect they're 
related, and it's a stupid bug on my part.

There's also a free beer for whoever provides mkfs.jffs2.

Aside from the bugs, there's a few things left to tidy up...

 - background GC
 - fine-tune the allocation / GC thresholds
 - More optimal compression. Currently it's optimised for mips32 code.
 - chattr support - turning on/off and tuning compression per-inode
 - checkpointing
 - making the scan code populate real inodes so read_inode just after 
	mount doesn't have to read the flash twice for large files.
 - disable compression in commit_write()?
 - stop it depending on a block device. mount(8) needs a change for this.
 - test, test, test
 - make it work on NAND flash. We need to know when we can GC
	deletion dirents, etc. And think about holes/truncation. It can
	all be done reasonably simply, but it need implementing.
 - NAND flash will require new dirent/dnode structures on the medium with
	ECC data in rather than just the CRC we're using ATM.
 - more?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
