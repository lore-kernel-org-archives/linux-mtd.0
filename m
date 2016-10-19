Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwkov-00086V-Uv
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 06:57:51 +0000
Received: by mail-it0-x242.google.com with SMTP id 66so1107467itl.3
 for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2016 23:57:29 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161018220334.6452fc5b.albert.aribaud@3adev.fr>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <20160927055957.427-2-albert.aribaud@3adev.fr>
 <20161003185143.GA27634@rob-hp-laptop>
 <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
 <20161018220334.6452fc5b.albert.aribaud@3adev.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Oct 2016 08:57:27 +0200
Message-ID: <CAMuHMdW-L=Wc7mcs6s_N+joEZ8hX7DLHoY_YU0wuvnM=3DN8ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
To: Albert ARIBAUD <albert.aribaud@3adev.fr>
Cc: Rob Herring <robh@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Han Xu <han.xu@nxp.com>
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

On Tue, Oct 18, 2016 at 10:03 PM, Albert ARIBAUD
<albert.aribaud@3adev.fr> wrote:
> Le Mon, 3 Oct 2016 21:57:58 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> a =C3=A9crit :
>
>> On Mon, Oct 3, 2016 at 8:51 PM, Rob Herring <robh@kernel.org> wrote:
>> > On Tue, Sep 27, 2016 at 07:59:57AM +0200, Albert ARIBAUD (3ADEV) wrote=
:
>> >> Introduce spi-bus-width property for bus subnodes, to
>> >> specify per-bus capability to use NORMAL, FAST, DUAL,
>> >> and/or QUAD reads.
>> >>
>> >> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud@3adev.fr>
>> >> ---
>> >>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 +++++++++=
+++++++++
>> >>  1 file changed, 18 insertions(+)
>> >
>> > Make this a common property.
>
> @Rob: do you mean common to all slaves, i.e. described
> in ./Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt?
>
>> They already exist:
>>
>> Documentation/devicetree/bindings/spi/spi-bus.txt:
>> - spi-tx-bus-width - (optional) The bus width (number of data wires)
>> that is used for MOSI. Defaults to 1 if not present.
>> - spi-rx-bus-width - (optional) The bus width (number of data wires)
>> that is used for MISO. Defaults to 1 if not present.
>>
>> The above are for normal/dual/quad.
>>
>> "Fast" is not a property of the bus, but of the SPI slave, right? Cfr.
>>
>> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:
>> - m25p,fast-read : Use the "fast read" opcode to read data from the
>> chip instead of the usual "read" opcode. This opcode is not supported
>> by all chips and support for it can not be detected at runtime.
>>                    Refer to your chips' datasheet to check if this is
>> supported by your chip.
>>
>> Gr{oetje,eeting}s,
>
> @Geert: the problem here is that on the board for which I wrote this
> patch, only one of the two NOR slaves can do quad SPI; the other one
> can do dual at best. Setting a bus property would prevent the
> quad-capable device from doing actual quad reads.
>
> The fsl-quadspi driver already supports per-NOR read and erase commands
> to support heterogeneous NOR setups. A per-NOR bus width property would
> make sense in this light.

spi-[tx]x-bus-width is already a property for the SPI slave, not for
the whole bus.
So you can use 4 for the quad-capable device, and 1 or 2 for the other.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
