Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUkjX-0006Ie-Iv
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2015 00:08:00 +0000
Received: by pabzx8 with SMTP id zx8so4012512pab.1
 for <linux-mtd@lists.infradead.org>; Wed, 26 Aug 2015 17:07:39 -0700 (PDT)
Date: Wed, 26 Aug 2015 17:07:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Cc: Xander Huff <xander.huff@ni.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jeff.westfahl@ni.com" <jeff.westfahl@ni.com>,
 "jaeden.amero@ni.com" <jaeden.amero@ni.com>,
 "joshc@ni.com" <joshc@ni.com>, Ben Shelton <ben.shelton@ni.com>,
 Richard Weinberger <richard@nod.at>,
 Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?= <peterpandong@micron.com>
Subject: Re: [RESEND RESEND RESEND PATCH v2] mtd: nand_bbt: scan for next
 free bbt block if writing bbt fails
Message-ID: <20150827000731.GW81844@google.com>
References: <1439330122-41912-1-git-send-email-xander.huff@ni.com>
 <1440524966-29627-1-git-send-email-xander.huff@ni.com>
 <20150825183400.GH81844@google.com>
 <A765B125120D1346A63912DDE6D8B6310BF47F35@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF47F35@NTXXIAMBX02.xacn.micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 26, 2015 at 03:57:00PM +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> > On Tue, Aug 25, 2015 at 12:49:26PM -0500, Xander Huff wrote:

> > > diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> > > index 63a1a36..09f9e62 100644
> > > --- a/drivers/mtd/nand/nand_bbt.c
> > > +++ b/drivers/mtd/nand/nand_bbt.c

> > > -787,13 +788,42 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
> > >  		einfo.addr = to;
> > >  		einfo.len = 1 << this->bbt_erase_shift;
> > >  		res = nand_erase_nand(mtd, &einfo, 1);
> > > -		if (res < 0)
> > > +		if (res == -EIO && einfo.state == MTD_ERASE_FAILED
> > > +		    && einfo.priv == NAND_ERASE_BLOCK_ERASE_FAILED) {
> > 
> > Do you actually need that last condition? What's wrong with the first two?
> > 
> > > +			/* This block is bad. Mark it as such and see if
> > > +			 * there's another block available in the BBT area. */
> > > +			int block = page >>
> > > +				(this->bbt_erase_shift - this->page_shift);
> > > +			pr_info("nand_bbt: failed to erase block %d when writing
> > BBT\n",
> > > +				block);
> > > +			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> > > +
> > > +			res = this->block_markbad(mtd, block);
> > > +			if (res)
> > > +				pr_warn("nand_bbt: error %d while marking block %d
> > bad\n",
> > > +					res, block);
> > > +			goto next;
> > > +		} else if (res < 0)
> > >  			goto outerr;
> 
> 
> For my knowledge , we don't directly mark this block be a bad block,
> Just like ubi layer,this block also need to further testing and verify if
> It is real bad block.right?

That's a good point...we might want some kind of separate function for a
torture test. Might look at UBI's torture_peb() for inspiration.

> > >
> > >  		res = scan_write_bbt(mtd, to, len, buf,
> > >  				td->options & NAND_BBT_NO_OOB ? NULL :
> > >  				&buf[len]);
> > > -		if (res < 0)
> > > +		if (res == -EIO) {
> > > +			/* This block is bad. Mark it as such and see if
> > > +			 * there's another block available in the BBT area. */
> > > +			int block = page >>
> > > +				(this->bbt_erase_shift - this->page_shift);
> > > +			pr_info("nand_bbt: failed to erase block %d when writing
> > BBT\n",
> > > +				block);
> > > +			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> > > +
> > > +			res = this->block_markbad(mtd, block);
> > > +			if (res)
> > > +				pr_warn("nand_bbt: error %d while marking block %d
> > bad\n",
> > > +					res, block);
> > > +			goto next;
> > > +		} else if (res < 0)
> > >  			goto outerr;
> > >
> > >  		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",

Brian
