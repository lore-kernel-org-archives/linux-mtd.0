Date: Wed, 8 May 2013 17:16:07 -0700
From: Tony Lindgren <tony@atomide.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3,2/3] ARM: dts: AM33XX: Add GPMC node
Message-ID: <20130509001606.GZ32546@atomide.com>
References: <2645efefa3d36388ff1d4b64255d880b6587770f.1359007746.git.avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2645efefa3d36388ff1d4b64255d880b6587770f.1359007746.git.avinashphilip@ti.com>
Cc: linux@arm.linux.org.uk, b-cousson@ti.com,
 devicetree-discuss@lists.ozlabs.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, hvaibhav@ti.com, gururaja.hebbar@ti.com,
 zonque@gmail.com, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Gupta, Pekon <pekon@ti.com> [130502 02:49]:
> From: "Philip, Avinash" <avinashphilip@ti.com>
> 
> Add GPMC data node to AM33XX device tree file.
> 
> Signed-off-by: Philip Avinash <avinashphilip@ti.com>
> Acked-by: Peter Korsgaard <jacmet@sunsite.dk>
> Signed-off-by: Pekon Gupta <pekon@ti.com>

Thanks adding into omap-for-v3.10/dt-fixes.

Tony
 
> ---
> Changes in v2:
> 	- Change number of chip select to 7
> 
>  arch/arm/boot/dts/am33xx.dtsi |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index 24fc835..1048795 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -407,5 +407,17 @@
>  			ti,hwmods = "elm";
>  			status = "disabled";
>  		};
> +
> +		gpmc: gpmc@50000000 {
> +			compatible = "ti,am3352-gpmc";
> +			ti,hwmods = "gpmc";
> +			reg = <0x50000000 0x2000>;
> +			interrupts = <100>;
> +			num-cs = <7>;
> +			num-waitpins = <2>;
> +			#address-cells = <2>;
> +			#size-cells = <1>;
> +			status = "disabled";
> +		};
>  	};
>  };
