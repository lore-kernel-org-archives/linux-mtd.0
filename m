Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlC2b-0001FY-4h
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 10:40:42 +0000
Date: Fri, 25 Aug 2017 13:40:15 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
Message-ID: <20170825104015.GB2980@lahna.fi.intel.com>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 25, 2017 at 01:12:51AM -0700, Bin Meng wrote:
> The Intel SPI-NOR driver is dependent on LPC_ICH to get the platform
> data. Select it in the Kconfig.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
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

How about 

	depends on X86 && LPC_ICH

instead?
