Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Z8c4-0006NL-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 10:13:52 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Z8c3-0006NF-00
	for mtd@infradead.org; Wed, 13 Sep 2000 10:13:51 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <39BEF000.85BADD09@colubris.com> 
References: <39BEF000.85BADD09@colubris.com>  <000801c00e8b$9a649560$0800a8c0@win95.inteloop.se> <15725.967205759@cygnus.co.uk> 
To: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: Anyone using mtd on NAND flash? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Sep 2000 10:13:21 +0100
Message-ID: <29459.968836401@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


stephane.laroche@colubris.com said:
> On the subject of NAND flash, could some JFFS expert point me 

You're posting in the wrong place if you want JFFS experts. Join the JFFS
development list - see http://developer.axis.com/software/jffs/ for
subscription instructions.

> on where I should look for those multiple writes to the same page?

The JFFS code writes out a node header, then writes the data separately. In 
some cases, it even goes back after writing the data and puts the correct 
checksum into the node header. 

Look for calls to flash_safe_write() in intrep.c

> I am currently working on a NAND driver for MTD that takes care of bad
> blocks and virtual mapping.  It does ECC, keeps a bad block table and
> does the virtual mapping of blocks so that MTD sees a linear block
> device with 100% good blocks. 

Nice. One question - why do you want to do it in the MTD driver rather than 
in the next layer up? This kind of functionality will be needed for a 
number of devices, so it's probably worth putting it in JFFS.

We're already intending to stop JFFS from treating the flash as a single 
linear device, and start keeping a list of erase blocks in various 
conditions (full,dirty,empty,etc.). It wouldn't be difficult to handle bad 
blocks once that's done.

Also, the write caching to ensure we only perform one write per page is 
going to make it extremely easy for JFFS to do its own ECC too, where 
appropriate.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
