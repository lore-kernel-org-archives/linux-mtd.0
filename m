Received: from mail-yb0-f195.google.com ([209.85.213.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTU3s-0004bs-VW
 for linux-mtd@lists.infradead.org; Fri, 07 Jul 2017 14:16:50 +0000
Received: by mail-yb0-f195.google.com with SMTP id 84so1460503ybe.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 07:16:28 -0700 (PDT)
Date: Fri, 7 Jul 2017 09:16:26 -0500
From: Rob Herring <robh@kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com,
 john@phrozen.org, linux-spi@vger.kernel.org,
 hauke.mehrtens@intel.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de
Subject: Re: [PATCH v7 10/16] reset: Add a reset controller driver for the
 Lantiq XWAY based SoCs
Message-ID: <20170707141626.56rz55grulhd3twp@rob-hp-laptop>
References: <20170702224051.15109-1-hauke@hauke-m.de>
 <20170702224051.15109-11-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170702224051.15109-11-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 03, 2017 at 12:40:45AM +0200, Hauke Mehrtens wrote:
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> The reset controllers (on xRX200 and newer SoCs have two of them) are
> provided by the RCU module. This was initially implemented as a simple
> reset controller. However, the RCU module provides more functionality
> (ethernet GPHYs, USB PHY, etc.), which makes it a MFD device.
> The old reset controller driver implementation from
> arch/mips/lantiq/xway/reset.c did not honor this fact.
> 
> For some devices the request and the status bits are different.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  .../devicetree/bindings/reset/lantiq,reset.txt     |  29 +++
>  drivers/reset/Kconfig                              |   6 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-lantiq.c                       | 210 +++++++++++++++++++++
>  4 files changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/lantiq,reset.txt
>  create mode 100644 drivers/reset/reset-lantiq.c
> 
> diff --git a/Documentation/devicetree/bindings/reset/lantiq,reset.txt b/Documentation/devicetree/bindings/reset/lantiq,reset.txt
> new file mode 100644
> index 000000000000..7737ed75f4c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/lantiq,reset.txt
> @@ -0,0 +1,29 @@
> +Lantiq XWAY SoC RCU reset controller binding
> +============================================
> +
> +This binding describes a reset-controller found on the RCU module on Lantiq
> +XWAY SoCs.
> +
> +This driver has to be a sub node of the Lantiq RCU block.
> +
> +-------------------------------------------------------------------------------
> +Required properties:
> +- compatible		: Should be one of
> +				"lantiq,danube-reset"
> +				"lantiq,xrx200-reset"
> +- offset-set		: Offset of the reset set register
> +- offset-status		: Offset of the reset status register

With reg added (missing here) as shown in the RCU example you can remove 
these 2.

> +- #reset-cells		: Specifies the number of cells needed to encode the
> +			  reset line, should be 2.
> +			  The first cell takes the reset set bit and the
> +			  second cell takes the status bit.
> +
> +-------------------------------------------------------------------------------
> +Example for the reset-controllers on the xRX200 SoCs:
> +	reset0: reset-controller@0 {
> +		compatible = "lantiq,xrx200-reset";
> +
> +		offset-set = <0x10>;
> +		offset-status = <0x14>;
> +		#reset-cells = <2>;
> +	};
