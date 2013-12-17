Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsnOx-0001TK-Eh
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 05:41:03 +0000
Date: Tue, 17 Dec 2013 13:11:25 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131217051031.GB15761@shlinux2.ap.freescale.net>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
 <20131211135451.GB1284@gmail.com>
 <20131211190313.GS27149@ld-irv-0074.broadcom.com>
 <20131212034749.GA1345@gmail.com>
 <20131217044342.GB12034@norris-Latitude-E6410>
 <20131217042307.GA15469@shlinux2.ap.freescale.net>
 <20131217050613.GC12034@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20131217050613.GC12034@norris-Latitude-E6410>
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

On Mon, Dec 16, 2013 at 09:06:13PM -0800, Brian Norris wrote:
> On Tue, Dec 17, 2013 at 12:23:08PM +0800, Huang Shijie wrote:
> > On Mon, Dec 16, 2013 at 08:43:42PM -0800, Brian Norris wrote:
> > > > 
> > > > The DMA warning only occurs when we enable the CONFIG_DMA_API_DEBUG.
> Particularly, I think it is quite reasonable to restrict DMA to
> mtd_read()/mtd_write()-like operations -- so this trickles down to
> read_page/write_page, but not to device configuration operations like
> ONFI set_features/get_features/read parameter tables, etc.
> 
> Do you disagree? Do you see some need to perform DMA on all operations?

The gpmi is much coupled with the MXS-DMA engine. the gpmi can uses the
mxs-dma to set the gpmi registers.

Use the DMA makes the GPMI code very simple, it really makes the code very
_ugly_ if we do not use the DMA for read_buf/write_buf.

If you insist that it is okay to use the local array in the nand_base.c,
I can use kmalloc/memcpy in the gpmi's read_buf/write_buf hooks. In such a 
way, we can make the gpmi looks more normal.

sorry, I really think it is no need to force the gpmi do not use the DMA
for read_buf/write_buf.

> 
> > > > Different nand chips use different read-retry methods. A headache to us.
> > > 
> > > Any chance we can push these vendors to implement things through a
> > > standard, like JEDEC? I believe there's a JEDEC parameter page standard
> > we do not have such influence to push these vendors.
> > they will not listen to us. :(
> 
> We can try! Strength in numbers! BTW, last time I brought up ONFI w/ a
> Toshiba representative, I think I offended them :) But at least I had
> their ear for a moment.
> 
look good to me. :)

I will suggest their FAE/AE when i meet them next time.

thanks
Huang Shijie
