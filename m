Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKbAV-00040b-N0
 for linux-mtd@lists.infradead.org; Sun, 17 Jan 2016 00:26:08 +0000
Date: Sat, 16 Jan 2016 18:25:42 -0600
From: Rob Herring <robh@kernel.org>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 galak@codeaurora.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, shijie.huang@intel.com,
 pengbinquan@huawei.com, han.xu@freescale.com,
 ezequiel@vanguardiasur.com.ar, fabio.estevam@freescale.com,
 manabian@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com,
 suwenping@hisilicon.com, ml.yang@hisilicon.com,
 gaofei@hisilicon.com, zhangzhenxing@hisilicon.com,
 xuejiancheng@hisilicon.com
Subject: Re: [PATCH v3] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Message-ID: <20160117002542.GA14111@rob-hp-laptop>
References: <1452849235-17334-1-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452849235-17334-1-git-send-email-xuejiancheng@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2016 at 05:13:55PM +0800, Jiancheng Xue wrote:
> add hisilicon spi-nor flash controller driver
> 
> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
> change log 
> v3:
> Added a compatible string "hisilicon,hi3519-sfc".
> v2:
> Fixed some compiling warings.  
> 	
>  .../devicetree/bindings/spi/spi-hisi-sfc.txt       |  26 ++
>  drivers/mtd/spi-nor/Kconfig                        |   6 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c                     | 499 +++++++++++++++++++++
>  4 files changed, 532 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> new file mode 100644
> index 0000000..f7d6e22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> @@ -0,0 +1,26 @@
> +HiSilicon SPI-NOR Flash Controller
> +
> +Required properties:
> +- compatible : Should be one of
> +		"hisilicon,hisi-sfc"
> +		"hisilicon,hi3519-sfc"

This should be both. One is generic and one is specific to an SOC.

Rob
