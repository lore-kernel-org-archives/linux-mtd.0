Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5TkO-0005vh-9E
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 09:05:29 +0000
Date: Tue, 2 May 2017 11:04:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Icenowy Zheng
 <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/15] mtd: nand: add manufacturer specific
 initialization/detection steps
Message-ID: <20170502110456.2b545823@bbrezillon>
In-Reply-To: <20170501210246.GA140640@google.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-6-git-send-email-boris.brezillon@free-electrons.com>
 <20170501210246.GA140640@google.com>
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

On Mon, 1 May 2017 14:02:46 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi,
> 
> On Tue, Jan 03, 2017 at 02:01:25PM +0100, Boris Brezillon wrote:
> > A lot of NANDs are implementing generic features in a non-generic way,
> > or are providing advanced auto-detection logic where the NAND ID bytes
> > meaning changes with the NAND generation.
> > 
> > Providing this vendor specific initialization step will allow us to get
> > rid of the full ids in the nand_ids table or all the vendor specific
> > cases added over the time in the generic NAND ID decoding logic.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 67 +++++++++++++++++++++++++++++++++++---------
> >  include/linux/mtd/nand.h     | 35 +++++++++++++++++++++++
> >  2 files changed, 89 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index efb3ade568d8..8f80faa57984 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c  
> 
> ...
> 
> > @@ -4163,6 +4196,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
> >  	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
> >  		chip->cmdfunc = nand_command_lp;
> >  
> > +	ret = nand_manufacturer_init(chip);
> > +	if (ret)
> > +		return ret;
> > +  
> 
> AFAICT, you're leaking anything that should be cleaned up in the
> ->cleanup() hook, for any error case after this. Not absolutely critical  
> to fix immediately, but I'd expect we should fix this in the 4.12 cycle.

Yep, already acked the patch. Thanks for the fix.
