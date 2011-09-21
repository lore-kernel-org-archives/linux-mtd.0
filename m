Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6Gat-0003KP-1S
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 06:47:43 +0000
Received: by yic24 with SMTP id 24so1076795yic.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 23:47:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8s-DbYNWuDht0KhU3wbW-4owNHxgvv-m_mftRReUzhRg@mail.gmail.com>
References: <CAFDOyVAzYULUuJMCTAcaFjkxxnzJRudGc9219zNLH7urpCiJAw@mail.gmail.com>
	<CAN8TOE8s-DbYNWuDht0KhU3wbW-4owNHxgvv-m_mftRReUzhRg@mail.gmail.com>
Date: Wed, 21 Sep 2011 08:47:41 +0200
Message-ID: <CAFDOyVB2pu+bTzsr7ugjPdyRQiAYkm32LFChh0NVYfVGkQnz7g@mail.gmail.com>
Subject: Re: measuring the flash usage
From: Folkert van Heusden <folkert.van.heusden@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> For an embedded system I'm working on I'd like to monitor the health
>> of the flash memory.
>> On regular Linux systems one can look at /proc/diskstats to see how
>> often the system writes to a disk. It seems though that (at least
>> kernel 2.6.19) for flash these counters are not updated.
>
> I don't have much experience with the /proc/diskstats but for me, it
> at least lists the mtdblockX devices I have on my system (which I
> don't use). If you use those (for instance, for JFFS2?), then I would
> imagine that Linux will track stats as with other block devices. Is
> this not your experience?

They're there, they just won't get updated.

> Generally, MTD is pretty good at printing important messages, which
> should get logged by your system. Also, bitflips/ECC errors can be
> tracked with ioctl(ECCGETSTATS). This info is retrieved, for example,
> by nanddump.

Are these values retained accross power off/reboots?
And will this work for NOR flash?


Thanks.

Folkert.
