Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxAGv-0000EJ-Ja
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 10:40:43 +0000
Date: Sun, 9 Apr 2017 12:40:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/3] dt-bindings: mtd: document linux,part-probe
 property
Message-ID: <20170409124008.532fb063@bbrezillon>
In-Reply-To: <20170331114016.26858-1-zajec5@gmail.com>
References: <20170331114016.26858-1-zajec5@gmail.com>
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

Hi Rafal,

On Fri, 31 Mar 2017 13:40:14 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Support for this property has been introduced in 2010 with commit
> 9d5da3a9b849 ("mtd: extend physmap_of to let the device tree specify the
> parition probe") but it was never documented. Fix this by adding a
> proper description and example.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  Documentation/devicetree/bindings/mtd/common.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documenta=
tion/devicetree/bindings/mtd/common.txt
> index fc068b923d7a..1ada70e718b2 100644
> --- a/Documentation/devicetree/bindings/mtd/common.txt
> +++ b/Documentation/devicetree/bindings/mtd/common.txt
> @@ -6,10 +6,17 @@ Optional properties:
>    controller based name) in order to ease flash device identification
>    and/or describe what they are used for.
> =20
> +- linux,part-probe: if present, this property should contain a list of s=
trings
> +  with partition probes to be used for the flash device. A role of parti=
tion
> +  probe (parser) is to read/construct partition table and register found
> +  partitions. Getting partition table may be platform or device specific=
 so
> +  various devices may use various Linux drivers for this purpose.
> +
>  Example:
> =20
>  	flash@0 {
>  		label =3D "System-firmware";
> +		linux,part-probe =3D "cmdlinepart", "ofpart";
> =20
>  		/* flash type specific properties */
>  	};
