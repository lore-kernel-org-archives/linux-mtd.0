Message-ID: <55D29A0B.20408@st.com>
Date: Mon, 17 Aug 2015 19:35:55 -0700
From: vikas <vikas.manocha@st.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Graham Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1439522892-7524-1-git-send-email-marex@denx.de>
In-Reply-To: <1439522892-7524-1-git-send-email-marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On 08/13/2015 08:28 PM, Marek Vasut wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> Add binding document for the Cadence QSPI controller.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alan Tull <atull@opensource.altera.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Graham Moore <grmoore@opensource.altera.com>
> Cc: Vikas MANOCHA <vikas.manocha@st.com>
> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/mtd/cadence_quadspi.txt    | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> 
> V2: Add cdns prefix to driver-specific bindings.
> V3: Use existing property "is-decoded-cs" instead of creating a
>     duplicate, "ext-decoder". Timing parameters are in nanoseconds,
>     not master reference clocks. Remove bus-num completely.
> V4: Add new properties fifo-width and trigger-address
> V7: - Prefix all of the Cadence-specific properties with cdns prefix,
>       those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
>       "cdns,fifo-width", "cdns,trigger-address".
>     - Drop bogus properties which were not used and were incorrect.
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> new file mode 100644
> index 0000000..ebaf1fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> @@ -0,0 +1,50 @@
> +* Cadence Quad SPI controller
> +
> +Required properties:
> +- compatible : Should be "cdns,qspi-nor".
> +- reg : Contains two entries, each of which is a tuple consisting of a
> +	physical address and length.  The first entry is the address and
> +	length of the controller register set.  The second entry is the
> +	address and length of the QSPI Controller data area.

"Controller data area", i think it means mapped NOR Flash address ?
If yes, it would be more clear with "Physical base address & size of NOR Flash".

> +- interrupts : Unit interrupt specifier for the controller interrupt.
> +- clocks : phandle to the Quad SPI clock.
> +- cdns,fifo-depth : Size of the data FIFO in words.

It actually is sram-depth, better would be "sram-depth" to avoid confusion.

> +- cdns,fifo-width: Bus width of the data FIFO in bytes.
> +- cdns,trigger-address : 32-bit indirect AHB trigger address.

we might make trigger-address also part of property "reg".

> +
> +Optional properties:
> +- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.

Not clear about the usage of decoder, if it does not make sense we might remove it from driver.

> +
> +Optional subnodes:

I think flash subnode is mandatory.

Rgds,
Vikas

> +Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
> +custom properties:
> +- cdns,read-delay : Delay for read capture logic, in clock cycles
> +- cdns,tshsl-ns : Delay in nanoseconds for the length that the master mode chip select outputs are de-asserted between transactions.
> +- cdns,tsd2d-ns : Delay in nanoseconds between one chip select being de-activated and the activation of another.
> +- cdns,tchsh-ns : Delay in nanoseconds between last bit of current transaction and deasserting the device chip select (qspi_n_ss_out).
> +- cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low and first bit transfer.
> +
> +Example:
> +
> +	qspi: spi@ff705000 {
> +		compatible = "cdns,qspi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0xff705000 0x1000>,
> +		      <0xffa00000 0x1000>;
> +		interrupts = <0 151 4>;
> +		clocks = <&qspi_clk>;
> +		cdns,is-decoded-cs;
> +		cdns,fifo-depth = <128>;
> +		cdns,fifo-width = <4>;
> +		cdns,trigger-address = <0x00000000>;
> +
> +		flash0: n25q00@0 {
> +			...
> +			cdns,read-delay = <4>;
> +			cdns,tshsl-ns = <50>;
> +			cdns,tsd2d-ns = <50>;
> +			cdns,tchsh-ns = <4>;
> +			cdns,tslch-ns = <4>;
> +		};
> +	};
> 
