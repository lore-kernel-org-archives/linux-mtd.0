Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CIQ8v-00082i-1Q
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2004 07:21:07 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Mikael Starvik <mikael.starvik@axis.com>
In-Reply-To: <BFECAF9E178F144FAEF2BF4CE739C66818F58E@exmail1.se.axis.com>
References: <BFECAF9E178F144FAEF2BF4CE739C66818F58E@exmail1.se.axis.com>
Content-Type: text/plain
Message-Id: <1097838790.17034.63.camel@thomas>
Mime-Version: 1.0
Date: Fri, 15 Oct 2004 13:13:10 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND programming bug in Linux 2.6.8?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-15 at 12:53, Mikael Starvik wrote:

> The problem is that for a 16-bit device the READ1 command will be issued
> even though the column address fits in 8 bits. Suggested patch below.

There is no problem at all.

1. As we do only full page reads, this will never happen. The READ1 code
could go away complete.

2. If you want to read the second half of the page, then it's completely
correct to issue the READ1 command, because the column address is
shifted right by 1 later. The READ1 command selects the second half of
the page whether the chip is in 8 or in 16 bit mode.

read from offset 256
command = READ1, column address = 0
it will read from offset 256

read from offset 260
command = READ1, column address = 2
it will read from offset 256 + 2*2 = 260

tglx
