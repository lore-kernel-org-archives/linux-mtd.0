Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNROX-0002U3-N0
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 03:41:59 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <4181840D.2020605@magellan-technology.com>
References: <20041028230640.GB13105@home.fluff.org>
	<4181840D.2020605@magellan-technology.com>
Content-Type: text/plain
Date: Fri, 29 Oct 2004 09:33:43 +0200
Message-Id: <1099035223.22387.529.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: Read/nBusy via interrupt
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-29 at 09:43 +1000, Aras Vaichas wrote:
> Ben Dooks wrote:
> > Does anyone here have any comments over the pros/cons of using
> > an interrupt which goes off to wait for a NAND flash ready/not-busy
> > signal?
> > 
> 
> pros of using interrupt:
> * faster MTD access (maybe, depends on polling rate) but as a percentage of 
> total access time it probably doesn't make much difference.

For program and erase it makes a lot of difference. The waiting process
releases the CPU and gets woken when the job is done. Arguing with
percentage of total access time is utter crap here. The poll/yield loop
involves unneccecary context switches, which can significantly influence
the overall system performance on smaller systems.

> * less cpu overhead
> 
> cons of using interrupt:
> * more pins used up on CPU

No. Usually R/B is connected anyway.

> * more code to write and debug!

About 20 lines. I'm scared.

> * more interrupts going off in system

They go only off, when a long lasting operation is in progress

> * more pins needed on MTD -> more expensive boards and chips, longer board 
> design times

He ? NAND FLASH has a ready/busy pin, which does not produce extra
costs. What's the longer design time per pin on complex boards ?
A typical 32bit embedded system CPU board uses alone about 500 pins for
connecting CPU, SDRAM, power and the on chip peripherals. Do you really
want to tell me, that 1 more pin will increase board costs and design
time significantly ?

> If you take a look at the 8-CASON part, you'll notice that in order to reduce 
> pin count, they leave out the ready/nbusy signal because this information can 
> be obtained by polling. This is really a matter of board space as you can fit 
> 1Megabyte of bootable FLASH into a surface mount 8pin package by leaving out 
> this pin.

This is a 1 MByte boot FLASH designed for space constraint devices. You
need a CPU which can boot from those. 

We are talking about NAND >= 32MB, which is often used for filesystems.

> If you wanted to improve performance, you would simply find out how long the 
> MTD usually stays busy for and only resume polling after that time.

Nice plan. Using what ? Typical erase/program time, maximum
erase/program time ? And waiting in the worst case 10ms for something
what takes 3ms ? This improves performance a lot.

> If you can spare the board space, why not use interrupts? Make it a kernel 
> option. MTD_EADYNBUSY_INTERRUPT ?

There's no option neccecary at all. This is board related and has to be
solved by the board driver anyway. The functionality to do so is already
there.

tglx
