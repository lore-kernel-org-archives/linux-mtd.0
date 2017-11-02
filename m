Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eAEnB-0001Fy-08
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 12:40:19 +0000
Date: Thu, 2 Nov 2017 13:39:54 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Peter Rosin <peda@axentia.se>, linux-mtd <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org\"  <devicetree@vger.kernel.org>,
 Nicolas Ferre  <nicolas.ferre@microchip.com>"@mail.free-electrons.com
Subject: Re: sam9x5: MTD numbering changed
Message-ID: <20171102133954.055ce285@bbrezillon>
In-Reply-To: <1509621436.16695.3.camel@gmail.com>
References: <1509621436.16695.3.camel@gmail.com>
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

+Nicolas

Hi Richard,

On Thu, 02 Nov 2017 12:17:16 +0100
Richard Genoud <richard.genoud@gmail.com> wrote:

> Hi,
>=20
> I've got an at91sam9g35-cm based board, with 4 partition on the spi-
> dataflas and 5 partitions on the NAND flash.
> Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND bindi=
ngs"),
> the NAND partitions were mtd0-4 and spi-dataflash partitions mtd5-8.
>=20
> Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND bindin=
gs"),
> the spi-dataflash partitions are discovered before the NAND partitions.
> So NAND partition became mtd4-8 and spi-dataflash partition mtd0-3.
>=20
> This broke some script that relied on the mtd numbering.
>=20
> Updating those scripts to rely on the mtd device name instead of
> number=C2=A0is not really a problem. The real problem is when an older
> script using mtd numbering is run on the new system : I expect dead
> kittens everywhere !

Crap! That was one of the thing I was afraid of when changing the
binding: probe order has an impact on ids assigned to MTD devs, and
since things are not defined at the same place in the DT, it changes
the probe order.

>=20
> So, I'd like to know if there's a way to force the older numbering ?

Reverting the patches is probably the easiest way (and it's easily
backportable). Now, if we want to switch to the new bindings at some
point we'll need to support DT aliases for mtd devs:

aliases {
	mtdX =3D &flashpartN;
	mtdY =3D &flashdevM;
};

The problem with this solution is that it only works if all partitions
are defined in the DT, which is not always the case (they can be defined
on the command line with mtdparts=3D).

> (I tried poking around the DTS without succ=C3=A8s).
>=20
> any idea ?

I don't have a perfect solution, but the problem you report clearly
shows that relying on MTD numbering is unsafe and should be avoided.

Regards,

Boris

>=20
> regards,
> Richard.
>=20
>=20
> PS:
> DTS looks like that:
> /dts-v1/;
> #include "at91sam9g35.dtsi"
> #include "at91sam9x5cm.dtsi"
>=20
> / {
> 	ahb {
> 		apb {
> 			spi0: spi@f0000000 {
> 				pinctrl-0 =3D <&pinctrl_spi0 &pinctrl_spi0_cs>;
> 				status =3D "okay";
> 				cs-gpios =3D <&pioA 14 GPIO_ACTIVE_HIGH>, <0>, <0>, <0>;
> 				m25p80@0 {
> 					#address-cells =3D <1>;
> 					#size-cells =3D <1>;
> 					compatible =3D "atmel,at25df321a";
> 					spi-max-frequency =3D <50000000>;
> 					m25p,fast-read;
> 					reg =3D <0>;
>=20
> 					partitions {
> 						compatible =3D "fixed-partitions";
> 						#address-cells =3D <1>;
> 						#size-cells =3D <1>;
>=20
> 						bootpri@0000000 {
> 							label =3D "bootpri";
> 							reg =3D <0x00000000 0x00008000>;
> 						};
>=20
> 						bootsec@0008000 {
> 							label =3D "bootsec";
> 							reg =3D <0x00008000 0x00100000>;
> 						};
>=20
> 						bootenv@00108000 {
> 							label =3D "bootenv";
> 							reg =3D <0x00108000 0x00110000>;
> 						};
>=20
> 						free@00110000 {
> 							label =3D "free";
> 							reg =3D <0x00110000 0x002f0000>;
> 						};
> 					};
> 				};
> 			};
> 		};
>=20
>                 ebi: ebi@10000000 {
>                         nand_controller: nand-controller {
>                                 nand@3 {
>                                         status =3D "okay";
>                                         nand-ecc-strength =3D <4>;
>                                 };
>                         };
>                 };
> 	};
> };
