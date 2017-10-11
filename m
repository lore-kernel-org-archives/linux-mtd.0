Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2Bzq-00047l-E1
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 08:04:08 +0000
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <3af38787-4542-7a2b-36be-56c11b1b81f2@wedev4u.fr>
Date: Wed, 11 Oct 2017 10:03:41 +0200
MIME-Version: 1.0
In-Reply-To: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
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

Le 25/08/2017 à 10:12, Bin Meng a écrit :
> The Intel SPI-NOR driver is dependent on LPC_ICH to get the platform
> data. Select it in the Kconfig.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
> 
>  drivers/mtd/spi-nor/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index bfdfb1e..e998800 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -93,6 +93,7 @@ config SPI_INTEL_SPI_PLATFORM
>  	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
>  	depends on X86
>  	select SPI_INTEL_SPI
> +	select LPC_ICH
>  	help
>  	  This enables platform support for the Intel PCH/PCU SPI
>  	  controller in master mode. This controller is present in modern
> 
