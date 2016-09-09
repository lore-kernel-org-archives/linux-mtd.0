Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biRPu-0008BA-Oo
 for linux-mtd@lists.infradead.org; Fri, 09 Sep 2016 19:24:51 +0000
Date: Fri, 9 Sep 2016 21:24:28 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 1/9] mtd: nand: Create a NAND reset function
Message-ID: <20160909192428.bxexkdokigezeqc7@pengutronix.de>
References: <1473422712-12359-1-git-send-email-s.hauer@pengutronix.de>
 <1473422712-12359-2-git-send-email-s.hauer@pengutronix.de>
 <CAOMZO5DfSU5rhf45Vcs7Sit=v2FdQtm=nhdfstZdYwizP6C-=w@mail.gmail.com>
 <20160909142635.23a8c865@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160909142635.23a8c865@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, Sep 09, 2016 at 02:26:35PM +0200, Boris Brezillon wrote:
> On Fri, 9 Sep 2016 09:15:52 -0300
> Fabio Estevam <festevam@gmail.com> wrote:
> > On Fri, Sep 9, 2016 at 9:05 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > 
> > >  /**
> > > + * nand_reset - Reset and initialize a NAND device
> > > + * @chip: The NAND chip
> > > + *
> > > + * Returns 0 for success or negative error code otherwise
> > > + */
> > > +int nand_reset(struct nand_chip *chip)
> > > +{
> > > +       chip->cmdfunc(&chip->mtd, NAND_CMD_RESET, -1, -1);
> > > +
> > > +       return 0;  
> > 
> > It always return 0 here, so the comment and code do not match.
> 
> Not sure this is a big problem, because the function is updated in
> patch 6 and after that it can return an error.

Also from a purely logically POV "Returns 0 for success or negative
error code otherwise" doesn't contradict the implementation. The
function just always succeeds and so the statement is true because the
left argument of the or expression is true :-)

SCNR
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
