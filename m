Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11iIit-0003du-00
	for mtd@infradead.org; Mon, 1 Nov 1999 14:46:15 +0000
To: Mike Touloumtzis <miket@bluemug.com>
Cc: Shawn Leas <SLEAS@videoupdate.com>,
    "'Stephen C. Tweedie'" <sct@redhat.com>,
    =?iso-8859-1?Q?'Josef_H=F6=F6k'?= <joh@xinit.se>,
    linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: jfs/linux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 01 Nov 1999 14:45:57 +0000
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11iIib-00088Z-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


miket@bluemug.com said:
>  Log-structured file systems are also very interesting for Flash-ROMs
> in embedded devices.  Wear leveling is a big concern there, seek time
> is not.  Reconciling proper GC with decent random access times is
> still the trick, though. 

All the solutions we currently have for filesystems on flash present a block 
device rather than a filesystem interface - that is, both FTL and NFTL act as 
an extra translation layer below the actual filesystem, providing 512-byte 
random block access for use by a traditional filesystem. 

It would probably be more efficient to implement a filesystem directly on the 
flash, much like Microsoft's FFS2, except that FFS2 obviously isn't 
POSIX-compliant, and hence isn't very interesting to us, although we do have 
the beginnings of a filesystem driver for it.

As there are patent problems with both FTL and NFTL, it would be extremely 
useful to have a POSIX-compliant filesystem designed specifically for use on 
flash devices. 

I think that there is already such a beast in existence, designed for QNX. It
would be nice to either support this or write a replacement. 

Contact me if you're interested in following this up.

----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
