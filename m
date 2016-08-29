Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beSmG-0002bx-SN
 for linux-mtd@lists.infradead.org; Mon, 29 Aug 2016 20:03:29 +0000
Received: by mail-pa0-x243.google.com with SMTP id vy10so9417680pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2016 13:03:07 -0700 (PDT)
Date: Mon, 29 Aug 2016 12:57:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Roger Quadros <rogerq@ti.com>, dan.carpenter@oracle.com, richard@nod.at,
 fcooper@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: omap2: Don't call dma_release_channel() if
 dma_request_chan() failed
Message-ID: <20160829195745.GA99752@google.com>
References: <1471247259-27107-1-git-send-email-rogerq@ti.com>
 <20160815172200.11b9860c@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160815172200.11b9860c@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 15, 2016 at 05:22:00PM +0200, Boris Brezillon wrote:
> On Mon, 15 Aug 2016 10:47:39 +0300
> Roger Quadros <rogerq@ti.com> wrote:
> 
> > dma_request_chan() can fail returning an error pointer. In this case
> > prevent calling dma_release_channel() to prevent a ERR_PTR() dereference.
> > 
> > As error path can be called even with no DMA configuration, info->dma can
> > be NULL so don't call dma_release_channel() for that case either.
> > 
> > Fixes: de3bfc4a1616: ("mtd: nand: omap2: fix return value check in omap_nand_probe()")
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Roger Quadros <rogerq@ti.com>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Brian, can you apply this fix directly?

Applied to linux-mtd.git
