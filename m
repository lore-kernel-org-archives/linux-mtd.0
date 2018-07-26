Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fimAT-000715-4G
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 19:43:22 +0000
Date: Thu, 26 Jul 2018 21:42:58 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: explicitly document nesting
 partitions descriptions
Message-ID: <20180726214258.733ca90d@bbrezillon>
In-Reply-To: <20180713143221.8474-1-zajec5@gmail.com>
References: <20180713143221.8474-1-zajec5@gmail.com>
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

On Fri, 13 Jul 2018 16:32:20 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Documentation was already saying that fixed and dynamic partitioning can
> be mixed but was missing a clear description and examples. This commit
> adds a proper documentation of how descriptions can be nested and how
> layouts can be mixed.
>=20
> This addition is important for partitions that contain subpartitions.
> In such cases partitions have to be properly described in order to let
> system handle them correctly.
>=20
> Depending on situation, nesting descriptions may provide more accurate
> logic/structure and/or allow mixing partitioning types (various
> "compatible" values).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied both patches.

Thanks,

Boris

> ---
> V2: Rewrote example: I can include "brcm,trx" now as its Documentation
>     has been pushed into mtd git tree.
>     Updated commit message.
> ---
>  .../devicetree/bindings/mtd/partition.txt          | 46 ++++++++++++++++=
++++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Docume=
ntation/devicetree/bindings/mtd/partition.txt
> index a8f382642ba9..afbbd870496d 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -14,6 +14,13 @@ method is used for a given flash device. To describe t=
he method there should be
>  a subnode of the flash device that is named 'partitions'. It must have a
>  'compatible' property, which is used to identify the method to use.
> =20
> +When a single partition is represented with a DT node (it depends on a u=
sed
> +format) it may also be described using above rules ('compatible' and opt=
ionally
> +some extra properties / subnodes). It allows describing more complex,
> +hierarchical (multi-level) layouts and should be used if there is some
> +significant relation between partitions or some partition internally uses
> +another partitioning method.
> +
>  Available bindings are listed in the "partitions" subdirectory.
> =20
> =20
> @@ -109,3 +116,42 @@ flash@2 {
>  		};
>  	};
>  };
> +
> +flash@3 {
> +	partitions {
> +		compatible =3D "fixed-partitions";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		partition@0 {
> +			label =3D "bootloader";
> +			reg =3D <0x000000 0x100000>;
> +			read-only;
> +		};
> +
> +		firmware@100000 {
> +			label =3D "firmware";
> +			reg =3D <0x100000 0xe00000>;
> +			compatible =3D "brcm,trx";
> +		};
> +
> +		calibration@f00000 {
> +			label =3D "calibration";
> +			reg =3D <0xf00000 0x100000>;
> +			compatible =3D "fixed-partitions";
> +			ranges =3D <0 0xf00000 0x100000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "wifi0";
> +				reg =3D <0x000000 0x080000>;
> +			};
> +
> +			partition@80000 {
> +				label =3D "wifi1";
> +				reg =3D <0x080000 0x080000>;
> +			};
> +		};
> +	};
> +};
