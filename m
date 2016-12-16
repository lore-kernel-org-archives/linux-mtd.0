Received: from mail1.bemta12.messagelabs.com ([216.82.251.8])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHsXT-00037N-Cx
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 13:27:08 +0000
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
To: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, DT <devicetree@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mason
 <slash.tmp@free.fr>, Sebastian Frias <sf84@laposte.net>, Mans Rullgard
 <mans@mansr.com>, Mark Brown <broonie@kernel.org>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B06.6030608@sigmadesigns.com> <1978954.SRtJpfOGp1@wuerfel>
 <d3cbfda6-23bf-4ad1-b1ce-c179b765272f@sigmadesigns.com>
Message-ID: <ee9efd0a-59f5-8c21-0cad-40ca30e3a3e7@sigmadesigns.com>
Date: Fri, 16 Dec 2016 14:26:33 +0100
MIME-Version: 1.0
In-Reply-To: <d3cbfda6-23bf-4ad1-b1ce-c179b765272f@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Language: 
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16/12/2016 11:56, Marc Gonzalez wrote:
> On 07/11/2016 10:18, Arnd Bergmann wrote:
>> On Tuesday, October 25, 2016 3:15:50 PM CET Marc Gonzalez wrote:
>>> Add the tango NAND Flash Controller dt bindings documentation.
>>>
>>> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
>>> ---
>>>  Documentation/devicetree/bindings/mtd/tango-nand.txt | 38 ++++++++++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
>>> new file mode 100644
>>> index 000000000000..3cbf95d6595a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
>>> @@ -0,0 +1,38 @@
>>> +Sigma Designs Tango4 NAND Flash Controller (NFC)
>>> +
>>> +Required properties:
>>> +
>>> +- compatible: "sigma,smp8758-nand"
>>> +- reg: address/size of nfc_reg, nfc_mem, and pbus_reg
>>> +- dmas: reference to the DMA channel used by the controller
>>> +- dma-names: "nfc_sbox"
>>
>> Drop the "nfc_" prefix here, it seems redundant.
> 
> I took a closer look at Documentation/devicetree/bindings and
> arch/arm/boot/dts and it seems the overwhelming nomenclature
> is "rx", "tx" (with variants around these two).
> 
> Should I just use "rxtx" for my driver?

On IRC, Arnd wrote:

"The string for dma-names is not important, it just needs to be documented
in the binding. If you have hardware specifications, use the name that is
next to the wire for the dma-request line. "dma-names" is only required so
you can connect a single dmarq to multiple dma engines (most chips only
connect each rq to one dmaengine though)."

In my system, peripheral devices are connected to DMA channels via
a multiplexer called the "host switch box". The documentation calls
the ports FOO_SBOX and SBOX_FOO.

For MLC NAND Flash controller 0, the ports are mlc_flash0_sbox
and sbox_mlc_flash0.

Additionally, the DMA driver handles both directions, so the DT only
defines a single duplex channel.

I originally used "nfc_sbox" (nfc = NAND Flash controller) to stick to
the HW naming, but I am willing to change it to "rxtx" if that's what
Boris prefers, (or just "sbox", but Mans pointed out that this was too
specific, and future HW might do away with the switch box).

I'm open to comments.

Regards.
