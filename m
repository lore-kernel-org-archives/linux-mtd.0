Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGfLa-0006tl-Fo
 for linux-mtd@lists.infradead.org; Thu, 10 May 2018 06:46:46 +0000
Date: Thu, 10 May 2018 08:46:14 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, stable@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Bean Huo <beanhuo@micron.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Peter
 Pan <peterpandong@micron.com>
Subject: Re: [PATCH] mtd: rawnand: micron: Fix support for on-die ECC
Message-ID: <20180510084614.07b1fd9c@bbrezillon>
In-Reply-To: <20180508231259.10e951d4@bbrezillon>
References: <20180503074908.20485-1-boris.brezillon@bootlin.com>
 <20180504115835.5702710e@xps13>
 <20180508231259.10e951d4@bbrezillon>
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

On Tue, 8 May 2018 23:12:59 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Fri, 4 May 2018 11:58:35 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Hi Boris,
> > 
> > On Thu,  3 May 2018 09:49:08 +0200, Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:
> >   
> > > It looks like the NAND_STATUS_FAIL bit is sticky after an ECC failure,
> > > which leads all READ operations following the failing one to report
> > > an ECC failure. Reset the chip to clear the NAND_STATUS_FAIL bit.
> > > 
> > > Note that this behavior is not document in the datasheet, but resetting
> > > the chip is the only solution we found to fix the problem.
> > > 
> > > Fixes: 9748e1d87573 ("mtd: nand: add support for Micron on-die ECC")
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > Cc: Bean Huo <beanhuo@micron.com>
> > > Cc: Peter Pan <peterpandong@micron.com>
> > > ---    
> > 
> > Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> Queued to mtd/master.

I'm dropping this patch because I'm no longer sure this is the correct
way to fix bug. It seems that nand_set_features_op() is checking the
FAIL bit while the ONFI spec clearly says that FAIL bit is only valid
after a PROGRAM, ERASE or READ-with-on-die-ECC-enabled op. That might
explain why ->set_features() fails with -EIO after an ECC failure
(apparently Micron only clears the FAIL bit when launching a PROGRAM,
ERASE or READ-with-on-die-ECC-enabled op, not on a SET_FEATURES op).
