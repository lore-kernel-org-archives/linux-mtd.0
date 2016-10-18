Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwacP-00064G-3L
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 20:04:14 +0000
Date: Tue, 18 Oct 2016 22:03:34 +0200
From: Albert ARIBAUD <albert.aribaud@3adev.fr>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
Message-ID: <20161018220334.6452fc5b.albert.aribaud@3adev.fr>
In-Reply-To: <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <20160927055957.427-2-albert.aribaud@3adev.fr>
 <20161003185143.GA27634@rob-hp-laptop>
 <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
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

Hi Rob and Geert,

Le Mon, 3 Oct 2016 21:57:58 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> a =C3=A9crit :

> On Mon, Oct 3, 2016 at 8:51 PM, Rob Herring <robh@kernel.org> wrote:
> > On Tue, Sep 27, 2016 at 07:59:57AM +0200, Albert ARIBAUD (3ADEV) wrote:=
 =20
> >> Introduce spi-bus-width property for bus subnodes, to
> >> specify per-bus capability to use NORMAL, FAST, DUAL,
> >> and/or QUAD reads.
> >>
> >> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud@3adev.fr>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 ++++++++++=
++++++++
> >>  1 file changed, 18 insertions(+) =20
> >
> > Make this a common property. =20

@Rob: do you mean common to all slaves, i.e. described
in ./Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt?

> They already exist:
>=20
> Documentation/devicetree/bindings/spi/spi-bus.txt:
> - spi-tx-bus-width - (optional) The bus width (number of data wires)
> that is used for MOSI. Defaults to 1 if not present.
> - spi-rx-bus-width - (optional) The bus width (number of data wires)
> that is used for MISO. Defaults to 1 if not present.
>=20
> The above are for normal/dual/quad.
>=20
> "Fast" is not a property of the bus, but of the SPI slave, right? Cfr.
>=20
> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:
> - m25p,fast-read : Use the "fast read" opcode to read data from the
> chip instead of the usual "read" opcode. This opcode is not supported
> by all chips and support for it can not be detected at runtime.
>                    Refer to your chips' datasheet to check if this is
> supported by your chip.
>=20
> Gr{oetje,eeting}s,

@Geert: the problem here is that on the board for which I wrote this
patch, only one of the two NOR slaves can do quad SPI; the other one
can do dual at best. Setting a bus property would prevent the
quad-capable device from doing actual quad reads.

The fsl-quadspi driver already supports per-NOR read and erase commands
to support heterogeneous NOR setups. A per-NOR bus width property would
make sense in this light.

Cordialement,
Albert ARIBAUD
3ADEV
