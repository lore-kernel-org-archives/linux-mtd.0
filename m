Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezNym-0006FQ-Oz
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 14:47:43 +0000
Date: Fri, 23 Mar 2018 15:47:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] devicetree: Add devicetree bindings
 documentation for
Message-ID: <20180323154727.6c7951c6@xps13>
In-Reply-To: <1521807722-21626-6-git-send-email-nagasure@xilinx.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
 <1521807722-21626-6-git-send-email-nagasure@xilinx.com>
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

Hi Naga,

On Fri, 23 Mar 2018 17:52:02 +0530, Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:

> Add bindings documentation for Zynq QSPI driver.
>=20
> Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
> ---
>  .../devicetree/bindings/spi/spi-zynq-qspi.txt      | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt b/Do=
cumentation/devicetree/bindings/spi/spi-zynq-qspi.txt
> new file mode 100644
> index 0000000..fe3b8e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
> @@ -0,0 +1,28 @@
> +Xilinx Zynq QSPI controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible		: Should be "xlnx,zynq-qspi-1.0".

What is this trailing "-1.0" for?

> +- reg			: Physical base address and size of QSPI registers map.
> +- interrupts		: Property with a value describing the interrupt
> +			  number.
> +- interrupt-parent	: Must be core interrupt controller
> +- clock-names		: List of input clock names - "ref_clk", "pclk"
> +			  (See clock bindings for details).
> +- clocks		: Clock phandles (see clock bindings for details).
> +
> +Optional properties:
> +- num-cs		: Number of chip selects used.
> +- is-dual		: QSPI operating in Dual parallel.
> +- is-satcked		: QSPI operating in Stacked mode.

        ^ stacked

BTW, if you have both is-dual and is-stacked properties in the DT, do
you really need a configuration option for that?

> +
> +Example:
> +	qspi@e000d000 {
> +		compatible =3D "xlnx,zynq-qspi-1.0";
> +		clock-names =3D "ref_clk", "pclk";
> +		clocks =3D <&clkc 10>, <&clkc 43>;
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <0 19 4>;
> +		num-cs =3D <1>;
> +		reg =3D <0xe000d000 0x1000>;
> +	} ;

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
