From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, "robh@kernel.org"
 <robh@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "oss@buserror.net" <oss@buserror.net>, Leo Li
 <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>
Subject: RE: [PATCH 1/2][v6] dt-bindings: mtd-physmap: Add endianness supports
Date: Tue, 27 Mar 2018 12:06:41 +0000
Message-ID: <VI1PR0402MB385456DB28FE27FCF9ACCAB997AC0@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <20180312081128.8195-1-prabhakar.kushwaha@nxp.com>
 <20180323093408.230a61c1@bbrezillon>
In-Reply-To: <20180323093408.230a61c1@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Friday, March 23, 2018 2:04 PM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>;
> robh@kernel.org
> Cc: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org;
> mark.rutland@arm.com; shawnguo@kernel.org; boris.brezillon@free-
> electrons.com; computersforpeace@gmail.com; oss@buserror.net; Leo Li
> <leoyang.li@nxp.com>; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 1/2][v6] dt-bindings: mtd-physmap: Add endianness
> supports
>=20
> On Mon, 12 Mar 2018 13:41:28 +0530
> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
>=20
> > Connection between flash and controller is not necessary to be always
> > of same type. It may varies from platform to platform.
> >
> > Adding endianness (optional) property to provide connection type
> > information.
> >
> > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes for v2: updated subject
> > Changes for v3: fixed typo for "big-endian"
> > Changes for v4: Moved binding definition in mtd-physmap.txt as
> > discussed at
> >
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat
> >
> chwork.ozlabs.org%2Fpatch%2F842543%2F&data=3D02%7C01%7Cprabhakar.ku
> shwah
> >
> a%40nxp.com%7C4e3c62614d144bdbb76408d59098d999%7C686ea1d3bc2b4c
> 6fa92cd
> >
> 99c5c301635%7C0%7C0%7C636573908516332353&sdata=3DOd7aqu%2BqV4RHB
> EmT08UOb
> > H2EFGgWmGfftCRKlOlj1kY%3D&reserved=3D0
> > Changes for v5: Sending as it is
> > Changes for v6: Updated binding when endianness property is absent
> >
> >  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> > b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> > index 4a0a48bf4ecb..691c98f7301d 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> > +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> > @@ -41,6 +41,11 @@ additional (optional) property is defined:
> >
> >   - erase-size : The chip's physical erase block size in bytes.
> >
> > + The device tree may optionally contain endianness property.
> > + little-endian or big-endian : It represents connection between
> > + controller and
>=20
> You still haven't answered the comments I made on your v5. To me, this do=
es
> not represent how the controller and chip pins are connected, but how the
> chip was programmed and which endianness should be used by the
> controller to correctly read the data back. Maybe I'm wrong, hence my
> question.
>=20

NXP's ARM SoC has IFC module which interface with NOR flash. Here IFC is bi=
g endian module connected with NOR flash.=20
As SoC has ARM processor(Littler Endian),  CONFIG_MTD_CFI_BE_BYTE_SWAP need=
s to be enabled  to make sure data is read correctly. =20
This is the reason, I wrote about connection between controller and flash.

In a way, I agree with you.  It is not about connection.=20
It is about how controller read the data (inherently ARM processor)

So I am planning to write below text
little-endian or big-endian: It represents endianness of controller for cor=
rect data reading from flash.=20
                                                 If this property is missin=
g, the endianness is chosen by the system (potentially based
                                                on extra configuration opti=
ons).

please let me know if above definition requires more changes.=20

Regards,
Prabhakar
