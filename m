Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0U19-000186-6n
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 14:54:24 +0000
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] mtd: spi-nor: Allow Cadence QSPI support for ARM64
To: cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1506701269-29652-1-git-send-email-thor.thayer@linux.intel.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <6f21cd6f-4ad7-b611-c22f-45f4ec0232ab@linux.intel.com>
Date: Fri, 6 Oct 2017 09:56:59 -0500
MIME-Version: 1.0
In-Reply-To: <1506701269-29652-1-git-send-email-thor.thayer@linux.intel.com>
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

gentle ping...


On 09/29/2017 11:07 AM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Allow ARM64 support for the Cadence QSPI interface by
> adding ARM64 as a dependency.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>   drivers/mtd/spi-nor/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 69c638dd0484..f26aaa6d1430 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -50,7 +50,7 @@ config SPI_ATMEL_QUADSPI
>   
>   config SPI_CADENCE_QUADSPI
>   	tristate "Cadence Quad SPI controller"
> -	depends on OF && (ARM || COMPILE_TEST)
> +	depends on OF && (ARM || ARM64 || COMPILE_TEST)
>   	help
>   	  Enable support for the Cadence Quad SPI Flash controller.
>   
> 
