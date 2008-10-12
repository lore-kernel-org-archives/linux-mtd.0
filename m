Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kp6sm-00025c-AI
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 19:45:41 +0000
Date: Sun, 12 Oct 2008 20:40:07 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081012194007.GB28525@flint.arm.linux.org.uk>
References: <20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
	<8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
	<20081012101326.GB29975@flint.arm.linux.org.uk>
	<8bd0f97a0810121204t115a7b95o33fb06a2fd13273d@mail.gmail.com>
	<20081012190939.GA28525@flint.arm.linux.org.uk>
	<8bd0f97a0810121222o655bfa3s1acaaaab5efe31cc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd0f97a0810121222o655bfa3s1acaaaab5efe31cc@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Russ Dill <russ.dill@gmail.com>, Jamie Lokier <jamie@shareable.org>,
	Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Mike Rapoport <mike@compulab.co.il>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 12, 2008 at 03:22:45PM -0400, Mike Frysinger wrote:
> On Sun, Oct 12, 2008 at 15:09, Russell King - ARM Linux wrote:
> > On Sun, Oct 12, 2008 at 03:04:06PM -0400, Mike Frysinger wrote:
> >> On Sun, Oct 12, 2008 at 06:13, Russell King - ARM Linux wrote:
> >> > It doesn't.  The fact that the GPIO state is preserved when free'd on
> >> > PXA is just that it takes _more_ code to do anything else.
> >>
> >> so which is it ?  GPIO state *should* be preserved, or PXA does it
> >> simply due to code frugality ?
> >
> > May I remind you that _you_ are the one with the system which doesn't
> > preserve GPIO state.
> >
> >> if the API behavior is strictly documented, your complaint here is
> >> pretty moot.
> >
> > My complaint?  I don't have a complaint.  You are the one with the
> > complaint with the driver that's being discussed.  You're the one
> > who's moaning about it setting state before calling gpio_free.
> >
> > I see no point in continuing this discussion; your arguments are
> > just plain silly.  I've explained _why_ we're doing it.
> >
> > Our GPIO hardware behaves differently from yours.  Our gpio_free()
> > is side-effect free.  Get over it.
> 
> i'm attempting to get things fixed for everyone.  stop being so
> abrasive over nothing.

Me being abrasive?  ROTFL.  You're the one being difficult and constantly
twisting what I'm saying.

> my question is simply:
> > if certain behavior is expected, then it should be codified.  i see no
> > mention (unless i just missed it) of expected behavior upon freeing in
> > Documentation/gpio.txt.
> 
> and i havent gotten a straight answer out of you about this.  should
> state be retained when a pin gets freed or not ?

How the hell do I know?  Ask the GPIO library authors what *their*
intention of their interface is!

Look, so you can be clear for my point:

1. GPIO hardware state may be unaffected by gpio_free() - since it's
   undefined whether gpio_free() has any side effects.
2. Real implementations today exist where gpio_free() does not affect
   hardware state.
3. NAND may be connected to GPIOs for the control signals.
4. For hardware where gpio_free() does not affect hardware state, it
   makes total sense to ensure that GPIOs are set to inactive states
   prior to free.

That is the basis of my point.  Not "don't need pull ups".  And not
anything else that you're busy trying to twist my damned words into.

I don't care whether pull ups exist - because that's completely
irrelevent in the case where hardware state is unaffected by gpio_free.
You're the one bringing the issue of pull ups into this discussion,
not me.  You're the one clouding the issue.

Let me repeat.

1. gpio_free() is undefined wrt hardware side effects.
2. Some implementations may preserve the existing state, others may not.
3. To cater for all, setting the hardware state to inactive is _clearly_
   the right thing to do.

So, stop twisting my bloody words into your own stupid arguments.

I'm done with this thread.
