Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKFWA-0004jS-MY
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 08:24:40 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: marcus@mikolaiczyk.de
In-Reply-To: <E1CKEvW-0000RJ-00@www.strato-webmail.de>
References: <E1CKEvW-0000RJ-00@www.strato-webmail.de>
Content-Type: text/plain
Message-Id: <1098274596.12223.1563.camel@thomas>
Mime-Version: 1.0
Date: Wed, 20 Oct 2004 14:16:36 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 16Bit Bus with 8 Bit NAND?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-20 at 13:46, marcus@mikolaiczyk.de wrote:
> > > bit NAND Flash and realy don't have a clue if it's a problem that the
> > > bus reads 16 Bit from an 8 Bit NAND.
> > > 1. Does the Kernel (theh NAND Driver) automatically detect this and
> > > 'ignores' the 'empty 8 bit?
> >
> > It might work, but it's not a big deal to fix it.
> 
> Means, that it works basicly but if not I can adapt the driver
> source to work correctly?

It needs additional options and a set of additional functions for
read/write which are aware of the buswidth.

> > > 3. Or should we use 2 8bit NAND so that we've got 16bit - and is this
> > > supported in the NAND Driver?
> >
> > The 2 parallel 8bit NAND is not supported yet. Is a bit of work though.
> >
> > But why don't you use 16bit NAND ?
> 
> Is it supported with the driver for the 2.4.x Kernle Release? 'Cause we
> will use the 2.4.19 Release (an existing toolchain for tc1130 is based on
> this release).
> I read something about the supported NANDs (Toschiba,..?) in the nand.c -
> if I remember correctly. Is this strongly restricted to these NANDS
> there?

The code there is not functional at all. See also
http://www.linux-mtd.infradead.org/#kernelversions

A toolchain is neither a reason nor an excuse :)

> The colleagues, responsible for the hardware didn't tell me somenthing
> about 16 bit NAND. Mayby its size is bigger or is more expensive - I'll
> clearifiy that with the colleagues.

There are chips with e.g 32MB with either 8 or 16bit interface
available. I doubt that there is a big price difference.

tglx
