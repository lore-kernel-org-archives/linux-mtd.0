Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CjwtX-0002Rh-Dq
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2004 04:47:01 -0500
Message-Id: <6.0.1.1.0.20041230103615.01f4d508@192.168.2.1>
Date: Thu, 30 Dec 2004 10:46:51 +0100
To: Jared Hulbert <jaredeh@gmail.com>
From: llandre <r&d2@dave-tech.it>
In-Reply-To: <6934efce041229202370761a59@mail.gmail.com>
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
	<6934efce04122709464e95ec21@mail.gmail.com>
	<6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
	<6934efce041228094447dbfbd1@mail.gmail.com>
	<6.0.1.1.0.20041229093407.01f20e88@192.168.2.1>
	<6934efce041229202370761a59@mail.gmail.com>
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


>My biggest concern is this STS pin is not something supported on many
>strataflash chips.   Though this might be an elegant solution for a
>system with irq lines to spare using these particular chips I don't
>think it would be used often enough to be supportable.

I see. So far I worked with Intel StrataFlash only.

> > I don't know how NOR/Strata Flash drivers work and I thouhgt they implement
> > the well-known data polling algorithm to detect the end of operation.
> > However, if they actually "sleeps" as you pointed out, I
> > clearly am wrong. If I'm right instead, the data-polling algorithm wastes
> > bandwidth
> > because it performs a lot of read accesses just to read the value of a bit.
>
>in 2.6.10 drivers/mtd/chips/
>cfi_cmdset_0001.c:1065  sleeps for the word write if I understand
>cfi_udelay() correctly
>cfi_cmdset_0001.c:1308  sleeps for the buffered write if I understand
>cfi_udelay() correctly
>cfi_cmdset_0001.c:1470  sleeps for the erase

Ok, so I was wrong.

> > This can lead to problems for example when you have a bus-demanding
> > peripheral such
> > as a LCD controller. In this case the wasted bandwith can lead to 
> flickering.
> > In conclusion, to avoid data-polling algorithm, it is possible to 
> implement the
> > same ready/busy pin strategy used for NAND chips.
>
>I can imagine that happens, but does it?  I'm never been able to see
>that kind of effect, have you?

Yes, I have encountered this problem with a Frescale MC9328MXL processor.
The flickering occurs when JFFS2 performs erase/write operations on the
StrataFlash. This happens with Linux 2.6 only. When running
Linux 2.4 LCD exhibits no flickering.




llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
