Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZWjs-0000vK-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 11:59:32 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZWjp-0000vE-00
	for mtd@infradead.org; Thu, 14 Sep 2000 11:59:30 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id LAA02121
	for <mtd@infradead.org>; Thu, 14 Sep 2000 11:59:24 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: sbc-mediagx
In-reply-to: Your message of "Thu, 14 Sep 2000 09:22:17 BST."
             <39C08AB9.1DF0409B@arcom.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Sep 2000 11:59:23 +0100
Message-Id: <E13ZWjk-0003YF-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>Yep.  It will do.  The CFI probe stuff thinks that each chip is 2
>interleaved => it thinks the size of the chip returned is half the
>actual size.  It then looks for the second chip at two times the size
>returned ie 8*2=16Mibyte => it can't find the second chip.  I fudged
>around this by ignoring the interleave when working out the address to
>probe for a second chip.  This isn't in the CVS since it would break
>other peoples chips.  I've reasly got to think of a better solution...

I don't know enough about the way flash works to determine what's going on, 
I'm afraid.

[...]
>They're not really partition but MTD devices that are restricted to
>certain areas of the flash.
>
>The odd numbered devices are read only versions of the even numbered
>devices which is why mtd0 looks the same as mtd1.

Am I right in assuming that the partition sizes in sbc_mediagx.c are 
hard-coded and don't necessarily correspond to any particular region on the 
disk? FXINFO claims that the VBF partition starts at 256kB. Looking at 
dev/mtd/0, there's a ROM image in the bottom 8kB, and at 256kB there's 
something that looks suspiciously like a VBF header. I can certainly identify 
things like the volume serial number and various pieces of information that 
FXINFO gave me. These are then repeated every megabyte.

...

Yup, changing the partition information to:

const static PartitionInfo partition_info[]={
    {"SBC-MediaGX flash BIOS extension", 0, 256*1024},
    {"SBC-MediaGX flash VBF volume", 256*1024, 0},
};

...makes things make a whole lot more sense.

[...]
>You won't beable to have both Linux and Dos booting of the flash.  Just
>make sure you have a floppy drive to boot from...

I have one, yes. However I'm extremely wary of playing with the flash; as far 
as I can determine, the FlashFX BIOS extension and, possibly, the Award BIOS 
itself are in the flash. If I erased it all from within Linux, I might nuke 
those as well and render the board unbootable. If anyone can comfirm that this 
is not the case, I would be most grateful.

Am I right in assuming that VBF is patented and closed? Is any information on 
it at all available, even just enough to identify the start of the VBF 
partition?

>Arcom is currently in the process of producing a Linux dev. kit which
>will do all this + booting for you.

Excellent.

David Given
dg@tao-group.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
