Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhHyX-0002fe-Gu
 for linux-mtd@lists.infradead.org; Mon, 14 Aug 2017 16:12:23 +0000
Subject: Re: [PATCH] mtd: spi-nor: fix "No newline at end of file"
To: matthew.gerlach@linux.intel.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, linux-mtd@lists.infradead.org,
 ludovic.barre@st.com, linux-kernel@vger.kernel.org
References: <1502233106-24777-1-git-send-email-matthew.gerlach@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <9e1ad8af-ae3f-f23d-e3ba-4629473e8654@wedev4u.fr>
Date: Mon, 14 Aug 2017 18:11:57 +0200
MIME-Version: 1.0
In-Reply-To: <1502233106-24777-1-git-send-email-matthew.gerlach@linux.intel.com>
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

Le 09/08/2017 à 00:58, matthew.gerlach@linux.intel.com a écrit :
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> 
> Add a newline to the end of drivers/spi-nor/Makefile to get rid the message,
> "No newline at end of file", produced by git.  This fix will allow subsequent
> changes to the file to be able to produce clean patches.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
>  drivers/mtd/spi-nor/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index c5f171d..7d84c51 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -9,4 +9,4 @@ obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
>  obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
>  obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
>  obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
> -obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
> \ No newline at end of file
> +obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
> 
