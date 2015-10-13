Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm0eQ-0002sl-Dg
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 14:34:04 +0000
Received: by lbbck17 with SMTP id ck17so22704110lbb.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 07:33:40 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8173: Add nor flash node
To: Bayi Cheng <bayi.cheng@mediatek.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
 <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Daniel Kurtz <djkurtz@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <561D1642.3070105@cogentembedded.com>
Date: Tue, 13 Oct 2015 17:33:38 +0300
MIME-Version: 1.0
In-Reply-To: <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 10/13/2015 12:39 PM, Bayi Cheng wrote:

> Add Mediatek nor flash node
>
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index d18ee42..385c2e4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -365,6 +365,21 @@
>   			status = "disabled";
>   		};
>
> +		nor_flash: spi@1100d000 {

    I don't think this is a good label name for a SPI controller.

> +			compatible = "mediatek,mt8173-nor";
> +			reg = <0 0x1100d000 0 0xe0>;
> +			clocks = <&pericfg CLK_PERI_SPI>,
> +				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +			clock-names = "spi", "sf";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			flash@0 {
> +				compatible = "jedec,spi-nor";
> +				reg = <0>;
> +			};
> +		};
> +
>   		i2c3: i2c3@11010000 {

    Grr, the name should be "i2c@11010000".

[...]

MBR, Sergei
