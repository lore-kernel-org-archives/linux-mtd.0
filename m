Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e44be-0002TJ-LH
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 12:35:00 +0000
Received: by mail-oi0-x241.google.com with SMTP id h6so4492666oia.10
 for <linux-mtd@lists.infradead.org>; Mon, 16 Oct 2017 05:34:34 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <CAEUhbmXmw9uGwnAQBd2bRYvGfmCAyJFAswp33Y5LvJREB7pjmA@mail.gmail.com>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <3af38787-4542-7a2b-36be-56c11b1b81f2@wedev4u.fr>
 <CAK8P3a3kdJiug1MaUaTzQxqayGuEGQvox-RX+NOtw0EFO7nkag@mail.gmail.com>
 <CAEUhbmXmw9uGwnAQBd2bRYvGfmCAyJFAswp33Y5LvJREB7pjmA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 16 Oct 2017 14:34:33 +0200
Message-ID: <CAK8P3a1R=K5c7e9c72b4j612YVUoFzPs_+v8jN4FfBfWs+Ut-A@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 15, 2017 at 3:38 PM, Bin Meng <bmeng.cn@gmail.com> wrote:
> On Fri, Oct 13, 2017 at 7:15 PM, Arnd Bergmann <arnd@arndb.de> wrote:>> On Wed, Oct 11, 2017 at 10:03 AM, Cyrille Pitchen
>> warning: (SPI_INTEL_SPI_PLATFORM && ITCO_WDT) selects LPC_ICH which
>> has unmet direct dependencies (HAS_IOMEM && PCI)
>> drivers/mfd/lpc_ich.c: In function 'lpc_ich_init_spi':
>> drivers/mfd/lpc_ich.c:1137:3: error: implicit declaration of function
>> 'pci_bus_write_config_byte'; did you mean 'pci_write_config_byte'?
>> [-Werror=implicit-function-declaration]
>>
>
> Thanks for your testing. However, I believe this build error cannot be
> seen in a real system due to x86 always has PCI on. But I see you were
> doing build testing with COMPILE_TEST.

I don't think there is a general dependency on PCI for x86, other
than the fact that most device drivers require it and you'd normally
want to enable it.

>> Also, the 'depends on EXPERT' statement looks misplaced,
>> enabling EXPERT should only be there to allow you to turn
>> extra things *off*, not to hide device drivers.
>>
>
> I will leave this to Mika to comment the "EXPERT" usage. If we remove
> this, I think that should be another patch and the documentation of
> this driver should be updated too.

Ok.

>> How about this:
>>
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 19bcb63a1ce7..b81d9b4dae7b 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -90,7 +90,7 @@ config SPI_INTEL_SPI
>>         tristate
>>
>>  config SPI_INTEL_SPI_PCI
>> -       tristate "Intel PCH/PCU SPI flash PCI driver" if EXPERT
>> +       tristate "Intel PCH/PCU SPI flash PCI driver"
>>         depends on X86 && PCI
>>         select SPI_INTEL_SPI
>>         help
>> @@ -106,10 +106,10 @@ config SPI_INTEL_SPI_PCI
>>           will be called intel-spi-pci.
>>
>>  config SPI_INTEL_SPI_PLATFORM
>> -       tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
>> -       depends on X86
>> +       tristate "Intel PCH/PCU SPI flash platform driver"
>> +       depends on X86 && (PCI || COMPILE_TEST)
>>         select SPI_INTEL_SPI
>> -       select LPC_ICH
>> +       select LPC_ICH if PCI
>
> I think we just need do:
>
> depends on X86 && PCI
>
> then
>
> select LPC_ICH

Right, that would solve this particular build issue, just not
allow the compile-test alternative.

We could also try to fix this more broadly, to allow compile-testing
independent of X86: It is bad style to have a 'select' statement for
a user-visible symbol (both in my version above, and yours).

The only connection I see between LPC_ICH and
SPI_INTEL_SPI_PCI is that at the moment that MFD driver is the
only thing that provides a platform device named "intel-spi", but I
see no reason why the spi-nor driver needs to know about this.

In similar cases on ARM, I tend to recommend something like

config SPI_INTEL_SPI_PLATFORM
       tristate "Intel PCH/PCU SPI flash platform driver" if LPC_ICH
|| COMPILE_TEST
       select SPI_INTEL_SPI

and then change all the other 'select LPC_ICH' to 'depends on
as well. If we leave the 'select' in place here, it might be good to
remove the prompt from the LPC_ICH option and have it only
selected by the other drivers.

       Arnd
