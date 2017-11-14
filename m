Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEcsv-0000DP-NP
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 15:12:23 +0000
Subject: Re: [PATCH v4 02/16] ARM: dts: OMAP2+: Add compatible property to
 onenand node
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111211735.2a3q5lw4itsltjrw@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <ac576e3c-5df6-850f-c8d7-58aee395b3e9@ti.com>
Date: Tue, 14 Nov 2017 17:11:47 +0200
MIME-Version: 1.0
In-Reply-To: <20171111211735.2a3q5lw4itsltjrw@lenoch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BF
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 11/11/17 23:17, Ladislav Michl wrote:
> OMAP onenand nodes are missing compatible property, add it.
>=20
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

Acked-by: Roger Quadros <rogerq@ti.com>

How about updating bindings/mtd/gpmc-onenand.txt in a separate patch?

> ---
>  Changes:
>  -v4: new patch
>=20
>  arch/arm/boot/dts/omap2420-n8x0-common.dtsi | 1 +
>  arch/arm/boot/dts/omap3-n900.dts            | 1 +
>  arch/arm/boot/dts/omap3-n950-n9.dtsi        | 1 +
>  arch/arm/boot/dts/omap3430-sdp.dts          | 1 +
>  4 files changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi b/arch/arm/boot/=
dts/omap2420-n8x0-common.dtsi
> index 1de80c7886ab..843f6a2f5e29 100644
> --- a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
> +++ b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
> @@ -48,6 +48,7 @@
>  	onenand@0,0 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> +		compatible =3D "ti,omap2-onenand";
>  		reg =3D <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
> =20
>  		gpmc,sync-read;
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n=
900.dts
> index 4acd32a1c4ef..aa5b1a439564 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -838,6 +838,7 @@
>  	onenand@0,0 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> +		compatible =3D "ti,omap2-onenand";
>  		reg =3D <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
> =20
>  		gpmc,sync-read;
> diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/oma=
p3-n950-n9.dtsi
> index 1b0bd72945f2..cb3c7b2fce52 100644
> --- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
> +++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
> @@ -367,6 +367,7 @@
>  	onenand@0,0 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> +		compatible =3D "ti,omap2-onenand";
>  		reg =3D <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
> =20
>  		gpmc,sync-read;
> diff --git a/arch/arm/boot/dts/omap3430-sdp.dts b/arch/arm/boot/dts/omap3=
430-sdp.dts
> index d50a105c9dc6..ed65795ccc62 100644
> --- a/arch/arm/boot/dts/omap3430-sdp.dts
> +++ b/arch/arm/boot/dts/omap3430-sdp.dts
> @@ -155,6 +155,7 @@
>  		linux,mtd-name=3D "samsung,kfm2g16q2m-deb8";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> +		compatible =3D "ti,omap2-onenand";
>  		reg =3D <2 0 0x20000>;	/* CS2, offset 0, IO size 4 */
> =20
>  		gpmc,device-width =3D <2>;
>=20

--=20
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki
