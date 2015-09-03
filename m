Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXWzf-0007aU-N4
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 16:04:08 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [RESEND PATCH v3 0/5] mtd: nand: properly handle bitflips in erased
 pages
Date: Thu,  3 Sep 2015 18:03:37 +0200
Message-Id: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

Sorry for the noise, the previous submission was containing duplicate
patches :-/.

Here is a new version of the generic 'bitflips in erased pages' series.

I slightly modified the second patch of the previous series to address some
of your concerns and optimize a bit in case some implementations already
fix bitflips in erased pages.

If you're not happy with the changes in patches 2 to 5, could you at least
consider taking the first one?

This patch series aims at providing a common logic to check for bitflips
in erased pages.

Currently each driver is implementing its own logic to check for bitflips
in erased pages. Not only this create code duplication, but most of these
implementations are incorrect.
Here are a few aspects that are often left aside in those implementations:
1/ they do not check OOB bytes when checking for the ff pattern, which
   means they can consider a page as empty while the MTD user actually
   wanted to write almost ff with a few bits to zero
2/ they check for the ff pattern on the whole page, while ECC actually
   works on smaller chunks (usually 512 or 1024 bytes chunks)
3/ they use random bitflip thresholds to decide whether a page/chunk is
   erased or not. IMO this threshold should be set to ECC strength (or
   at least something correlated to this parameter)

The approach taken in this series is to provide two helper functions to
check for bitflips in erased pages. Each driver that needs to check for
such cases can then call the nand_check_erased_ecc_chunk() function, and
rely on the common logic to decide whether a page is erased or not.

While Brian suggested a few times to make this detection automatic for
all drivers that set a specific flag (NAND_CHECK_ERASED_BITFLIPS?), here
is a few reasons I think this is not such a good idea:
1/ some (a lot of) drivers do not properly implement the raw access
   functions, and since we need to check for raw data and OOB bytes this
   makes the automatic detection unusable for most drivers unless they
   decide to correctly implement those methods (which would be a good
   thing BTW).
2/ as a I said earlier, this check should be made at the ECC chunk level
   and not at the page level. This spots two problems: some (a lot of)
   drivers do not properly specify the ecc layout information, and even
   if the ecc layout is correctly defined, there is no way to attach ECC
   bytes to a specific ECC chunk.
3/ the last aspect is the perf penalty incured by this test. Automatically
   doing that at the NAND core level implies reading the whole page again
   in raw mode, while with the helper function approach, drivers supporting
   access at the ECC chunk level can read only the faulty chunk in raw
   mode.

Regarding the bitflips threshold at which an erased pages is considered as
faulty, I have assigned it to ECC strength. As mentioned by Andrea, using
ECC strength might cause some trouble, because if you already have some
bitflips in an erased page, programming it might generate even more of
them.
In the other hand, shouldn't that be checked after (or before) programming
a page. I mean, UBI is already capable of detecting pages which are over
the configured bitflips_threshold and move data around when it detects
such pages.
If we check data after writing a page we wouldn't have to bother about
setting a weaker value for the "bitflips in erased page" case.
Another thing in favor of the ECC strength value for this "bitflips in
erased page" threshold value: if the ECC engine is generating 0xff ECC
bytes when the page is empty, then it will be able to fix ECC strength
bitflips without complaining, so why should we use different value when
we detect bitflips using the pattern match approach?

Best Regards,

Boris

Changes since v2:
- improve nand_check_erased_buf() implementation
- keep nand_check_erased_buf() private to nand_base.c
- patch existing ecc.correct() implementations to return consistent error
  codes
- make the 'erased check' optional
- remove some custom implementations of the 'erased check'

Changes since v1:
- fix the nand_check_erased_buf() function
- mark the bitflips > bitflips_threshold condition as unlikely
- add missing memsets in nand_check_erased_ecc_chunk()

Boris Brezillon (5):
  mtd: nand: add nand_check_erased helper functions
  mtd: nand: return consistent error codes in ecc.correct()
    implementations
  mtd: nand: use nand_check_erased_ecc_chunk in default ECC read
    functions
  mtd: nand: make 'erased check' optional
  mtd: nand: remove custom 'erased check' implementation

 drivers/mtd/nand/atmel_nand.c   |   2 +-
 drivers/mtd/nand/bf5xx_nand.c   |  20 +++--
 drivers/mtd/nand/davinci_nand.c |  14 +--
 drivers/mtd/nand/diskonchip.c   |  32 +------
 drivers/mtd/nand/jz4740_nand.c  |  22 +----
 drivers/mtd/nand/mxc_nand.c     |   4 +-
 drivers/mtd/nand/nand_base.c    | 190 ++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/nand/nand_bch.c     |   2 +-
 drivers/mtd/nand/nand_ecc.c     |   2 +-
 drivers/mtd/nand/omap2.c        |   6 +-
 drivers/mtd/nand/r852.c         |   5 +-
 drivers/mtd/nand/tmio_nand.c    |   1 +
 drivers/mtd/nand/txx9ndfmc.c    |   1 +
 include/linux/mtd/nand.h        |  21 ++++-
 include/linux/mtd/nand_bch.h    |   2 +-
 15 files changed, 238 insertions(+), 86 deletions(-)

-- 
1.9.1
