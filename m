Received: from [2001:470:1f01:ffff::eb] (helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jg24R-0008Pr-HA
	for linux-mtd@lists.infradead.org; Sun, 30 Mar 2008 18:15:56 +0000
In-Reply-To: <20080327100304.GC10397@localhost.localdomain>
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251914.24021.laurentp@cse-semaphore.com>
	<47EA4741.2050402@ru.mvista.com>
	<200803271013.32612.laurentp@cse-semaphore.com>
	<20080327100304.GC10397@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <7c44646510c3b98075de9aa57cad0bce@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: OF compatible MTD platform RAM driver ?
Date: Sun, 30 Mar 2008 20:15:46 +0200
To: David Gibson <david@gibson.dropbear.id.au>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Laurent Pinchart <laurentp@cse-semaphore.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Could we agree on a name ? I'd like to submit a new patch.
>
> For ROMs I think just plain "rom" should be sufficient.

Yes.

> For RAMs we
> need something to indicate that it's memory but intended for secondary
> storage, not as main memory.

How it is intended to be used is not a property of the hardware, so
that information doesn't belong in the device tree at all.  The Linux
platform code should handle this, I imagine.


Segher
