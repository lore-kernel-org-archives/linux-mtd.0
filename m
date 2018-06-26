Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXsPc-0007cJ-EE
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2018 18:09:58 +0000
Date: Tue, 26 Jun 2018 20:09:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Richard Weinberger <richard@nod.at>, DTML
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marek =?UTF-8?B?VmHFoXV0?= <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] arm: dts: socfpga: denali needs nand_x_clk too
Message-ID: <20180626200928.29aca979@xps13>
In-Reply-To: <CAK7LNATyo+7gauyQcRmNfCs8CagU1XdpHHgREMeTvf4rqxpeNQ@mail.gmail.com>
References: <20180619120719.26921-1-richard@nod.at>
 <CAK7LNASgPa4D0Siyo3mvK_AJ2zaECDXGaMEn-iNzQ9PFXFir+w@mail.gmail.com>
 <3320422.EJ8D6C0VHL@blindfold>
 <d4fdcd1d-db20-1837-a037-0982a042d357@kernel.org>
 <20180625165506.484e025f@bbrezillon>
 <CAK7LNATyo+7gauyQcRmNfCs8CagU1XdpHHgREMeTvf4rqxpeNQ@mail.gmail.com>
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

Hi Masahiro,

On Tue, 26 Jun 2018 11:38:21 +0900, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> 2018-06-25 23:55 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> > On Mon, 25 Jun 2018 09:50:18 -0500
> > Dinh Nguyen <dinguyen@kernel.org> wrote:
> > =20
> >> On 06/22/2018 10:58 AM, Richard Weinberger wrote: =20
> >> > Masahiro,
> >> >
> >> > Am Freitag, 22. Juni 2018, 16:37:21 CEST schrieb Masahiro Yamada: =20
> >> >> Hi Richard,
> >> >>
> >> >>
> >> >> 2018-06-19 21:07 GMT+09:00 Richard Weinberger <richard@nod.at>: =20
> >> >>> The denali NAND flash controller needs at least two clocks to oper=
ate,
> >> >>> nand_clk and nand_x_clk.
> >> >>> Since 1bb88666775e ("mtd: nand: denali: handle timing parameters by
> >> >>> setup_data_interface()") nand_x_clk is used to derive timing setti=
ngs.
> >> >>>
> >> >>> Signed-off-by: Richard Weinberger <richard@nod.at>
> >> >>> ---
> >> >>> Strictly speaking denali needs a ecc_clk too, but AFAIK such a clo=
ck
> >> >>> is not present on this SoC.
> >> >>> But my SoCFPGA knowledge is very limited.
> >> >>>
> >> >>> Thanks,
> >> >>> //richard
> >> >>> ---
> >> >>>  arch/arm/boot/dts/socfpga.dtsi | 3 ++-
> >> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >>>
> >> >>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/so=
cfpga.dtsi
> >> >>> index 486d4e7433ed..562f7b375bbd 100644
> >> >>> --- a/arch/arm/boot/dts/socfpga.dtsi
> >> >>> +++ b/arch/arm/boot/dts/socfpga.dtsi
> >> >>> @@ -754,7 +754,8 @@
> >> >>>                         reg-names =3D "nand_data", "denali_reg";
> >> >>>                         interrupts =3D <0x0 0x90 0x4>;
> >> >>>                         dma-mask =3D <0xffffffff>;
> >> >>> -                       clocks =3D <&nand_clk>;
> >> >>> +                       clocks =3D <&nand_clk>, <&nand_x_clk>;
> >> >>> +                       clock-names =3D "nand", "nand_x"; =20
> >> >>
> >> >>
> >> >> IMHO, this should be
> >> >>
> >> >>                           clocks =3D <&nand_clk>, <&nand_x_clk>, <&=
nand_x_clk>;
> >> >>                           clock-names =3D "nand", "nand_x", "ecc"; =
=20
> >>
> >> No, it should be just the nand_x and ecc.
> >>
> >> There's already a patch to use the nand_x_clk and not the nand_clk. =20
>=20
>=20
> Different people try to fix the problem in different ways.
>=20
> I think it is due to miscommunication across sub-systems.

Is the series named

        mtd: rawnand: denali: add new clocks and improve
    	                      setup_data_interface

still valid?

I am about to apply it (patches 2/5 to 5/5) but it looks like the
discussion is still ongoing.

Thanks,
Miqu=C3=A8l
