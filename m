Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kowkh-00073K-Bv
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 08:56:39 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1182953rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Oct 2008 01:56:37 -0700 (PDT)
Message-ID: <8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
Date: Sun, 12 Oct 2008 04:56:37 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Russell King - ARM Linux" <linux@arm.linux.org.uk>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
In-Reply-To: <20081012082803.GA29975@flint.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
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

On Sun, Oct 12, 2008 at 04:28, Russell King - ARM Linux wrote:
> On Sun, Oct 12, 2008 at 04:14:43AM -0400, Mike Frysinger wrote:
>> On Sun, Oct 12, 2008 at 04:02, Mike Rapoport wrote:
>> > +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
>> > +               gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
>> > +       gpio_set_value(gpiomtd->plat.gpio_nce, 1);
>> > +
>> > +       gpio_free(gpiomtd->plat.gpio_cle);
>> > +       gpio_free(gpiomtd->plat.gpio_ale);
>> > +       gpio_free(gpiomtd->plat.gpio_nce);
>> > +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
>> > +               gpio_free(gpiomtd->plat.gpio_nwp);
>>
>> why do you bother setting the value before releasing ?  when you
>> release, the pin tends to go to the hardware default and on the
>> Blackfin, that tends to be "tristate".  are you just banking on the
>> idea that the pin will stay the way it was last set before it gets
>> freed ?
>
> Maybe you should reconsider that behaviour - this is a prime example
> why such behaviour is wrong.  If you leave the NAND signals floating,
> you're going to eat power - most CMOS based devices want inputs to be
> either logic high or low, and not floating otherwise they eat power.
>
> Moreover, you don't want to leave memory control lines floating - you
> don't want them to pick up noise which may be transmitted inside the
> NAND chip and may cause malfunction.
>
> Lastly, you don't want spurious writes to the NAND memory region (think
> DMA controller scribbling over memory because of some buggy driver) to
> write into the NAND, or maybe cause the NAND to erase itself.
>
> There's another reason for doing this.  Think GPIO line connected to
> a loudspeaker amplifier shutdown input.  Do you really want that line
> floating when the sound driver isn't loaded?

this is what pull downs/pull ups are for.  your arguments can just as
readily be applied to the powering up state and initialization stages.
 software cant (and shouldnt) rectify crappy hardware designs.

> On ARM, certainly PXA, the last GPIO state is preserved when free'd.

if certain behavior is expected, then it should be codified.  i see no
mention (unless i just missed it) of expected behavior upon freeing in
Documentation/gpio.txt.
-mike
