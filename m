Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3dNQ-0001By-Ph
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2018 08:34:58 +0000
Date: Sat, 22 Sep 2018 10:34:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <christophe.kerello@st.com>
Cc: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND
 controller documentation
Message-ID: <20180922103440.12575714@xps13>
In-Reply-To: <1537199260-7280-2-git-send-email-christophe.kerello@st.com>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
 <1537199260-7280-2-git-send-email-christophe.kerello@st.com>
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

Hi Christophe,

<christophe.kerello@st.com> wrote on Mon, 17 Sep 2018 17:47:38 +0200:

> From: Christophe Kerello <christophe.kerello@st.com>
>=20
> This patch adds the documentation of the device tree bindings for the STM=
32
> FMC2 NAND controller.
>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 90 ++++++++++++++++=
++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand=
.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt b/=
Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> new file mode 100644
> index 0000000..93eaf11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> @@ -0,0 +1,90 @@
> +STMicroelectronics Flexible Memory Controller 2 (FMC2)
> +NAND Interface
> +
> +Required properties:
> +- compatible: "st,stm32mp15-fmc2"

I think this form is preferred:

"
- compatible: Should be one of:
              * st,stm32mp15-fmc2
"

> +- reg: the first contains the register location and length

the register location and length of...?

> +       the second contains the data common space used for cs0 and length
> +       the third contains the cmd attribute space used for cs0 and length
> +       the fourth contains the addr attribute space used for cs0 and len=
gth
> +       the fifth contains the data common space used for cs1 and length
> +       the sixth contains the cmd attribute space used for cs1 and length
> +       the seventh contains the addr attribute space used for cs1 and le=
ngth

Maybe you could simplify a bit with something like:

-reg: NAND flash controller memory areas.
      First region ...
      Regions 2 to 4 respectively contain the data, command, and
      address space for CS0.
      Regions 5 to 7 contain the same areas for CS1.

> +- interrupts: The interrupt number
> +- pinctrl-0: Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
> +- clocks: Use common clock framework
> +
> +Optional properties:
> +- resets: Reference to a reset controller asserting the FMC controller
> +- dmas: DMA specifiers (see: dma/stm32-mdma.txt)
> +- dma-names: Must be "tx", "rx" and "ecc"
> +
> +Optional children nodes:
> +Children nodes represent the available nand chips.

Please s/nand/NAND/ in plain English.

> +
> +Optional properties:
> +- nand-on-flash-bbt: see nand.txt
> +- nand-ecc-strength: see nand.txt
> +- nand-ecc-step-size: see nand.txt
> +- st,fmc2_timings: array of 8 bytes for NAND timings. The meanings of
> +  these bytes are:
> +  byte 0 TCLR      : CLE to RE delay in number of AHB clock cycles, only=
 4 bits
> +                     are valid. Zero means one clock cycle, 15 means 16 =
clock
> +                     cycles.
> +  byte 1 TAR       : ALE to RE delay, 4 bits are valid. Same format as T=
CLR.
> +  byte 2 THIZ      : number of HCLK clock cycles during which the data b=
us is
> +                     kept in Hi-Z (tristate) after the start of a write =
access.
> +                     Only valid for write transactions. Zero means 1 cyc=
le,
> +                     255 means 256 cycles.
> +  byte 3 TWAIT     : number of HCLK clock cycles to assert the command t=
o the
> +                     NAND flash in response to SMWAITn. Zero means 1 cyc=
le,
> +                     255 means 256 cycles.
> +  byte 4 THOLD_MEM : common memory space timing
> +                     number of HCLK clock cycles to hold the address (an=
d data
> +                     when writing) after the command deassertion. Zero m=
eans
> +                     1 cycle, 255 means 256 cycles.
> +  byte 5 TSET_MEM  : common memory space timing
> +                     number of HCLK clock cycles to assert the address b=
efore
> +                     the command is asserted. Zero means 1 cycle, 255 me=
ans 256
> +                     cycles.
> +  byte 6 THOLD_ATT : attribute memory space timing
> +                     number of HCLK clock cycles to hold the address (an=
d data
> +                     when writing) after the command deassertion. Zero m=
eans
> +                     1 cycle, 255 means 256 cycles.
> +  byte 7 TSET_ATT  : attribute memory space timing
> +                     number of HCLK clock cycles to assert the address b=
efore
> +                     the command is asserted. Zero means 1 cycle, 255 me=
ans 256
> +                     cycles.

Let me review the driver but this array of timings is really
suspicious. I am pretty sure you don't need it in the DT.

> +
> +The following ECC strength and step size are currently supported:
> + - nand-ecc-strength =3D <1>, nand-ecc-step-size =3D <512> (HAMMING)
> + - nand-ecc-strength =3D <4>, nand-ecc-step-size =3D <512> (BCH4)
> + - nand-ecc-strength =3D <8>, nand-ecc-step-size =3D <512> (BCH8) (defau=
lt)
> +
> +Example:
> +
> +	fmc2_nand: fmc2_nand@58002000 {
> +		compatible =3D "st,stm32mp15-fmc2";
> +		reg =3D <0x58002000 0x1000>,
> +		      <0x80000000 0x1000>,
> +		      <0x88010000 0x1000>,
> +		      <0x88020000 0x1000>,
> +		      <0x81000000 0x1000>,
> +		      <0x89010000 0x1000>,
> +		      <0x89020000 0x1000>;
> +		interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&rcc FMC_K>;
> +		resets =3D <&rcc FMC_R>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&fmc2_pins_a>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		nand@0 {
> +			reg =3D <0>;
> +			nand-on-flash-bbt;
> +			st,fmc2_timings =3D /bits/ 8 <2 2 1 7 1 0 104 25>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +		};
> +	};

Thanks,
Miqu=C3=A8l
