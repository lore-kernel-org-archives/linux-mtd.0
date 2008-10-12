Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kow69-0004vV-DL
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 08:14:45 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1176483rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Oct 2008 01:14:43 -0700 (PDT)
Message-ID: <8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
Date: Sun, 12 Oct 2008 04:14:43 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Mike Rapoport" <mike@compulab.co.il>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
In-Reply-To: <48F1AF0C.8080401@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Russ Dill <russ.dill@gmail.com>, Jamie Lokier <jamie@shareable.org>,
	Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 12, 2008 at 04:02, Mike Rapoport wrote:
> Mike Frysinger wrote:
>>> The problem is that a write to GPIO may pass a write to the static
>>> memory regions, or vice versa.  So, what we do is we insert a read
>>> with a dependency in the execution to ensure that we stall the
>>> pipeline until that read - and therefore the preceding write has
>>> completed.
>>
>> so the function comment should read something like "make sure the gpio
>> state has actually changed before returning to the higher nand layers"
>
> The patch with (hopefully) clearer gpio_nand_dosync() comments.

looks like it, thanks for that

> +static int gpio_nand_remove(struct platform_device *dev)

should have __devexit markings

> +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> +               gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
> +       gpio_set_value(gpiomtd->plat.gpio_nce, 1);
> +
> +       gpio_free(gpiomtd->plat.gpio_cle);
> +       gpio_free(gpiomtd->plat.gpio_ale);
> +       gpio_free(gpiomtd->plat.gpio_nce);
> +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> +               gpio_free(gpiomtd->plat.gpio_nwp);

why do you bother setting the value before releasing ?  when you
release, the pin tends to go to the hardware default and on the
Blackfin, that tends to be "tristate".  are you just banking on the
idea that the pin will stay the way it was last set before it gets
freed ?

> +static int gpio_nand_probe(struct platform_device *dev)

should have __devinit markings

> +err_wp:
> +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> +               gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
> +       gpio_free(gpiomtd->plat.gpio_rdy);
> +err_rdy:
> +       gpio_free(gpiomtd->plat.gpio_cle);
> +err_cle:
> +       gpio_free(gpiomtd->plat.gpio_ale);
> +err_ale:
> +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> +               gpio_free(gpiomtd->plat.gpio_nwp);
> +err_nwp:
> +       gpio_free(gpiomtd->plat.gpio_nce);
> +err_nce:
> +       iounmap(gpiomtd->io_sync);
> +       if (res1)
> +               release_mem_region(res1->start, res1->end - res1->start + 1);
> +err_sync:
> +       iounmap(gpiomtd->nand_chip.IO_ADDR_R);
> +       release_mem_region(res0->start, res0->end - res0->start + 1);
> +err_map:
> +       kfree(gpiomtd);
> +       return -ENOMEM;

you really should be returning "ret" rather than "-ENOMEM" as many
(most?) of the ways you'd get here will not be due to out of memory
conditions.  some error paths above will probably require you to
manually set "ret" to something relevant ...
-mike
