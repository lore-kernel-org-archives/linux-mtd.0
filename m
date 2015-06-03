From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 08/11] MTD: m25p80: Add option to limit SPI transfer size.
Date: Thu, 4 Jun 2015 01:03:09 +0200
References: <cover.1433364398.git.hramrach@gmail.com>
 <8fc4b9f5291a509c4c35782a1337bf536f1019af.1433364398.git.hramrach@gmail.com>
In-Reply-To: <8fc4b9f5291a509c4c35782a1337bf536f1019af.1433364398.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201506040103.09555.marex@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-mtd@lists.infradead.org,
 Alison Chaiken <alison_chaiken@mentor.com>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= \(beanhuo\)" <beanhuo@micron.com>,
 linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 Vinod Koul <vinod.koul@intel.com>,
 =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@freescale.com>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>, dmaengine@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, June 03, 2015 at 11:26:41 PM, Michal Suchanek wrote:
> On sunxi the SPI controller currently does not have DMA support and fails
> any transfer larger than 63 bytes.
> 
> On Exynos the pl330 DMA controller fails any transfer larger than 64kb
> when using slower speed like 40MHz and any transfer larger than 128bytes
> when running at 133MHz.

This smells more like some corruption of the data on the bus or something
even more obscure.

> The best thing is that in both cases the controller can just lock up and
> never finish potentially leaving the hardware in unusable state.
> 
> So it is required that the m25p80 driver actively prevents doing
> transfers that are too large for the current driver state on a
> particular piece of hardware.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> 
> --
> 
> Update commit message and documentation text.
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.txt      |  6 ++++++
>  drivers/mtd/devices/m25p80.c                       | 24
> ++++++++++++++++++++-- 2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt index
> 2bee681..4e63ae8 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -19,6 +19,12 @@ Optional properties:
>                     all chips and support for it can not be detected at
> runtime. Refer to your chips' datasheet to check if this is supported by
> your chip.
> +- linux,max_tx_len : With some SPI controller drivers possible transfer
> size is +                     limited. This may be hardware or driver bug.
> +                     Transfer data in chunks no larger than this value. +
>                     Using this option may severely degrade performance and
> +                     possibly flash memory life when max_tx_len is
> smaller than +                     flash page size (typically 256 bytes)

Will we need similar patch for all other SPI slave drivers, like SPI NAND ?

Best regards,
Marek Vasut
