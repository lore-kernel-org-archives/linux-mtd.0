Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWvpa-00060C-Fg
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 00:23:15 +0000
Received: by paap5 with SMTP id p5so4526675paa.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 17:22:53 -0700 (PDT)
Date: Tue, 1 Sep 2015 17:22:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com
Subject: Re: [PATCH] nand: sunxi: fix write to USER_DATA reg
Message-ID: <20150902002250.GM81844@google.com>
References: <1438250466-18396-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150824115630.53287671@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150824115630.53287671@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Aug 24, 2015 at 11:56:30AM +0200, Boris Brezillon wrote:
> On Thu, 30 Jul 2015 12:01:06 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > The USER_DATA register cannot be accessed using byte accessors on A13
> > SoCs, thus triggering a bug when using memcpy_toio on this register.
> > Declare a temporary u32 variable to store the USER_DATA value and access
> > the register with writel.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Could you consider taking this patch for 4.3 (if it's too late for
> 4.3-rc1, could you queue it for -rc2)?

Sorry, didn't notice this until after my pull request. I can take some
version of this for 4.3-rcX for sure. Remains to be seen which one...

> BTW, I'd like to add
> 
> Cc: <stable@vger.kernel.org> # 3.19+
> 
> should I resend a new version or could you add it while you're applying
> the patch on your branch?

I can add it if I take this one, or you can add it yourself if we make
it to v2.

> Thanks,
> 
> Boris
> 
> > ---
> >  drivers/mtd/nand/sunxi_nand.c | 24 +++++++++++++-----------
> >  1 file changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> > index 6f93b29..5e374ab 100644
> > --- a/drivers/mtd/nand/sunxi_nand.c
> > +++ b/drivers/mtd/nand/sunxi_nand.c
> > @@ -624,6 +624,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct mtd_info *mtd,
> >  	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
> >  
> >  	for (i = 0; i < ecc->steps; i++) {
> > +		u32 user_data;
> > +
> >  		if (i)
> >  			chip->cmdfunc(mtd, NAND_CMD_RNDIN, i * ecc->size, -1);
> >  
> > @@ -632,16 +634,16 @@ static int sunxi_nfc_hw_ecc_write_page(struct mtd_info *mtd,
> >  		offset = layout->eccpos[i * ecc->bytes] - 4 + mtd->writesize;
> >  
> >  		/* Fill OOB data in */
> > -		if (oob_required) {
> > -			tmp = 0xffffffff;
> > -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, &tmp,
> > -				    4);
> > +		if (!oob_required) {

Hmm, seems like you're flipping the condition:

  oob_required --> !oob_required

That looks like the right change, but it's not mentioned in the commit
message.

> > +			user_data = 0xffffffff;

While we're at it: this oob_required dance looks a little unnecessary.
If (as it seems here) you need to fill in the OOB data with *something*
(even if it's just 0xffffffff), then it's safe to just ignore
the oob_required parameter and just use chip->oob_poi, which will have
been filled with 0xff. (The semantic meaning is that even if programming
the OOB from ->oob_poi is "not required", it is still allowed.)

That would help simplify this code too, I think, as you can eliminate
the !oob_required case.

> >  		} else {
> > -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE,
> > -				    chip->oob_poi + offset - mtd->writesize,
> > -				    4);
> > +			memcpy(&user_data,
> > +			       chip->oob_poi + layout->oobfree[i].offset, 4);
> > +			user_data = le32_to_cpu(user_data);

sparse doesn't like this (here and below):

drivers/mtd/nand/sunxi_nand.c:656:37: warning: cast to restricted __le32 [sparse]
drivers/mtd/nand/sunxi_nand.c:793:31: warning: cast to restricted __le32 [sparse]

Seems you're trying to shoehorn yourself into using writel(), when you
don't actually want the endian swapping. I think this is a valid case
for using __raw_writel(), actually (Arnd even noted this last time we
discussed the "right" way to use some of these accessors). Maybe put a
comment for it too.

> >  		}
> >  
> > +		writel(user_data, nfc->regs + NFC_REG_USER_DATA_BASE);
> > +
> >  		chip->cmdfunc(mtd, NAND_CMD_RNDIN, offset, -1);
> >  
> >  		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
> > @@ -772,13 +774,13 @@ static int sunxi_nfc_hw_syndrome_ecc_write_page(struct mtd_info *mtd,
> >  		/* Fill OOB data in */
> >  		if (oob_required) {
> >  			tmp = 0xffffffff;
> > -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, &tmp,
> > -				    4);
> >  		} else {
> > -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, oob,
> > -				    4);
> > +			memcpy(&tmp, oob, sizeof(tmp));
> > +			tmp = le32_to_cpu(tmp);
> >  		}
> >  
> > +		writel(tmp, nfc->regs + NFC_REG_USER_DATA_BASE);
> > +
> >  		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ACCESS_DIR |
> >  		      (1 << 30);
> >  		writel(tmp, nfc->regs + NFC_REG_CMD);

Brian
