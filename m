Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKM2q-0001Ql-Bd
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 10:26:18 +0000
Date: Thu, 30 Nov 2017 11:25:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org, Roger Quadros
 <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Tony
 Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 01/16] dt-bindings: mtd: gpmc-onenand: Update
 properties description
Message-ID: <20171130112544.5509ca1b@bbrezillon>
In-Reply-To: <20171115162458.rtompijrsaobdemk@lenoch>
References: <20171115162306.2o2w2yrf7wucroxd@lenoch>
 <20171115162458.rtompijrsaobdemk@lenoch>
MIME-Version: 1.0
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

+Rob and the DT ML

On Wed, 15 Nov 2017 17:24:58 +0100
Ladislav Michl <ladis@linux-mips.org> wrote:

> Compatible property is required for OMAP2+ mtd driver. Also
> add INT pin gpio description and delete unused dma-channel
> property.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Acked-by: Roger Quadros <rogerq@ti.com>
> ---
> 
> Changes in v5:
> - renamed R/B pin to INT pin
> 
> Changes in v4:
> - new patch
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mtd/gpmc-onenand.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> index b6e8bfd024f4..e9f01a963a0a 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> @@ -9,13 +9,14 @@ Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  
>  Required properties:
>  
> + - compatible:		"ti,omap2-onenand"

Don't you break backward compat by adding this new requirement?

>   - reg:			The CS line the peripheral is connected to
> - - gpmc,device-width	Width of the ONENAND device connected to the GPMC
> + - gpmc,device-width:	Width of the ONENAND device connected to the GPMC
>  			in bytes. Must be 1 or 2.
>  
>  Optional properties:
>  
> - - dma-channel:		DMA Channel index
> + - int-gpios:		GPIO specifier for the INT pin.
>  
>  For inline partition table parsing (optional):
>  
> @@ -35,6 +36,7 @@ Example for an OMAP3430 board:
>  		#size-cells = <1>;
>  
>  		onenand@0 {
> +			compatible = "ti,omap2-onenand";
>  			reg = <0 0 0>; /* CS0, offset 0 */
>  			gpmc,device-width = <2>;
>  
