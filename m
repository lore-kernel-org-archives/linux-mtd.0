Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6o7R-0007bu-OO
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 06:03:50 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1109847630.16158.22.camel@hades.cambridge.redhat.com>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>
	<1109847630.16158.22.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 12:03:42 +0100
Message-Id: <1109847822.4370.40.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [RFD] Move 2.4 code out from CVS head
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-03 at 11:00 +0000, David Woodhouse wrote:
> On Thu, 2005-03-03 at 11:53 +0100, Thomas Gleixner wrote:
> > > If you don't need it alive, you don't need a branch. You don't even need
> > > a tag -- 'cvs up -D2005-03-01'.
> > 
> > I have zero interest to keep it alive.
> 
> Then we have no need of a branch. Just remove the files.

Can we at least preserve the history in same way? AFAIK is CVS remove a
non reversible operation.

tglx
