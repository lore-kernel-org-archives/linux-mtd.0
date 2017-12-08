Date: Fri, 8 Dec 2017 21:56:51 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur
 Hershkovits <neta@marvell.com>
Subject: Re: [PATCH 01/12] dt-bindings: mtd: add Marvell NAND controller
 documentation
Message-ID: <20171208215651.70480178@bbrezillon>
In-Reply-To: <20171207201814.30411-2-miquel.raynal@free-electrons.com>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171207201814.30411-2-miquel.raynal@free-electrons.com>
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

On Thu,  7 Dec 2017 21:18:03 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Document the legacy and the new bindings for Marvell NAND controller.
> 
> The pxa3xx_nand.c driver does only support legacy bindings, which are
> incomplete and inaccurate. A rework of this controller (called
> marvell_nand.c) does support both.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/marvell-nand.txt       | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> new file mode 100644
> index 000000000000..0b3d5e0bab83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> @@ -0,0 +1,84 @@
> +Marvell NAND Flash Controller (NFC)
> +
> +Required properties:
> +- compatible: can be one of the following:
> +    * "marvell,armada-8k-nand-controller"
> +    * "marvell,armada370-nand-controller"
> +    * "marvell,pxa3xx-nand-controller"
> +    * "marvell,armada-8k-nand" (deprecated)
> +    * "marvell,armada370-nand" (deprecated)
> +    * "marvell,pxa3xx-nand" (deprecated)
> +- reg: NAND flash controller memory area.
> +- #address-cells: shall be set to 1. Encode the NAND CS.
> +- #size-cells: shall be set to 0.
> +- interrupts: shall define the NAND controller interrupt.
> +- clocks: shall reference the NAND controller clock.
> +- marvell,system-controller: Set to retrieve the syscon node that handles
> +  NAND controller related registers (only required with the
> +  "marvell,armada-8k-nand[-controller]" compatibles).
> +
> +Optional properties:
> +- label: see partition.txt. New platforms shall omit this property.
> +- dmas: shall reference DMA channel associated to the NAND controller.
> +- dma-names: shall be "rxtx".
> +
> +Optional children nodes:
> +Children nodes represent the available NAND chips.
> +
> +Required properties:
> +- reg: shall contain the native Chip Select ids (0-3)
> +- marvell,rb: shall contain the native Ready/Busy ids (0-1)
> +
> +Optional properties:
> +- marvell,nand-keep-config: orders the driver not to take the timings
> +  from the core and leaving them completely untouched. Bootloader
> +  timings will then be used.
> +- nand-on-flash-bbt: see nand.txt.
> +- nand-ecc-mode: see nand.txt. Will use hardware ECC if not specified.
> +- nand-ecc-algo: see nand.txt. This property may be added when using
> +  hardware ECC for clarification but will be ignored by the driver
> +  because ECC mode is chosen depending on the page size and the strength
> +  required by the NAND chip. This value may be overwritten with
> +  nand-ecc-strength property.
> +- nand-ecc-strength: see nand.txt.
> +- nand-ecc-step-size: see nand.txt. This has no effect and will be
> +  ignored by the driver when using hardware ECC because Marvell's NAND
> +  flash controller does use fixed strength (1-bit for Hamming, 16-bit
> +  for BCH), so the step size will shrink or grow in order to fit the
> +  required strength. Step sizes are not completely random for all and
> +  follow certain patterns described in AN-379, "Marvell SoC NFC ECC".
> +
> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
> +generic bindings.
> +
> +
> +Example:
> +nand_controller: nand-controller@d0000 {
> +	compatible = "marvell,armada370-nand-controller";
> +	reg = <0xd0000 0x54>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&coredivclk 0>;
> +
> +	nand@0 {
> +		reg = <0>;
> +		marvell,rb = <0>;
> +		nand-ecc-mode = "hw";
> +		marvell,nand-keep-config;
> +		nand-on-flash-bbt;
> +		nand-ecc-strength = <4>;
> +		nand-ecc-step-size = <512>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "Rootfs";
> +				reg = <0x00000000 0x40000000>;
> +			};
> +		};
> +	};
> +};

Maybe you should also give an example for the old bindings.
BTW, given your properties description, it's not clear which properties
are deprecated. Maybe you should split the doc in 2 sections: one
describing the new bindings, and the other one describing the deprecated
bindings.
