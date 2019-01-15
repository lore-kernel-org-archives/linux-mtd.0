Subject: Re: [PATCH] ARM: tegra: add "jedec,spi-nor" flash compatible binding
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, Stephen Warren
 <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>,
 <linux-tegra@vger.kernel.org>
CC: <linux-mtd@lists.infradead.org>
References: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cd7aed36-7a89-e129-9db5-16237f9e40e6@nvidia.com>
Date: Tue, 15 Jan 2019 15:09:46 +0000
MIME-Version: 1.0
In-Reply-To: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 16/08/2015 07:13, Rafa=C5=82 Mi=C5=82ecki wrote:
> Starting with commit 8947e396a829 ("Documentation: dt: mtd: replace
> "nor-jedec" binding with "jedec, spi-nor"") we have "jedec,spi-nor"
> binding indicating support for JEDEC identification.
>=20
> Use it for all flashes that are supposed to support READ ID op according
> to the datasheets.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts    | 2 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 2 +-
>  arch/arm/boot/dts/tegra124-nyan.dtsi      | 2 +-
>  arch/arm/boot/dts/tegra124-venice2.dts    | 2 +-
>  arch/arm/boot/dts/tegra20-trimslice.dts   | 2 +-
>  arch/arm/boot/dts/tegra30-beaver.dts      | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/t=
egra114-dalmore.dts
> index 8b7aa0d..5de23de 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -1082,7 +1082,7 @@
>  		status =3D "okay";
>  		spi-max-frequency =3D <25000000>;
>  		spi-flash@0 {
> -			compatible =3D "winbond,w25q32dw";
> +			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
>  			reg =3D <0>;
>  			spi-max-frequency =3D <20000000>;
>  		};
> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dt=
s/tegra124-jetson-tk1.dts
> index bd43ed6..44097c6 100644
> --- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> +++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> @@ -1611,7 +1611,7 @@
>  		status =3D "okay";
>  		spi-max-frequency =3D <25000000>;
>  		spi-flash@0 {
> -			compatible =3D "winbond,w25q32dw";
> +			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
>  			reg =3D <0>;
>  			spi-max-frequency =3D <20000000>;
>  		};
> diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/teg=
ra124-nyan.dtsi
> index a9aec23..7d26f49 100644
> --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
> +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
> @@ -343,7 +343,7 @@
>  		spi-max-frequency =3D <25000000>;
> =20
>  		flash@0 {
> -			compatible =3D "winbond,w25q32dw";
> +			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
>  			spi-max-frequency =3D <25000000>;
>  			reg =3D <0>;
>  		};
> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/t=
egra124-venice2.dts
> index 79e724b..4decb3c 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -866,7 +866,7 @@
>  		status =3D "okay";
>  		spi-max-frequency =3D <25000000>;
>  		spi-flash@0 {
> -			compatible =3D "winbond,w25q32dw";
> +			compatible =3D "winbond,w25q32dw", "jedec,spi-nor";
>  			reg =3D <0>;
>  			spi-max-frequency =3D <20000000>;
>  		};
> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/=
tegra20-trimslice.dts
> index d99af4e..c4cff8b 100644
> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
> @@ -282,7 +282,7 @@
>  		status =3D "okay";
>  		spi-max-frequency =3D <48000000>;
>  		spi-flash@0 {
> -			compatible =3D "winbond,w25q80bl";
> +			compatible =3D "winbond,w25q80bl", "jedec,spi-nor";
>  			reg =3D <0>;
>  			spi-max-frequency =3D <48000000>;
>  		};
> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/teg=
ra30-beaver.dts
> index 3dede39..c9d230c 100644
> --- a/arch/arm/boot/dts/tegra30-beaver.dts
> +++ b/arch/arm/boot/dts/tegra30-beaver.dts
> @@ -1884,7 +1884,7 @@
>  		status =3D "okay";
>  		spi-max-frequency =3D <25000000>;
>  		spi-flash@1 {
> -			compatible =3D "winbond,w25q32";
> +			compatible =3D "winbond,w25q32", "jedec,spi-nor";
>  			reg =3D <1>;
>  			spi-max-frequency =3D <20000000>;
>  		};
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/te=
gra30-cardhu.dtsi
> index bb1ca15..df7f845 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> @@ -354,7 +354,7 @@
>  		status =3D "okay";
>  		spi-max-frequency =3D <25000000>;
>  		spi-flash@1 {
> -			compatible =3D "winbond,w25q32";
> +			compatible =3D "winbond,w25q32", "jedec,spi-nor";
>  			reg =3D <1>;
>  			spi-max-frequency =3D <20000000>;
>  		};
>=20

Looks like this one got lost, but still applies cleanly so ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

--=20
nvpublic
