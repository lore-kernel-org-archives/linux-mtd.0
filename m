Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ev9XJ-0005Mo-Lb
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2018 22:33:51 +0000
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
Subject: Re: [PATCH V9 0/4] mtd: read partitions compatible prop for "ofpart"
 type
Date: Sun, 11 Mar 2018 23:35:06 +0100
Message-ID: <1849709.LgWgpBxLnY@blindfold>
In-Reply-To: <20180130201059.4424-1-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
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

Rafa=C5=82,

Am Dienstag, 30. Januar 2018, 21:10:55 CET schrieb Rafa=C5=82 Mi=C5=82ecki:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This patchset provides a proper support for flash device DT node with
> "partitions" subnode using "compatible" property. It's already
> documented in the: Documentation/devicetree/bindings/mtd/partition.txt
>=20
> We believed a previous version 8 was ready to go, but soon after landing
> in the linux-next we got a regression report from Peter.
>=20
> This version takes a safe path by:
> 1) Respecting parsers order as specified in the default/driver-provided
>    list.
> 2) Looking at "compatible" property only when "ofpart" type gets
>    speciied.
>=20
> I double-checked the code and cannot think of any regression this could
> cause. I also hope this design (roughly discussed with Boris) can be
> acceptable for the mtd subsystem.
>=20
> This is of course 4.17 material at best.
>=20
> Brian Norris (1):
>   mtd: partitions: add of_match_table parser matching
>=20
> Rafa=C5=82 Mi=C5=82ecki (3):
>   mtd: partitions: add special treating for the "ofpart" parser type
>   mtd: rename "ofpart" parser to "fixed-partitions" as it fits it better
>   mtd: ofpart: add of_match_table with "fixed-partitions"
>=20
>  drivers/mtd/mtdpart.c          | 116
> +++++++++++++++++++++++++++++++++++++---- drivers/mtd/ofpart.c           =
|=20
> 18 +++++--
>  include/linux/mtd/partitions.h |   1 +
>  3 files changed, 121 insertions(+), 14 deletions(-)

As discussed on IRC, 1/4 confused me. It should be squashed into 3/4 to mak=
e=20
sense.
Other than that I think we can merge this patch series.
Not that I'm a super fan of it, but I can see the use-case but don't have a=
n=20
idea how to solve the problem in a less hacky way. ;-\

Just to be sure, DT guys are also happy with it, right?

Thanks,
//richard
