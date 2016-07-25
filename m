Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRfCb-00082A-8h
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 12:41:46 +0000
Date: Mon, 25 Jul 2016 14:41:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, "George Spelvin" <linux@sciencehorizons.net>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] mtd: add support for pairing scheme description
Message-ID: <20160725144122.3bec34aa@bbrezillon>
In-Reply-To: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
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

Brian, Georges,

It's already too late for 4.8, but I'd like to get this sorted out
quickly, so I can apply the patches on my nand/next branch and get it
tested in linux-next.

Note that there's nothing risky in there: we're only introducing a
new in-kernel API that is not used yet, so even if we get it wrong
we'll be able to fix it without impacting MTD users.

Meanwhile, we'll be able to rebase our UBI/MLC work on top of these
changes, and let people test more easily (only a single series to
apply instead of 2).

To sum-up, can you review this v2 and let me know if you see other
things to fix.

Thanks,

Boris

On Mon, 20 Jun 2016 15:50:15 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi,
> 
> This series is the first step towards reliable MLC/TLC NAND support.
> Those patches allows the NAND layer to expose page pairing information
> to MTD users.
> The plan is to teach UBI about those constraints and let UBI code take
> the appropriate precautions when dealing with those multi-level cells
> NANDs. The way we'll handle this "paired pages" constraint will be
> described soon in a series adapting the UBI layer, so stay tune ;).
> 
> Note that this implementation only allows page pairing scheme description
> when the NAND has a full-id entry in the nand_ids table.
> This should be addressed in some way for ONFI and JEDEC NANDs, though
> I'm not sure how to handle this yet.
> 
> Brian, I tried document a bit more the structures and helpers added in
> the first patch, but I'm not sure my descriptions are understandable.
> 
> Georges, I took most of your suggestions into account, except for the
> struct mtd_pairing_info to unsigned int migration. I'm really unsure
> we need this level of optimization right now, and that's still
> something we'll be able to change afterwards (I don't expect to see a
> lot of users for this API).
> 
> Best Regards,
> 
> Boris
> 
> Changes since v1:
> - document the paring scheme concepts and the associate structures and
>   helpers
> - rework the dist3 and dist6 implementation according to George
>   comments
> - introduce the mtd_set_pairing_scheme() helper to avoid directly
>   manipulating the mtd->pairing field
> - drop the patch assigning dist6 pairing scheme to the H27UCG8T2ATR
>   NAND (in the light of George comment I'm not longer sure this scheme
>   is suitable for this NAND, and I can't test it)
> 
> Boris Brezillon (3):
>   mtd: introduce the mtd_pairing_scheme concept
>   mtd: nand: implement two pairing scheme
>   mtd: nand: add a pairing field to nand_flash_dev
> 
>  drivers/mtd/mtdcore.c        |  94 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/mtdpart.c        |   1 +
>  drivers/mtd/nand/nand_base.c |  98 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h      | 106 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand.h     |   5 ++
>  5 files changed, 304 insertions(+)
> 
