Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVdJ-0002RB-Vs
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:40:43 +0000
Date: Thu, 30 Mar 2017 10:40:05 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>, Arnaud
 Mouiche <arnaud.mouiche@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Marek Vasut <marex@denx.de>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v4 3/9] mtd: nand: add more helpers in nand.h
Message-ID: <20170330104005.6b736b3e@bbrezillon>
In-Reply-To: <CAAyFORLydLDvTXTbHz8p4a7qA4rK+v5qS+gcwGc3frEjmO8Y7A@mail.gmail.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-4-git-send-email-peterpandong@micron.com>
 <20170329215749.1c35f780@bbrezillon>
 <CAAyFORLydLDvTXTbHz8p4a7qA4rK+v5qS+gcwGc3frEjmO8Y7A@mail.gmail.com>
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

On Thu, 30 Mar 2017 16:04:44 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> Hi Boris,
> 
> On Thu, Mar 30, 2017 at 3:57 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Thu, 23 Mar 2017 17:43:40 +0800
> > Peter Pan <peterpandong@micron.com> wrote:
> >  
> >> This commit adds some helpers in nand.h
> >>     nand_size()
> >>     nand_check_address()
> >>     nand_check_oob_ops()
> >>     nand_oob_ops_across_page()
> >>     nand_check_erase_ops()
> >>
> >> Signed-off-by: Peter Pan <peterpandong@micron.com>
> >> ---
> >>  include/linux/mtd/nand.h | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 62 insertions(+)
> >>
> >> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> >> index 54ded4c..0c52401 100644
> >> --- a/include/linux/mtd/nand.h
> >> +++ b/include/linux/mtd/nand.h
> >> @@ -434,6 +434,68 @@ static inline int nand_neraseblocks(struct nand_device *nand)
> >>  }
> >>
> >>  /**
> >> + * nand_size - Get NAND size
> >> + * @nand: NAND device
> >> + *
> >> + * Returns the total size exposed by @nand.
> >> + */
> >> +static inline u64 nand_size(struct nand_device *nand)
> >> +{
> >> +     return nand->memorg.ndies * nand->memorg.diesize;
> >> +}
> >> +  
> >
> > The nand_size() function should probably go in the commit introducing
> > the interface-agnostic NAND layer (in my own series).
> >
> > Since you'll be the first one to use the generic NAND layer, I propose
> > that you start maintaining my patch-set along with your SPI NAND
> > patches.  
> 
> You mean that I send your patch-set with SPI NAND patches? If so, you want
> me to do this in v5 or when SPI NAND patches is ready to merge?

No need to send the "interface-agnostic NAND layer" patches in future
versions of this series, let's wait until everyone is happy with the SPI
NAND patches.
But you can already create your own branch and maintain my patches
(rebase on newer kernel versions or nand/next if needed, squash changes
into existing commits if it makes sense, ...). It's also easier for
people who want to test your patches to have a branch containing
everything.
