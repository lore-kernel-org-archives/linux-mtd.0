Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13r3mK-0007Xw-00
	for mtd-list@infradead.org; Wed, 01 Nov 2000 19:42:32 +0000
Received: from [205.250.170.220] (helo=xanadu.vipswitch.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13r3mJ-0007Xq-00
	for mtd@infradead.org; Wed, 01 Nov 2000 19:42:31 +0000
Date: Wed, 1 Nov 2000 14:37:29 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Gregory Schallert <gschallert@dawning.com>
cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: mtdblock module & I'm Back again 
In-Reply-To: <3A005A52.E95F536@dawning.com>
Message-ID: <Pine.LNX.4.10.10011011431390.3482-100000@xanadu.vipswitch.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 1 Nov 2000, Gregory Schallert wrote:

> 1)  when I compile the mtdblock.c file I get a referenced symbol
> "invalidate_buffers"  Any Ideas why?
> 
> I have currently have a MTD release that is about a month old.  I'm
> going to download the new one and see if I still get the same problem.

It should have been fixed in the current CVS.

> 2)  What does mtdblock.c actually do? If I load mtd.o, mapped.o, and
> mtdblock.o  what additional functionality do I need to program to get a
> minix file system on the flash chips?

IMHO mtdblock is currently broken.  It works read-only.  I'm implementing
the write support at the moment.

However, in the mean time, you might consider investigating JFFS which
might just do what you want.  Even if JFFS requires mtdblock it is used
only to identify the flash device so the issue with mtdblock write support
doesn't apply to JFFS.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
