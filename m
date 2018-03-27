Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0l73-0006ws-Hu
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 09:41:55 +0000
Date: Tue, 27 Mar 2018 11:41:30 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, John
 Crispin <john@phrozen.org>, linux-mtd@lists.infradead.org, Jonas Gorski
 <jonas.gorski@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>, Peter Rosin
 <peda@axentia.se>
Subject: Re: [PATCH V10 0/3] mtd: read partitions compatible prop for
 "ofpart" type
Message-ID: <20180327114130.0fa3ee0e@bbrezillon>
In-Reply-To: <20180314121044.12033-1-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
 <20180314121044.12033-1-zajec5@gmail.com>
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

On Wed, 14 Mar 2018 13:10:41 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This patchset provides a proper support for flash device DT node with
> "partitions" subnode using "compatible" property. It's already
> documented in the: Documentation/devicetree/bindings/mtd/partition.txt
>=20
> We believed that version 7 was ready to go, but soon after landing in
> the linux-next we got a regression report from Peter. Later versions
> takes a safe path by:
> 1) Respecting parsers order as specified in the default/driver-provided
>    list.
> 2) Looking at "compatible" property only when "ofpart" type gets
>    speciied.
>=20
> Version 9 was successfully tested by Peter and version 10 just squashes
> two commits into a one.
>=20
> I double-checked the code and cannot think of any regression this could
> cause. I also hope this design (roughly discussed with Boris) can be
> acceptable for the mtd subsystem.
>=20
> The most important patch from this patchset (1/3) was reviewed by Rob in
> the
> [PATCH V6 1/2] mtd: partitions: add of_match_table parser matching
> https://patchwork.ozlabs.org/comment/1831551/
>=20
> If possible this is a 4.17 material.

Applied, finally. I'm still convinced putting this information in the
"partitions" node compatible is a bad idea because it adds extra
complexity to something that was already quite complex, but you won!

Note that Rob had comments on [1] that you never answered, so I'm not
even sure when we'll start seeing boards using this infrastructure.

[1]http://patchwork.ozlabs.org/patch/859690/

--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
