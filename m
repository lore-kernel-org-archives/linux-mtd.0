Return-path: <David.Woodhouse@mvhi.com>
Received: from tmmi196-053.telusvelocity.net
	([209.115.196.53] helo=Wakko.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111Djw-0004gK-00
	for mtd@infradead.org; Mon, 5 Jul 1999 19:45:16 +0100
Date: Mon, 5 Jul 1999 12:45:08 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu
Subject: FFS2 and MTDs (flash)
In-Reply-To: <E111DRz-0002E1-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990705123421.23392C-100000@Wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 5 Jul 1999, David Woodhouse wrote:

> Using FFS2 directly on the MTD layer rather than through an 'intermediate' 
> block device should allow us to do clever things like execute-in-place (XIP) 
> without too much trouble. Is there any need for FFS2 directly on a block 
> device? If there is, I may have to rethink the arrangements to allow it.

Yes, there is lots of benifit to being able to mount a FFS filesystem over
a loop device or on a RAM disk or something else. There is also lots of
benifit to being able to create the FFS off the flash and then write the
whole thing in one go. For my purposes that is a crucial feature. Also
since the MTD's are presented as block devices you can mount other FS's
like romfs in read-only mode. 

Things will also run a bit faster if the buffer cache is used to hang onto
some often used filesystem meta data in main memory.

XIP is not directly possible with FFS2 as it places no constraints on
alignment (like romfs). It is concievable that you could carefully layout
a FFS2 filesystem to allow XIP, but IMHO it isn't worth it - if you are
running linux then you have ram to spare. Even QNX is largely moving away
from that except in the most tiny systems. 

My intent is to have the File System detect that it was mounted on a MTD
and then directly access that system where necessary. I've also re-done
the MTD stuff that was taken from the PCMCIA modules to act as a block
device drive and to provide a library of functions for dealing with raw
flash (which is what all my SBCs have on them). I haven't had any interest
in porting the FTL layer or providing backwards compatibilty with the
original character devices. Ultimately using FFS instead of something like
minix over FTL is a much better solution for embedded systems.

You're welcome to my code so far if you are interested, I have support for
an Octagon 5066, a V-Max 301 and untested support for something called a
MixCom card. 

BTW, I thought Disk on a chip used an ATA interface, and wasn't really a
MTD?

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
