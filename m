From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nuc900_nand: read correct SMISR register
Date: Wed, 13 Jan 2016 23:02:06 +0100
Message-ID: <5830403.0pR8UVXPRZ@wuerfel>
In-Reply-To: <20160113215013.GS109450@google.com>
References: <9019174.GYajdpGP8V@wuerfel> <20160113215013.GS109450@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 13 January 2016 13:50:13 Brian Norris wrote:
> 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
> > index 220ddfcf29f5..dbc5b571c2bb 100644
> > --- a/drivers/mtd/nand/nuc900_nand.c
> > +++ b/drivers/mtd/nand/nuc900_nand.c
> > @@ -113,7 +113,7 @@ static int nuc900_check_rb(struct nuc900_nand *nand)
> >  {
> >       unsigned int val;
> >       spin_lock(&nand->lock);
> > -     val = __raw_readl(REG_SMISR);
> > +     val = __raw_readl(nand->reg + REG_SMISR);
> >       val &= READYBUSY;
> >       spin_unlock(&nand->lock);
> >  
> 
> Looks OK to me, though I kinda hate dragging on support for
> obviously-unused drivers...

Should we mark that driver in Kconfig as obviously broken then?

Let's wait for Wan ZongShun to reply first, it's possible that the
entire w90x900 platform has come to the point where we are better off
removing it than fixing ancient bugs.

	Arnd
