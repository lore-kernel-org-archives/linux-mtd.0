Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TzD0u-0001v0-VD
 for linux-mtd@lists.infradead.org; Sat, 26 Jan 2013 21:10:18 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] goldfish: NAND flash driver
References: <20130121234502.19934.61017.stgit@bob.linux.org.uk>
 <87r4lboco1.fsf@free.fr> <20130123221245.2a3021ce@bob.linux.org.uk>
Date: Sat, 26 Jan 2013 22:10:07 +0100
Message-ID: <871ud7odlc.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alan Cox <alan@linux.intel.com> writes:

>> > +	writel(cmdp, base + NAND_COMMAND);
>> What guarantee do you have on the order of writes here ? Isn't a
>> write barrier required here ?
>
> Its a virtual platform powered by an emulator - so no barriers needed
> that I can see.
OK.

...zip...

>> > +	if (goldfish_nand_cmd_with_params(mtd, cmd, addr, len,
>> > ptr, &rv)) {
>> > +		writel(mtd - nand->mtd, base + NAND_DEV);
>> > +		writel((u32)(addr >> 32), base + NAND_ADDR_HIGH);
>> > +		writel((u32)addr, base + NAND_ADDR_LOW);
>> > +		writel(len, base + NAND_TRANSFER_SIZE);
>> > +		writel((u32)ptr, base + NAND_DATA);
>> > +		writel(cmd, base + NAND_COMMAND);
>> > +		rv = readl(base + NAND_RESULT);
>> Same question here on the order of the read wrt to previous writes.
>
> reads wont pass write anyway as its a sane platform.
Euh how so ? Assuming I understood correctly the "an emulated platform" part,
and the reads+writes end up in RAM, then an out-of-order execution core can
reorder independent read/writes. For example if base+NAND_RESULT is already in
cache, the core can perform the readl before the last writel, can't it ?

>> That looks weird (the __pa()) usage. I thought drivers should not use
>> __pa() directly.
>
> Will look at using dma_alloc_coherent for it.
Cool.

>> > +	spin_lock_irqsave(&nand->lock, irq_flags);
>> Again same spin_lock question.
>
> I'm very wary of changing this but will take a look. It's actually not
> that important because its not real flash so it has unusually excellent
> performance via the emulator.
Sure.

BTW, I rechecked the patch a bit more, especially goldfish_nand_write_oob(). I
recall that a write_oob() function should first check the mtd_oob_ops.mode and
act depending on its value : MTD_OPS_PLACE_OOB, MTD_OPS_RAW, and
MTD_OPS_AUTO_OOB.
The action is different on each value (or -EINVAL returned if not handled).

Cheers.

--
Robert

PS: I have the responsiveness of a diseased turttle, and I don't expect things
will improve in the next days as I changed my home, so please be patient (or
convince my boss :))
