Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp1ic-0001HO-AV
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 04:56:43 -0500
Message-ID: <41E646B4.2000101@redhat.com>
Date: Thu, 13 Jan 2005 04:00:20 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41E59642.2040508@redhat.com>
	<1105606708.3116.20.camel@lap02.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: AG-AND requested changes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thomas Gleixner wrote:

> 1) . . .  Please do not
> make it dependent on NAND_IS_AND, invent a new option like
> BBT_AUTO_REFRESH or what ever nice symbol you imagine.

Will do.

> 2) . . .
> Looks sane. You call this from the board driver I guess ?

Yes, I call it from the driver's init routine, after performing nand_scan.

I'll update the code and post a revised patch.


Thank you,

d.marlin
