Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Onll-0003cy-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 21:29:25 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14Onlj-0003cq-00
	for mtd@infradead.org; Fri, 02 Feb 2001 21:29:24 +0000
Message-ID: <20010202212916.18193.qmail@scrye.com>
Date: Fri, 2 Feb 2001 14:29:16 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <Pine.LNX.4.30.0102022117500.8902-100000@imladris.demon.co.uk>
References: <20010202205810.17803.qmail@scrye.com>
	<Pine.LNX.4.30.0102022117500.8902-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>>>>> "David" == David Woodhouse <dwmw2@infradead.org> writes:

David> On Fri, 2 Feb 2001, Kevin Fenzi wrote:
>>  ...  M-Systems DiskOnChip driver. (C) 1999 Machine Vision
>> Holdings, Inc.  M-Systems NAND Flash Translation Layer driver. (C)
>> 1999 MVHI $Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $ ...

David> Didn't find hardware. Did you hardcode the address or leave it
David> at zero to auto-probe? Common mistake is to give the segment
David> address not the real address (0xd800 not 0xd8000). You do need
David> the extra zero.

I left it at 0. How can I tell what address the DOC is at? from the
bios? 

So it would print something here if it found the DOC? 

David> Note to self: Hide that option and the 55AA one inside
David> if(LINUXBIOS).

yeah, also help for those kernel options would be nice. ;) 
I had to look at the code to see that 0 meant to auto-probe. ;) 

>> Then, I tried the newest m-systems driver with 2.2.18:

>> VFS: Cannot open root device 3e:01 Kernel panic: VFS: Unable to
>> mount root fs on 3e:01

David> They changed the major number from the temporary one they were
David> using. But rather than using the one I'd already registered,
David> they started using an entirely new one. Major 100 I think.

yeah, I tried that too...no dice. That just should need to be the
'root=' option for the kernel in lilo.conf, right? 

David> Geometry info is useful though - can you compare it with what
David> the free driver reports, when you get that working?

sure. 

>> I would be happy to write up a HOWTO or the like if someone can
>> help me get it going. ;)

David> I love you.

ha. I have to get it working first tho. ;) 

David> -- dwmw2

kevin




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
