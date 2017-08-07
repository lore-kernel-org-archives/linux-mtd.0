Subject: Re: [PATCH] mtd: nand: Rename nand.h into rawnand.h
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Peter Pan <peterpandong@micron.com>, Jonathan Corbet <corbet@lwn.net>,
 Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Eric Miao <eric.y.miao@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Alexander Clouter <alex@digriz.org.uk>, Daniel Mack <daniel@zonque.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Simtec Linux Team
 <linux@simtec.co.uk>, Steven Miao <realmz6@gmail.com>,
 Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Ralf Baechle <ralf@linux-mips.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux
 <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wan ZongShun <mcuos.com@gmail.com>, Neil Armstrong
 <narmstrong@baylibre.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 adi-buildroot-devel@lists.sourceforge.net, linux-cris-kernel@axis.com,
 linux-mips@linux-mips.org, linux-sh@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org,
 linux-oxnas@lists.tuxfamily.org, linuxppc-dev@lists.ozlabs.org,
 devel@driverdev.osuosl.org
References: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
From: Harvey Hunt <harveyhuntnexus@gmail.com>
Message-ID: <8fa469f8-63d6-9305-db8e-88416ea2c6cc@gmail.com>
Date: Mon, 7 Aug 2017 20:58:43 +0100
MIME-Version: 1.0
In-Reply-To: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 08/04/2017 04:29 PM, Boris Brezillon wrote:
[...]
>   drivers/mtd/nand/jz4780_nand.c                  | 2 +-
[...]

For JZ4780,

Acked-By: Harvey Hunt <harveyhuntnexus@gmail.com>
