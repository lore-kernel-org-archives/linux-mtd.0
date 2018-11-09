Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL0I4-0001C1-Bk
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 06:29:13 +0000
Date: Fri, 9 Nov 2018 07:28:57 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <michals@xilinx.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nagasuresh12@gmail.com>, <robh@kernel.org>
Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
Message-ID: <20181109072857.75e86cb6@bbrezillon>
In-Reply-To: <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

On Fri, 9 Nov 2018 10:30:39 +0530
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> This patch adds the dts binding document for arasan nand flash controller
> 
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v12:
>  - Removed interrupt-parent description as it is implied as suggested by
>    Rob Herring
>  - Added missing ';' as required
> Changes in v11:
>  - Updated compatible description as suggested by Boris
>  - Removed arasan-has-dma property
> Changes in v10:
>  - None
> Changes in v9:
>  - None
> Changes in v8:
>  - Updated compatible and clock-names as per Boris comments
> Changes in v7:
>  - Corrected the acronyms those should be in caps
> Changes in v6:
>  - Removed num-cs property
>  - Separated nandchip from nand controller
> Changes in v5:
>  - None
> Changes in v4:
>  - Added num-cs property
>  - Added clock support
> Changes in v3:
>  - None
> Changes in v2:
>  - None
> ---
>  .../devicetree/bindings/mtd/arasan_nand.txt        | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> new file mode 100644
> index 0000000..b522daf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
> @@ -0,0 +1,32 @@
> +Arasan NAND Flash Controller with ONFI 3.1 support
> +
> +Required properties:
> +- compatible:		Should be "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
> +- reg:			Memory map for module access
> +- interrupts:		Should contain the interrupt for the device
> +- clock-name:		List of input clocks - "sys", "flash"
> +			(See clock bindings for details)
> +- clocks:		Clock phandles (see clock bindings for details)
> +
> +Required properties for child node:
> +- nand-ecc-mode: see nand.txt

Why is it required? Can't you fallback to HW when this prop is missing?
Oh, and reg is not listed in the required props.

> +
> +For NAND partition information please refer the below file
> +Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example:
> +	nfc: nand@ff100000 {
> +		compatible = "xlnx,zynqmp-nand", "arasan,nfc-v3p10";
> +		reg = <0x0 0xff100000 0x1000>;
> +		clock-name = "sys", "flash";
> +		clocks = <&misc_clk &misc_clk>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 14 4>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		nand@0 {
> +			reg = <0>;
> +			nand-ecc-mode = "hw";
> +		};
> +	};
