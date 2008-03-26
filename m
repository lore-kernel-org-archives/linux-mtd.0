Received: from [2001:470:1f01:ffff::eb] (helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeXFh-0005tx-DT
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 15:09:22 +0000
In-Reply-To: <200803251914.24021.laurentp@cse-semaphore.com>
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251823.32039.laurentp@cse-semaphore.com>
	<DCEAAC0833DD314AB0B58112AD99B93B0427706A@ismail.innsys.innovsys.com>
	<200803251914.24021.laurentp@cse-semaphore.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <b06db7bb4932d14f8af9547abdfc9d0d@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: OF compatible MTD platform RAM driver ?
Date: Wed, 26 Mar 2008 16:06:45 +0100
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org,
	Rune Torgersen <runet@innovsys.com>, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> So we're left with two main options.
>
> - Reusing the nvram device type from the Device Support Extensions.

This wouldn't bring you anything.  A device_type is only used internally
by OF, to decide what device nodes support which OF programming model.
If you only have a flat device tree, "device_type" should be used only
as a workaround for older kernels that require it.

> - Using another device node with a compatible value set to 
> "linear-ram" (or
> something similar). This would support both volatile and non-volatile
> devices, and a property could be added to specify if the device is 
> volatile
> or not.

"memory-mapped-memory" perhaps :-)

Or, just "memory".  Although that one might play havoc with some
not-quite-correct main memory probing code.


Segher
