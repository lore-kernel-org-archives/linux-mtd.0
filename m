Received: from py-out-1112.google.com ([64.233.166.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTbIm-0000rJ-FU
	for linux-mtd@lists.infradead.org; Mon, 25 Feb 2008 11:15:22 +0000
Received: by py-out-1112.google.com with SMTP id p76so2239587pyb.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Feb 2008 03:15:19 -0800 (PST)
Message-ID: <386072610802250315l2b7bbed0ma00b13ef68a2a486@mail.gmail.com>
Date: Mon, 25 Feb 2008 19:15:19 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: "Ivan Djelic" <ivan.djelic@parrot.com>
Subject: Re: [MTD/NAND] Blackfin NFC driver DMA bug ?
In-Reply-To: <20080222085403.GA2870@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <loom.20080221T171743-57@post.gmane.org>
	<386072610802211852r466ba76m427d8705b3d86ad9@mail.gmail.com>
	<20080222084533.GA2543@parrot.com> <20080222085403.GA2870@parrot.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 22, 2008 at 4:54 PM, Ivan Djelic <ivan.djelic@parrot.com> wrote:
> On Fri, Feb 22, 2008 at 09:45:33AM +0100, Ivan Djelic wrote:
>  > > Oh, I am not fully understand your concern.  The code is invalidating
>  > > or flushing buf before DMA operation.
>  > > And invalidate and flush operation is OK for buf which is not
>  > > cache-aligned on Blackfin arch. it also should be
>  > > OK for other arch.
>  >
>  > Well, consider the following scenario, in which 'buf' is not cache-aligned:
>  >
>  > 1) function bf5xx_nand_dma_rw() is called for reading data.
>  >
>  > 2) dcache is partially invalidated on a range containing 'buf': this range is
>  > cache-aligned, of course.
>  >
>
> > 3) some variable residing nearby 'buf' (in the same cache line interval) is
>  > read (not modified), resulting in a cache line being fetched. Cache line is not
>  > dirty.
>
>  Also, the variable contents in 3) may also be corrupted because of the
>  invalidation in 2).
>

Thanks a lot for the clarification.

If can be fixed in drivers or in MTD API, maybe MTD API is good place
to fix it completely as David mentioned.
I will found some way to fix it in my driver firstly.

Regards,
-Bryan Wu
