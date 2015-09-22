Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeIPL-0001Lb-Rq
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 07:54:36 +0000
Date: Tue, 22 Sep 2015 09:54:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Roger Quadros <rogerq@ti.com>, Ezequiel =?UTF-8?B?R2FyY8OtYQ==?=
 <ezequiel@vanguardiasur.com.ar>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Josh Wu <josh.wu@atmel.com>
Subject: Re: [RESEND PATCH v3 2/5] mtd: nand: return consistent error codes
 in ecc.correct() implementations
Message-ID: <20150922095413.562a83f5@bbrezillon>
In-Reply-To: <20150921231029.GF31505@google.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
 <1441296222-14989-3-git-send-email-boris.brezillon@free-electrons.com>
 <20150921231029.GF31505@google.com>
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

Hi,

On Mon, 21 Sep 2015 16:10:29 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> + a few others for review/test, since this touches several drivers
> 
> On Thu, Sep 03, 2015 at 06:03:39PM +0200, Boris Brezillon wrote:
> > The error code returned by the ecc.correct() are not consistent over the
> > all implementations.
> > 
> > Document the expected behavior in include/linux/mtd/nand.h and fix
> > offending implementations.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> The patch all looks good to me. A note below:
> 
> > ---
> >  drivers/mtd/nand/atmel_nand.c   |  2 +-
> >  drivers/mtd/nand/bf5xx_nand.c   | 20 ++++++++++++++------
> >  drivers/mtd/nand/davinci_nand.c |  6 +++---
> >  drivers/mtd/nand/jz4740_nand.c  |  4 ++--
> >  drivers/mtd/nand/mxc_nand.c     |  4 ++--
> >  drivers/mtd/nand/nand_bch.c     |  2 +-
> >  drivers/mtd/nand/nand_ecc.c     |  2 +-
> >  drivers/mtd/nand/omap2.c        |  6 +++---
> >  drivers/mtd/nand/r852.c         |  4 ++--
> >  include/linux/mtd/nand.h        |  8 +++++++-
> >  include/linux/mtd/nand_bch.h    |  2 +-
> >  11 files changed, 37 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> > index 46010bd..dc7b399 100644
> > --- a/drivers/mtd/nand/atmel_nand.c
> > +++ b/drivers/mtd/nand/atmel_nand.c
> > @@ -1443,7 +1443,7 @@ static int atmel_nand_correct(struct mtd_info *mtd, u_char *dat,
> >  		 * We can't correct so many errors */
> >  		dev_dbg(host->dev, "atmel_nand : multiple errors detected."
> >  				" Unable to correct.\n");
> > -		return -EIO;
> > +		return -EBADMSG;
> >  	}
> >  
> >  	/* if there's a single bit error : we can correct it */
> > diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
> > index 4d8d4ba..9c39056 100644
> > --- a/drivers/mtd/nand/bf5xx_nand.c
> > +++ b/drivers/mtd/nand/bf5xx_nand.c
> > @@ -252,7 +252,7 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
> >  	 */
> >  	if (hweight32(syndrome[0]) == 1) {
> >  		dev_err(info->device, "ECC data was incorrect!\n");
> > -		return 1;
> > +		return -EBADMSG;
> >  	}
> >  
> >  	syndrome[1] = (calced & 0x7FF) ^ (stored & 0x7FF);
> > @@ -285,7 +285,7 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
> >  		data = data ^ (0x1 << failing_bit);
> >  		*(dat + failing_byte) = data;
> >  
> > -		return 0;
> > +		return 1;
> >  	}
> >  
> >  	/*
> > @@ -298,26 +298,34 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
> >  	dev_err(info->device,
> >  		"Please discard data, mark bad block\n");
> >  
> > -	return 1;
> > +	return -EBADMSG;
> >  }
> 
> The above changes to bf5xx_nand all look correct, but they are actually
> semantic changes that could be considered a bugfix (correctable errors
> were going unreported, and uncorrectable errors were being reported as
> correctable). I'm not sure this really deserves special treatment (e.g.,
> -stable) since apparently no one cared. Perhaps this platform is dead?
> 
> Anyway, I'll probably add a comment to the commit description if I take
> this patch.

No problem, feel free to add extra explanations in the commit message.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
