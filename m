Date: Fri, 11 Dec 2015 16:15:35 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Stefan Agner
 <stefan@agner.ch>, linux-sunxi@googlegroups.com,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Alexander Clouter <alex@digriz.org.uk>, devel@driverdev.osuosl.org, Jesper
 Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org, Maxim
 Levitsky <maximlevitsky@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Marek
 Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim
 <kgene@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Josh Wu <josh.wu@atmel.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Wan
 ZongShun <mcuos.com@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Mikael Starvik <starvik@axis.com>, Krzysztof
 Halasa <khalasa@piap.pl>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ryan Mallon <rmallon@gmail.com>,
 linux-cris-kernel@axis.com, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Sascha Hauer
 <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Imre Kaloz
 <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>, Daniel Mack
 <daniel@zonque.org>
Subject: Re: [PATCH v4 01/58] mtd: nand: denali: add missing nand_release()
 call in denali_remove()
Message-ID: <20151211161535.60a96ec2@bbrezillon>
In-Reply-To: <20151211143947.GL5284@mwanda>
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449734442-18672-2-git-send-email-boris.brezillon@free-electrons.com>
 <20151211004008.GQ144338@google.com>
 <20151211145320.1560fac3@bbrezillon> <20151211143947.GL5284@mwanda>
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

Hi Dan,

On Fri, 11 Dec 2015 17:39:47 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Fri, Dec 11, 2015 at 02:53:20PM +0100, Boris Brezillon wrote:
> > Hi Brian,
> > 
> > On Thu, 10 Dec 2015 16:40:08 -0800
> > Brian Norris <computersforpeace@gmail.com> wrote:
> > 
> > > On Thu, Dec 10, 2015 at 08:59:45AM +0100, Boris Brezillon wrote:
> > > > Unregister the NAND device from the NAND subsystem when removing a denali
> > > > NAND controller, otherwise the MTD attached to the NAND device is still
> > > > exposed by the MTD layer, and accesses to this device will likely crash
> > > > the system.
> > > > 
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > > Cc: <stable@vger.kernel.org> #3.8+
> > > 
> > > Does this follow these rules, from
> > > Documentation/stable_kernel_rules.txt?
> > > 
> > >  - It must be obviously correct and tested.
> > > 
> > >  - It must fix a real bug that bothers people (not a, "This could be a
> > >    problem..." type thing).
> > 
> > As you wish, I'll remove those Cc and Fixes tags, or just drop the
> > patch if you think it's useless...
> 
> The fixes tag is a separate thing from CCing stable.  It's useful on by
> itself.  I always put the person who wrote the original patch in the To:
> header so they can review and comment if I have made a mistake.

Noted. I added back the Fixes tag and added Dinh Nguyen (the commit
author) in the loop.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
