Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CjrqK-0001ZD-4Q
	for linux-mtd@lists.infradead.org; Wed, 29 Dec 2004 23:23:21 -0500
Received: by wproxy.gmail.com with SMTP id 37so31876wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Dec 2004 20:23:18 -0800 (PST)
Message-ID: <6934efce041229202370761a59@mail.gmail.com>
Date: Wed, 29 Dec 2004 20:23:18 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: llandre <r&d2@dave-tech.it>
In-Reply-To: <6.0.1.1.0.20041229093407.01f20e88@192.168.2.1>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
	<6934efce04122709464e95ec21@mail.gmail.com>
	<6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
	<6934efce041228094447dbfbd1@mail.gmail.com>
	<6.0.1.1.0.20041229093407.01f20e88@192.168.2.1>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to exploit STS pin of Strata Flash
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> when I helped Thomas Gleixner to debug the code to support 2k-page NAND
> devices, I
> discussed with him about this subject. For NAND chips there are three
> possibilities:
> 1) if the driver can not read the ready/busy pin, MTD waits the maximum
> delay required
> by the device to perform such operations (this clearly reduces performance)
> 2) if the driver can read the ready/busy pin, MTD polls this pin in order to
> detect the end of operation (no accesses on the bus)
> 3) if the ready/busy ping is connected to an IRQ line, the driver can
> "sleep" until
> the processor receives an interrupt from the NAND (I never implemented this
> solution so far)

My biggest concern is this STS pin is not something supported on many
strataflash chips.   Though this might be an elegant solution for a
system with irq lines to spare using these particular chips I don't
think it would be used often enough to be supportable.

> I don't know how NOR/Strata Flash drivers work and I thouhgt they implement
> the well-known data polling algorithm to detect the end of operation.
> However, if they actually "sleeps" as you pointed out, I
> clearly am wrong. If I'm right instead, the data-polling algorithm wastes
> bandwidth
> because it performs a lot of read accesses just to read the value of a bit.

in 2.6.10 drivers/mtd/chips/
cfi_cmdset_0001.c:1065  sleeps for the word write if I understand
cfi_udelay() correctly
cfi_cmdset_0001.c:1308  sleeps for the buffered write if I understand
cfi_udelay() correctly
cfi_cmdset_0001.c:1470  sleeps for the erase

> This can lead to problems for example when you have a bus-demanding
> peripheral such
> as a LCD controller. In this case the wasted bandwith can lead to flickering.
> In conclusion, to avoid data-polling algorithm, it is possible to implement the
> same ready/busy pin strategy used for NAND chips.

I can imagine that happens, but does it?  I'm never been able to see
that kind of effect, have you?  Maybe the sleeps work good enough.  If
this sort of thing happens and we can prove it... well maybe we can
influence the chipheads who design this stuff.

,Jared
