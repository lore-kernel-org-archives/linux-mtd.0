Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsoem-0002tH-5T
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 07:01:29 +0000
Received: by mail-pd0-f182.google.com with SMTP id v10so6461221pde.27
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 23:01:06 -0800 (PST)
Date: Mon, 16 Dec 2013 23:01:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131217070103.GF12034@norris-Latitude-E6410>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
 <20131211135451.GB1284@gmail.com>
 <20131211190313.GS27149@ld-irv-0074.broadcom.com>
 <20131212034749.GA1345@gmail.com>
 <20131217044342.GB12034@norris-Latitude-E6410>
 <20131217042307.GA15469@shlinux2.ap.freescale.net>
 <20131217050613.GC12034@norris-Latitude-E6410>
 <20131217051031.GB15761@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131217051031.GB15761@shlinux2.ap.freescale.net>
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 01:11:25PM +0800, Huang Shijie wrote:
> On Mon, Dec 16, 2013 at 09:06:13PM -0800, Brian Norris wrote:
> > On Tue, Dec 17, 2013 at 12:23:08PM +0800, Huang Shijie wrote:
> > > On Mon, Dec 16, 2013 at 08:43:42PM -0800, Brian Norris wrote:
> > > > > 
> > > > > The DMA warning only occurs when we enable the CONFIG_DMA_API_DEBUG.
> > Particularly, I think it is quite reasonable to restrict DMA to
> > mtd_read()/mtd_write()-like operations -- so this trickles down to
> > read_page/write_page, but not to device configuration operations like
> > ONFI set_features/get_features/read parameter tables, etc.
> > 
> > Do you disagree? Do you see some need to perform DMA on all operations?
> 
> The gpmi is much coupled with the MXS-DMA engine. the gpmi can uses the
> mxs-dma to set the gpmi registers.
> 
> Use the DMA makes the GPMI code very simple, it really makes the code very
> _ugly_ if we do not use the DMA for read_buf/write_buf.

It's not just about ugliness, it's about maintainability. I can clean up
a few cases here and there that don't conform to your driver's needs now
(notice I pointed out another instance of this in Uwe's patch), but
unless we establish better guidelines for NAND, this is fragile.

As a diversion, let's look at atmel_nand for an example. It uses DMA as
well, but it dodges some of your problems using a heuristic, so that it
only uses DMA for larger-than-OOB-size transactions (see
atmel_read_buf). Additionally, it has a hack-y check for highmem, to try
to confirm that the region it's trying to map is, in fact, DMA-able.

So, atmel_nand does not have an ideal solution, but it at least attempts
to solve parts of this problem. GPMI, on the other hand, ignores it
entirely.

> If you insist that it is okay to use the local array in the nand_base.c,
> I can use kmalloc/memcpy in the gpmi's read_buf/write_buf hooks. In such a 
> way, we can make the gpmi looks more normal.

I think a bounce buffer is necessary, if you really want to use DMA all
the time; some transactions are just not worth initializing DMA-able
buffers in the high-level code. But even better, can GPMI easily utilize
some sort of PIO mode for small/slow-path transactions like this, or is
it inextricably tied to the MXS-DMA engine?

Brian
