Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW0ph-0005iS-Na
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 10:59:18 +0000
Date: Thu, 12 Mar 2015 10:58:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Message-ID: <20150312105824.GD30145@leverpostej>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 11, 2015 at 09:57:25PM +0000, Brian Norris wrote:
> Almost all flash that are "compatible" with m25p80 support the JEDEC
> READ ID opcode (0x95), and in fact, that is often the only thing that is
> used to differentiate them. Let's add a compatible string that
> represents this lowest common denominator of compatibility.
> 
> Device trees can still specify manufacturer/device names in addition,
> but (until some reason is found to differentiate between them through
> device tree) software will likely want to bind just against the generic
> name, and avoid unnecessarily growing its device ID binding tables.
> 
> This is related to the work of commit a5b7616c55e1 ("mtd:
> m25p80,spi-nor: Fix module aliases for m25p80"), which showed that
> maintaining these device tables as stable device-tree/modalias binding
> tables is not a worthwhile burden for mostly-comptatible flash.
> 
> At the same time, let's update the binding doc to point to the
> m25p_ids[] ID list instead of spi_nor_ids[]. The former can be used for
> device tree bindings, but the latter cannot. In the future, we should
> pare down the m25p_ids[] list to only those IDs which are actually used
> in device trees.

We really should not be referring to C files for the binding. The right
fix is to define the list in the binding document.

Mark.

> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Rafał Miłecki <zajec5@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/m25p80.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
> index 4611aa83531b..1b2997d4cee4 100644
> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> @@ -3,9 +3,12 @@
>  Required properties:
>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>    representing partitions.
> -- compatible : Should be the manufacturer and the name of the chip. Bear in mind
> +- compatible : Should be "nor-jedec" for any SPI NOR flash that can be
> +               identified by the JEDEC READ ID opcode (0x95).
> +               Additionally, may include a device-specific string consisting of
> +               the manufacturer and name of the chip. Bear in mind
>                 the DT binding is not Linux-only, but in case of Linux, see the
> -               "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c for the list
> +               "m25p_ids" table in drivers/mtd/devices/m25p80.c for the list
>                 of supported chips.
>  - reg : Chip-Select number
>  - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
> @@ -22,7 +25,7 @@ Example:
>  	flash: m25p80@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		compatible = "spansion,m25p80";
> +		compatible = "spansion,m25p80", "nor-jedec";
>  		reg = <0>;
>  		spi-max-frequency = <40000000>;
>  		m25p,fast-read;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
