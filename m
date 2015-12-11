Subject: Re: [PATCH v4 38/58] mtd: nand: s3c2410: use the mtd instance embedded
 in struct nand_chip
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449734442-18672-39-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Marek Vasut <marek.vasut@gmail.com>,
 Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-cris-kernel@axis.com, Josh Wu <josh.wu@atmel.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <566A371C.7030507@samsung.com>
Date: Fri, 11 Dec 2015 11:38:20 +0900
MIME-version: 1.0
In-reply-to: <1449734442-18672-39-git-send-email-boris.brezillon@free-electrons.com>
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10.12.2015 17:00, Boris Brezillon wrote:
> struct nand_chip now embeds an mtd device. Make use of this mtd instance.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes generated with the following coccinelle script
> 
> --->8---
> virtual patch
> 
> @fix1@
> identifier __chipfield, __mtdfield;
> type __type;
> @@
> (
> 	__type {
> 		...
> 		struct nand_chip __chipfield;
> 		...
> -		struct mtd_info __mtdfield;
> 		...
> 	};
> |
> 	__type {
> 		...
> -		struct mtd_info __mtdfield;
> 		...
> 		struct nand_chip __chipfield;
> 		...
> 	};
> )
> 
> @fix2 depends on fix1@
> identifier fix1.__chipfield, fix1.__mtdfield;
> identifier __subfield;
> type fix1.__type;
> __type *__priv;
> @@
> (
> -	__priv->__mtdfield.__subfield
> +	nand_to_mtd(&__priv->__chipfield)->__subfield
> |
> -	&(__priv->__mtdfield)
> +	nand_to_mtd(&__priv->__chipfield)
> )
> --->8---
> ---
>  drivers/mtd/nand/s3c2410.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 

Looks correct:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
