Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135Zfw-0000Ig-00
	for mtd-list@infradead.org; Fri, 23 Jun 2000 21:03:40 +0100
Received: from web5303.mail.yahoo.com ([216.115.106.112])
	by infradead.org with smtp (Exim 3.03 #1)
	id 135Zfu-0000IZ-00
	for mtd@infradead.org; Fri, 23 Jun 2000 21:03:38 +0100
Message-ID: <20000623200502.17301.qmail@web5303.mail.yahoo.com>
Date: Fri, 23 Jun 2000 16:05:02 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: newbie trying to figure out MTD
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have little experience with the internals of Linux,
but I have been tasked with getting FTL to work with
an embedded Linux system.

The setup is as follows:
    o Embedded Linux platform
    o Ext2 filesystem
    o Intel Strataflash
    o System can currently boot using a ram disk 
      and Ext2
      
My plan of attack was this:
    1. Boot target with ram disk.
    2. Install the mtd module(s).
    3. Create an Ext2 filesystem with 
       'mkfs -t ext2 /dev/ftl'
       or something to that effect.
    4. Populate the flash disk with the neccessary
       files
    5. Make the ftl device the root device.
    
Obviously these are *very* high level steps.

Anyways, you might be thinking "This guy doesn't
know what he is talking about." and I am almost 
inclined to agree.

Could someone comment on what I am trying to
accomplish
vs. what I am doing?  Or perhaps some general 
instructions on how I should use MTD?  

I have read the MTD docs and have looked through the
mailing list archives, but a lot of that is more
specific info than I need right now.

My thanks to any one that helps.

   -- kelly

_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
