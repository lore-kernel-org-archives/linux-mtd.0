Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8T3y-0005Rf-TU
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 10:07:39 +0000
Date: Thu, 21 Feb 2013 11:07:28 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH RFC] mtd/nand: implement user otp for Micron chips
Message-ID: <20130221100728.GI32249@pengutronix.de>
References: <1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <5125ED30.3020305@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5125ED30.3020305@parrot.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Feb 21, 2013 at 10:47:28AM +0100, Matthieu CASTET wrote:
> Uwe Kleine-König a écrit :
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> > 
> > there are some things to clean up before this patch can be applied. See
> > the respective comments in the code, most of them are marked with XXX,
> > but I'm sure you'll find things to criticize that I didn't mark :-)
> > 
> > About the unsuitablity of nand_do_read_ops and nand_do_write_ops I'd like to
> > hear your thoughts. Would you prefer a new function that does only the
> > necessary stuff, or should I add another parameter to make them do the
> > right thing for me?
> > 
> > BTW, to make use of this patch you'd need
> > 	http://patchwork.ozlabs.org/patch/221191/
> > 
> > Best regards
> > Uwe
> > 
> >  drivers/mtd/nand/nand_base.c |  126 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 126 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 3766682..10e51f3 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2753,6 +2753,116 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
> >  	return 0;
> Shouldn't vendor specific code go in another file ?
OK for me, I didn't notice any other vendor specific code and e.g. onfi
stuff is in nand_base, too. (Maybe that is because it's not possible to
see from the filenames under drivers/mtd/nand if that file defines a
controller driver or some chip specific stuff.)

I will move it to a file nandchip-micron.c for the next submission. Does
this look right?  I will wait for more feedback though.

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
