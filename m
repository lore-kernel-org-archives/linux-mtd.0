Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VorVz-00085l-5w
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 09:16:03 +0000
Date: Fri, 6 Dec 2013 16:48:45 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131206084844.GA16001@shlinux2.ap.freescale.net>
References: <1386274800-22013-1-git-send-email-computersforpeace@gmail.com>
 <1386274800-22013-3-git-send-email-computersforpeace@gmail.com>
 <20131205205838.GL27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20131205205838.GL27149@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 12:58:38PM -0800, Brian Norris wrote:
> Caught a simple bug when testing with a non-READ_RETRY NAND. See below.
> 
> On Thu, Dec 05, 2013 at 12:19:59PM -0800, Brian Norris wrote:
> ...
> > One thing I'm not sure about: do all relevant (i.e., ONFI-capable) NAND drivers
> > support SET_FEATURES properly? If not, then it's possible that this could break
> > nand_do_read_ops for such drivers. Not sure what the best method of handling
> > that would be.
> ...
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> ...
> > @@ -1512,8 +1535,27 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
> >  					nand_wait_ready(mtd);
> >  			}
> >  
> > -			if (mtd->ecc_stats.failed - ecc_failures)
> > -				ecc_fail = true;
> > +			if (mtd->ecc_stats.failed - ecc_failures) {
> > +				retry_mode++;
> 
> This increment shouldn't be done for all ECC failures, but only for
> failures where there are remaining read-retry modes (i.e., flash that
> support read retry).
> 
> > +				if (retry_mode < chip->read_retries) {
> > +					pr_debug("ECC error; performing READ RETRY %d\n",
> > +							retry_mode);
> > +
> > +					ret = nand_set_read_retry(mtd,
> > +							retry_mode);
> > +					if (ret < 0)
> > +						break;
> > +
> > +					/* Reset failures */
> > +					mtd->ecc_stats.failed = ecc_failures;
> > +					continue;
> > +				} else {
> > +					/* No more retry modes; real failure */
> > +					ecc_fail = true;
> > +				}
> > +			}
> > +
> > +			buf += bytes;
> >  		} else {
> >  			memcpy(buf, chip->buffers->databuf + col, bytes);
> >  			buf += bytes;
> 
> I'll send a v2 with the following extra diff:

I am glad you begin to add the read-retry support.

I ever planned to send out my read-retry patch set (which has been queued
in my hand for half of year) after I finish the
spi nor framework. 

I can not wait to review your V2 patch.

thanks
Huang Shijie
