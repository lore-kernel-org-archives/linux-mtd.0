Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0QJ7-00013Q-L8
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2018 11:28:59 +0000
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 John Crispin <john@phrozen.org>, Peter Rosin <peda@axentia.se>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V10 0/3] mtd: read partitions compatible prop for "ofpart"
 type
Date: Mon, 26 Mar 2018 13:30:15 +0200
Message-ID: <1844604.Hq7LKkU3xk@blindfold>
In-Reply-To: <20180314121044.12033-1-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
 <20180314121044.12033-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 14. M=C3=A4rz 2018, 13:10:41 CEST schrieb Rafa=C5=82 Mi=C5=82e=
cki:
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
>=20
> Rafa=C5=82 Mi=C5=82ecki (3):
>   mtd: partitions: add of_match_table parser matching for the "ofpart"
>     type
>   mtd: rename "ofpart" parser to "fixed-partitions" as it fits it better
>   mtd: ofpart: add of_match_table with "fixed-partitions"
>=20
>  drivers/mtd/mtdpart.c          | 116
> +++++++++++++++++++++++++++++++++++++---- drivers/mtd/ofpart.c           =
|=20
> 18 +++++--
>  include/linux/mtd/partitions.h |   1 +
>  3 files changed, 121 insertions(+), 14 deletions(-)

Series looks good to me.

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
