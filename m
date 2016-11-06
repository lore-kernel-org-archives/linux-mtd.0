Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3WNm-0002BW-W8
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2016 22:57:48 +0000
Date: Sun, 6 Nov 2016 23:57:25 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, DT <devicetree@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, Mason
 <slash.tmp@free.fr>, Sebastian Frias <sf84@laposte.net>
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Message-ID: <20161106235725.7ce08b4d@bbrezillon>
In-Reply-To: <580F5B06.6030608@sigmadesigns.com>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B06.6030608@sigmadesigns.com>
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

On Tue, 25 Oct 2016 15:15:50 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> Add the tango NAND Flash Controller dt bindings documentation.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Applied after renaming the nand controller node.

Thanks,

Boris

> ---
>  Documentation/devicetree/bindings/mtd/tango-nand.txt | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> new file mode 100644
> index 000000000000..3cbf95d6595a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> @@ -0,0 +1,38 @@
> +Sigma Designs Tango4 NAND Flash Controller (NFC)
> +
> +Required properties:
> +
> +- compatible: "sigma,smp8758-nand"
> +- reg: address/size of nfc_reg, nfc_mem, and pbus_reg
> +- dmas: reference to the DMA channel used by the controller
> +- dma-names: "nfc_sbox"
> +- clocks: reference to the system clock
> +- #address-cells: <1>
> +- #size-cells: <0>
> +
> +Children nodes represent the available NAND chips.
> +See Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
> +
> +Example:
> +
> +	nand: nand@2c000 {
> +		compatible = "sigma,smp8758-nand";
> +		reg = <0x2c000 0x30 0x2d000 0x800 0x20000 0x1000>;
> +		dmas = <&dma0 3>;
> +		dma-names = "nfc_sbox";
> +		clocks = <&clkgen SYS_CLK>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		nand@0 {
> +			reg = <0>; /* CS0 */
> +			nand-ecc-strength = <14>;
> +			nand-ecc-step-size = <1024>;
> +		};
> +
> +		nand@1 {
> +			reg = <1>; /* CS1 */
> +			nand-ecc-strength = <14>;
> +			nand-ecc-step-size = <1024>;
> +		};
> +	};
