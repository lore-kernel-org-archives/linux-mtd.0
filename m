Received: from rv-out-0708.google.com ([209.85.198.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Knd2g-0000jP-Nb
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 17:41:47 +0000
Received: by rv-out-0708.google.com with SMTP id b17so5834538rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Oct 2008 10:41:45 -0700 (PDT)
Message-ID: <8bd0f97a0810081041q5d329984x149317f3fff54365@mail.gmail.com>
Date: Wed, 8 Oct 2008 13:41:45 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Mike Rapoport" <mike@compulab.co.il>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
In-Reply-To: <48EC6F1B.7040404@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48EC4CC5.5030809@compulab.co.il>
	<8bd0f97a0810072320h5361c7d3q219aeaf9407a5293@mail.gmail.com>
	<20081008072843.GA19401@flint.arm.linux.org.uk>
	<8bd0f97a0810080029o6f8250cfi734d19191eb92c1d@mail.gmail.com>
	<48EC6F1B.7040404@compulab.co.il>
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

On Wed, Oct 8, 2008 at 04:28, Mike Rapoport wrote:
> Mike Frysinger wrote:
>> On Wed, Oct 8, 2008 at 03:28, Russell King - ARM Linux wrote:
>>> On Wed, Oct 08, 2008 at 02:20:13AM -0400, Mike Frysinger wrote:
>>>> On Wed, Oct 8, 2008 at 02:01, Mike Rapoport wrote:
>>>>> +/* gpio_nand_dosync()
>>>>> + *
>>>>> + * needed due to bus-reordering within the PXA itself (see section on
>>>>> + * I/O ordering in PXA manual (section 2.3, p35)
>>>>> + */
>>>>> +static void gpio_nand_dosync(struct gpiomtd *gpiomtd)
>>>>> +{
>>>>> +       unsigned long tmp;
>>>>> +
>>>>> +       if (gpiomtd->io_sync) {
>>>>> +               /*
>>>>> +                * this should generate the read, followed by
>>>>> +                * something that depends on the read
>>>>> +                */
>>>>> +               tmp = readl(gpiomtd->io_sync);
>>>>> +               asm volatile("mov %1, %0\n" : "=r" (tmp) : "r" (tmp));
>>>>> +       }
>>>>> +}
>>>> there isnt much point in attempting to write a generic solution if
>>>> you're just going to turn around and stick straight assembly in the
>>>> middle of it.  why not use a real arch-generic method like a memory
>>>> barrier.
>>> Linux memory barriers don't cater for what's required here.  What's
>>> required is what's there - a read from a separate region with a
>>> dependency on that read.  Linux has no such barrier.
>>
>> thanks, this kind of comment in the source would be useful ... but
>> what is also needed is '#ifdef __arm__'
>
> If '#ifdef' is preferable than 'depend on ARM' I can send an updated patch.

i'd remove the "depend on ARM" and add "#ifdef __arm__" into the .c
file.  unless i missed something, there's nothing else arm specific in
there.
-mike
