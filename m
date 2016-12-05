Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDl54-00047T-PU
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 04:40:48 +0000
Received: by mail-wm0-x244.google.com with SMTP id a20so13337721wme.2
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2016 20:40:25 -0800 (PST)
Subject: Re: [PATCH v6 1/2] mtd: arasan: Add device tree binding documentation
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@atmel.com, robh+dt@kernel.org, mark.rutland@arm.com
References: <1480911066-26157-1-git-send-email-punnaia@xilinx.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, michals@xilinx.com,
 kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <74842d92-840d-a7c2-fb1b-ddab1ac2cf42@gmail.com>
Date: Mon, 5 Dec 2016 05:25:54 +0100
MIME-Version: 1.0
In-Reply-To: <1480911066-26157-1-git-send-email-punnaia@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/05/2016 05:11 AM, Punnaiah Choudary Kalluri wrote:
> This patch adds the dts binding document for arasan nand flash
> controller.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> changes in v6:
> - Removed num-cs property
> - Separated nandchip from nand controller
> changes in v5:
> - None
> Changes in v4:
> - Added num-cs property
> - Added clock support
> Changes in v3:
> - None
> Changes in v2:
> - None
> ---
>  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> new file mode 100644
> index 0000000..dcbe7ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> @@ -0,0 +1,38 @@
> +Arasan Nand Flash Controller with ONFI 3.1 support

Arasan NAND Flash ...

> +Required properties:
> +- compatible: Should be "arasan,nfc-v3p10"

This v3p10 looks like version 3 patchlevel 10, but shouldn't we have
some fallback option which doesn't encode IP version in the compat
string ?

Also, shouldn't quirks be handled by DT props instead of effectively
encoding them into the compatible string ?

> +- reg: Memory map for module access
> +- interrupt-parent: Interrupt controller the interrupt is routed through
> +- interrupts: Should contain the interrupt for the device
> +- clock-name: List of input clocks - "clk_sys", "clk_flash"
> +	      (See clock bindings for details)
> +- clocks: Clock phandles (see clock bindings for details)
> +
> +Optional properties:
> +- arasan,has-mdma: Enables Dma support

'Enables DMA support' , with DMA in caps.

> +for nand partition information please refer the below file

For NAND ...

> +Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example:
> +	nand0: nand@ff100000 {
> +		compatible = "arasan,nfc-v3p10"
> +		reg = <0x0 0xff100000 0x1000>;
> +		clock-name = "clk_sys", "clk_flash"
> +		clocks = <&misc_clk &misc_clk>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 14 4>;
> +		arasan,has-mdma;
> +		#address-cells = <1>;
> +		#size-cells = <0>
> +
> +		nand@0 {
> +			reg = <0>
> +			partition@0 {
> +				label = "filesystem";
> +				reg = <0x0 0x0 0x1000000>;
> +			};
> +			(...)
> +		};
> +	};
> 


-- 
Best regards,
Marek Vasut
