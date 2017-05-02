Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5V5O-00069u-Kr
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 10:31:16 +0000
Date: Tue, 2 May 2017 12:30:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 3/3][v3] mtd: nand: davinci: set ECC algorithm
 explicitly for HW based ECC
Message-ID: <20170502123053.6437e04b@bbrezillon>
In-Reply-To: <20170502110045.29cb9121@bbrezillon>
References: <20170313074641.28b383e7@bbrezillon>
 <20170502081323.3138-1-lynxis@fe80.eu>
 <20170502081323.3138-4-lynxis@fe80.eu>
 <20170502110045.29cb9121@bbrezillon>
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

On Tue, 2 May 2017 11:00:45 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Tue,  2 May 2017 10:13:23 +0200
> Alexander Couzens <lynxis@fe80.eu> wrote:
> 
> > Required to set the ooblayout based on the algorithm.  
> 
> Not strictly required if you take my comment into account (see my
> reply to patch 2). This being said, it's always to have this kind of
> information, I'll just have to check if it doesn't conflict with
> Masahiro's patches.

Never mind, I'm just mixing up davinci and denali :-).

> 
> > 
> > Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> > ---
> >  drivers/mtd/nand/davinci_nand.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> > index 27fa8b87cd5f..9e5167496ce1 100644
> > --- a/drivers/mtd/nand/davinci_nand.c
> > +++ b/drivers/mtd/nand/davinci_nand.c
> > @@ -760,11 +760,13 @@ static int nand_davinci_probe(struct platform_device *pdev)
> >  			info->chip.ecc.hwctl = nand_davinci_hwctl_4bit;
> >  			info->chip.ecc.bytes = 10;
> >  			info->chip.ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
> > -		} else {
> > +			info->chip.ecc.algo = NAND_ECC_BCH;
> > +		} else { /* 1bit ecc hamming */  
> 
> Please put this comment on the next line.
> 
> >  			info->chip.ecc.calculate = nand_davinci_calculate_1bit;
> >  			info->chip.ecc.correct = nand_davinci_correct_1bit;
> >  			info->chip.ecc.hwctl = nand_davinci_hwctl_1bit;
> >  			info->chip.ecc.bytes = 3;
> > +			info->chip.ecc.algo = NAND_ECC_HAMMING;
> >  		}
> >  		info->chip.ecc.size = 512;
> >  		info->chip.ecc.strength = pdata->ecc_bits;  
> 
