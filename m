Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OnfD-0003bj-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 21:22:39 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14OnfB-0003bd-00
	for mtd@infradead.org; Fri, 02 Feb 2001 21:22:38 +0000
Date: Fri, 2 Feb 2001 21:22:31 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Fenzi <kevin@scrye.com>
cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <20010202205810.17803.qmail@scrye.com>
Message-ID: <Pine.LNX.4.30.0102022117500.8902-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Feb 2001, Kevin Fenzi wrote:

> 
> ...
> M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
> M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI       
> $Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $          
> ...


Didn't find hardware. Did you hardcode the address or leave it at zero to 
auto-probe? Common mistake is to give the segment address not the real 
address (0xd800 not 0xd8000). You do need the extra zero.

Note to self: Hide that option and the 55AA one inside if(LINUXBIOS).

> Then, I tried the newest m-systems driver with 2.2.18:

> VFS: Cannot open root device 3e:01
> Kernel panic: VFS: Unable to mount root fs on 3e:01

They changed the major number from the temporary one they were using. But
rather than using the one I'd already registered, they started using an
entirely new one. Major 100 I think.

Geometry info is useful though - can you compare it with what the free 
driver reports, when you get that working?

> I would be happy to write up a HOWTO or the like if someone can help
> me get it going. ;) 

I love you.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
