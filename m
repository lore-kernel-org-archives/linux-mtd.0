Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lBMY-0000jB-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 16:12:26 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFA7A@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'Mark Meade' <mark@lakeshoremicro.com>, David Woodhouse
	 <dwmw2@infradead.org>
Cc: Vadim Khmelnitsky <VadimK@m-sys.com>, linux-mtd@lists.infradead.org
Subject: RE: UnitSizeFactor of != 1 yet? 
Date: Wed, 13 Mar 2002 08:24:05 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Vadim - I noticed that during a nftl_format, there were messages about
"skipping factory
marked bad zones".  Does the latest version of DFORMAT create a new bad
block table?  I
was under the impression that my bad block table was long gone...

[Vadim]
This message means that we do not touch block that marked as bad in BBT (
bad block table ). If there is no BBT
fomat will treat DOC as a virgin device , meaning the first thing would be
to scan the whole media to find the bad blocks . On the virgin media bad
blocks are the blocks that are not fully erased .( at least one byte in data
or extra area is not 0xFF ) 

Vadim 
-----Original Message-----
From: Mark Meade [mailto:mark@lakeshoremicro.com]
Sent: Wed, March 13, 2002 7:05 AM
To: David Woodhouse
Cc: Vadim Khmelnitsky; linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 


David,

With the latest revision of nfltmount.c (1.28), I was able to mount the DoC
and create
files on the fat partition -- everything seems OK.  I didn't put in any
additional checks
on UnitSizeFactor == 0, as it looks like the code has already assumed that 0
is equivalent
to 0xFF.

I created an ext2 partition, and attempted to boot from it.  The kernel
booted, but I got
the following panic:

    NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think
we know what
it means...
    nftla:<0>Kernel panic: unknown: request list destroyed

Attempting to mount this ext2 partition is successful, but I'm seeing
multiple messages
like:

    NFTL_findfreeblock: there are too few free EUNs
    Write Inhibited on EUN 919
    Folding chain 8 into unit 559
    Want to erase

Vadim - I noticed that during a nftl_format, there were messages about
"skipping factory
marked bad zones".  Does the latest version of DFORMAT create a new bad
block table?  I
was under the impression that my bad block table was long gone...

Mark

David Woodhouse wrote:

> Eep. OK, if you put a check in just before we deal with UnitSizeFactor,
> setting it to 0xFF if it was 0x00 - does that make it work? Don't break
the
> memcmp with the later MediaHeader - use a local variable of something.
