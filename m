From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.
 org, Neta Zur Hershkovits <neta@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 11/12] ARM64: dts: marvell: use reworked NAND controller
 driver on Armada 7K
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171207201814.30411-12-miquel.raynal@free-electrons.com>
Date: Fri, 15 Dec 2017 11:29:33 +0100
In-Reply-To: <20171207201814.30411-12-miquel.raynal@free-electrons.com>
 (Miquel Raynal's message of "Thu, 7 Dec 2017 21:18:13 +0100")
Message-ID: <87374cmghe.fsf@free-electrons.com>
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

Hi Miquel,
=20
 On jeu., d=C3=A9c. 07 2017, Miquel Raynal <miquel.raynal@free-electrons.co=
m> wrote:

> Use the new bindings of the reworked Marvell NAND controller driver.
> Also adapt the nand controller node organization to distinguish which
> property is relevant for the controller, and which one is NAND chip
> specific. Expose the partitions as a subnode of the NAND chip.
>
> Remove the 'marvell,nand-enable-arbiter' property, not needed anymore as
> the driver activates the arbiter by default for all boards (either
> needed or harmless).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-7040-db.dts     | 52 +++++++++++++---=
------
>  .../boot/dts/marvell/armada-cp110-master.dtsi      |  8 ++--
>  2 files changed, 36 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-7040-db.dts
> index 52b5341cb270..758452c10612 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -156,36 +156,48 @@
>  	};
>  };
>=20=20
> -&cpm_nand {
> +&cpm_nand_controller {
>  	/*
>  	 * SPI on CPM and NAND have common pins on this board. We can
> -	 * use only one at a time. To enable the NAND (whihch will
> +	 * use only one at a time. To enable the NAND (which will
>  	 * disable the SPI), the "status =3D "okay";" line have to be
>  	 * added here.
>  	 */
> -	num-cs =3D <1>;
>  	pinctrl-0 =3D <&nand_pins>, <&nand_rb>;
>  	pinctrl-names =3D "default";
> -	nand-ecc-strength =3D <4>;
> -	nand-ecc-step-size =3D <512>;
> -	marvell,nand-enable-arbiter;
> -	nand-on-flash-bbt;
> -
> -	partition@0 {
> -		label =3D "U-Boot";
> -		reg =3D <0 0x200000>;
> -	};
> -	partition@200000 {
> -		label =3D "Linux";
> -		reg =3D <0x200000 0xe00000>;
> -	};
> -	partition@1000000 {
> -		label =3D "Filesystem";
> -		reg =3D <0x1000000 0x3f000000>;
> +
> +	nand@0 {
> +		reg =3D <0>;
> +		label =3D "pxa3xx_nand-0";
> +		marvell,rb =3D <0>;
> +		nand-on-flash-bbt;
> +		nand-ecc-strength =3D <4>;
> +		nand-ecc-step-size =3D <512>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "U-Boot";
> +				reg =3D <0 0x200000>;
> +			};
> +
> +			partition@200000 {
> +				label =3D "Linux";
> +				reg =3D <0x200000 0xe00000>;
> +			};
> +
> +			partition@1000000 {
> +				label =3D "Filesystem";
> +				reg =3D <0x1000000 0x3f000000>;
> +			};
> +
> +		};
>  	};
>  };
>=20=20
> -
>  &cpm_spi1 {
>  	status =3D "okay";
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/=
arm64/boot/dts/marvell/armada-cp110-master.dtsi
> index e3b64d03fbd8..8a3cff9a7343 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
> @@ -309,17 +309,17 @@
>  				status =3D "disabled";
>  			};
>=20=20
> -			cpm_nand: nand@720000 {
> +			cpm_nand_controller: nand@720000 {
>  				/*
>  				 * Due to the limiation of the pin available
>  				 * this controller is only usable on the CPM
>  				 * for A7K and on the CPS for A8K.
>  				 */
> -				compatible =3D "marvell,armada-8k-nand",
> -					     "marvell,armada370-nand";
> +				compatible =3D "marvell,armada-8k-nand-controller",
> +					     "marvell,armada370-nand-controller";
>  				reg =3D <0x720000 0x54>;
>  				#address-cells =3D <1>;
> -				#size-cells =3D <1>;
> +				#size-cells =3D <0>;
>  				interrupts =3D <ICU_GRP_NSR 115 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&cpm_clk 1 2>;
>  				marvell,system-controller =3D <&cpm_syscon0>;
> --=20
> 2.11.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
