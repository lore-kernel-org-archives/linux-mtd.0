From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: arm@kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] ARM: mvebu: ix4-300d: Add compatible property to
 "partitions" node
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
 <1450694033-27717-2-git-send-email-geert+renesas@glider.be>
Date: Mon, 21 Dec 2015 17:48:48 +0100
In-Reply-To: <1450694033-27717-2-git-send-email-geert+renesas@glider.be>
 (Geert Uytterhoeven's message of "Mon, 21 Dec 2015 11:33:45 +0100")
Message-ID: <87zix3rbm7.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
=20
 On lun., d=C3=A9c. 21 2015, Geert Uytterhoeven <geert+renesas@glider.be> w=
rote:

> As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compatible
> property to "partitions" node"), the "partitions" subnode of an SPI
> FLASH device node must have a compatible property. The partitions are no
> longer detected if it is not present.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Brian Norris <computersforpeace@gmail.com>

Applied on mvebu/dt (with the hope that it is still time to push it to
arm-soc)

Thanks,

Gregory

> ---
> v2:
>   - Add Acked-by.
> ---
>  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/b=
oot/dts/armada-xp-lenovo-ix4-300d.dts
> index 13cf69a8d0fb392b..fb9e1bbf23385b85 100644
> --- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> +++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> @@ -152,6 +152,7 @@
>  				nand-on-flash-bbt;
>=20=20
>  				partitions {
> +					compatible =3D "fixed-partitions";
>  					#address-cells =3D <1>;
>  					#size-cells =3D <1>;
>=20=20
> --=20
> 1.9.1
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
