Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2fvl-00063I-CO
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 15:29:38 +0000
Received: by mail-vk0-x242.google.com with SMTP id j127so5947911vkh.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2017 08:29:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170424124120.31613-2-zajec5@gmail.com>
References: <20170420135731.13272-2-zajec5@gmail.com>
 <20170424124120.31613-1-zajec5@gmail.com>
 <20170424124120.31613-2-zajec5@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Apr 2017 17:28:54 +0200
Message-ID: <CAOiHx=mHvuWM8Ww1+GD621c1AgAU0BNoGG-=1BgRxEVnTj8wLQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] dt-bindings: mtd: make partitions doc a bit more
 generic
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

Hi,

On 24 April 2017 at 14:41, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote=
:
> From: Brian Norris <computersforpeace@gmail.com>
>
> Currently the only documented partitioning is "fixed-partitions" but
> there are more methods in use that we may want to support in the future.
> Mention them and make it clear Fixed Partitions are just a single case.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> This is based on Brian's patch:
> [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
>
> V1: Dropped "Section B: On-Flash Partition Tables" with Google's FMAP as =
this
>     patchset doesn't add that new parser.
> V2: Add "We currently only document a binding for fixed layouts." part
> ---
>  .../devicetree/bindings/mtd/partition.txt          | 30 ++++++++++++++++=
+-----
>  1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Docume=
ntation/devicetree/bindings/mtd/partition.txt
> index 81a224da63be..b5de311b967a 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -1,29 +1,47 @@
> -Representing flash partitions in devicetree
> +Flash partitions in device tree
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
> -Partitions can be represented by sub-nodes of an mtd device. This can be=
 used
> +Flash devices can be partitioned into one or more functional ranges (e.g=
. "boot
> +code", "nvram", "kernel").
> +
> +Different devices may be partitioned in a different ways. Some may use a=
 fixed
> +flash layout set at production time. Some may use on-flash table that de=
scribes
> +the geometry and naming/purpose of each functional region. It is also po=
ssible
> +to see these methods mixed.
> +
> +To assist system software in locating partitions, we provide a binding t=
o
> +describe which method is used for a given flash.

Since patch 3 adds specifying methods through the compatible of the
partitions subnode, maybe we should document that here? Something
along

"To assist system software in locating partitions, we allow describing
which method is used for a given flash device. To describe the method
there should be a subnode of the flash device that is named
'partitions'. It must have a 'compatible' property, which is used to
identify the method to use."


Regards
Jonas
