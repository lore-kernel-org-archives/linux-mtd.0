Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ojcH-00017n-00
	for mtd-list@infradead.org; Mon, 08 May 2000 10:14:17 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ojcG-00017h-00
	for mtd@infradead.org; Mon, 08 May 2000 10:14:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <14613.19866.269661.531112@jodie.local> 
References: <14613.19866.269661.531112@jodie.local>  <E12mz9Z-0006NG-00@infradead.org> <14613.18040.415068.143363@jodie.local> 
To: Dvir Oren <dviro@lucidvon.com>
Cc: MTD <mtd@infradead.org>
Subject: Re: next step 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 May 2000 10:19:11 +0100
Message-ID: <9688.957777551@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dvir@lucidvon.com said:
>  Also, David once told me that fdisking /dev/nftla when nftl.o is
> loaded (which will always be true if you are using a kernel with the
> MTD drivers build-in) might not work.  This is to be checked with
> David.
>  

Any access to /dev/nftla (including fdisk) _requires_ the nftl.o module to 
be loaded. But you shouldn't have any of it mounted if you're 
repartitioning it, as with any other block device.

What I pointed out to you was that you shouldn't have nftl.o loaded when you
use nftl_format to completely reinitialise the NFTL on the flash - because
nftl.o will cache some information off the (original) nftl format, and will
get utterly confused when you you change it all.

NFTL is like a filesystem, which resides on the actual flash (/dev/mtd0). 

When you load the nftl.o module, it's like mounting that filesystem. 

Unlike a normal filesystem, NFTL provides a block device (on top of which
you will generally put another, normal, filesystem), and the nftl.o module
'mounts' the NFTL from the flash as soon as it's loaded. 

So when you use nftl_format or anything else to access the flash directly,
you will utterly confuse the NFTL code if it's still present - because it's
always 'mounted'. It's just like writing directly to a block device while 
it's mounted. Hence, you have to remove the NFTL support before writing 
directly to the flash. Unless you're only updating the firmware, which 
doesn't affect the area in which the NFTL is stored on the flash.




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
