Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KoIq0-0004wY-2Q
	for linux-mtd@lists.infradead.org; Fri, 10 Oct 2008 14:19:28 +0000
Date: Fri, 10 Oct 2008 15:19:16 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081010141916.GB16934@shareable.org>
References: <48EF3291.5040000@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48EF3291.5040000@compulab.co.il>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Mike Frysinger <vapier.adi@gmail.com>, Russ Dill <russ.dill@gmail.com>,
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

Mike Rapoport wrote:
> +#ifdef CONFIG_ARM
> +/* gpio_nand_dosync()
> + *
> + * needed due to bus-reordering within the PXA itself (see section on
> + * I/O ordering in PXA manual (section 2.3, p35)
> + */

Is CONFIG_ARM the same as "is a PXA"?

> +		/*
> +		 * Linux memory barriers don't cater for what's required here.
> +		 * What's required is what's here - a read from a separate
> +		 * region with a dependency on that read.
> +		 */

It would be nice if this comment explained _why_ it's needed here, not
just what it's doing but why this MTD device in particular needs it -
for the benefit of someone using this driver on another architecture.

If the problem is that "readl" alone doesn't force a read cycle on
PXA, it sounds like "readl" on PXA contains a bug which may affect
other drivers on that architecture too, and that the right place to
fix it is in "readl".

> +static inline void gpio_nand_dosync(struct gpiomtd *gpiomtd) {}

Is this dummy implementation likely to be correct on non-ARM
architectures, or is this just faking it so the code will compile?

I can't tell from the comments.

Thanks,
-- Jamie
