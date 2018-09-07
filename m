Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyCpp-0000QY-Mg
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 09:13:51 +0000
Date: Fri, 7 Sep 2018 11:13:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio
 Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Imre
 Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Tony
 Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Alexander Clouter
 <alex@digriz.org.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Jason Cooper
 <jason@lakedaemon.net>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Daniel
 Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@linux-mips.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Subject: Re: [PATCH 19/19] mtd: rawnand: Move JEDEC code to nand_jedec.c
Message-ID: <20180907111324.691ba379@bbrezillon>
In-Reply-To: <20180907084044.GA6361@lenoch>
References: <20180906223851.6964-1-boris.brezillon@bootlin.com>
 <20180906223851.6964-20-boris.brezillon@bootlin.com>
 <20180907084044.GA6361@lenoch>
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

On Fri, 7 Sep 2018 10:40:44 +0200
Ladislav Michl <ladis@linux-mips.org> wrote:

> Hi Boris,
> 
> this patchseries is really amazing clean up. Thank you!

I'm glad I'm not the only one to find it useful :-).

> 
> On Fri, Sep 07, 2018 at 12:38:51AM +0200, Boris Brezillon wrote:
> > This moves ONFI related code to nand_onfi.c and ONFI related
> > struct/macros to include/linux/mtd/onfi.h.  
> 
> Seems above commit log comes from previous patch.

Oops, will fix that.

Thanks,

Boris
