Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dILlS-0006SK-Uj
 for linux-mtd@lists.infradead.org; Tue, 06 Jun 2017 21:11:47 +0000
Date: Tue, 6 Jun 2017 23:11:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: nand: Add support for Toshiba BENAND
 (Built-in ECC NAND)
Message-ID: <20170606231119.5f0fcf85@bbrezillon>
In-Reply-To: <ea24c8c5-4607-6018-bca2-3eb7deaff5b9@toshiba.co.jp>
References: <1495761335-20535-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20170526182254.6a4f98c8@bbrezillon>
 <ea24c8c5-4607-6018-bca2-3eb7deaff5b9@toshiba.co.jp>
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

On Mon, 5 Jun 2017 14:36:23 +0900
KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:

> Hi Boris,
> 
> Thank you very much for your detailed review.
> I just comming back from busy week for conference and started to look it.
> 
> I have a question regarding to the following comment.
> 
> >>  static int toshiba_nand_init(struct nand_chip *chip)
> >>  {
> >> +	struct mtd_info *mtd = nand_to_mtd(chip);
> >> +
> >>  	if (nand_is_slc(chip))
> >>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
> >>  
> >> +	if (chip->ecc.mode == NAND_ECC_BENAND) {
> >> +		chip->ecc.options = NAND_ECC_CUSTOM_PAGE_ACCESS;
> >> +		chip->ecc.bytes = 0;  
> > 
> > It should be set to 16 according to the datasheet. But I guess this is
> > not exactly true. I'm pretty sure we can use some of these bytes to
> > store real data. Assuming you're using BCH, only 13bytes are needed for
> > 8bits/512bytes strength, and I guess the BBM region is also left
> > untouched (first 2 bytes of the OOB region).  
> 
> On BENAND, all OOB reginon can be used by user (driver). The calculated
> ECC data stored into other isolated area which is ubable to access from user.
> This is why chip->ecc.bytes = 0.

Oh, nice!

> To make sure this specification, I also checked the BENAND datasheet
> but unfortunatelly it was undocumented. Sorry for this confusion.

No problem. Do you think you can update the datasheet (or ask someone
who can) to clarify this aspect? As you said, it's really not clear
that these ECC bytes are actually stored in a dedicated region that is
invisible to users.

> 
> I think I can add comment here or add definition somewhere to describe this
> specification.

Yes please, add a comment in the code, just above the ->ecc.bytes = 0
assignment.

> If you have any preference or suggestion to describe this, please let me know.

Nope. Just put the explanation you give here.
