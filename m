Received: from wireless02.one2one.net ([149.254.200.194]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19YFde-0006xR-0v
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jul 2003 02:45:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <092C59AE-ACB6-11D7-81FB-000393AD6294@regolith.co.uk>
References: <092C59AE-ACB6-11D7-81FB-000393AD6294@regolith.co.uk>
Message-Id: <1057282999.12599.9.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 04 Jul 2003 02:43:21 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Alex Samoutin <samoutin@hotbox.ru>
cc: tglx@linutronix.de
cc: linux-mtd@lists.infradead.org
cc: Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-07-02 at 18:53, Jasmine Strong wrote:
> The timings for the 405 EBIU bus do not match the required timings for
> the Toshiba chip's read cycle.  There is no good solution to this 
> problem.
> 
> We ended up putting the !RE pin onto a GPIO, but this caused (huge)
> problems with interrupts and so forth.

Hmmm. Perhaps this is a situation in which using something like a
DiskOnChip might be useful. The DiskOnChip ASIC isolates the flash bus
from the host and gives you a sensible pipeline for data transfer;
dual-host-cycle read/write accesses when appropriate.

Otherwise yes, you need to invent the same kind of thing to meet the
timing constraints of the NAND chip.

-- 
dwmw2
