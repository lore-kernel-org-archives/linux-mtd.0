Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6tW7-0002jZ-90
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 11:49:39 -0500
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR011.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0ICS00A6IC0SVO@VL-MO-MR011.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 11:48:28 -0500 (EST)
Date: Thu, 03 Mar 2005 11:48:25 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <4226F51A.7070603@imc-berlin.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-id: <Pine.LNX.4.62.0503031146070.15953@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>
	<1109847630.16158.22.camel@hades.cambridge.redhat.com>
	<4226F51A.7070603@imc-berlin.de>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [RFD] Move 2.4 code out from CVS head
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 3 Mar 2005, Steven Scholz wrote:

> David Woodhouse wrote:
> > On Thu, 2005-03-03 at 11:53 +0100, Thomas Gleixner wrote:
> > 
> > > > If you don't need it alive, you don't need a branch. You don't even need
> > > > a tag -- 'cvs up -D2005-03-01'.
> > > 
> > > I have zero interest to keep it alive.
> > 
> > 
> > Then we have no need of a branch. Just remove the files.
> 
> Does that mean that there will be _no_ " maintainence only mode" for 2.4?

Depends if _you_ or someone else decides to volunteer for the task.
do you?  I don't.

> It's ok ig there are no new features for 2.4. But bugs should still be
> fixed...

It just won't happen magically.


Nicolas
