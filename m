Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTepG-0003Ja-Rw
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 06:43:00 -0400
From: Andy Hawkins <a.hawkins@cabletime.com>
To: tglx@linutronix.de
In-Reply-To: <200405281227.34312.tglx@linutronix.de>
References: <1085737289.5617.3.camel@adh>
	<200405281227.34312.tglx@linutronix.de>
Content-Type: text/plain
Message-Id: <1085740962.5617.9.camel@adh>
Mime-Version: 1.0
Date: 28 May 2004 11:42:42 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Large flash concatenation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thanks to both Thomas and David for replying.

On Fri, 2004-05-28 at 11:27, Thomas Gleixner wrote:
> 1. Please use the latest NAND code, as the support for the larger devices is 
> already there and the old code does not handle the large page devices.
> We have actually problems with CVS access (is IPV6 only). I can provide a 
> current snapshot on request.

I'm now doing that. I've downloaded the latest snapshot
(mtd-snapshot-20040527.tar.bz2) and am trying to get it to compile now.

> 2. The nand driver itself can handle multiple chips now. The scan function
> supports multiple chip detection. Do not use the concat function for this 
> purpose. The chips are provided as one big device to the MTD layer if you do 
> not use partitions.

How do I do this? Each chip appears at a separate address (we've used
the lower 6 bits of the address lines to decode the chip selects for
each chip). At the moment, I'm looping over all the possible addresses
calling 'nand_scan' at each address. Is this this correct way to do
this?

> It might turn out that JFFS2 is not the first choice for this concatenated 
> device size, but it should work. Maybe YAFFS2 would be more suitable. It's 
> not released yet AFAIK, but it should be available soon. 

We haven't made a final choice of filesystem as of yet, I just want to
get the devices up and running so that I can write / read them (to prove
our hardware design is correct).

> You can join #mtd on irc.freenode.net if you want.

That might be a good idea. Thanks for letting me know about that.

Andy
