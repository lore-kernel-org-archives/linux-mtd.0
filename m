Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3yXQ-0006dE-Pt
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 14:30:24 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUS00EPD099VM@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 15:29:33 +0100 (MET)
Date: Thu, 18 Mar 2004 15:26:35 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1079619390.16952.142.camel@hades.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <200403181526.35200.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
 <200403181411.25596.tglx@linutronix.de>
 <1079619390.16952.142.camel@hades.cambridge.redhat.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Large block NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 March 2004 15:16, David Woodhouse wrote:
> On Thu, 2004-03-18 at 14:11 +0100, Thomas Gleixner wrote:
> > Be aware, that the available NAND aware filesystems must be changed too,
> > as they are not aware of pagesizes > 512 byte, but if IIRC  the datasheet
> > details it is possible to write 4  512 byte sub-pages to the device
> > without violating the specs. Anyway changes will be neccecary.
>
> JFFS2 shouldn't actually have any problem with arbitrary page sizes as
> long as they're a power of two.

Except for the oob handling, but thats only one function to adjust

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
