Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYqVU-0000dW-FS
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 09:48:34 +0000
Date: Tue, 9 Jan 2018 10:47:32 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH] mtd: tests: nandbiterrs: Fix read_page return value
Message-ID: <20180109094732.3gir5acacsu3ce5a@pengutronix.de>
References: <20180109090938.29760-1-s.hauer@pengutronix.de>
 <20180109103112.2cc8681c@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109103112.2cc8681c@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 09, 2018 at 10:31:12AM +0100, Boris Brezillon wrote:
> On Tue,  9 Jan 2018 10:09:38 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > The number of corrected bitflips is not correctly reported by
> > the test until the bitflip threshold is reached.
> > 
> > read_page() shall return the number of corrected bitflips, but
> > mtd_read() returns 0 or a negative error, so we can't forward
> > its return value. In the absence of an error we always have
> > calculate the number of bitflips ourselves.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  drivers/mtd/tests/nandbiterrs.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
> > index 5f03b8c885a9..11e39ab4a810 100644
> > --- a/drivers/mtd/tests/nandbiterrs.c
> > +++ b/drivers/mtd/tests/nandbiterrs.c
> > @@ -152,15 +152,16 @@ static int read_page(int log)
> >  
> >  	err = mtd_read(mtd, offset, mtd->writesize, &read, rbuffer);
> >  	if (err == -EUCLEAN)
> 
> Why not just replacing the above test by
> 
> 	if (!err || err == -EUCLEAN)

Looks better indeed. I just sent an update.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
