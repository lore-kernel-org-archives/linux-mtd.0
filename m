Received: from mail-pg0-f66.google.com ([74.125.83.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diMRP-0008Fo-A6
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 15:10:42 +0000
Received: by mail-pg0-f66.google.com with SMTP id t80so4199183pgb.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2017 08:10:14 -0700 (PDT)
Date: Thu, 17 Aug 2017 10:10:12 -0500
From: Rob Herring <robh@kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com,
 john@phrozen.org, linux-spi@vger.kernel.org,
 hauke.mehrtens@intel.com, andy.shevchenko@gmail.com,
 p.zabel@pengutronix.de, kishon@ti.com, mark.rutland@arm.com
Subject: Re: [PATCH v9 10/16] reset: Add a reset controller driver for the
 Lantiq XWAY based SoCs
Message-ID: <20170817151012.7hbnsgwv477mjnqx@rob-hp-laptop>
References: <20170808225247.32266-1-hauke@hauke-m.de>
 <20170808225247.32266-11-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170808225247.32266-11-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 09, 2017 at 12:52:41AM +0200, Hauke Mehrtens wrote:
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
>  .../devicetree/bindings/reset/lantiq,reset.txt     |  30 +++
>  drivers/reset/Kconfig                              |   6 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-lantiq.c                       | 212 +++++++++++++++++++++
>  4 files changed, 249 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/lantiq,reset.txt
>  create mode 100644 drivers/reset/reset-lantiq.c
> 
> diff --git a/Documentation/devicetree/bindings/reset/lantiq,reset.txt b/Documentation/devicetree/bindings/reset/lantiq,reset.txt
> new file mode 100644
> index 000000000000..c1c48aa099b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/lantiq,reset.txt
> @@ -0,0 +1,30 @@
> +Lantiq XWAY SoC RCU reset controller binding
> +============================================
> +
> +This binding describes a reset-controller found on the RCU module on Lantiq
> +XWAY SoCs.
> +
> +This driver has to be a sub node of the Lantiq RCU block.

s/driver/node/

> +
> +-------------------------------------------------------------------------------
> +Required properties:
> +- compatible		: Should be one of
> +				"lantiq,danube-reset"
> +				"lantiq,xrx200-reset"
> +- reg			: Defines the following sets of registers in the parent
> +			  syscon device
> +			- Offset of the reset set register
> +			- Offset of the reset status register
> +- #reset-cells		: Specifies the number of cells needed to encode the
> +			  reset line, should be 2.
> +			  The first cell takes the reset set bit and the
> +			  second cell takes the status bit.
> +
> +-------------------------------------------------------------------------------
> +Example for the reset-controllers on the xRX200 SoCs:
> +	reset0: reset-controller@0 {

Should be: reset-controller@10

With those fixed,

Acked-by: Rob Herring <robh@kernel.org>

> +		compatible = "lantiq,xrx200-reset";
> +		reg <0x10 0x04>, <0x14 0x04>;
> +
> +		#reset-cells = <2>;
> +	};
