Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtHGy-0003lG-Bv
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 15:43:52 +0000
Date: Mon, 2 Nov 2015 21:16:59 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Han Xu <b45815@freescale.com>, fabio.estevam@freescale.com,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 hofrat@osadl.org, shijie.huang@arm.com, dan.j.williams@intel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH v7 2/7] dmaengine: mxs: APBH DMA supports deep sleep mode'
Message-ID: <20151102154659.GR21326@localhost>
References: <1445983540-27155-1-git-send-email-b45815@freescale.com>
 <1445983540-27155-3-git-send-email-b45815@freescale.com>
 <20151031014244.GF21326@localhost>
 <20151102162906.1e3c29da@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151102162906.1e3c29da@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 04:29:06PM +0100, Thomas Petazzoni wrote:
> Vinod,
> 
> On Sat, 31 Oct 2015 07:12:44 +0530, Vinod Koul wrote:
> > On Tue, Oct 27, 2015 at 05:05:35PM -0500, Han Xu wrote:
> > >  
> > > -static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
> > > +static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
> > 
> > This change seems unrelated to patch description, can you explain why?
> 
> It seems related: mxs_dma_init() is now no longer called at
> initialization time, but also when resuming, as visible...

Right looks good then

-- 
~Vinod
