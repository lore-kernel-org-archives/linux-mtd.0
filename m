Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CjLOp-0004u2-Hv
	for linux-mtd@lists.infradead.org; Tue, 28 Dec 2004 12:44:48 -0500
Received: by wproxy.gmail.com with SMTP id 37so413235wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Dec 2004 09:44:46 -0800 (PST)
Message-ID: <6934efce041228094447dbfbd1@mail.gmail.com>
Date: Tue, 28 Dec 2004 09:44:45 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: llandre <r&d2@dave-tech.it>
In-Reply-To: <6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
	<6934efce04122709464e95ec21@mail.gmail.com>
	<6.0.1.1.0.20041228094614.01ec9ff8@192.168.2.1>
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

> To avoid the bus accesses to detect the end of erase/write operations.
> This wastes a lot of bus bandwidth.

I believe the current StrataFlash drivers actually sleep() for an
appropriate amount of time in both the write and erase routines.  I'm
not sure that they are actually going to be wasting that much useful
bus time.  I'm curious to know if you have any data to suggest this
bus usage has any significant impact on system performance.
 
> >How?  Connect it to a irq line?
> 
> Is this supported by MTD? How to enable this feature in the low-level driver?
> I had a look at the existing drivers but it neems no one uses interrupt ...

No.  I was just curious what you were thinking of.  It could be done. 
If you really think its worth it.

,Jared
