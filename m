Date: Thu, 19 Oct 2017 00:01:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Daniel Mack <daniel@zonque.org>, David
 Woodhouse <dwmw2@infradead.org>, devel@driverdev.osuosl.org,
 devicetree@vger.kernel.org, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Gregory Clement
 <gregory.clement@free-electrons.com>, Han Xu <han.xu@nxp.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jason Cooper <jason@lakedaemon.net>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org, Marc
 Gonzalez <marc_gonzalez@sigmadesigns.com>, Marek Vasut
 <marek.vasut@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Masahiro
 Yamada <yamada.masahiro@socionext.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Richard Weinberger
 <richard@nod.at>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring
 <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner
 <stefan@agner.ch>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Wenyou Yang <wenyou.yang@atmel.com>, Will Deacon
 <will.deacon@arm.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Igor Grinberg
 <grinberg@compulab.co.il>, Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz
 <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Hanna Hawa
 <hannah@marvell.com>
Subject: Re: [RFC 05/12] dt-bindings: mtd: add Marvell NAND controller
 documentation
Message-ID: <20171019000158.43140ce0@bbrezillon>
In-Reply-To: <20171018143629.29302-6-miquel.raynal@free-electrons.com>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171018143629.29302-6-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Oct 2017 16:36:22 +0200
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Document the bindings for the legacy and the new bindings relative to
> Marvell NAND controller driver rework.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/marvell-nand.txt       | 95 ++++++++++++++++=
++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Doc=
umentation/devicetree/bindings/mtd/marvell-nand.txt
> new file mode 100644
> index 000000000000..ea99f426c03f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> @@ -0,0 +1,95 @@
> +Marvell NAND Flash Controller (NFC)
> +
> +Required properties:
> +C'est faux, t'en a rajout=C3=A9 un y a pas longtps :).
> +Je conseille de mettre =C3=A7a sous forme de liste, genre

Oops! French words slipped in :-).

> +
> +- compatible: can be one of the following:
> +    * "marvell,armada-8k-nand-controller"
> +    * "marvell,armada370-nand-controller"
> +    * "marvell,pxa3xx-nand-controller"
> +    * "marvell,armada-8k-nand" (deprecated)
> +    * "marvell,armada370-nand" (deprecated)
> +    * "marvell,pxa3xx-nand" (deprecated)
> +- reg: shall contain registers location and length for data and reg.
> +- #address-cells: shall be set to 1. Encode the nand CS.
> +- #size-cells: shall be set to 0.
> +- interrupts: shall define the nand controller interrupt.
> +- clocks: shall reference nand controller clocks.
> +- marvell,system-controller: Set to retrieve the syscon node that handles
> +  NAND controller related registers (only required with the
> +  "marvell,armada-8k-nand[-controller]" compatibles).
> +
> +Optional properties:
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
> +- marvell,nand-enable-arbiter: only useful for PXA platforms, will
> +  enable bus arbiter between NFC and DFI bus (must be enabled for
> +  NFC operation)
> +- nand-on-flash-bbt: speed up the boot process by not discovering all
> +  the bad blocks at each boot and reading directly an on flash table.
> +- nand-ecc-mode: one of the supported ECC modes ("none", "soft",
> +  "hw"). If not specified, hardware ECC will be used.
> +- nand-ecc-algo: algorithm to use if previous choice was "soft"
> +  ("hamming" or "bch). This property may be added for hardware ECC for
> +  clarification but will be ignored by the driver because ECC mode is
> +  chosen depending on the page size and the strength required by the
> +  NAND chip. This value may be overwritten with the nand-ecc-strength
> +  property.
> +- nand-ecc-strength: desired ECC strength.
> +- nand-ecc-step-size: indication on the ECC step size. This has no
> +  effect and will be ignored by the driver when using hardware
> +  ECC. Because Marvell's NAND flash controller does use fixed strength
> +  (1-bit for Hamming, 16-bit for BCH), the step size will shrink or
> +  grown in order to fit the required strength and the value
> +  updated. Step sizes are not completely random for all and follow
> +  certain patterns described in AN-379, "Marvell SoC NFC ECC".
> +
> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
> +generic bindings.
> +
> +
> +Example:
> +nand_controller: nand-controller@d0000 {
> +	compatible =3D "marvell,armada370-nand-controller";
> +	reg =3D <0xd0000 0x54>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks =3D <&coredivclk 0>;
> +	status =3D "okay";
> +
> +	nand@0 {
> +		reg =3D <0>;
> +		marvell,rb =3D <0>;
> +		nand-ecc-mode =3D "hw";
> +		marvell,nand-keep-config;
> +		marvell,nand-enable-arbiter;
> +		nand-on-flash-bbt;
> +		nand-ecc-strength =3D <4>;
> +		nand-ecc-step-size =3D <512>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "Rootfs";
> +				reg =3D <0x00000000 0x40000000>;
> +			};
> +		};
> +	};
> +};
