Date: Tue, 21 Jul 2015 14:05:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lucas Stach <dev@lynxeye.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Stefan Agner <stefan@agner.ch>,
 Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Patch v3 1/5] mtd: nand: tegra: add devicetree binding
Message-ID: <20150721210537.GL24125@google.com>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
 <1431282602-7137-2-git-send-email-dev@lynxeye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431282602-7137-2-git-send-email-dev@lynxeye.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 10, 2015 at 08:29:58PM +0200, Lucas Stach wrote:
> This adds the devicetree binding for the Tegra 2 NAND flash
> controller.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.txt           | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
> new file mode 100644
> index 0000000..522d442
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
> @@ -0,0 +1,29 @@
> +NVIDIA Tegra NAND Flash controller
> +
> +Required properties:
> +- compatible: Must be one of:
> +  - "nvidia,tegra20-nand"
> +- reg: MMIO address range
> +- interrupts: interrupt output of the NFC controller
> +- clocks: Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +  - nand
> +- resets: Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.
> +- reset-names: Must include the following entries:
> +  - nand
> +
> +Optional properties:
> +- nvidia,wp-gpios: GPIO used to disable write protection of the flash

I think write-protect is a pretty common function, so we might want to
just remove the 'nvidia,' prefix, so we can eventually move your code to
the core nand_base.c library (BTW, I noticed you grab the GPIO, but you
don't do anything with it; is that intentional?). In fact, I've seen
requests for that very feature on the mailing list.

> +
> +  Example:
> +	nand@70008000 {
> +		compatible = "nvidia,tegra20-nand";
> +		reg = <0x70008000 0x100>;
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
> +		clock-names = "nand";
> +		resets = <&tegra_car 13>;
> +		reset-names = "nand";
> +	};

Otherwise, looks good.

Reviewed-by: Brian Norris <computersforpeace@gmail.com>

I have a few comments on the NAND driver, too.

Brian
