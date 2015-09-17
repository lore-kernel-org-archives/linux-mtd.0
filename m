Message-ID: <1442480573.27250.28.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
From: bayi.cheng <bayi.cheng@mediatek.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: Brian Norris <computersforpeace@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar
 Gala" <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Date: Thu, 17 Sep 2015 17:02:53 +0800
In-Reply-To: <1442478994-12467-1-git-send-email-bayi.cheng@mediatek.com>
References: <1442478994-12467-1-git-send-email-bayi.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry, Please ignore this mail, and I will publish new one.




On Thu, 2015-09-17 at 16:36 +0800, Bayi Cheng wrote:
> Add device tree binding documentation for serial flash with
> Mediatek serial flash controller
> 
> Change-Id: Iaecd0bb7ba1b224f1e27bd7063f0b8d7ea30175a
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtk_quadspi.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
> new file mode 100644
> index 0000000..6153227
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
> @@ -0,0 +1,18 @@
> +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> +
> +Required properties:
> +- compatible: Should be "mediatek,mt8173-nor";
> +- reg: Physical base address and length of the controller's register
> +- clocks: spi source clock amd serial flash controller's clock
> +- clock-names: "spi", "sf"
> +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +
> +Example:
> +nor_flash: nor@1100d000 {
> +	compatible = "mediatek,mt8173-nor";
> +	reg = <0 0x1100D000 0 0xE0>;
> +	clocks = <&pericfg CLK_PERI_SPI>,
> +			 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +	clock-names = "spi", "sf";
> +};
> +
