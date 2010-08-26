Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OoTiL-0001WI-0G
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2010 04:05:21 +0000
Received: from dflp53.itg.ti.com ([128.247.5.6])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o7Q45Ici012892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2010 23:05:19 -0500
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: <Artem.Bityutskiy@nokia.com>
References: <1282738700-30966-1-git-send-email-w.sang@pengutronix.de>	<039d01cb4450$e8f7d6a0$bae783e0$@raj@ti.com>
	<1282740906.24044.210.camel@localhost>
In-Reply-To: <1282740906.24044.210.camel@localhost>
Subject: RE: [RFC] nand/davinci: Fix comment to match the code
Date: Thu, 26 Aug 2010 09:29:56 +0530
Message-ID: <045301cb44d3$2551fef0$6ff5fcd0$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	'Sneha Narnakaje' <nsnehaprabha@ti.com>,
	'Wolfram Sang' <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 25, 2010 at 18:25:06, Artem Bityutskiy wrote:
> On Wed, 2010-08-25 at 17:57 +0530, Sudhakar Rajashekhara wrote:
> > > --- a/drivers/mtd/nand/davinci_nand.c
> > > +++ b/drivers/mtd/nand/davinci_nand.c
> > > @@ -369,8 +369,9 @@ compare:
> > >  	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
> > >  	 * begin trying to poll for the state, you may fall right out of your
> > >  	 * loop without any of the correction calculations having taken place.
> > > -	 * The recommendation from the hardware team is to wait till ECC_STATE
> > > -	 * reads less than 4, which means ECC HW has entered correction state.
> > > +	 * The recommendation from the hardware team is to initially delay as
> > > +	 * long as ECC_STATE reads less than 4. After that, ECC HW has entered
> > > +	 * correction state.
> > >  	 */
> > >  	do {
> > >  		ecc_state = (davinci_nand_readl(info,
> > > -- 
> > 
> > Thanks for pointing this out, but I have already corrected this and submitted
> > the patch. Artem Bityutskity has pushed this patch to his l2-mtd-2.6 / master
> > tree.
> 
> If you mean
> 
> commit 1c3275b656045aff9a75bb2c9f3251af1043ebb3
> Author: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> Date:   Tue Jul 20 15:24:01 2010 -0700
> 
>     mtd: nand: davinci: correct 4-bit error correction
>     
>     On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting the
>     4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 and
>     before waiting for the NAND Flash status register to be equal to 1, 2 or
>     3, we have to wait till the ECC HW goes to correction state.  Without this
>     wait, ECC correction calculations will not be proper.
>     
>     This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and DM365
>     EVMs.
>     
>     Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
>     Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> 
> then it is already in upstream in Linus' tree. I do not have anything else from you.
> 

Yes, this was the patch I was talking about. But this patch seems little
different than the one I submitted to linux-mtd list at
http://patchwork.ozlabs.org/patch/59180/. But I can submit another patch
which corrects it. 

Wolfram Sang,
Do you agree that in the above link which shows the patch I have submitted,
the comment matches the code?

Regards,
Sudhakar
