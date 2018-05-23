Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLS2P-0006Fs-2y
 for linux-mtd@lists.infradead.org; Wed, 23 May 2018 11:34:45 +0000
Date: Wed, 23 May 2018 13:34:20 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: document Broadcom's BCM47xx
 partitions
Message-ID: <20180523133420.34ffe221@bbrezillon>
In-Reply-To: <20180509081729.28347-1-zajec5@gmail.com>
References: <20180509081729.28347-1-zajec5@gmail.com>
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

On Wed,  9 May 2018 10:17:28 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Broadcom based home router devices use partitions which have to be
> discovered in a specific way. They are not fixed and there is not any
> standard partition table. This commit adds and describes a new custom
> binding for such devices.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied both.

Thanks,

Boris

> ---
> This commit documents a new binding for describing partitions. Just as a
> reminder: we agreed to use "compatible" for that purpose to avoid
> /guessing/. There are too many cases, devices and /formats/ to just
> blindly try every possible parser.
>=20
> This was e.g. described by Boris in his patchset 2+ years ago:
> [RFC PATCH 0/7] mtd: partitions: add of_match_table support
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064076.html
>=20
> Quote:
> >  (2) we can't just scan for all supported parsers (like the block syste=
m does), since
> >      there is a wide diversity of "formats" (no standardization), and i=
t is not
> >      always safe or efficient to attempt to do so, particularly since m=
any of
> >      them allow their data structures to be placed anywhere on the flas=
h, and
> >      so require scanning the entire flash device to find them. =20
>=20
> I believe this solution was also acked back then by Rob:
> [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064100.html
>=20
> V2: Move documentation to the new brcm,bcm947xx-cfe-partitions.txt file
>     as suggested by Rob (we don't want to bloat partition.txt).
>     Slightly update commit message.
> ---
>  .../devicetree/bindings/mtd/partition.txt          |  2 +-
>  .../partitions/brcm,bcm947xx-cfe-partitions.txt    | 42 ++++++++++++++++=
++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm=
,bcm947xx-cfe-partitions.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Docume=
ntation/devicetree/bindings/mtd/partition.txt
> index 36f3b769a626..a8f382642ba9 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -14,7 +14,7 @@ method is used for a given flash device. To describe th=
e method there should be
>  a subnode of the flash device that is named 'partitions'. It must have a
>  'compatible' property, which is used to identify the method to use.
> =20
> -We currently only document a binding for fixed layouts.
> +Available bindings are listed in the "partitions" subdirectory.
> =20
> =20
>  Fixed Partitions
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm947=
xx-cfe-partitions.txt b/Documentation/devicetree/bindings/mtd/partitions/br=
cm,bcm947xx-cfe-partitions.txt
> new file mode 100644
> index 000000000000..1d61a029395e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm947xx-cfe-=
partitions.txt
> @@ -0,0 +1,42 @@
> +Broadcom BCM47xx Partitions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Broadcom is one of hardware manufacturers providing SoCs (BCM47xx) used =
in
> +home routers. Their BCM947xx boards using CFE bootloader have several pa=
rtitions
> +without any on-flash partition table. On some devices their sizes and/or
> +meanings can also vary so fixed partitioning can't be used.
> +
> +Discovering partitions on these devices is possible thanks to having a s=
pecial
> +header and/or magic signature at the beginning of each of them. They are=
 also
> +block aligned which is important for determinig a size.
> +
> +Most of partitions use ASCII text based magic for determining a type. Mo=
re
> +complex partitions (like TRX with its HDR0 magic) may include extra head=
er
> +containing some details, including a length.
> +
> +A list of supported partitions includes:
> +1) Bootloader with Broadcom's CFE (Common Firmware Environment)
> +2) NVRAM with configuration/calibration data
> +3) Device manufacturer's data with some default values (e.g. SSIDs)
> +4) TRX firmware container which can hold up to 4 subpartitions
> +5) Backup TRX firmware used after failed upgrade
> +
> +As mentioned earlier, role of some partitions may depend on extra config=
uration.
> +For example both: main firmware and backup firmware use the same TRX for=
mat with
> +the same header. To distinguish currently used firmware a CFE's environm=
ent
> +variable "bootpartition" is used.
> +
> +
> +Devices using Broadcom partitions described above should should have fla=
sh node
> +with a subnode named "partitions" using following properties:
> +
> +Required properties:
> +- compatible : (required) must be "brcm,bcm947xx-cfe-partitions"
> +
> +Example:
> +
> +flash@0 {
> +	partitions {
> +		compatible =3D "brcm,bcm947xx-cfe-partitions";
> +	};
> +};
