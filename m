Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZFdM-0000m0-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 17:43:40 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZFdI-0000lt-00
	for mtd@infradead.org; Wed, 13 Sep 2000 17:43:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13ZFNG-00020Z-00@pearl.tao.co.uk> 
References: <E13ZFNG-00020Z-00@pearl.tao.co.uk> 
To: David Given <dg@tao-group.com>
Cc: mtd@infradead.org
Subject: Re: sbc-mediagx 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Sep 2000 17:43:22 +0100
Message-ID: <32401.968863402@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dg@tao-group.com said:
>  * MTD only works with kernels compiled with*out* MODVERSIONS. This is
> because  the dynamic loading code in map.h doesn't know about the
> mangled symbols used  with this option turned on. 

Easy to fix - just that nobody's bothered yet. Patches accepted if you care 
enough to produce one.


dg@tao-group.com said:
>  * The device claims to see only 8MB of my flash medium. 

Odd. Please send the kernel's output while it's probing. How big _is_ the 
flash?


dg@tao-group.com said:
>  * The device sees three partitions on the disk. DOS sees one. I
> suspect that  they use different concepts of partitions. 

Yes. In hindsight, we probably shouldn't call them 'partitions'.

dg@tao-group.com said:
>  * MTD doesn't work with devfs, so you have to create device nodes
> manually ---  /dev/mtd is at c,90,0..2 and /dev/mtdblock is at
> b,31,0..2, right? 

See #1. Patches accepted if you care :)


dg@tao-group.com said:
>  Would anyone like to explain to me what's going on, if anyone knows?
> I  *really* don't want to go back to using flashfx.o. I don't want to
> experiment  as I could easily render my board unbootable. Which would
> be a shame.

Please could you bzip2 and send to me the contents of /dev/mtd[012]. I'm 
not 100% sure what translation layer is used by flashfx, but it might be 
something I recognise.


dg@tao-group.com said:
>  BTW, anyone know how frequently the kernel syncs with the CVS tree? 

Rarely at the moment. I sync to Linus' kernel frequently, but I'm not
intending to send him anything more for 2.4. Once the 2.5 series starts, 
I'll be keeping it reasonably up-to-date. 

AnonCVS access is available. I recommend you use that.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
