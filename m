Date: Tue, 29 Apr 2014 15:28:15 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 1/5] ARM: defconfigs: add MTD_SPI_NOR (new dependency for
 M25P80)
Message-ID: <20140429182815.GA28069@arch.cereza>
References: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
 <1397719309-2022-2-git-send-email-computersforpeace@gmail.com>
 <535A8FC9.8040707@wwwdotorg.org>
 <20140429172227.GB11657@arch.cereza>
 <20140429174849.GO28159@titan.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140429174849.GO28159@titan.lakedaemon.net>
Cc: Marek Vasut <marex@denx.de>, Russell King <linux@arm.linux.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 29, Jason Cooper wrote:
> On Tue, Apr 29, 2014 at 02:22:27PM -0300, Ezequiel Garcia wrote:
> > On Apr 25, Stephen Warren wrote:
> > > On 04/17/2014 01:21 AM, Brian Norris wrote:
> > > > These defconfigs contain the CONFIG_M25P80 symbol, which is now
> > > > dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to the
> > > > relevant defconfigs.
> > > > 
> > > > At the same time, drop the now-nonexistent CONFIG_MTD_CHAR symbol.
> 
> Excuse my ignorance of the history of this bug, but shouldn't this be
> solved in the Kconfig logic?  Since when do we solve config symbol
> dependency bugs in the defconfigs?
> 

Long story short: it was decided that select'ing this new symbol was not
appropriate. Instead, it must be explicitly selected by the user, hence
the defconfig fix.

The full story: https://lkml.org/lkml/2014/4/17/45

And in particular: https://lkml.org/lkml/2014/4/21/425
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
