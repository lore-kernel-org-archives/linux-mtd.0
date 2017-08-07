Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deZU2-0000nF-CD
 for linux-mtd@lists.infradead.org; Mon, 07 Aug 2017 04:17:41 +0000
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v774Gh7w015242
 for <linux-mtd@lists.infradead.org>; Mon, 7 Aug 2017 13:16:44 +0900
Received: by mail-yw0-f173.google.com with SMTP id s143so36314938ywg.1
 for <linux-mtd@lists.infradead.org>; Sun, 06 Aug 2017 21:16:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 7 Aug 2017 13:16:42 +0900
Message-ID: <CAK7LNAT0jpECc3qxGRxXOjd+ojp0yKhTia=RC9n72jLLp4p_og@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Rename nand.h into rawnand.h
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

2017-08-05 0:29 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> We are planning to share more code between different NAND based
> devices (SPI NAND, OneNAND and raw NANDs), but before doing that
> we need to move the existing include/linux/mtd/nand.h file into
> include/linux/mtd/rawnand.h so we can later create a nand.h header
> containing all common structure and function prototypes.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Kevin Hilman <khilman@kernel.org>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Gregory Clement <gregory.clement@free-electrons.com>
> Cc: Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Krzysztof Halasa <khalasa@piap.pl>
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Alexander Clouter <alex@digriz.org.uk>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Simtec Linux Team <linux@simtec.co.uk>
> Cc: Steven Miao <realmz6@gmail.com>
> Cc: Mikael Starvik <starvik@axis.com>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Wenyou Yang <wenyou.yang@atmel.com>
> Cc: Josh Wu <rainyfeeling@outlook.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Han Xu <han.xu@nxp.com>
> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Sylvain Lemieux <slemieux.tyco@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Wan ZongShun <mcuos.com@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
> Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: adi-buildroot-devel@lists.sourceforge.net
> Cc: linux-cris-kernel@axis.com
> Cc: linux-mips@linux-mips.org
> Cc: linux-sh@vger.kernel.org
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-oxnas@lists.tuxfamily.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: devel@driverdev.osuosl.org
> ---
> Hi All,
>
> Sorry for the huge Cc list, but I'd like to collect as much acks as
> possible for this patch which is actually part of a bigger series [1].
>
> Note that there's nothing complicated here, it's just a mechanical
> s/nand\.h/rawnand\.h/ replacement, but it impacts several architectures,
> the doc and staging directories.
>
> Regards,
>
> Boris
>
> [1]https://lwn.net/Articles/723694/
> ---

[snip]

>  drivers/mtd/nand/denali.h                       | 2 +-


For Denali,

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
