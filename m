Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NfM2-00066w-Fw
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 21:59:30 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 5 Jun 2003 09:02:41 +1200
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
	<20030604095450.A129B4375@blood.actrix.co.nz>
	<1054720928.17921.208.camel@passion.cambridge.redhat.com>
In-Reply-To: <1054720928.17921.208.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <20030604210006.160E9155D6@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Execute in place.
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 04 June 2003 22:02, you wrote:
> On Wed, 2003-06-04 at 10:57, Charles Manning wrote:
> > Is there any discussion leading up to XIP? ie. Why? ... and why not!

The main reason I raised this is that I would not like to think that people 
are going to say "Ooooh lookie - nice new XIP stuff" and design for it 
without understanding the pros and cons. Generally I think though that having 
XIP is a GoodThing as it does provide more design options and flexibility to 
redeploy old hw designs.

>
> Why? Because your hardware designer didn't realise that RAM is cheaper
> than flash, and gave you more flash than you need and not enough RAM.
> Hence you want to run stuff uncompressed and use up all that nice
> expensive flash space, while retaining your precious RAM.
>
> Or, more charitably, perhaps you _really_ care about power consumption
> and observe that flash takes less power than RAM.

Hmmmm. I don't think it is as straight forward as that at a systems level, 
but anyway...

[snip]

> > The fundamental implementation seems quite simple and elegant.IMHO.
>
> Good. My main concern was that there would be some platform where we
> can't actually poll for interrupts like this, and we have to redirect
> the IRQ vectors to somewhere in RAM, etc. I suppose that can still be
> hidden behind xip_cli(), xip_sti() and xip_irqpending() though.

Of the micros I have morked with, the most opaque interrupt controller (and 
hence hardest to deal with) is the 8259 as used with x86 (well excluding the 
8048 and 8051 which are not worthy of consideration here). The 8259 is 
sufficently transparent to provide this polling. The trend with more modern 
devices has been to make the peripherals (inc interrupt controller) more 
transparent thus making this less of a problem.

There I've made a definitive statement - watch me make an idiot of myself!

-- CHarles
