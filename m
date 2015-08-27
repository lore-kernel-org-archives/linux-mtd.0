Message-ID: <55DF4C82.3070708@st.com>
Date: Thu, 27 Aug 2015 10:44:34 -0700
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
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1440148851-14621-1-git-send-email-marex@denx.de>
In-Reply-To: <1440148851-14621-1-git-send-email-marex@denx.de>
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

Hi,

On 08/21/2015 02:20 AM, Marek Vasut wrote:
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
>  .../devicetree/bindings/mtd/cadence-quadspi.txt    | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
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
> V8: Align lines to 80 chars.
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> new file mode 100644
> index 0000000..f248056
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> @@ -0,0 +1,56 @@
> +* Cadence Quad SPI controller
> +
> +Required properties:
> +- compatible : Should be "cdns,qspi-nor".
> +- reg : Contains two entries, each of which is a tuple consisting of a
> +	physical address and length. The first entry is the address and
> +	length of the controller register set. The second entry is the
> +	address and length of the QSPI Controller data area.

still hooked up with  "Controller data area", it is ambiguous.
Use something which is more clear: Nor Flash memory mapped address.

> +- interrupts : Unit interrupt specifier for the controller interrupt.
> +- clocks : phandle to the Quad SPI clock.
> +- cdns,fifo-depth : Size of the data FIFO in words.
> +- cdns,fifo-width : Bus width of the data FIFO in bytes.
> +- cdns,trigger-address : 32-bit indirect AHB trigger address.
> +
> +Optional properties:

again, is it optional ? can the driver be used without these properties ?

> +- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.

again, add info what the decoder is for ? 

> +
> +Optional subnodes:
> +Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
> +custom properties:
> +- cdns,read-delay : Delay for read capture logic, in clock cycles
> +- cdns,tshsl-ns : Delay in nanoseconds for the length that the master
> +                  mode chip select outputs are de-asserted between
> +		  transactions.
> +- cdns,tsd2d-ns : Delay in nanoseconds between one chip select being
> +                  de-activated and the activation of another.
> +- cdns,tchsh-ns : Delay in nanoseconds between last bit of current
> +                  transaction and deasserting the device chip select
> +		  (qspi_n_ss_out).
> +- cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
> +                  and first bit transfer.
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

flag value ?

Cheers,
Vikas

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
