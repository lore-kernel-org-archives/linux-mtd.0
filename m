Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsmWE-0008LI-50
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 04:44:30 +0000
Received: by mail-pa0-f46.google.com with SMTP id kl14so3911002pab.19
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 20:44:08 -0800 (PST)
Date: Mon, 16 Dec 2013 20:43:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131217044342.GB12034@norris-Latitude-E6410>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
 <20131211135451.GB1284@gmail.com>
 <20131211190313.GS27149@ld-irv-0074.broadcom.com>
 <20131212034749.GA1345@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131212034749.GA1345@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
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

On Thu, Dec 12, 2013 at 11:47:52AM +0800, Huang Shijie wrote:
> On Wed, Dec 11, 2013 at 11:03:13AM -0800, Brian Norris wrote:
> > On Wed, Dec 11, 2013 at 09:54:54PM +0800, Huang Shijie wrote:
> > > On Mon, Dec 09, 2013 at 12:09:12PM -0800, Brian Norris wrote:
> > > > +	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
> > > > +
> > > This can cause a DMA warning.
> > 
> > ...on GPMI NAND, but not on most (any?) other drivers. Why does GPMI try
> > to use DMA on *every* operation? That doesn't even make sense for a 4 or
> > 5 byte transfer. Plus, we don't give a guarantee that buffers will be
> > DMA-able in MTD (UBI uses vmalloc() buffers, for instance), so I'm sure
> > you'll hit problems other places. I can fix this one (use
> > chip->buffers->databuf instead?) but I think GPMI is a bad citizen in
> > this regard, given that you have no guarantee. You need to fix MTD
> > systematically if you expect this guarantee.
> You do not need to change this code, if you like it.
> 
> The DMA warning only occurs when we enable the CONFIG_DMA_API_DEBUG.

But the warning has a significant purpose: it is *not* legal to perform
DMA on stack memory, and no driver should do this. Either nand_base or
gpmi-nand need to be fixed here.

But I think it's the GPMI driver is the one that needs fixing, not this
patch. Are there any scenarios where it makes sense for gpmi-nand to use
DMA for its read_buf/write_buf? Shouldn't the only DMA-necessary
operations come through the ecc.write_page and ecc.read_page callbacks?
If I'm correct, then gpmi-nand should not be using DMA at all in
read_buf/write_buf.

> Different nand chips use different read-retry methods. A headache to us.

Any chance we can push these vendors to implement things through a
standard, like JEDEC? I believe there's a JEDEC parameter page standard
now, though I haven't looked at it closely. Micron's support is nice and
simple because it properly uses the ONFI vendor block. Other vendors
should take note...

> The common idea between the read-retry methods is:
>   "we have to cycle through each mode and retry"
> 
> So the chip.read_retries is used by others too.

Good to know.

> After the nand chip use <19nm, afaik, all the NAND chips needs the
> read-retry. We have to implement the read-retry for all of them.
> The nightmare is coming.

*cue the dark organ music*

Sigh. I might have to abandon MTD for eMMC some day ;)

Brian
