Received: from ozlabs.org ([203.10.76.45])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jg4tJ-0000B1-8O
	for linux-mtd@lists.infradead.org; Sun, 30 Mar 2008 21:16:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <18416.813.635397.559197@cargo.ozlabs.ibm.com>
Date: Mon, 31 Mar 2008 08:16:29 +1100
From: Paul Mackerras <paulus@samba.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: OF compatible MTD platform RAM driver ?
In-Reply-To: <7c44646510c3b98075de9aa57cad0bce@kernel.crashing.org>
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251914.24021.laurentp@cse-semaphore.com>
	<47EA4741.2050402@ru.mvista.com>
	<200803271013.32612.laurentp@cse-semaphore.com>
	<20080327100304.GC10397@localhost.localdomain>
	<7c44646510c3b98075de9aa57cad0bce@kernel.crashing.org>
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

> > For RAMs we
> > need something to indicate that it's memory but intended for secondary
> > storage, not as main memory.
> 
> How it is intended to be used is not a property of the hardware, so
> that information doesn't belong in the device tree at all.  The Linux
> platform code should handle this, I imagine.

There must be some reason why it is not intended to be used as main
memory.  Presumably it has something different about it compared to
"normal" RAM, and that difference could perfectly well be expressed in
the device tree.

Paul.
