Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH0r0-0002Ru-BM
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 03:03:11 +0000
Received: by mail-pa0-x22a.google.com with SMTP id yy13so154159173pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 19:02:49 -0800 (PST)
Date: Wed, 6 Jan 2016 19:02:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 "Franklin S Cooper Jr." <fcooper@ti.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] mtd: nand: properly handle bitflips in erased pages
Message-ID: <20160107030246.GC109450@google.com>
References: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed, Dec 30, 2015 at 08:32:02PM +0100, Boris Brezillon wrote:
> Hi,
> 
> This patch series aims at providing a common logic to check for bitflips
> in erased pages.
> 
> Currently each driver is implementing its own logic to check for bitflips
> in erased pages. Not only this create code duplication, but most of these
> implementations are incorrect.
> Here are a few aspects that are often left aside in those implementations:
> 1/ they do not check OOB bytes when checking for the ff pattern, which
>    means they can consider a page as empty while the MTD user actually
>    wanted to write almost ff with a few bits to zero
> 2/ they check for the ff pattern on the whole page, while ECC actually
>    works on smaller chunks (usually 512 or 1024 bytes chunks)
> 3/ they use random bitflip thresholds to decide whether a page/chunk is
>    erased or not. IMO this threshold should be set to ECC strength (or
>    at least something correlated to this parameter)
> 
> The approach taken in this series is to provide two helper functions to
> check for bitflips in erased pages. Each driver that needs to check for
> such cases can then call the nand_check_erased_ecc_chunk() function, and
> rely on the common logic to decide whether a page is erased or not.
> 
> While Brian suggested a few times to make this detection automatic for
> all drivers that set a specific flag (NAND_CHECK_ERASED_BITFLIPS?), here
> is a few reasons I think this is not such a good idea:
> 1/ some (a lot of) drivers do not properly implement the raw access
>    functions, and since we need to check for raw data and OOB bytes this
>    makes the automatic detection unusable for most drivers unless they
>    decide to correctly implement those methods (which would be a good
>    thing BTW).
> 2/ as a I said earlier, this check should be made at the ECC chunk level
>    and not at the page level. This spots two problems: some (a lot of)
>    drivers do not properly specify the ecc layout information, and even
>    if the ecc layout is correctly defined, there is no way to attach ECC
>    bytes to a specific ECC chunk.
> 3/ the last aspect is the perf penalty incured by this test. Automatically
>    doing that at the NAND core level implies reading the whole page again
>    in raw mode, while with the helper function approach, drivers supporting
>    access at the ECC chunk level can read only the faulty chunk in raw
>    mode.
> 
> Regarding the bitflips threshold at which an erased pages is considered as
> faulty, I have assigned it to ECC strength. As mentioned by Andrea, using
> ECC strength might cause some trouble, because if you already have some
> bitflips in an erased page, programming it might generate even more of
> them.
> In the other hand, shouldn't that be checked after (or before) programming
> a page. I mean, UBI is already capable of detecting pages which are over
> the configured bitflips_threshold and move data around when it detects
> such pages.
> If we check data after writing a page we wouldn't have to bother about
> setting a weaker value for the "bitflips in erased page" case.
> Another thing in favor of the ECC strength value for this "bitflips in
> erased page" threshold value: if the ECC engine is generating 0xff ECC
> bytes when the page is empty, then it will be able to fix ECC strength
> bitflips without complaining, so why should we use different value when
> we detect bitflips using the pattern match approach?

Thanks for the full description here. I agree with most, if not all of
this.

> Best Regards,
> 
> Boris
> 
> Changes since v3:
> - drop already applied patches
> - make the generic "bitflips in erased pages" check as an opt-in flag
> - split driver changes to ease review
> - addressed Brian's comments
> 
> Changes since v2:
> - improve nand_check_erased_buf() implementation
> - keep nand_check_erased_buf() private to nand_base.c
> - patch existing ecc.correct() implementations to return consistent error
>   codes
> - make the 'erased check' optional
> - remove some custom implementations of the 'erased check'
> 
> Changes since v1:
> - fix the nand_check_erased_buf() function
> - mark the bitflips > bitflips_threshold condition as unlikely
> - add missing memsets in nand_check_erased_ecc_chunk()
> 
> 
> Boris Brezillon (5):
>   mtd: nand: return consistent error codes in ecc.correct()
>     implementations
>   mtd: nand: use nand_check_erased_ecc_chunk in default ECC read
>     functions
>   mtd: nand: davinci: remove custom 'erased check' implementation
>   mtd: nand: diskonchip: remove custom 'erased check' implementation
>   mtd: nand: jz4740: remove custom 'erased check' implementation

Pushed the rest of the series. If someone ends up reviewing/testing the
last 2 (I'm not counting on it), then we can revisit them.

Thanks,
Brian

>  drivers/mtd/nand/atmel_nand.c   |  2 +-
>  drivers/mtd/nand/bf5xx_nand.c   | 20 +++++++++++-----
>  drivers/mtd/nand/davinci_nand.c | 15 ++++--------
>  drivers/mtd/nand/diskonchip.c   | 37 ++--------------------------
>  drivers/mtd/nand/jz4740_nand.c  | 22 ++---------------
>  drivers/mtd/nand/mxc_nand.c     |  4 ++--
>  drivers/mtd/nand/nand_base.c    | 53 +++++++++++++++++++++++++++++++++++------
>  drivers/mtd/nand/nand_bch.c     |  2 +-
>  drivers/mtd/nand/nand_ecc.c     |  2 +-
>  drivers/mtd/nand/omap2.c        |  6 ++---
>  drivers/mtd/nand/r852.c         |  4 ++--
>  include/linux/mtd/nand.h        | 18 +++++++++++++-
>  include/linux/mtd/nand_bch.h    |  2 +-
>  13 files changed, 96 insertions(+), 91 deletions(-)
> 
> -- 
> 2.1.4
> 
