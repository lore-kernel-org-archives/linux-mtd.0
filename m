Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CjD9l-0003hW-3Q
	for linux-mtd@lists.infradead.org; Tue, 28 Dec 2004 03:56:42 -0500
Message-Id: <6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
Date: Tue, 28 Dec 2004 09:56:32 +0100
To: Jared Hulbert <jaredeh@gmail.com>
From: llandre <r&d2@dave-tech.it>
In-Reply-To: <6934efce04122709464e95ec21@mail.gmail.com>
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
	<6934efce04122709464e95ec21@mail.gmail.com>
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


> > I have a question about STS pin of Strata Flash.
> > I'd like to implement a function in the low-level map driver
> > in order to exploit the STS pin to read the ready/busy
> > status (NAND-like).
> > How should I hack the code? It seems there is
> > no <board>_device_ready or something like that ...
>
>Why?

To avoid the bus accesses to detect the end of erase/write operations.
This wastes a lot of bus bandwidth.


>How?  Connect it to a irq line?

Is this supported by MTD? How to enable this feature in the low-level driver?
I had a look at the existing drivers but it neems no one uses interrupt ...


Regards,

llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
