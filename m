Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6nx9-0007HO-RZ
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 05:53:12 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1109846792.16158.20.camel@hades.cambridge.redhat.com>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 11:53:09 +0100
Message-Id: <1109847189.4370.27.camel@tglx.tec.linutronix.de>
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

On Thu, 2005-03-03 at 10:46 +0000, David Woodhouse wrote:
> On Thu, 2005-03-03 at 11:44 +0100, Thomas Gleixner wrote:
> > I had no intention to keep that branch alive. I just wanted to
> > preserve the current state. Sure we also can release a final MTD-2.4-
> > not-guaranteed-to-work-2005-03-01-10:00-tarball.
> 
> If you don't need it alive, you don't need a branch. You don't even need
> a tag -- 'cvs up -D2005-03-01'.

I have zero interest to keep it alive.

tglx
