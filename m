Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hZ6k-0002i6-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 16:40:38 +0100
Received: from mail.addcoinc.com
	([12.47.38.2] helo=exchange.addcoinc.com ident=fwuser)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hZ6j-0002fQ-00
	for mtd@infradead.org; Mon, 26 Mar 2001 16:40:37 +0100
Message-ID: <5B08DC7C9AA6D411930E00105A19794B02F4D7@EXCHANGE>
From: "Carson, Jon A." <JACarson@addcoinc.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: FW: Can't compile 2.4.2 kernel after MTD patch
Date: Mon, 26 Mar 2001 09:36:35 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi ,

I had some similar experiences with nftl.c.  Here are the problems I had:


1. I added some casts to get the compiler to stop whining about this: 

nftl.c: In function `NFTL_notify_add':
nftl.c:204: warning: long int format, int arg (arg 3)
nftl.c:204: warning: long int format, int arg (arg 4)

was:
	DEBUG(MTD_DEBUG_LEVEL3, "mtd->read = %p, size = %ld, erasesize =
%ld\n",
	      mtd->read, mtd->size, mtd->erasesize);
now:
      DEBUG(MTD_DEBUG_LEVEL3, "mtd->read = %p, size = %ld, erasesize =
%ld\n",
	      mtd->read, ( long int ) mtd->size, ( long int )
mtd->erasesize);



2. Here is the same bug that Frank found. Basically just a typo I guess.
nftl.c: In function `NFTL_findwriteunit':
nftl.c:624: `MTD_DEBUG_LEVEL_1' undeclared (first use in this function)
nftl.c:624: (Each undeclared identifier is reported only once
nftl.c:624: for each function it appears in.)

was:
        DEBUG(MTD_DEBUG_LEVEL_1, "Using desparate==1 to find free EUN to
accommodate write to VUC %d\n", thisVUC);
now:
	DEBUG(MTD_DEBUG_LEVEL1, "Using desparate==1 to find free EUN to
accommodate write to VUC %d\n", thisVUC);



I had a lot of trouble with this one. AS you can see, I just commented the
version checking code out, since I couldnt figure out what was originally
meant here.  "nftl.c" now compiles without error for me.   BTW: I think that
the version statement needs some parenth's like:
#if (LINUX_VERSION_CODE > 0x20400) . I tried this but, it still did not
work.


nftl.c: In function `nftl_ioctl':
nftl.c:847: warning: implicit declaration of function `blk_ioctl'

was:
#if LINUX_VERSION_CODE > 0x20400 /* ??? */
#include <linux/blkpg.h>
#endif

now:
// #if LINUX_VERSION_CODE > 0x20400 /* ??? */
#include <linux/blkpg.h>
// #endif


Please check out these changes for a "sanity check" I have not updated any
CVS archive code.  I 'll leave that to the masters :)

Thanks,
Jon Carson
ADDCO Inc.
USA


----------------------------------------
> -----Original Message-----
> From: Frank Neuber [mailto:neuber@convergence.de]
> Sent: Monday, March 26, 2001 5:49 AM
> To: ihristov@databrokers.net; mtd@infradead.org
> Subject: re: Can't compile 2.4.2 kernel after MTD patch
> 
> 
> Hi,
> 
> > nftl.c: In function `NFTL_findwriteunit':
> > nftl.c:624: `MTD_DEBUG_LEVEL_1' undeclared (first use in this
> function)
> > nftl.c:624: (Each undeclared identifier is reported only once
> 
> there is a small bug in nftl.c! The debug variable should be
> MTD_DEBUG_LEVEL1  :-)
> 
> Frank
> 
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
