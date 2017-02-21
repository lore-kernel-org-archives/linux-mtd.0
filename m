Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cg8DV-0002hw-UB
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 11:02:47 +0000
Date: Tue, 21 Feb 2017 12:02:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, "linshunquan (A)"
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH 04/11] nand: spi: Add read function support
Message-ID: <20170221120213.1f7c7728@bbrezillon>
In-Reply-To: <CAAyFORKDNpkycQ-n5yg=H+fmu6v4teUhwzcXEa-SROV_8kVOBA@mail.gmail.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-5-git-send-email-peterpandong@micron.com>
 <20170221105153.75772e25@bbrezillon>
 <CAAyFORKDNpkycQ-n5yg=H+fmu6v4teUhwzcXEa-SROV_8kVOBA@mail.gmail.com>
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

On Tue, 21 Feb 2017 18:06:03 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:



> >> +/**
> >> + * spi_nand_transfer_oob - transfer oob to client buffer
> >> + * @chip: SPI-NAND device structure
> >> + * @oob: oob destination address
> >> + * @ops: oob ops structure
> >> + * @len: size of oob to transfer
> >> + */
> >> +static void spi_nand_transfer_oob(struct spi_nand_chip *chip, u8 *oob,
> >> +                               struct mtd_oob_ops *ops, size_t len)
> >> +{
> >> +     struct mtd_info *mtd = spi_nand_to_mtd(chip);
> >> +     int ret;
> >> +
> >> +     switch (ops->mode) {
> >> +
> >> +     case MTD_OPS_PLACE_OOB:
> >> +     case MTD_OPS_RAW:
> >> +             memcpy(oob, chip->oobbuf + ops->ooboffs, len);
> >> +             return;
> >> +
> >> +     case MTD_OPS_AUTO_OOB:
> >> +             ret = mtd_ooblayout_get_databytes(mtd, oob, chip->oobbuf,
> >> +                                               ops->ooboffs, len);
> >> +             BUG_ON(ret);
> >> +             return;
> >> +
> >> +     default:
> >> +             BUG();  
> >
> > Let's try to avoid these BUG_ON() calls. If you want transfer_oob() to
> > report an error, change the function prototype and check the ret code
> > in the caller.  
> 
> I will remove the BUG_ON()s in v2. Boris, I think this part can be put in
> new NAND core, what do you think?

Well, assuming we move the ->oob buffer in nand_device struct, then
yes. That's exactly for this reason I wanted to see a version of the
SPI NAND framework before merging the "interface-agnostic NAND layer".
I guess we'll find other candidates for factorization, but I also think
we should not try to get the perfect implementation before merging
something (IOW, let's keep this improvement on our TODO list).

> 
> >  
> >> +     }
> >> +}
