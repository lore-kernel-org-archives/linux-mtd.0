Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSpMs-0002uY-Il
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 12:54:49 +0000
Received: by werc12 with SMTP id c12so129276wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 05:54:39 -0700 (PDT)
Date: Fri, 11 May 2012 15:54:24 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/2] mtd: nand: check the return code of
 'read_oob/read_oob_raw'
Message-ID: <20120511155424.7e7c5666@halley>
In-Reply-To: <1336736891.2625.49.camel@sauron.fi.intel.com>
References: <20120509130635.32973038@pixies.home.jungo.com>
 <20120509131334.2d0b7160@pixies.home.jungo.com>
 <1336736891.2625.49.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, 11 May 2012 14:48:11 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-05-09 at 13:13 +0300, Shmulik Ladkani wrote:
> > @@ -1826,9 +1827,12 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
> >  
> >  	while (1) {
> >  		if (ops->mode == MTD_OPS_RAW)
> > -			chip->ecc.read_oob_raw(mtd, chip, page);
> > +			ret = chip->ecc.read_oob_raw(mtd, chip, page);
> >  		else
> > -			chip->ecc.read_oob(mtd, chip, page);
> > +			ret = chip->ecc.read_oob(mtd, chip, page);
> > +
> > +		if (ret < 0)
> > +			break;
> 
> For page reading the convention is that we keep reading and try to read
> everything anyway, I guess it is reasonable thing to do for OOB as well?

AFAIU, we actually _stop_ reading upon 'ecc.read_page()' error.
And 'ops->retlen' is updated to reflect actual bytes sucessfully read.

See snip from 'nand_do_read_ops':

---------------------------------
	while (1) {

		...
		...

			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);

			/*
			 * Now read the page into the buffer.  Absent an error,
			 * the read methods return max bitflips per ecc step.
			 */
			if (unlikely(ops->mode == MTD_OPS_RAW))
				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
							      oob_required,
							      page);
			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
				ret = chip->ecc.read_subpage(mtd, chip,
							col, bytes, bufpoi);
			else
				ret = chip->ecc.read_page(mtd, chip, bufpoi,
							  oob_required, page);
			if (ret < 0) {
				if (!aligned)
					/* Invalidate page cache */
					chip->pagebuf = -1;
				break;
			}

		...
		...

	}

	ops->retlen = ops->len - (size_t) readlen;
	if (oob)
		ops->oobretlen = ops->ooblen - oobreadlen;

	if (ret < 0)
		return ret;
---------------------------------

The error is propagated back to 'nand_read' and to the 'mtd->_read'
user.

Have I misinterpreted your question? Did you mean something else?

BTW, note that the patch does not intend to change existing
behavior of '_read_oob' in case 'ecc.read_oob()' calls were succesful.

The behavior is changed only if 'ecc.read_oob()' fails.
In that case an error indication is returned and 'ops->oobretlen' is set
appropriately.
I havn't tested this, but it seems as the reaonable thing to report back
to the '_read_oob' users.

Regards,
Shmulik
