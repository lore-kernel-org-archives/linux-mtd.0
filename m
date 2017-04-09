Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cx7MA-0001KL-Ls
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 07:33:57 +0000
Date: Sun, 9 Apr 2017 09:33:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Leonard Crestez <leonard.crestez@nxp.com>,
 linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Graham Moore
 <grmoore@opensource.altera.com>, Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>, Octavian Purdila
 <octavian.purdila@nxp.com>
Subject: Re: [PATCH v3 33/37] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170409093323.4b122af1@bbrezillon>
In-Reply-To: <CAK7LNAQiO0Jx-qp=-pGWeknAbcTsf9VBPDdR65BP-5f3c4hXEA@mail.gmail.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
 <1491487722.4829.11.camel@nxp.com>
 <CAK7LNAQiO0Jx-qp=-pGWeknAbcTsf9VBPDdR65BP-5f3c4hXEA@mail.gmail.com>
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

On Fri, 7 Apr 2017 15:49:23 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Leonard,
> 
> 2017-04-06 23:08 GMT+09:00 Leonard Crestez <leonard.crestez@nxp.com>:
> > On Thu, Mar 30, 2017 at 11:15 AM, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:  
> >>
> >> Some NAND controllers are using DMA engine requiring a specific
> >> buffer alignment.  The core provides no guarantee on the nand_buffers
> >> pointers, which forces some drivers to allocate their own buffers
> >> and pass the NAND_OWN_BUFFERS flag.
> >>
> >> Rework the nand_buffers allocation logic to allocate each buffer
> >> independently.  This should make most NAND controllers/DMA engine
> >> happy, and allow us to get rid of these custom buf allocation in
> >> NAND controller drivers.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>  
> >  
> >> @@ -4914,8 +4930,12 @@ void nand_cleanup(struct nand_chip *chip)  
> >> >         /* Free bad block table memory */  
> >>         kfree(chip->bbt);
> >> -       if (!(chip->options & NAND_OWN_BUFFERS))
> >> +       if (!(chip->options & NAND_OWN_BUFFERS)) {
> >> +               kfree(chip->buffers->databuf);
> >> +               kfree(chip->buffers->ecccode);
> >> +               kfree(chip->buffers->ecccalc);
> >>                 kfree(chip->buffers);
> >> +       }  
> >
> > It seems that chip->buffers might not be allocated at this point, for
> > example if nand_cleanup is called during a failed probe. You should
> > check if (chip->buffers != NULL) before freeing stuff inside it.  
> 
> You are right.
> 
> The failure path in NAND drivers is messy.   :-(

Totally agree, and that's partly because of the complex/non-trivial
NAND APIs :-/.

> nand_cleanup() may be called before nand_scan_tail()
> finishes successfully...

Actually, I think the real bug is in the GPMI driver which is not using
nand_release() appropriately. nand_release() is supposed to be called
on a registered NAND device, so it's wrong to call it before
mtd_register() has been called and returned 0.

Note that nand_cleanup() can only be called after nand_scan_tail() has
returned 0 (which unfortunately is not obvious :-/).

I still plan to take Masahiro's fixup patch because the more
precautions we take the better it is, but I still think the real bug is
in the GPMI driver.

One last comment: a bug still exists in the GPMI driver when
nand_scan_ident() fails after NAND buffers allocation because it never
sets chip->buffers back to NULL (see [1]).

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L4834
