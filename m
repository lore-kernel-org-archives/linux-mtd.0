Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuGde-0006N4-OM
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 12:29:00 +0000
Date: Mon, 27 Aug 2018 14:31:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: don't include dma-direct.h
Message-ID: <20180827123107.GA27035@lst.de>
References: <20180827085943.24324-1-hch@lst.de>
 <CAFLxGvy=1r0aKHxj_LtwFrGMULH0nFk9ZJR6YpeEM6D24P2-mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvy=1r0aKHxj_LtwFrGMULH0nFk9ZJR6YpeEM6D24P2-mw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 27, 2018 at 11:51:29AM +0200, Richard Weinberger wrote:
> On Mon, Aug 27, 2018 at 10:59 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > A recent commit removed the incorrect use of phys_to_dma from this
> > driver, but failed to remove the dma-direct.h include, so do that
> > now.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  drivers/mtd/nand/raw/qcom_nandc.c | 1 -
> >  include/linux/dma-mapping.h       | 6 ++++++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> Hmm, the diffstat does not match the diff itself.

Tha's because it had an accidental hunk in my tree I removed when
sending.  I think you can trust the diff, but if you really want
I can resend.
