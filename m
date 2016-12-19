Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIxXc-0001qh-SY
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 12:59:45 +0000
Date: Mon, 19 Dec 2016 13:59:16 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>, DT
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Message-ID: <20161219135916.4fd5e546@bbrezillon>
In-Reply-To: <d3cbfda6-23bf-4ad1-b1ce-c179b765272f@sigmadesigns.com>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B06.6030608@sigmadesigns.com> <1978954.SRtJpfOGp1@wuerfel>
 <d3cbfda6-23bf-4ad1-b1ce-c179b765272f@sigmadesigns.com>
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

On Fri, 16 Dec 2016 11:56:38 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> On 07/11/2016 10:18, Arnd Bergmann wrote:
> > On Tuesday, October 25, 2016 3:15:50 PM CET Marc Gonzalez wrote:  
> >> Add the tango NAND Flash Controller dt bindings documentation.
> >>
> >> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/tango-nand.txt | 38 ++++++++++++++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> >> new file mode 100644
> >> index 000000000000..3cbf95d6595a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> >> @@ -0,0 +1,38 @@
> >> +Sigma Designs Tango4 NAND Flash Controller (NFC)
> >> +
> >> +Required properties:
> >> +
> >> +- compatible: "sigma,smp8758-nand"
> >> +- reg: address/size of nfc_reg, nfc_mem, and pbus_reg
> >> +- dmas: reference to the DMA channel used by the controller
> >> +- dma-names: "nfc_sbox"  
> > 
> > Drop the "nfc_" prefix here, it seems redundant.  
> 
> I took a closer look at Documentation/devicetree/bindings and
> arch/arm/boot/dts and it seems the overwhelming nomenclature
> is "rx", "tx" (with variants around these two).
> 
> Should I just use "rxtx" for my driver?
> 
> >> +- clocks: reference to the system clock
> >> +- #address-cells: <1>
> >> +- #size-cells: <0>
> >> +
> >> +Children nodes represent the available NAND chips.
> >> +See Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
> >> +
> >> +Example:
> >> +
> >> +	nand: nand@2c000 {
> >> +		compatible = "sigma,smp8758-nand";
> >> +		reg = <0x2c000 0x30 0x2d000 0x800 0x20000 0x1000>;  
> > 
> > It would be nicer to write this as
> > 
> > 	reg = <0x2c000 0x30>, <0x2d000 0x800>, <0x20000 0x1000>;
> > 
> > which is identical in binary format.  
> 
> This is indeed a marked improvement. Boris, if I fix these two nits,
> can I submit a single patch, or do you want them split?

Sure, just describe the different binding changes in your commit
message.
