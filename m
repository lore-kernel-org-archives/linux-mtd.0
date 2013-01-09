From: Marek Vasut <marex@denx.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] mtd: mxc_nand: Make use of supplied pinctrl data
Date: Wed, 9 Jan 2013 10:08:49 +0100
References: <1357568885-15507-1-git-send-email-marex@denx.de>
 <201301082122.46815.marex@denx.de>
 <20130109064107.GB12525@S2100-06.ap.freescale.net>
In-Reply-To: <20130109064107.GB12525@S2100-06.ap.freescale.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201301091008.49832.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org,
 Lothar =?iso-8859-1?q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Shawn Guo,

> On Tue, Jan 08, 2013 at 09:22:46PM +0100, Marek Vasut wrote:
> > Dear Jean-Christophe PLAGNIOL-VILLARD,
> > 
> > > On 15:28 Mon 07 Jan     , Marek Vasut wrote:
> > > > The MXC NAND driver doesn't consider the pinctrl data supplied via
> > > > DT, which will result in NAND pins not being properly configured.
> > > > 
> > > > Make the driver use pinctrl, but to prevent breakage on various
> > > > boards, do not fail if the pinctrl data are not available, only
> > > > print a warning message.
> > > 
> > > nack
> > > 
> > > we will at bus level
> > 
> > Can you please elaborate? I don't understand what you're complaining
> > about at all, sorry.
> 
> He is talking about patch [1] which is likely to hit mainline for 3.9.
> 
> Shawn
> 
> [1] http://thread.gmane.org/gmane.linux.kernel/1409263

Oh, this is good, thanks for explaining Shawn!

Well, this patch can be applied as a fallback if it doesn't hit 3.9 , either way 
works for me.

Best regards,
Marek Vasut
