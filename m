MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Thu, 02 Jul 2015 15:44:20 +0200
From: Stefan Agner <stefan@agner.ch>
To: Cory Tusar <cory.tusar@pid1solutions.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@freescale.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux@arm.linux.org.uk,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 andrew@lunn.ch
Subject: Re: [RFC PATCH 2/7] ARM: dts: vfxxx: Include support for qspi1
 functionality.
In-Reply-To: <1435782010-9809-4-git-send-email-cory.tusar@pid1solutions.com>
References: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
 <1435782010-9809-4-git-send-email-cory.tusar@pid1solutions.com>
Message-ID: <0d7c39d4b78fec56adc8a8d66301a3ad@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-07-01 22:20, Cory Tusar wrote:
> This commit extends the existing Vybrid QSPI devicetree implementation
> to also describe the qspi1 functional block.
> 
> Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 089a263..a7c370e 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -251,6 +251,19 @@
>  				status = "disabled";
>  			};
>  
> +			qspi1: quadspi@400c4000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,vf610-qspi";
> +				reg = <0x400c4000 0x1000>, <0x50000000 0x10000000>;
> +				reg-names = "QuadSPI", "QuadSPI-memory";
> +				interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_QSPI1_EN>,
> +					<&clks VF610_CLK_QSPI1>;
> +				clock-names = "qspi_en", "qspi";
> +				status = "disabled";
> +			};
> +
>  			iomuxc: iomuxc@40048000 {
>  				compatible = "fsl,vf610-iomuxc";
>  				reg = <0x40048000 0x1000>;

This seem to be at the wrong place under aips0. qspi1 should be under
aips1. just before fec0. But other than that, I checked the addresses
looks good to me. Hence with that change applied you can include:

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan
