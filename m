Date: Tue, 1 Dec 2015 14:17:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-cris-kernel@axis.com, Josh Wu <josh.wu@atmel.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Subject: Re: [PATCH v2 17/25] mtd: nand: remove useless mtd->priv = chip
 assignments
Message-ID: <20151201221747.GB64635@google.com>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
 <1448967802-25796-18-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1448967802-25796-18-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 01, 2015 at 12:03:14PM +0100, Boris Brezillon wrote:
> mtd_to_nand() now uses the container_of() approach to transform an
> mtd_info pointer into a nand_chip one. Drop useless mtd->priv
> assignments from NAND controller drivers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Patch generated with the following coccinelle script:
> 
> ---8<----
> virtual patch
> 
> @@
> struct mtd_info m;
> struct mtd_info *mp;
> struct nand_chip *c;
> @@
> (
> -(m).priv = c;
> |
> -(mp)->priv = c;
> |
> -(mp)->priv = (void *)c;
> )
> ---8<----
> ---

...

> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 3f29734..ed4184c 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -834,7 +834,6 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
>  	chip->IO_ADDR_R = chip->IO_ADDR_W;
>  
>  	nmtd->info	   = info;
> -	mtd->priv	   = chip;

After this one, we have:

drivers/mtd/nand/s3c2410.c: In function ‘s3c2410_nand_init_chip’:
drivers/mtd/nand/s3c2410.c:791:19: warning: unused variable ‘mtd’ [-Wunused-variable]


>  	nmtd->set	   = set;
>  
>  #ifdef CONFIG_MTD_NAND_S3C2410_HWECC
 
Brian
