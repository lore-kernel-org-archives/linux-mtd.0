Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHseZ-00061K-Cq
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 13:34:28 +0000
Date: Fri, 16 Dec 2016 13:33:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mason <slash.tmp@free.fr>, Sebastian Frias <sf84@laposte.net>,
 Mans Rullgard <mans@mansr.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Message-ID: <20161216133316.GE20265@leverpostej>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B06.6030608@sigmadesigns.com> <1978954.SRtJpfOGp1@wuerfel>
 <d3cbfda6-23bf-4ad1-b1ce-c179b765272f@sigmadesigns.com>
 <ee9efd0a-59f5-8c21-0cad-40ca30e3a3e7@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee9efd0a-59f5-8c21-0cad-40ca30e3a3e7@sigmadesigns.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 16, 2016 at 02:26:33PM +0100, Marc Gonzalez wrote:
> On 16/12/2016 11:56, Marc Gonzalez wrote:
> > Should I just use "rxtx" for my driver?
> 
> On IRC, Arnd wrote:
> 
> "The string for dma-names is not important, it just needs to be documented
> in the binding. If you have hardware specifications, use the name that is
> next to the wire for the dma-request line. "dma-names" is only required so
> you can connect a single dmarq to multiple dma engines (most chips only
> connect each rq to one dmaengine though)."
> 
> In my system, peripheral devices are connected to DMA channels via
> a multiplexer called the "host switch box". The documentation calls
> the ports FOO_SBOX and SBOX_FOO.
> 
> For MLC NAND Flash controller 0, the ports are mlc_flash0_sbox
> and sbox_mlc_flash0.
> 
> Additionally, the DMA driver handles both directions, so the DT only
> defines a single duplex channel.
> 
> I originally used "nfc_sbox" (nfc = NAND Flash controller) to stick to
> the HW naming, but I am willing to change it to "rxtx" if that's what
> Boris prefers, (or just "sbox", but Mans pointed out that this was too
> specific, and future HW might do away with the switch box).

"rxtx" is the best option, if you need a name at all.

The name is relative to the device instance, so "nfc_" is unnecessary;
we know the node is an NFC controller. The sbox is part of the SoC
wiring rather than being part of the NFC controller, so the "sbox" part
also shouldn't be part of the name.

Likewise for the NAND flash controller. There, the "0" instance number
also shouldn't have been there -- the name is relative to the instance,
and two instances should use the same names. Too late now, I guess. :(

Thanks,
Mark.
