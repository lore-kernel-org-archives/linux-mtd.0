Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1ComCU-0004DO-T4
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 12:22:31 -0500
Received: by wproxy.gmail.com with SMTP id 36so605791wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 09:22:30 -0800 (PST)
Message-ID: <6934efce050112092246ae9277@mail.gmail.com>
Date: Wed, 12 Jan 2005 09:22:29 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112170256.GF25638@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<20050112170256.GF25638@wohnheim.fh-wedel.de>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Correct.  That requirement comes mostly from having to program the
> memory controller before being able to use DRAM.  After the early
> boot, it's just nice to have.

Requirement in the marketplace I mean.  Most NOR chips are expected to
have 0 errors by those who buy them.

> Would this actually be an advantage?  Last time I looked, it was
> cheaper to use more DRAM.  Most DSL routers I see advertised have a
> 1:4 or 1:8 ratio of NOR:DRAM, so it looks as if the prices haven't
> changed much.

So you save more RAM that you use up flash when doing XIP.  We've seen
1.5MiB of RAM saved at a cost of 1MiB of NOR.  This reduces the total
memory footprint of the system.  It can also make the difference
between 16MiB and a 32MiB DRAM.  The end result is that the XIP can
lower the BOM cost for a device.  It also can reduce the power
consumption such that your phone or PDA has a much longer standby
time.  The performance advantage of XIP to boot up and application
launch can be quite noticable.  Think of the flow of data to start
executing an application from JFFS2.  We copy the data 3 times in RAM?
decompress it, CRC it.  Compare that to mmap() in XIP cramfs.  It just
points to the flash address.
