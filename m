Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CjZhT-0006lJ-Ns
	for linux-mtd@lists.infradead.org; Wed, 29 Dec 2004 04:01:01 -0500
Message-Id: <6.0.1.1.0.20041229093407.01f20e88@192.168.2.1>
Date: Wed, 29 Dec 2004 10:00:53 +0100
To: Jared Hulbert <jaredeh@gmail.com>
From: llandre <r&d2@dave-tech.it>
In-Reply-To: <6934efce041228094447dbfbd1@mail.gmail.com>
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
	<6934efce04122709464e95ec21@mail.gmail.com>
	<6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
	<6934efce041228094447dbfbd1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to exploit STS pin of Strata Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > To avoid the bus accesses to detect the end of erase/write operations.
> > This wastes a lot of bus bandwidth.
>
>I believe the current StrataFlash drivers actually sleep() for an
>appropriate amount of time in both the write and erase routines.  I'm
>not sure that they are actually going to be wasting that much useful
>bus time.  I'm curious to know if you have any data to suggest this
>bus usage has any significant impact on system performance.
>
> > >How?  Connect it to a irq line?
> >
> > Is this supported by MTD? How to enable this feature in the low-level 
> driver?
> > I had a look at the existing drivers but it neems no one uses interrupt ...
>
>No.  I was just curious what you were thinking of.  It could be done.
>If you really think its worth it.

Jared,

when I helped Thomas Gleixner to debug the code to support 2k-page NAND 
devices, I
discussed with him about this subject. For NAND chips there are three 
possibilities:
1) if the driver can not read the ready/busy pin, MTD waits the maximum 
delay required
by the device to perform such operations (this clearly reduces performance)
2) if the driver can read the ready/busy pin, MTD polls this pin in order to
detect the end of operation (no accesses on the bus)
3) if the ready/busy ping is connected to an IRQ line, the driver can 
"sleep" until
the processor receives an interrupt from the NAND (I never implemented this 
solution so far)

I don't know how NOR/Strata Flash drivers work and I thouhgt they implement
the well-known data polling algorithm to detect the end of operation.
However, if they actually "sleeps" as you pointed out, I
clearly am wrong. If I'm right instead, the data-polling algorithm wastes 
bandwidth
because it performs a lot of read accesses just to read the value of a bit.
This can lead to problems for example when you have a bus-demanding 
peripheral such
as a LCD controller. In this case the wasted bandwith can lead to flickering.
In conclusion, to avoid data-polling algorithm, it is possible to implement the
same ready/busy pin strategy used for NAND chips.


Regards,

llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
