Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddgXS-0002gy-Lf
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 17:37:32 +0000
Date: Fri, 4 Aug 2017 19:36:20 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Rich Felker <dalias@libc.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, linux-mips@linux-mips.org,
 Sekhar Nori <nsekhar@ti.com>, Stefan Agner <stefan@agner.ch>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Alexander Clouter <alex@digriz.org.uk>, devel@driverdev.osuosl.org,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-omap@vger.kernel.org,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>, linux-doc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>,
 Wan ZongShun <mcuos.com@gmail.com>, Steven Miao <realmz6@gmail.com>,
 linux-samsung-soc@vger.kernel.org,
 adi-buildroot-devel@lists.sourceforge.net,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Mikael Starvik <starvik@axis.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Han Xu <han.xu@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, linux-cris-kernel@axis.com,
 linux-oxnas@lists.tuxfamily.org, David Woodhouse <dwmw2@infradead.org>,
 Kevin Hilman <khilman@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ralf Baechle <ralf@linux-mips.org>, Wenyou Yang <wenyou.yang@atmel.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>, Peter Pan <peterpandong@micron.com>
Subject: Re: [PATCH] mtd: nand: Rename nand.h into rawnand.h
Message-ID: <20170804173620.xf3lyhcr2725geex@pengutronix.de>
References: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Boris,

you could easily split this patch per architecture/subsystem if you in a
first patch move the content of nand.h to rawnand.h and make nand.h just
#include rawnand.h. Then you can switch one user at a time and when all
are converted to use rawnand.h you can drop the #include.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
