Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbMJM-00045A-6K
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 08:41:53 +0000
Subject: Re: marvell_nand driver fails to suspend
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <68ab4512-58f2-1ade-6754-616de8d8c8d5@zonque.org>
 <9de339a6-01f9-d3a9-0271-f33933ede35b@zonque.org>
 <20180702092014.0006fee0@xps13>
 <01ca9c4b-dc20-47fa-ae3c-983b3f47b28d@zonque.org>
 <20180703090557.0ec5cd20@xps13>
 <98a6c329-d0a4-72c7-bb06-34b80738c475@zonque.org>
 <20180706102740.4e7558a2@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <f3373d43-6018-f974-2249-a70bd0e720c3@zonque.org>
Date: Fri, 6 Jul 2018 10:41:35 +0200
MIME-Version: 1.0
In-Reply-To: <20180706102740.4e7558a2@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Friday, July 06, 2018 10:27 AM, Miquel Raynal wrote:
> Daniel Mack <daniel@zonque.org> wrote on Thu, 5 Jul 2018 10:22:29
>> I can't easily, because I don't have the individual timing
>> parameters at hand. I could of course re-engineer them from the
>> NDTR0/NDTR1 values the bootloader sets, but that would only lead to
>> these registers being restored to the same value as they currently
>> have. And as they're read during probe() anyway and re-used in
>> marvell_nfc_select_chip(), I don't think that's the problem.
> 
> I do agree with the second part of your statement. However I don't 
> understand why you talk about re-engineering the timings.

The timings were calculated when I wrote the bootloader some years back, 
and all I'm saying is that at least for now, the kernel doesn't need to 
do that again. It should instead just take whatever has been provided by 
the bootloader.

> This 
> "keep-config" DT property was just an ugly hack to avoid
> implementing ->setup_data_interface() and rely on the Bootloader's
> setup. While this work at the slowest speed, it is clearly not as
> efficient as tuning the timings at probe time depending on the NAND
> chip. I recently changed the DT NAND nodes to 1/ separate the
> controller and the NAND chip and 2/ remove superfluous properties
> like this one.

Do you have patches ready for that?

> If you are against NAND throughput, I suggest you to
> test without it :)

I have no problem adding the timing properties to DT, but I don't expect 
that to improve the throughput. The bootloader is specifically written 
for this board, and it has optimized timing values already.

>> /* * Do not change the timing registers when using the DT property 
>> * marvell,nand-keep-config; in that case ->ndtr0 and ->ndtr1 from
>> the * marvell_nand structure are supposedly empty. */ 
>> writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0); 
>> writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
> 
> This comment should not be there anymore. The logic described in the 
> first sentence is true and already handled in
> marvell_nand_chip_init(). But at any moment ->ndtr[0|1] are clearly
> not supposed to be empty (anymore).

But it's okay to write them here, that's what you're saying? For the 
resume case, this is actually exactly what's needed, as the NDTR 
registers contents are lost in low-power mode.

[...]

>> The controller loses all its state after resume, but I don't see
>> which register is not re-initialized after that, but I might miss
>> something.
> 
> I suppose you are good with the above hooks.
> 
> Maybe you can add traces in the IRQ handler and also dump NDSR on 
> timeout. Let's check: - If the IRQ is fired or not - If the right bit
> is set or not

Yes, I did that, and the ISR is never entered after resume.

> If it worked with the pxa3xx_nand.c driver, then it's probably a
> driver issue... Can you test with the pxa3xx_nand.c driver with the
> same kernel version?

That's be my next attempt, yes. Thanks for pointing me to the right 
commits :)

> I have some platforms with such controller but I never used 
> suspend/resume on them, I'll have to check.

It would be interesting to see if this works on other platforms, yes.


Thanks,
Daniel
