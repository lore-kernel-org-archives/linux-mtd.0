Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bbdbb-0003pq-5c
	for linux-mtd@lists.infradead.org; Sat, 19 Jun 2004 07:01:52 -0400
Date: Sat, 19 Jun 2004 12:01:46 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040619120146.A28048@flint.arm.linux.org.uk>
References: <20040613214329.GA2282@buici.com>
	<200406191019.09268.tglx@linutronix.de>
	<20040619102322.A24396@flint.arm.linux.org.uk>
	<200406191151.53437.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200406191151.53437.tglx@linutronix.de>;
	from tglx@linutronix.de on Sat, Jun 19, 2004 at 11:51:53AM +0200
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Marc Singer <elf@buici.com>
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 19, 2004 at 11:51:53AM +0200, Thomas Gleixner wrote:
> So a final conclusion would be:
> 
> 1. Add commandline parsing for flashbase,size,buswidth which covers the case 
> where no special code is neccecary to access the chips.

I don't have strong views on this, but if the platform model is going
to be used (so that we get the VPP and WP enable code), there seems to
be little point in separating this out into the boot loader.

Other than that, it seems fine.
