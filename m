Date: Thu, 6 Sep 2018 10:37:32 -0700
From: Paul Burton <paul.burton@mips.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Alexander Clouter <alex@digriz.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Wan ZongShun <mcuos.com@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Mans Rullgard <mans@mansr.com>, Stefan Agner <stefan@agner.ch>,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Subject: Re: [PATCH v2 01/23] mtd: rawnand: plat_nand: Pass a nand_chip
 object to all platform_nand_ctrl hooks
Message-ID: <20180906173732.yrh47v46p2huhyrv@pburton-laptop>
References: <20180906120535.21255-1-boris.brezillon@bootlin.com>
 <20180906120535.21255-2-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180906120535.21255-2-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu, Sep 06, 2018 at 02:05:13PM +0200, Boris Brezillon wrote:
> Let's make the raw NAND API consistent by patching all helpers and
> hooks to take a nand_chip object instead of an mtd_info one or
> remove the mtd_info object when both are passed.
> 
> In order to do that, we first need to update the platform_nand_ctrl
> hooks to take a nand_chip object instead of an mtd_info.
> 
> We add temporary plat_nand_xxx() wrappers to the do the mtd -> chip
> conversion, but those will be dropped when patching nand_chip hooks to
> take a nand_chip object.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Acked-by: Krzysztof Halasa <khalasa@piap.pl>

Acked-by: Paul Burton <paul.burton@mips.com> # MIPS parts

Thanks,
    Paul
