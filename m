Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsmeB-0008V5-7o
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 04:52:43 +0000
Date: Tue, 17 Dec 2013 12:23:08 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131217042307.GA15469@shlinux2.ap.freescale.net>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
 <20131211135451.GB1284@gmail.com>
 <20131211190313.GS27149@ld-irv-0074.broadcom.com>
 <20131212034749.GA1345@gmail.com>
 <20131217044342.GB12034@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20131217044342.GB12034@norris-Latitude-E6410>
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

On Mon, Dec 16, 2013 at 08:43:42PM -0800, Brian Norris wrote:
> > 
> > The DMA warning only occurs when we enable the CONFIG_DMA_API_DEBUG.
> 
> But the warning has a significant purpose: it is *not* legal to perform
> DMA on stack memory, and no driver should do this. Either nand_base or
> gpmi-nand need to be fixed here.
> 
> But I think it's the GPMI driver is the one that needs fixing, not this
> patch. Are there any scenarios where it makes sense for gpmi-nand to use
> DMA for its read_buf/write_buf? Shouldn't the only DMA-necessary
> operations come through the ecc.write_page and ecc.read_page callbacks?
> If I'm correct, then gpmi-nand should not be using DMA at all in
> read_buf/write_buf.
Currently, all the operations, including the read_buf/write_buf, use
the DMA.

Is there any ABI tells us we should not use the DMA for read_buf/write_buf? :)


> 
> > Different nand chips use different read-retry methods. A headache to us.
> 
> Any chance we can push these vendors to implement things through a
> standard, like JEDEC? I believe there's a JEDEC parameter page standard
we do not have such influence to push these vendors.
they will not listen to us. :(

> now, though I haven't looked at it closely. Micron's support is nice and
> simple because it properly uses the ONFI vendor block. Other vendors
> should take note...
yes. Micron is good example.


thanks
Huang Shijie
