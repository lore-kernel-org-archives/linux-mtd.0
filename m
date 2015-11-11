Date: Wed, 11 Nov 2015 13:39:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Bayi Cheng <bayi.cheng@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com,
 jteki@openedev.com, ezequiel@vanguardiasur.com.ar
Subject: Re: [PATCH v6 3/3] arm64: dts: mt8173: Add nor flash node
Message-ID: <20151111213900.GK12143@google.com>
References: <1446824889-16144-1-git-send-email-bayi.cheng@mediatek.com>
 <1446824889-16144-4-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446824889-16144-4-git-send-email-bayi.cheng@mediatek.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 06, 2015 at 11:48:09PM +0800, Bayi Cheng wrote:
> Add Mediatek nor flash node
> 
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index d18ee42..f5f08eb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -365,6 +365,22 @@
>  			status = "disabled";
>  		};
>  
> +		nor_flash: spi@1100d000 {
> +			compatible = "mediatek,mt8173-nor";
> +			reg = <0 0x1100d000 0 0xe0>;
> +			clocks = <&pericfg CLK_PERI_SPI>,
> +				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +			clock-names = "spi", "sf";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +
> +			flash@0 {
> +				compatible = "jedec,spi-nor";
> +				reg = <0>;
> +			};
> +		};
> +
>  		i2c3: i2c3@11010000 {
>  			compatible = "mediatek,mt8173-i2c";
>  			reg = <0 0x11010000 0 0x70>,
> -- 
> 1.8.1.1.dirty
> 
