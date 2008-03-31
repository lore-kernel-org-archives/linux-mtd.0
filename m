Received: from ozlabs.org ([203.10.76.45])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jg87G-0007OF-6Z
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 00:43:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <18416.13196.812280.794832@cargo.ozlabs.ibm.com>
Date: Mon, 31 Mar 2008 11:42:52 +1100
From: Paul Mackerras <paulus@samba.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: OF compatible MTD platform RAM driver ?
In-Reply-To: <56851566f85e117c42b078dd2d6a2028@kernel.crashing.org>
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251914.24021.laurentp@cse-semaphore.com>
	<47EA4741.2050402@ru.mvista.com>
	<200803271013.32612.laurentp@cse-semaphore.com>
	<20080327100304.GC10397@localhost.localdomain>
	<7c44646510c3b98075de9aa57cad0bce@kernel.crashing.org>
	<18416.813.635397.559197@cargo.ozlabs.ibm.com>
	<56851566f85e117c42b078dd2d6a2028@kernel.crashing.org>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Segher Boessenkool writes:

> It's still the (platform) probe code its responsibility to figure
> out what (if anything) to do with any device.  And "main memory"
> is probed differently (via /chosen/memory, for example) anyway.
> Well, actually, Linux searches for all nodes with device_type "memory",
> which should work fine as well [*].
> 
> So, all in all, I think we should just give these "auxiliary memory"
> devices a name of "ram" c.q. "rom", and some "reg", and that should
> be all that is needed: the main memory probe stuff won't consider
> these nodes, and the (platform) device probe code can do whatever it
> wants (create mtd devices, I guess).

Sounds reasonable.

> [*] It seems to me the longtrail workaround code in prom_init.c is
> incorrect though: it will match any node with name "memory" that
> doesn't have a device_type?

It only matches on children of the root node, and it's that way
because the /memory node in the longtrail device tree doesn't have a
device_type.  Actually we could probably remove the longtrail stuff
now; I think mine has stopped working, and I only know of 2 others in
existence. :)

Paul.
