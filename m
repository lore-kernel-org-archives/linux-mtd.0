Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e3j8V-0004VM-4G
 for linux-mtd@lists.infradead.org; Sun, 15 Oct 2017 13:39:25 +0000
Received: by mail-wm0-x241.google.com with SMTP id b189so5768122wmd.2
 for <linux-mtd@lists.infradead.org>; Sun, 15 Oct 2017 06:38:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3kdJiug1MaUaTzQxqayGuEGQvox-RX+NOtw0EFO7nkag@mail.gmail.com>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <3af38787-4542-7a2b-36be-56c11b1b81f2@wedev4u.fr>
 <CAK8P3a3kdJiug1MaUaTzQxqayGuEGQvox-RX+NOtw0EFO7nkag@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 15 Oct 2017 21:38:57 +0800
Message-ID: <CAEUhbmXmw9uGwnAQBd2bRYvGfmCAyJFAswp33Y5LvJREB7pjmA@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Arnd Bergmann <arnd@arndb.de>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

On Fri, Oct 13, 2017 at 7:15 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Oct 11, 2017 at 10:03 AM, Cyrille Pitchen
> <cyrille.pitchen@wedev4u.fr> wrote:
>> Le 25/08/2017 =C3=A0 10:12, Bin Meng a =C3=A9crit :
>>> The Intel SPI-NOR driver is dependent on LPC_ICH to get the platform
>>> data. Select it in the Kconfig.
>>>
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>
>> Applied to the spi-nor/next branch of l2-mtd
>
> This causes a build error now:
>
> warning: (SPI_INTEL_SPI_PLATFORM && ITCO_WDT) selects LPC_ICH which
> has unmet direct dependencies (HAS_IOMEM && PCI)
> drivers/mfd/lpc_ich.c: In function 'lpc_ich_init_spi':
> drivers/mfd/lpc_ich.c:1137:3: error: implicit declaration of function
> 'pci_bus_write_config_byte'; did you mean 'pci_write_config_byte'?
> [-Werror=3Dimplicit-function-declaration]
>

Thanks for your testing. However, I believe this build error cannot be
seen in a real system due to x86 always has PCI on. But I see you were
doing build testing with COMPILE_TEST.

> Generally speaking, using 'select' to force-enable another
> driver is a bad idea and causes endless problems, but if you
> insist on doing that, please make sure you get the right
> dependencies.
>

Sure.

> Also, the 'depends on EXPERT' statement looks misplaced,
> enabling EXPERT should only be there to allow you to turn
> extra things *off*, not to hide device drivers.
>

I will leave this to Mika to comment the "EXPERT" usage. If we remove
this, I think that should be another patch and the documentation of
this driver should be updated too.

> How about this:
>
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 19bcb63a1ce7..b81d9b4dae7b 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -90,7 +90,7 @@ config SPI_INTEL_SPI
>         tristate
>
>  config SPI_INTEL_SPI_PCI
> -       tristate "Intel PCH/PCU SPI flash PCI driver" if EXPERT
> +       tristate "Intel PCH/PCU SPI flash PCI driver"
>         depends on X86 && PCI
>         select SPI_INTEL_SPI
>         help
> @@ -106,10 +106,10 @@ config SPI_INTEL_SPI_PCI
>           will be called intel-spi-pci.
>
>  config SPI_INTEL_SPI_PLATFORM
> -       tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
> -       depends on X86
> +       tristate "Intel PCH/PCU SPI flash platform driver"
> +       depends on X86 && (PCI || COMPILE_TEST)
>         select SPI_INTEL_SPI
> -       select LPC_ICH
> +       select LPC_ICH if PCI

I think we just need do:

depends on X86 && PCI

then

select LPC_ICH

>         help
>           This enables platform support for the Intel PCH/PCU SPI
>           controller in master mode. This controller is present in modern
>

Regards,
Bin
