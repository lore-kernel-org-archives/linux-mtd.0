Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dwxDB-0006ZO-EN
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 21:16:16 +0000
Date: Tue, 26 Sep 2017 23:15:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH -next v2] mtd: nand: Add support for Toshiba BENAND
 (Built-in ECC NAND)
Message-ID: <20170926231549.40c09c5d@bbrezillon>
In-Reply-To: <34d612f6-a479-21e7-f0aa-734e647d5942@toshiba.co.jp>
References: <1505971922-4994-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20170921092849.6f1ba4b8@bbrezillon>
 <34d612f6-a479-21e7-f0aa-734e647d5942@toshiba.co.jp>
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

On Tue, 26 Sep 2017 18:18:04 +0900
KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:

> On 2017/09/21 16:28, Boris Brezillon wrote:
> > On Thu, 21 Sep 2017 14:32:02 +0900
> > KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
> >   
> >> This patch enables support for Toshiba BENAND.
> >> The current implementation does not support vondor specific command  
> > 
> > 					       ^ vendor
> >   
> >> TOSHIBA_NAND_CMD_ECC_STATUS. I would like to add the command, when
> >> the exec_op() [1] infrastructure is implemented.  
> > 
> > It's not a good idea to reference a branch that is likely to disappear
> > in a commit message. Just say that you can't properly support the
> > TOSHIBA_NAND_CMD_ECC_STATUS operation right and that it might be
> > addressed in the future.  
> 
> Thanks. I'll change the comment.
> 
> >> +	 */
> >> +	if (status & NAND_STATUS_FAIL) {
> >> +		/* uncorrectable */
> >> +		mtd->ecc_stats.failed++;
> >> +	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
> >> +		/* correctable */
> >> +		max_bitflips = mtd->bitflip_threshold;
> >> +		mtd->ecc_stats.corrected += max_bitflips;
> >> +	}  
> > 
> > Is this working correctly when you read more than one ECC chunk? The
> > ECC step size is 512 bytes and the page is bigger than that, which means
> > you have more than one ECC chunk per page. What happens to the
> > NAND_STATUS_FAIL flag if the first chunk is uncorrectable but
> > following ones are correctable (or do not contain bitflips at all)?   
> 
> As you mentioned, the ECC step size is 512 byte. But when 0x70 command is used
> a simplified ECC status per page is generated.

I'm fine with that as long as uncorrectable errors are detected
correctly and TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED is set as soon as
one of the ECC chunk exposes too many bitflips.

> In case the first chunk is uncorrectable but the following ones are correctable,
> the 0x70 command can only check the status of the uncorrectable one.

Sounds good.

> Each ECC chunk status can be checked by using the 0x7A command.
> 
> >> @@ -39,9 +105,43 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
> >>  
> >>  static int toshiba_nand_init(struct nand_chip *chip)
> >>  {
> >> +	struct mtd_info *mtd = nand_to_mtd(chip);
> >> +
> >>  	if (nand_is_slc(chip))
> >>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
> >>  
> >> +	if (nand_is_slc(chip) && (chip->id.data[4] & 0x80)) {
> >> +		/* BENAND */
> >> +
> >> +		/*
> >> +		 * We can't disable the internal ECC engine, the user
> >> +		 * has to use on-die ECC, there is no alternative.
> >> +		 */
> >> +		if (chip->ecc.mode != NAND_ECC_ON_DIE) {
> >> +			pr_err("On-die ECC should be selected.\n");
> >> +			return -EINVAL;
> >> +		}  
> > 
> > According to your previous explanation that's not exactly true. Since
> > ECC bytes are stored in a separate area, the user can decide to use
> > another mode without trouble. Just skip the BENAND initialization when
> > mode != NAND_ECC_ON_DIE and we should be good, or am I missing something?  
> 
> I am asking to product department to confirm it.

I'm almost sure this is the case ;-).

> 
> >> +
> >> +		/*
> >> +		 * On BENAND, all OOB reginon can be used by user (driver).  
> > 
> > 			      the entire OOB region can be used by the
> > 		   MTD user.
> > 
> > I'd drop the '(driver)' part since it's not really clear what the
> > driver is. If you're talking about the NAND controller driver then it's
> > wrong (at least most of the time), the real users of free OOB bytes are
> > upper layers (like JFFS2).
> >   
> >> +		 * The calculated ECC bytes are stored into other isolated
> >> +		 * area which is ubable to access from user.  
> > 
> > 			which is not accessible to users.
> >   
> >> +		 * This is why chip->ecc.bytes = 0.
> >> +		 */
> >> +		chip->ecc.bytes = 0;
> >> +		chip->ecc.size = 512;
> >> +		chip->ecc.strength = 8;
> >> +		chip->ecc.read_page = toshiba_nand_read_page_benand;
> >> +		chip->ecc.read_subpage = toshiba_nand_read_subpage_benand;
> >> +		chip->ecc.write_page = nand_write_page_raw;
> >> +		chip->ecc.read_page_raw = nand_read_page_raw;
> >> +		chip->ecc.write_page_raw = nand_write_page_raw;
> >> +
> >> +		chip->options |= NAND_SUBPAGE_READ;
> >> +
> >> +		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);  
> > 
> > Can you please move this code block in a separate toshiba_benand_init()
> > function in order to keep the toshiba_nand_init() small/readable.  
> 
> Sure. I will resend.
> 
> -- Yoshi
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
