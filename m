Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNTaU-0003T5-7W
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 06:02:29 -0400
Message-ID: <37673.192.168.0.2.1099043843.squirrel@192.168.0.2>
In-Reply-To: <418213C3.3050706@magellan-technology.com>
References: <20041028230640.GB13105@home.fluff.org>
	<4181840D.2020605@magellan-technology.com>
	<1099035223.22387.529.camel@thomas>
	<418213C3.3050706@magellan-technology.com>
Date: Fri, 29 Oct 2004 10:57:23 +0100 (BST)
From: jasmine@linuxgrrls.org
To: "Aras Vaichas" <arasv@magellan-technology.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: Read/nBusy via interrupt
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Thomas Gleixner wrote:

>> No. Usually R/B is connected anyway.
>
> usually? If the software doesn't need it, then why would you connect it?

Because hardware engineers usually design the hardware to be as flexible
as possible, in light of the fact that they don't know how the operating
system is going to want to use the hardware.

It's absolutely essential to implement interrupts on the RnB line if
you are going to run a realtime OS on the hardware, because polling
is 100% unacceptable in that situation.  You must poll with interrupts
disabled on a bus-connected Flash because otherwise interrupts and DMA
operations could potentially interfere with Flash operations.

Obviously in a realtime OS with target latency <50usecs, spending maybe
ten milliseconds with interrupts disabled is completely unacceptable.

So, connect the damned wire and shut up.

-J.,
software and hardware engineer.
