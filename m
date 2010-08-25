Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OoFXM-0001tl-OG
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2010 12:57:06 +0000
Subject: RE: [RFC] nand/davinci: Fix comment to match the code
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
In-Reply-To: <039d01cb4450$e8f7d6a0$bae783e0$@raj@ti.com>
References: <1282738700-30966-1-git-send-email-w.sang@pengutronix.de>
	<039d01cb4450$e8f7d6a0$bae783e0$@raj@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 Aug 2010 15:55:06 +0300
Message-ID: <1282740906.24044.210.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'Sneha Narnakaje' <nsnehaprabha@ti.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, 'Wolfram Sang' <w.sang@pengutronix.de>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-08-25 at 17:57 +0530, Sudhakar Rajashekhara wrote:
> > --- a/drivers/mtd/nand/davinci_nand.c
> > +++ b/drivers/mtd/nand/davinci_nand.c
> > @@ -369,8 +369,9 @@ compare:
> >  	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
> >  	 * begin trying to poll for the state, you may fall right out of your
> >  	 * loop without any of the correction calculations having taken place.
> > -	 * The recommendation from the hardware team is to wait till ECC_STATE
> > -	 * reads less than 4, which means ECC HW has entered correction state.
> > +	 * The recommendation from the hardware team is to initially delay as
> > +	 * long as ECC_STATE reads less than 4. After that, ECC HW has entered
> > +	 * correction state.
> >  	 */
> >  	do {
> >  		ecc_state = (davinci_nand_readl(info,
> > -- 
> 
> Thanks for pointing this out, but I have already corrected this and submitted
> the patch. Artem Bityutskity has pushed this patch to his l2-mtd-2.6 / master
> tree.

If you mean

commit 1c3275b656045aff9a75bb2c9f3251af1043ebb3
Author: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Date:   Tue Jul 20 15:24:01 2010 -0700

    mtd: nand: davinci: correct 4-bit error correction
    
    On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting the
    4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 and
    before waiting for the NAND Flash status register to be equal to 1, 2 or
    3, we have to wait till the ECC HW goes to correction state.  Without this
    wait, ECC correction calculations will not be proper.
    
    This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and DM365
    EVMs.
    
    Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
    Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

then it is already in upstream in Linus' tree. I do not have anything else from you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
