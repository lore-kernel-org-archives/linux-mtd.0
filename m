Date: Mon, 9 Aug 2010 15:19:33 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/2] mxc_nand: fixes for purposed updates
Message-ID: <20100809121933.GE2894@jasper.tkos.co.il>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<cover.1281353601.git.baruch@tkos.co.il>
	<1281354805.26440.4.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1281354805.26440.4.camel@localhost>
Cc: linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org, John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Mon, Aug 09, 2010 at 12:53:25PM +0100, David Woodhouse wrote:
> On Mon, 2010-08-09 at 14:38 +0300, Baruch Siach wrote:
> > With these patches applied I've tested mxc-nand-pu on a i.MX25 based system.
> > 
> > Baruch Siach (2):
> >   mxc_nand: fix build error
> >   mxc_nand: remove unused variables
> > 
> >  drivers/mtd/nand/mxc_nand.c |    9 +++------
> >  1 files changed, 3 insertions(+), 6 deletions(-)
> 
> These patches don't apply to the mtd-2.6.git tree.

These patches apply on top of the mxc-nand-pu branch of Sascha Hauer at 
git://git.pengutronix.de/git/imx/linux-2.6.git. Sorry for not mentioning this.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
