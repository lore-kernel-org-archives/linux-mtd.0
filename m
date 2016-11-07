Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3g4q-0006ky-Q8
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2016 09:18:55 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mason <slash.tmp@free.fr>, Sebastian Frias <sf84@laposte.net>
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Date: Mon, 07 Nov 2016 10:18:10 +0100
Message-ID: <1978954.SRtJpfOGp1@wuerfel>
In-Reply-To: <580F5B06.6030608@sigmadesigns.com>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B06.6030608@sigmadesigns.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, October 25, 2016 3:15:50 PM CET Marc Gonzalez wrote:
> Add the tango NAND Flash Controller dt bindings documentation.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
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

Drop the "nfc_" prefix here, it seems redundant.

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

It would be nicer to write this as

	reg = <0x2c000 0x30>, <0x2d000 0x800>, <0x20000 0x1000>;

which is identical in binary format.

	Arnd
