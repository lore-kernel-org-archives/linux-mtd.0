Date: Tue, 29 Apr 2014 14:22:27 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/5] ARM: defconfigs: add MTD_SPI_NOR (new dependency for
 M25P80)
Message-ID: <20140429172227.GB11657@arch.cereza>
References: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
 <1397719309-2022-2-git-send-email-computersforpeace@gmail.com>
 <535A8FC9.8040707@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <535A8FC9.8040707@wwwdotorg.org>
Cc: Marek Vasut <marex@denx.de>, Russell King <linux@arm.linux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 25, Stephen Warren wrote:
> On 04/17/2014 01:21 AM, Brian Norris wrote:
> > These defconfigs contain the CONFIG_M25P80 symbol, which is now
> > dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to the
> > relevant defconfigs.
> > 
> > At the same time, drop the now-nonexistent CONFIG_MTD_CHAR symbol.
> 
> I hadn't realized that the problem this patch solves was already present
> in the code, so this patch is simply catching up the defconfigs rather
> than part of a series which changed the code to cause the problem.
> 
> So, this needs to be applied ASAP.
> 

What's the status of this?

> I think this should be split it up so that each defconfig can go through
> the tree that owns it to avoid conflicts. If you repost split up, I can
> apply the tegra_defconfig change to the Tegra tree.
> 

Probably the same for mvebu (Ccing Jason).
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
