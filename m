Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CIQxH-0008Rl-Ex
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2004 08:13:08 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Mikael Starvik <mikael.starvik@axis.com>
In-Reply-To: <BFECAF9E178F144FAEF2BF4CE739C66818F58F@exmail1.se.axis.com>
References: <BFECAF9E178F144FAEF2BF4CE739C66818F58F@exmail1.se.axis.com>
Content-Type: text/plain
Message-Id: <1097841913.17034.68.camel@thomas>
Mime-Version: 1.0
Date: Fri, 15 Oct 2004 14:05:14 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: NAND programming bug in Linux 2.6.8?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-15 at 13:50, Mikael Starvik wrote:
> >1. As we do only full page reads, this will never happen. The READ1 code
> >could go away complete.
> 
> Hmm. I could swear that I have seen it at least once since my NAND model
> complained about it but now I can't repeat it.

Can you add a BUG() in there ? If it ever happens again we can figure
out where it's called from.

> >2. If you want to read the second half of the page, then it's completely
> >correct to issue the READ1 command, because the column address is
> >shifted right by 1 later. The READ1 command selects the second half of
> >the page whether the chip is in 8 or in 16 bit mode.
> 
> Ok, good! My Samsung datasheet (K9F2816U0C) is very vague on this point. In
> the programming examples for the 16 bit device only READ0 and READ_OOB is
> mentioned (while for the 8-bits device READ1 is also mentioned).

Yeah, its not neccecary for 16 bit, as the column address always fits
into 8bit.

tglx
