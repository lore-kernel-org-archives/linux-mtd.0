Received: from smtp128.sbc.mail.sp1.yahoo.com ([69.147.65.187])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KriAe-0002Ft-6D
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 23:58:52 +0000
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org,
 mike@compulab.co.il
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Date: Sun, 19 Oct 2008 16:51:29 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200810191651.29520.david-b@pacbell.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +#ifdef CONFIG_ARM
> +/* gpio_nand_dosync()
> + *
> + * needed due to bus-reordering within the PXA itself (see section on
> + * I/O ordering in PXA manual (section 2.3, p35)
> + */
> +static void gpio_nand_dosync(struct gpiomtd *gpiomtd)

I'm trying to understand why a PXA-specific issue is getting
applied to all ARMs.  #ifdef CONFIG_ARCH_PXA would be better
for *any* PXA-specific behavior like this.


Reading the list archives, I also see some confusion about
GPIO state after gpio_free() is called.  As soon as a GPIO
is no longer managed (as a GPIO) by a driver, it's fair for
the rest of the system to reconfigure it ... but platform
specific issues like "Will *this* system reconfigure it?
If so, how? and When?" are out-of-scope.  (Just like all
aspects of configuring pins for GPIO v. non-GPIO usage...)

The principle-of-least-surprise applies here, as it should
apply everywhere, though ... so until something takes over
the pin(s) used for that GPIO and reconfigures it (them) for
another purpose, it's reasonable to expect no state changes.
And it's likewise reasonable to expect that any kernel code
taking it over isn't fundamentally brain-dead ...

One general rule being that if you care what the hardware
is doing, you should have its driver managing that:  don't
unload the darn driver, if unloading it may break things!


That's not quite the same as the confusion about state at
low power levels.  In that case, drivers are within their
rights to claim that if platform code changes GPIO state
except according to driver requests, the platform is buggy.

(That includes the special configuration requests that can
be made on some platforms, covering low power modes.  I've
seen that on a couple systems, but it's currently rare and
thus very appropriate to treat as platform-specific.)

- Dave

p.s. In current kernel GIT there are two new hooks in
     the gpiolib framework, called on gpio_request()
     and gpio_free().  The intent is to support power
     management ... e.g. save 50uA by keeping unused
     GPIO banks unclocked or even powered off when not
     in use.  Such hooks are unfortunately open to some
     abuse ... I suspect platform-specific stupidities
     will start to appear.  Not much I can do about it.
