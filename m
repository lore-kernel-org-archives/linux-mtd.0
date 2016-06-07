Date: Tue, 7 Jun 2016 20:21:55 +0300
From: Aleksei Mamlin <mamlinav@gmail.com>
To: Aleksei Mamlin <mamlinav@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 4/7] ARM: dts: sun7i: Add NFC node to Allwinner A20 SoC
Message-Id: <20160607202155.a86cec11c48fc6c89b280eda@gmail.com>
In-Reply-To: <1465208664-9366-5-git-send-email-mamlinav@gmail.com>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
 <1465208664-9366-5-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  6 Jun 2016 13:24:21 +0300
Aleksei Mamlin <mamlinav@gmail.com> wrote:

> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Add NAND Flash controller node definition to the A20 SoC.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 915979f..e473570 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -826,6 +826,17 @@
>  			#size-cells = <0>;
>  		};
>  
> +		nfc: nand@01c03000 {
> +			compatible = "allwinner,sun4i-a10-nand";
> +			reg = <0x01c03000 0x1000>;
> +			interrupts = <37>;

Should be
			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;

> +			clocks = <&ahb_gates 13>, <&nand_clk>;
> +			clock-names = "ahb", "mod";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		emac: ethernet@01c0b000 {
>  			compatible = "allwinner,sun4i-a10-emac";
>  			reg = <0x01c0b000 0x1000>;
> -- 
> 2.7.3
> 


-- 
Thanks and regards,
Aleksei Mamlin
