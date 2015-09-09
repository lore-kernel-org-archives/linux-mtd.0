Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZYFP-0003GS-RL
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2015 05:48:44 +0000
Date: Wed, 9 Sep 2015 07:47:34 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Bayi Cheng <bayi.cheng@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Message-ID: <20150909054734.GC18700@pengutronix.de>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 08, 2015 at 05:49:54PM +0800, Bayi Cheng wrote:
> Add device tree binding documentation for serial flash with
> Mediatek serial flash controller
> 
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtk_nor.txt | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk_nor.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk_nor.txt b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> new file mode 100644
> index 0000000..0eca0cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> @@ -0,0 +1,25 @@
> +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> +
> +MTK MT81xx serial flash controller is designed for serial Flash device.
> +It supports one Flash device with signal mode, dual mode and quad mode.
> +
> +Required properties:
> +- compatible: should be "mediatek,mt8173-nor";
> +- reg: physical base address and length of the controller's register
> +- clocks: spi nor source clock
> +- clock-names: "spi_clk", "axi_clk", "mux_clk", "sf_clk"

Drop the _clk suffix. It's the clock-names property which already makes
it clear that these are clock names.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
