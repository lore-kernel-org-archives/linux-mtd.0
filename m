Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Koy2q-0006e2-VT
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 10:19:30 +0000
Date: Sun, 12 Oct 2008 11:13:26 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081012101326.GB29975@flint.arm.linux.org.uk>
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
	<8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
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

On Sun, Oct 12, 2008 at 04:56:37AM -0400, Mike Frysinger wrote:
> On Sun, Oct 12, 2008 at 04:28, Russell King - ARM Linux wrote:
> > Maybe you should reconsider that behaviour - this is a prime example
> > why such behaviour is wrong.  If you leave the NAND signals floating,
> > you're going to eat power - most CMOS based devices want inputs to be
> > either logic high or low, and not floating otherwise they eat power.
> >
> > Moreover, you don't want to leave memory control lines floating - you
> > don't want them to pick up noise which may be transmitted inside the
> > NAND chip and may cause malfunction.
> >
> > Lastly, you don't want spurious writes to the NAND memory region (think
> > DMA controller scribbling over memory because of some buggy driver) to
> > write into the NAND, or maybe cause the NAND to erase itself.
> >
> > There's another reason for doing this.  Think GPIO line connected to
> > a loudspeaker amplifier shutdown input.  Do you really want that line
> > floating when the sound driver isn't loaded?
> 
> this is what pull downs/pull ups are for.

So says you.  Not everyone will agree with that statement, especially
on designs which don't behave as you've described in your previous
mail.

> your arguments can just as readily be applied to the powering up state
> and initialization stages.  software cant (and shouldnt) rectify crappy
> hardware designs.

No they don't.  Consider the loudspeaker amplifier example.  Does it
matter if the amplifier is powered up for a few milliseconds on boot?
No.  Does it matter if the amplifier stays powered up afterwards?  Yes,
it'll kill your battery life.

Does it matter if the NAND control lines are at an indeterminent state
at boot?  Probably not, you'd hope that the boot software is small and
don't randomly scribble into your flash storage.  The boot software may
even setup the NAND control lines so it can read the kernel from flash.
Does it matter while the kernel is running, which will have setup the
entire system so there's more probability of things going wrong?

Yes, it could make your platform unbootable if the NAND gets corrupted.

> > On ARM, certainly PXA, the last GPIO state is preserved when free'd.
> 
> if certain behavior is expected, then it should be codified.  i see no
> mention (unless i just missed it) of expected behavior upon freeing in
> Documentation/gpio.txt.

It doesn't.  The fact that the GPIO state is preserved when free'd on
PXA is just that it takes _more_ code to do anything else.

Moreover, all ARM processors I've seen have the ability to set GPIO
state on low power modes, which makes the addition of lots of pull up
and pull down resistors not only a needlessly expense for production
runs, but also wastes power when the signal is held at the opposite
level to which it's being pulled to.

So, while you see "lack of pull ups" as crappy design, others will see
it as a power and cost saving measure.

I'll say that I've never liked this GPIO layer, because it breads ideas
like you're putting forward, which have traditionally not been needed
to be thought about when writing direct to the registers - where you
have system wide control of the GPIO state without any of this "on
gpio_free() such and such might happen" ideas.

Another example - think about a GPIO which is shared between two drivers.
Yes, there are platforms which do this.  No single driver owns the GPIO
signal.  What happens if it's gpio_free'd while the other driver is still
using it?  Yes, the GPIO layer sucks for that, but like it or not, it's
reality and the GPIO API doesn't cater for it.

And don't say, that's crappy hardware then.  Stop being a purist and
become a realist.  It's reality and there is no option but to make it
work.
