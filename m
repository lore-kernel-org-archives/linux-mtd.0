Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7HUr-0003UV-W0
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2016 07:52:39 +0000
Date: Thu, 17 Nov 2016 08:52:16 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-kernel@vger.kernel.org,
 "peterpandong@micron.com" <peterpandong@micron.com>
Subject: Re: [PATCH v2 3/7] mtd: nand: add a nand.h file to expose basic
 NAND stuff
Message-ID: <20161117085216.14c17813@bbrezillon>
In-Reply-To: <CAAyFORLqjZTZ78XOdJbqUXvSFtsWmbtw_wpmjvBwu2Z4cYCvdQ@mail.gmail.com>
References: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
 <1476628518-20450-4-git-send-email-boris.brezillon@free-electrons.com>
 <CAAyFORLqjZTZ78XOdJbqUXvSFtsWmbtw_wpmjvBwu2Z4cYCvdQ@mail.gmail.com>
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

On Thu, 17 Nov 2016 14:14:21 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> Hi Boris,
> 
> On Sun, Oct 16, 2016 at 10:35 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Now that raw NAND header has been moved to rawnand.h, we can add a new
> > nand.h file and define the common nand stuff in there.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  include/linux/mtd/nand.h | 480 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 480 insertions(+)
> >  create mode 100644 include/linux/mtd/nand.h
> >
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > new file mode 100644
> > index 000000000000..b9b5d3c1bdf9
> > --- /dev/null
> > +++ b/include/linux/mtd/nand.h  
> [...]
> > +
> > +/**
> > + * nand_offs_to_die - Convert an absolute offset to a die number
> > + * @nand: NAND device
> > + * @offs: absolute offset
> > + *
> > + * Returns the die number containing @offs.
> > + */
> > +static inline int nand_offs_to_die(struct nand_device *nand, loff_t offs)
> > +{
> > +       u64 die = offs;
> > +
> > +       do_div(die, nand->memorg.diesize);
> > +
> > +       return die;  
> 
> Is it proper to use do_div here?. If I'm right, the divisor of do_div is 32bit.
> It may cause division 0 exception when die size is larger than 4GB.
> div64_u64 may be better.

Nice catch! Indeed, div64_u64() should be used here. I'll fix that.

Thanks,

Boris
