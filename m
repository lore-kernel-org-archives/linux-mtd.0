Date: Thu, 5 Nov 2015 10:36:58 -0600
From: Rob Herring <robh@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 4/5] ARM: dts: DRA7: add entry for qspi mmap region
Message-ID: <20151105163658.GA28885@rob-hp-laptop>
References: <1446545174-14193-1-git-send-email-vigneshr@ti.com>
 <1446545174-14193-5-git-send-email-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446545174-14193-5-git-send-email-vigneshr@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 03, 2015 at 03:36:13PM +0530, Vignesh R wrote:
> Add qspi memory mapped region entries for DRA7xx based SoCs. Also,
> update the binding documents for the controller to document this change.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>

You don't really need an example for every possibility, but

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/spi/ti_qspi.txt | 13 +++++++++++++
>  arch/arm/boot/dts/dra7.dtsi                       |  6 ++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/ti_qspi.txt b/Documentation/devicetree/bindings/spi/ti_qspi.txt
> index 601a360531a5..f05dd631bef1 100644
> --- a/Documentation/devicetree/bindings/spi/ti_qspi.txt
> +++ b/Documentation/devicetree/bindings/spi/ti_qspi.txt
> @@ -26,3 +26,16 @@ qspi: qspi@4b300000 {
>  	spi-max-frequency = <25000000>;
>  	ti,hwmods = "qspi";
>  };
> +
> +For dra7xx:
> +qspi: qspi@4b300000 {
> +	compatible = "ti,dra7xxx-qspi";
> +	reg = <0x4b300000 0x100>, <0x4a002558 0x4>,
> +	      <0x5c000000 0x4000000>;
> +	reg-names = "qspi_base", "qspi_ctrlmod",
> +		    "qspi_mmap";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	spi-max-frequency = <48000000>;
> +	ti,hwmods = "qspi";
> +};
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index e289c706d27d..13c2f10ec217 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -1108,8 +1108,10 @@
>  
>  		qspi: qspi@4b300000 {
>  			compatible = "ti,dra7xxx-qspi";
> -			reg = <0x4b300000 0x100>;
> -			reg-names = "qspi_base";
> +			reg = <0x4b300000 0x100>, <0x4a002558 0x4>,
> +			      <0x5c000000 0x4000000>;
> +			reg-names = "qspi_base", "qspi_ctrlmod",
> +				    "qspi_mmap";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			ti,hwmods = "qspi";
> -- 
> 2.6.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
