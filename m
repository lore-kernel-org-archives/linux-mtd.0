Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ClP1K-0003jS-F9
	for linux-mtd@lists.infradead.org; Mon, 03 Jan 2005 05:01:07 -0500
Message-Id: <6.0.1.1.0.20050103101319.01f0d2d0@192.168.2.1>
Date: Mon, 03 Jan 2005 11:00:56 +0100
To: Jared Hulbert <jaredeh@gmail.com>
From: llandre <r&d2@dave-tech.it>
In-Reply-To: <6934efce04123014525f17be83@mail.gmail.com>
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
	<6934efce04122709464e95ec21@mail.gmail.com>
	<6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
	<6934efce041228094447dbfbd1@mail.gmail.com>
	<6.0.1.1.0.20041229093407.01f20e88@192.168.2.1>
	<6934efce041229202370761a59@mail.gmail.com>
	<6.0.1.1.0.20041230103615.01f4d508@192.168.2.1>
	<6934efce04123014525f17be83@mail.gmail.com>
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

Jared,

first of all happy new year!

>Even some new Intel StrataFlash does not have this pin.

I see.

> > Yes, I have encountered this problem with a Frescale MC9328MXL processor.
> > The flickering occurs when JFFS2 performs erase/write operations on the
> > StrataFlash. This happens with Linux 2.6 only. When running
> > Linux 2.4 LCD exhibits no flickering.
>
>Uh oh.  Same bootloader, hardware and everything?  I wonder what
>changed from 2.4 to 2.6 that would change that.

I encountered this problem several monts ago. I don't remember exactly
the configuration because JFFS2 has been temporarily used during software
development. After it has been abandoned, we "forgot" about the flickering.
I think I'll have the chance to have the hands on that project again in 2005.
In this case I'll compare the configuration with the one that works and
I'll post the differences.


Thanks for your cooperation and regards,

llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
