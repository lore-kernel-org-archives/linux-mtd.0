Date: Mon, 21 Aug 2017 22:13:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Dmitry Eremin-Solenikov
 <dbaryshkov@gmail.com>, Richard Weinberger <richard@nod.at>, Robert Jarzmik
 <robert.jarzmik@free.fr>, linux-mmc@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Lee Jones <lee.jones@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Daniel
 Mack <daniel@zonque.org>
Subject: Re: [PATCH v5 0/9] mtd: sharpslpart partition parser
Message-ID: <20170821221339.70cfcfb7@bbrezillon>
In-Reply-To: <1502743720-28672-1-git-send-email-andrea.adami@gmail.com>
References: <1502743720-28672-1-git-send-email-andrea.adami@gmail.com>
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

Le Mon, 14 Aug 2017 22:48:31 +0200,
Andrea Adami <andrea.adami@gmail.com> a =C3=A9crit :

> This patchset introduces a simple partition parser for the Sharp SL
> Series PXA handhelds. More details in the commit text.
>=20
> I have set in cc the ARM PXA maintainers because this is the MTD part of
> a planned wider patchset cleaning the Zaurus board files. The MFD maintai=
ners
> are also in cc (tmio.h change).
>=20
> Changelog:
> v1 firt version, initial import of 2.4 sources
> v2 refactor applying many suggested fixes
> v3 put the partition parser types in the platform data
> v4 refactor after ML review
> v5 fix commit messages and subject texts, remove global, fixes after v4 r=
eview
>=20
> GPL sources: http://support.ezaurus.com/developer/source/source_dl.asp
>=20
> Andrea Adami (9):
>   mtd: sharpslpart: Add sharpslpart partition parser
>   mtd: nand: sharpsl: Add partition parsers platform data
>   mfd: tmio: Add partition parsers platform data
>   mtd: nand: sharpsl: Register partitions using the parsers
>   mtd: nand: tmio: Register partitions using the parsers

Applied patches 2, to 5 to nand/next.

Thanks,

Boris

>   ARM: pxa/corgi: Remove hardcoded partitioning, use sharpslpart parser
>   ARM: pxa/tosa: Remove hardcoded partitioning, use sharpslpart parser
>   ARM: pxa/spitz: Remove hardcoded partitioning, use sharpslpart parser
>   ARM: pxa/poodle: Remove hardcoded partitioning, use sharpslpart parser
>=20
>  arch/arm/mach-pxa/corgi.c         |  31 +---
>  arch/arm/mach-pxa/poodle.c        |  28 +--
>  arch/arm/mach-pxa/spitz.c         |  34 +---
>  arch/arm/mach-pxa/tosa.c          |  28 +--
>  drivers/mtd/nand/sharpsl.c        |   2 +-
>  drivers/mtd/nand/tmio_nand.c      |   4 +-
>  drivers/mtd/parsers/Kconfig       |   8 +
>  drivers/mtd/parsers/Makefile      |   1 +
>  drivers/mtd/parsers/sharpslpart.c | 376 ++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mfd/tmio.h          |   1 +
>  include/linux/mtd/sharpsl.h       |   1 +
>  11 files changed, 424 insertions(+), 90 deletions(-)
>  create mode 100644 drivers/mtd/parsers/sharpslpart.c
>=20
