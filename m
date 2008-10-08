Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnSP8-0002CQ-Tg
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 06:20:15 +0000
Received: by rv-out-0708.google.com with SMTP id b17so5535952rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Oct 2008 23:20:14 -0700 (PDT)
Message-ID: <8bd0f97a0810072320h5361c7d3q219aeaf9407a5293@mail.gmail.com>
Date: Wed, 8 Oct 2008 02:20:13 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Mike Rapoport" <mike@compulab.co.il>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
In-Reply-To: <48EC4CC5.5030809@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48EC4CC5.5030809@compulab.co.il>
Cc: Russ Dill <russ.dill@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	Ben Dooks <ben-linux-arm@fluff.org>, David Woodhouse <dwmw2@infradead.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 8, 2008 at 02:01, Mike Rapoport wrote:
> +/* gpio_nand_dosync()
> + *
> + * needed due to bus-reordering within the PXA itself (see section on
> + * I/O ordering in PXA manual (section 2.3, p35)
> + */
> +static void gpio_nand_dosync(struct gpiomtd *gpiomtd)
> +{
> +       unsigned long tmp;
> +
> +       if (gpiomtd->io_sync) {
> +               /*
> +                * this should generate the read, followed by
> +                * something that depends on the read
> +                */
> +               tmp = readl(gpiomtd->io_sync);
> +               asm volatile("mov %1, %0\n" : "=r" (tmp) : "r" (tmp));
> +       }
> +}

there isnt much point in attempting to write a generic solution if
you're just going to turn around and stick straight assembly in the
middle of it.  why not use a real arch-generic method like a memory
barrier.
-mike
