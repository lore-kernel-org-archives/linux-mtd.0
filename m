Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hz8OI-0005vb-F9
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 05:46:52 -0400
Date: Fri, 15 Jun 2007 10:46:33 +0100
From: Ben Dooks <ben@fluff.org>
To: Vijay Kumar <vijaykumar@bravegnu.org>
Subject: Re: Read/Busy as Interrupt
Message-ID: <20070615094633.GA3732@fluff.org.uk>
References: <15361.202.144.30.226.1181887978.squirrel@www.bravegnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15361.202.144.30.226.1181887978.squirrel@www.bravegnu.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 15, 2007 at 11:42:58AM +0530, Vijay Kumar wrote:
> Hi Everyone,
> we have a custom MPC8560 board with a Micron NAND flash (MT29F4G08AAA).
> The flash has the following specification with regards to the ready/busy
> pin.
> 
> Block Erase - Max: 2ms, Typical: 1.5ms
> Page Prog - Max: 600us, Typical: 220us

You will also need to take into account the rise time (capacitance of
the line, versus the pull-up resistance used). Typically, with a 10K
resistor on a resonably complex board, it can add another 200-300uS
to the time taken.
 
> The MPC8560 does not have a NAND flash controller, and the NAND flash is
> interfaced through the local bus controller (UPM).
> 
> In a 2.6 linux kernel, is it better to implement a polling mechanism for
> the ready/busy pin or is it better to use interrupt (sleep/wake)
> mechanism.
> 
> The block erase seems to be a good candidate for interrupt mechansim. But
> it is not very clear for the page prog operation. Please let us know your
> suggestions on this.

This may be worth looking at for other controllers. I know the
S3C2440 and later have the option for RnB change interrupt. Having
the wait for ready function being passed an indication of what command
it is waiting for may be a good idea.

I'd say for anything in the sub ms region, you may end up using a
quantity of time in the IRQ handling mechanisms.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
