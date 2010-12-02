Received: from postdiluvian.org ([128.30.54.21] helo=porklips.postdiluvian.org)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PO0VP-0004vh-8i
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 04:10:51 +0000
Date: Wed, 1 Dec 2010 23:10:48 -0500
From: Mark Mason <mason@postdiluvian.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101202041048.GA5998@postdiluvian.org>
References: <20101129195014.19224240@wker>
	<20101129203306.GA22692@postdiluvian.org>
	<1291261659.14534.13.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291261659.14534.13.camel@koala>
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Mon, 2010-11-29 at 15:33 -0500, Mark Mason wrote:
> > I have seen something similar in the last few months with Samsung
> > K9WAG08U1B-PIB0 chips on a PowerPC 8260.  Sadly I can't be much help
> > since I no longer have access to the hardware and don't have detailed
> > notes anymore, but I did experience UBI/UBIFS corruption that
> > prevented mounting after power cycle tests.  The frequency was
> > approximately what you quote, and there was a high volume of writes to
> > NAND.
> > 
> > Reformatting the NAND was not a big problem for us, so we went with a
> > workaround and never had a chance to track down the actual problem
> > before the product shipped.
> > 
> > Wish I could be more help.
> 
> Well, you could have reported it, I usually try to provide at least
> some help...

Yes, I could have, and I should have, and I intended to, etc.
Unfortunately "market conditions prevailed", the product shipped, and
I wasn't needed anymore.

Plus, I meant to say 8315, not 8260.  Maybe the two bus controllers
are too similar, or maybe I've just inhaled too much flux.

>From the same project, I do have some improvements to the MPC8315 NAND
driver that allows higher bus throughput during erase cycles.  There's
a chance that this is applicable to other NAND controllers, but my
experience is limited.  I'd be more than happy to share my work with
someone who has an interest in the 83xx, and I promise that I will do
a better job at the details than I did with the CPUs in question.
