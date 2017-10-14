Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e3FeD-0002Ke-II
 for linux-mtd@lists.infradead.org; Sat, 14 Oct 2017 06:10:12 +0000
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <3af38787-4542-7a2b-36be-56c11b1b81f2@wedev4u.fr>
 <CAK8P3a3kdJiug1MaUaTzQxqayGuEGQvox-RX+NOtw0EFO7nkag@mail.gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <3b73e4fc-c361-6bc8-55e6-567d203192e6@wedev4u.fr>
Date: Sat, 14 Oct 2017 08:09:37 +0200
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3kdJiug1MaUaTzQxqayGuEGQvox-RX+NOtw0EFO7nkag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

Le 13/10/2017 à 13:15, Arnd Bergmann a écrit :
> On Wed, Oct 11, 2017 at 10:03 AM, Cyrille Pitchen
> <cyrille.pitchen@wedev4u.fr> wrote:
>> Le 25/08/2017 à 10:12, Bin Meng a écrit :
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
> [-Werror=implicit-function-declaration]
> 
> Generally speaking, using 'select' to force-enable another
> driver is a bad idea and causes endless problems, but if you
> insist on doing that, please make sure you get the right
> dependencies.
> 
> Also, the 'depends on EXPERT' statement looks misplaced,
> enabling EXPERT should only be there to allow you to turn
> extra things *off*, not to hide device drivers.
> 
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
>         help
>           This enables platform support for the Intel PCH/PCU SPI
>           controller in master mode. This controller is present in modern
> 
>        Arnd
> 

The patch has been removed from spi-nor/next and updated to 'Rejected'
in patchwork.

Thanks for your report.

Bin, you may have to submit another patch with the correct dependencies
or maybe adopt the "depends LPC_ICH" approach as suggested by Mika.

Best regards,

Cyrille
