Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bx7cA-00081t-Ts
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 07:18:11 +0000
Date: Thu, 20 Oct 2016 09:17:38 +0200
From: Albert ARIBAUD <albert.aribaud@3adev.fr>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
Message-ID: <20161020091738.37596c14.albert.aribaud@3adev.fr>
In-Reply-To: <CAMuHMdW-L=Wc7mcs6s_N+joEZ8hX7DLHoY_YU0wuvnM=3DN8ug@mail.gmail.com>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <20160927055957.427-2-albert.aribaud@3adev.fr>
 <20161003185143.GA27634@rob-hp-laptop>
 <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
 <20161018220334.6452fc5b.albert.aribaud@3adev.fr>
 <CAMuHMdW-L=Wc7mcs6s_N+joEZ8hX7DLHoY_YU0wuvnM=3DN8ug@mail.gmail.com>
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

Hi Geert,

Le Wed, 19 Oct 2016 08:57:27 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> a =C3=A9crit :

> > The fsl-quadspi driver already supports per-NOR read and erase commands
> > to support heterogeneous NOR setups. A per-NOR bus width property would
> > make sense in this light. =20
>=20
> spi-[tx]x-bus-width is already a property for the SPI slave, not for
> the whole bus.
> So you can use 4 for the quad-capable device, and 1 or 2 for the other.

My bad, then -- I'll use these.

> Gr{oetje,eeting}s,
>=20
>                         Geert

Cordialement,
Albert ARIBAUD
3ADEV
