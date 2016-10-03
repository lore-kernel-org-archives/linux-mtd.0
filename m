Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1br9NU-00070M-Ks
 for linux-mtd@lists.infradead.org; Mon, 03 Oct 2016 19:58:21 +0000
Received: by mail-it0-x242.google.com with SMTP id l13so7567706itl.2
 for <linux-mtd@lists.infradead.org>; Mon, 03 Oct 2016 12:57:59 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161003185143.GA27634@rob-hp-laptop>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <20160927055957.427-2-albert.aribaud@3adev.fr>
 <20161003185143.GA27634@rob-hp-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Oct 2016 21:57:58 +0200
Message-ID: <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
To: Rob Herring <robh@kernel.org>
Cc: "Albert ARIBAUD (3ADEV)" <albert.aribaud@3adev.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 3, 2016 at 8:51 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Sep 27, 2016 at 07:59:57AM +0200, Albert ARIBAUD (3ADEV) wrote:
>> Introduce spi-bus-width property for bus subnodes, to
>> specify per-bus capability to use NORMAL, FAST, DUAL,
>> and/or QUAD reads.
>>
>> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud@3adev.fr>
>> ---
>>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>
> Make this a common property.

They already exist:

Documentation/devicetree/bindings/spi/spi-bus.txt:
- spi-tx-bus-width - (optional) The bus width (number of data wires) that is
                      used for MOSI. Defaults to 1 if not present.
- spi-rx-bus-width - (optional) The bus width (number of data wires) that is
                      used for MISO. Defaults to 1 if not present.

The above are for normal/dual/quad.

"Fast" is not a property of the bus, but of the SPI slave, right? Cfr.

Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:
- m25p,fast-read : Use the "fast read" opcode to read data from the chip instead
                   of the usual "read" opcode. This opcode is not supported by
                   all chips and support for it can not be detected at runtime.
                   Refer to your chips' datasheet to check if this is supported
                   by your chip.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
