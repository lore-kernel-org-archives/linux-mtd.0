Received: from oceanus.site5.com ([67.43.13.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KnUP5-0003Ll-CU
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 08:28:20 +0000
Message-ID: <48EC6F1B.7040404@compulab.co.il>
Date: Wed, 08 Oct 2008 10:28:11 +0200
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
References: <48EC4CC5.5030809@compulab.co.il>	<8bd0f97a0810072320h5361c7d3q219aeaf9407a5293@mail.gmail.com>	<20081008072843.GA19401@flint.arm.linux.org.uk>
	<8bd0f97a0810080029o6f8250cfi734d19191eb92c1d@mail.gmail.com>
In-Reply-To: <8bd0f97a0810080029o6f8250cfi734d19191eb92c1d@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Russ Dill <russ.dill@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, Ben Dooks <ben-linux-arm@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Mike Frysinger wrote:
> On Wed, Oct 8, 2008 at 03:28, Russell King - ARM Linux wrote:
>> On Wed, Oct 08, 2008 at 02:20:13AM -0400, Mike Frysinger wrote:
>>> On Wed, Oct 8, 2008 at 02:01, Mike Rapoport wrote:
>>>> +/* gpio_nand_dosync()
>>>> + *
>>>> + * needed due to bus-reordering within the PXA itself (see section on
>>>> + * I/O ordering in PXA manual (section 2.3, p35)
>>>> + */
>>>> +static void gpio_nand_dosync(struct gpiomtd *gpiomtd)
>>>> +{
>>>> +       unsigned long tmp;
>>>> +
>>>> +       if (gpiomtd->io_sync) {
>>>> +               /*
>>>> +                * this should generate the read, followed by
>>>> +                * something that depends on the read
>>>> +                */
>>>> +               tmp = readl(gpiomtd->io_sync);
>>>> +               asm volatile("mov %1, %0\n" : "=r" (tmp) : "r" (tmp));
>>>> +       }
>>>> +}
>>> there isnt much point in attempting to write a generic solution if
>>> you're just going to turn around and stick straight assembly in the
>>> middle of it.  why not use a real arch-generic method like a memory
>>> barrier.
>> Linux memory barriers don't cater for what's required here.  What's
>> required is what's there - a read from a separate region with a
>> dependency on that read.  Linux has no such barrier.
> 
> thanks, this kind of comment in the source would be useful ... but
> what is also needed is '#ifdef __arm__'

If '#ifdef' is preferable than 'depend on ARM' I can send an updated patch.

> -mike
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Sincerely yours,
Mike.
