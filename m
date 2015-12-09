Date: Wed, 9 Dec 2015 09:32:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Hartley
 Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Imre
 Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Tony
 Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Alexander Clouter
 <alex@digriz.org.uk>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Marek
 Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net, Mikael Starvik
 <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-cris-kernel@axis.com, Josh Wu <josh.wu@atmel.com>, Wan ZongShun
 <mcuos.com@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Maxim Levitsky
 <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner
 <stefan@agner.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: [PATCH v3 bis 12/25] mtd: nand: use the mtd instance embedded
 in struct nand_chip
Message-ID: <20151209093210.007a63b3@bbrezillon>
In-Reply-To: <20151209001741.GT120110@google.com>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449046201-22921-1-git-send-email-boris.brezillon@free-electrons.com>
 <20151209001741.GT120110@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, 8 Dec 2015 16:17:41 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> 
> > diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
> > index 43bded6..84d027e 100644
> > --- a/drivers/mtd/nand/cmx270_nand.c
> > +++ b/drivers/mtd/nand/cmx270_nand.c
> > @@ -160,10 +160,8 @@ static int __init cmx270_init(void)
> >  	gpio_direction_input(GPIO_NAND_RB);
> >  
> >  	/* Allocate memory for MTD device structure and private data */
> > -	cmx270_nand_mtd = kzalloc(sizeof(struct mtd_info) +
> > -				  sizeof(struct nand_chip),
> > -				  GFP_KERNEL);
> > -	if (!cmx270_nand_mtd) {
> > +	this = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
> > +	if (!this) {
> >  		ret = -ENOMEM;
> >  		goto err_kzalloc;
> >  	}
> > @@ -175,8 +173,7 @@ static int __init cmx270_init(void)
> >  		goto err_ioremap;
> >  	}
> >  
> > -	/* Get pointer to private data */
> > -	this = (struct nand_chip *)(&cmx270_nand_mtd[1]);
> > +	cmx270_nand_mtd = nand_to_mtd(this);
> 
> So, you make cmx270_nand_mtd no longer kzalloc()'d, but I still see the
> cmx270_init() function end with:
> 
> err_scan:
>         iounmap(cmx270_nand_io);
> err_ioremap:
>         kfree(cmx270_nand_mtd);  <----- *** this! ***

Oh, crap.

> err_kzalloc:
>         gpio_free(GPIO_NAND_RB);
> err_gpio_request:
> 	gpio_free(GPIO_NAND_CS);
> 
> 	return ret;
> 
> }
> 
> I have a feeling there's a failing in your coccinelle script somewhere.

These changes are not automated, because it's kind of hard to address
all the different cases where the following pattern is employed;

var = kzalloc(sizeof(struct mtd_info) +
	      sizeof(struct nand_chip) + ..., ...);

Sometime var is an mtd_info pointer, sometime it's a nand_chip pointer
or directly a pointer to the private struct.

I'm pretty sure we could come up with a valid coccinelle script, but
given the number of drivers using this approach I'm not sure it is
worth it...

> 
> Given that I was only through 10 of 49 files changes, I think you might
> need to take a comb over your patch better.

I'll go over those changes one more time, but from my experience, these
kind of bugs are spotted more easily by people who didn't write the
code, so other reviews are more than welcome.

Also, as you suggested, I'll split the changes in several commits (one
per driver) so that you can pick them independently.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
