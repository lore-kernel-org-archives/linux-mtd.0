Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ty8F0-00043Q-8E
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2013 21:52:19 +0000
Date: Wed, 23 Jan 2013 22:12:45 +0000
From: Alan Cox <alan@linux.intel.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] goldfish: NAND flash driver
Message-ID: <20130123221245.2a3021ce@bob.linux.org.uk>
In-Reply-To: <87r4lboco1.fsf@free.fr>
References: <20130121234502.19934.61017.stgit@bob.linux.org.uk>
 <87r4lboco1.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > +	writel(cmdp, base + NAND_COMMAND);
> What guarantee do you have on the order of writes here ? Isn't a
> write barrier required here ?

Its a virtual platform powered by an emulator - so no barriers needed
that I can see.

> > +	spin_lock_irqsave(&nand->lock, irq_flags);
> Why this spin_lock and not a mutex ? I didn't see any interrupts used
> in this driver, have I missed something ?

The driver doesn't require it not sure about all the callers.
> 
> > +	if (goldfish_nand_cmd_with_params(mtd, cmd, addr, len,
> > ptr, &rv)) {
> > +		writel(mtd - nand->mtd, base + NAND_DEV);
> > +		writel((u32)(addr >> 32), base + NAND_ADDR_HIGH);
> > +		writel((u32)addr, base + NAND_ADDR_LOW);
> > +		writel(len, base + NAND_TRANSFER_SIZE);
> > +		writel((u32)ptr, base + NAND_DATA);
> > +		writel(cmd, base + NAND_COMMAND);
> > +		rv = readl(base + NAND_RESULT);
> Same question here on the order of the read wrt to previous writes.

reads wont pass write anyway as its a sane platform.

> > +	if (ofs + len > mtd->size)
> > +		goto invalid_arg;
> I don't think that test is required, the MTD API gives already that
> guarantee AFAIR.

Ok

> > +	nand->cmd_params = devm_kzalloc(&pdev->dev,
> > +					sizeof(struct cmd_params),
> > GFP_KERNEL);
> > +	if (!nand->cmd_params)
> > +		return -1;
> > +
> > +	paddr = __pa(nand->cmd_params);
> That looks weird (the __pa()) usage. I thought drivers should not use
> __pa() directly.

Will look at using dma_alloc_coherent for it.

> > +	spin_lock_irqsave(&nand->lock, irq_flags);
> Again same spin_lock question.

I'm very wary of changing this but will take a look. It's actually not
that important because its not real flash so it has unusually excellent
performance via the emulator.

Alan
