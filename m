Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jer7g-0004dJ-Pd
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 12:22:25 +0000
Message-ID: <47EB91D2.60100@ru.mvista.com>
Date: Thu, 27 Mar 2008 15:23:46 +0300
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: OF compatible MTD platform RAM driver ?
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251914.24021.laurentp@cse-semaphore.com>
	<47EA4741.2050402@ru.mvista.com>
	<200803271013.32612.laurentp@cse-semaphore.com>
	<20080327100304.GC10397@localhost.localdomain>
In-Reply-To: <20080327100304.GC10397@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Laurent Pinchart <laurentp@cse-semaphore.com>, ben@simtec.co.uk,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

David Gibson wrote:

>>>Laurent Pinchart wrote:

> [snip]

>>>    Heh, we've gone thru "physmap" before -- it was labelled Linux-specific 
>>>name (well, I'd agree with that).

>>physmap stands for physically mapped. That doesn't sound
>>Linux-specific to me, the fact that the MTD driver has the same name
>>is a pure coincidence.  linmap-rom and linmap-rom sound even more
>>Linux-specific :-)

> It may not be Linux specific per se, but it's a bad name, because the
> fact that the device is physically direct mapped isn't a useful
> distinguishing feature of the device.

    Yeah, it's not a propery of a device itself (yet, the device would be 
useless if this information is not supplied in the tree somehow). Yet remember 
the now ungoing discussion about "reg-shift" property for UARTs -- some people 
said that the fact that this property may not be a feature of device is 
irrelevant WRT the binding. :-)

> Main memory is also direct physically mapped, after all,  but that's not what you want to cover
> with this description.

   Haven't ever seen the description of memory as a device (unless you mean 
the "memory" node which can hardly be considered proper device -- mainly 
because of their usual placement at the top of the tree, and not where a RAM 
device logically should be in the bus hierarchy).

> In general how a device is wired is described by where it sits in the tree, not by its properties.

    Oh, another argument against "reg-shift" in the Xilinx UART quarry... :-)

> It only seems like a usefully distinguishing name because it's the
> Linux "physmap_of" driver that uses it.  So in this sense it is a
> Linux specific name after all.  In fact, physmap_of is itself very
> badly named - right now it only handles direct mapped mtds, but that's

    Yeah, because that's what is what it has been written for.

> not inherent; it could be trivially extended to also instantiate a
> non-direct-mapped device (as long as the underlying mtd layer
> supported it, of course).   It bears no relation at all to the
 > "physmap" driver, except historical accident.

    This driver resides on the "top", device mapping layer of the MTD 
hierarchy, and I don't see a point of cramming support for all the possible 
mappings into one driver vs doing it as the *separate* specific drivers in 
drivers/mtd/mapps/ -- as it has been done in the MTD tree before "the great OF 
revolution". This is really strange idea...

WBR, Sergei
