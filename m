Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WjmY-0007bu-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 19:55:34 +0000
Received: from p50861873.dip.t-dialin.net ([80.134.24.115] helo=callisto.local)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 16WlxT-0005Dw-00
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2002 23:14:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by callisto.local (Postfix on SuSE Linux 7.2 (i386)) with ESMTP id 76C811ECBB
	for <linux-mtd@lists.infradead.org>; Fri,  1 Feb 2002 19:34:25 +0100 (CET)
Date: Fri, 1 Feb 2002 19:34:25 +0100 (CET)
From: Robert Schwebel <robert@schwebel.de>
Reply-To: <robert@schwebel.de>
To: <linux-mtd@lists.infradead.org>
Subject: Clock drift
Message-ID: <Pine.LNX.4.33.0202011931390.2047-100000@callisto.local>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

in comp.os.linux.embedded there's currently a discussion about drifting
clocks on JumpTec's DIMM PCs, which might be flash related. Perhaps
anybody here can comment this:

Snip:

----------8<----------8<----------8<----------
Subject: Re: system time on dimm-pc
Date: Thu, 31 Jan 2002 17:19:06 -0700
From: Michael Dwyer <mdwyer@sixthdimension.com>
Organization: Sixth Dimension, Inc
Newsgroups: comp.os.linux.embedded
References: 1

Richard Schweikl wrote:
> I am using a JumpTec Dimm-PC-386 for embedded control since 2 years.
> Now, when the program should use the DOS system time we noticed that
> this timer is running with very bad accuracy. As this is identical on
> all our DimmPC-386 it seems to be a problem of this design.

I'm afraid that I'm not familiar with the JumpTec systems, but I can
tell you that we had severe clock-drift problems on our x86 boards
because of the flash Disk-On-Chip drivers.  I hypothesised that the
driver would disable interrupts while writing to the flash.  The flash
write took quite a while,  and since the regular timer interrupt was
blocked, the software clock wouldn't get updated correctly.

The clock skew was so severe that the NTPd would soon give up -- and was
totally unable to keep the clock in sync.

The new drivers seem to have fixed the problem, but you apparently may
also see this from heavy serial or network activity.  You might check
that you don't have something taking over interrupts.  As a workaround,
you might consider reading from the CMOS clock, instead.  It only has a
1s resolution, but it is more stable in an interrupt-laden system than
the software clock.

There are a couple other patches on this, like running NTPd (huge!) or
regular updates to the soft clock from the CMOS clock (dangerous -- time
could go backwards...)  but your best bet is to find what is making the
clock skew...

Clock crystals are also sensitive to temperature...  If these machines
are in harsh environments, this might be a factor.
----------8<----------8<----------8<----------

Robert
--
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
