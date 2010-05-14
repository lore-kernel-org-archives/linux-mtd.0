Date: Fri, 14 May 2010 10:41:49 +0200
From: Daniel Mack <daniel@caiaq.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 17/20] pxa3xx_nand: add cmdline part parser support
Message-ID: <20100514084149.GJ30801@buzzloop.caiaq.de>
References: <h2l771cded01005060212k39b41e4aqa57cc6e5072bfe3b@mail.gmail.com>
	<1273804364.9999.881.camel@macbook.infradead.org>
	<AANLkTikMrVigamYF8VAiEB3_JXGr6LAFliOmw9CJr8mz@mail.gmail.com>
	<1273824971.9999.1582.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1273824971.9999.1582.camel@macbook.infradead.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-mtd@lists.infradead.org, Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 14, 2010 at 09:16:11AM +0100, David Woodhouse wrote:
> On Fri, 2010-05-14 at 14:08 +0800, Haojian Zhuang wrote:
> > New patches are rebased for mtd-2.6 master branch. There're contained
> > in another mail loop.
> 
> Hm, please test these by sending to yourself first, saving the patches
> and checking that they apply.
> 
> [dwmw2@macbook mtd-2.6]$ git describe HEAD
> v2.6.34-rc7-142-gf6b173c
> 
> [dwmw2@macbook mtd-2.6]$ for a in `seq -w 1 20` ; do echo Patch $a ; patch -p1 < pxa$a.patch ; done
> Patch 01
> patching file arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> patching file drivers/mtd/nand/Kconfig
> patching file drivers/mtd/nand/pxa3xx_nand.c
> patch: **** malformed patch at line 203: transfering to/from NAND HW");

Jep, they're line-wrapped, just like the version before.

Haojian, you can avoid this to happen by using 'git send-email'.

Thanks,
Daniel
