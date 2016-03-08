Date: Tue, 8 Mar 2016 16:20:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Chen-Yu Tsai
 <wens@csie.org>, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Maxime Ripard
 <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/16] mtd: nand: sunxi: fix clk rate calculation
Message-ID: <20160308162040.7b659486@bbrezillon>
In-Reply-To: <20160308155803.1b0263eb@free-electrons.com>
References: <1457367513-26069-1-git-send-email-boris.brezillon@free-electrons.com>
 <1457367513-26069-3-git-send-email-boris.brezillon@free-electrons.com>
 <20160308155803.1b0263eb@free-electrons.com>
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

On Tue, 8 Mar 2016 15:58:03 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Boris,
> 
> On Mon,  7 Mar 2016 17:18:19 +0100, Boris Brezillon wrote:
> > Unlike what is specified in the Allwinner datasheets, the NAND clock rate
> > is not equal to 2/T but 1/T. Fix the clock rate selection accordingly.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/sunxi_nand.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> > index 4d01e65..ab66d8d 100644
> > --- a/drivers/mtd/nand/sunxi_nand.c
> > +++ b/drivers/mtd/nand/sunxi_nand.c
> > @@ -1208,13 +1208,7 @@ static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
> >  	/* Convert min_clk_period from picoseconds to nanoseconds */
> >  	min_clk_period = DIV_ROUND_UP(min_clk_period, 1000);
> >  
> > -	/*
> > -	 * Convert min_clk_period into a clk frequency, then get the
> > -	 * appropriate rate for the NAND controller IP given this formula
> > -	 * (specified in the datasheet):
> > -	 * nand clk_rate = 2 * min_clk_rate
> > -	 */
> 
> When some HW works in a way that is *NOT* the one specified in the
> datasheet, I think you should rather add *more* comments about this
> aspect, rather than removing existing comments.

Fair enough (but you know how much I like documenting my code ;)). I'll
add a comment explaining why it differs from the datasheet
description :P.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
