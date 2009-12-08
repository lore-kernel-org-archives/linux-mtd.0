Date: Tue, 8 Dec 2009 12:16:08 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: Juergen Beisert <jbe@pengutronix.de>
Subject: Re: [PATCH] [NAND] S3C2410: Fix NFC clock enable/disable imbalance
Message-ID: <20091208121607.GA20364@trinity.fluff.org>
References: <200912081056.40210.jbe@pengutronix.de>
	<4B1E3815.9020901@ru.mvista.com>
	<200912081307.17955.jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200912081307.17955.jbe@pengutronix.de>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 08, 2009 at 01:07:17PM +0100, Juergen Beisert wrote:
> On Dienstag, 8. Dezember 2009, Sergei Shtylyov wrote:
> > Hello.
> >
> > Juergen Beisert wrote:
> > > When unmounting an mtd filesystem the s3c2410_nand_select_chip() function
> > > gets called again with "chip == -1". In this case the current code
> > > disables the NFC clock at least a second time, so it does not work
> > > anymore. Clock disabling should only happen if it was really enabled.
> > >
> > > Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
> > >
> > > ---
> > >  drivers/mtd/nand/s3c2410.c |    8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > Index: linux-2.6.32/drivers/mtd/nand/s3c2410.c
> > > ===================================================================
> > > --- linux-2.6.32.orig/drivers/mtd/nand/s3c2410.c
> > > +++ linux-2.6.32/drivers/mtd/nand/s3c2410.c
> > > @@ -329,12 +329,16 @@ static void s3c2410_nand_select_chip(str
> > >  	struct s3c2410_nand_mtd *nmtd;
> > >  	struct nand_chip *this = mtd->priv;
> > >  	unsigned long cur;
> > > +	int clock_enabled;
> >
> >    Could be *bool*...
> 
> I'm not sure. When this function is called more than once to disable a NAND 
> device chip select, who knows if it might be called more than once to enable 
> it? Just an idea.

it might be worth tracking the clock state, not only in these case but to
ensure that things like suspend/resume cycles don't cause problems too.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
