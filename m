Date: Fri, 18 Dec 2015 14:17:58 -0800
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
Subject: Re: [PATCH v4 55/58] mtd: nand: add helpers to access ->priv
Message-ID: <20151218221758.GQ10460@google.com>
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449734442-18672-56-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449734442-18672-56-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu, Dec 10, 2015 at 09:00:39AM +0100, Boris Brezillon wrote:
> Add two helpers to access the field reserved for private controller data.
> This makes it clearer what this field is reserved for and ease future
> refactoring.

I agree with the refactoring part, but I'm not sure about the name. Is
it really "controller" data? That sounds like something that has 1
instance per controller. But the way this is sometimes used, we get 1
instance per NAND chip, and there may be more than one NAND chip per
controller.

So at the moment, this is more like opaque "driver data", like
dev_{get,set}_drvdata(), which doesn't really have a prescribed use --
it's up to the driver.

Notably, we already have a (sort of) 1-per-controler-instance field:
struct nand_hw_control (I notice we have both the 'controller' and
'hwcontrol' fields in nand_chip; that's pretty ugly too...). Those don't
have private data fields, but we could of course extend that if we
really want "controller" data.

Anyway, I don't feel like this question is resolved well enough to say
that we should go change all drivers to use these accessors. I know you
have bigger plans for putting more "controller" infrastructure into the
core drivers/mtd/nand/ code, so I'd like to see how that fits in here.

(If we're going to discuss this much more, I'd suggest a smaller CC
list. I'm mostly putting this here to show why I'm not taking the last
4 patches right now.)

Regards,
Brian

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  include/linux/mtd/nand.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 2bee2e4..4aed4b2 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -739,6 +739,16 @@ static inline struct mtd_info *nand_to_mtd(struct nand_chip *chip)
>  	return &chip->mtd;
>  }
>  
> +static inline void *nand_get_controller_data(struct nand_chip *chip)
> +{
> +	return chip->priv;
> +}
> +
> +static inline void nand_set_controller_data(struct nand_chip *chip, void *priv)
> +{
> +	chip->priv = priv;
> +}
> +
>  /*
>   * NAND Flash Manufacturer ID Codes
>   */
> -- 
> 2.1.4
> 
