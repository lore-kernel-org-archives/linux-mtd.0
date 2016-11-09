Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021c-5a
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:33:49 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 00/11] mtd: nand: denali: first round of cleanups of Denali
 NAND driver
Date: Wed,  9 Nov 2016 13:35:19 +0900
Message-Id: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I am tackling on this driver to use it for my SoCs.
The difficulty is a bunch of platform specific stuff
(more specifically, Intel MRST specific) is hard-coded in this driver.

I need lots of rework to utilize the driver for generic cases,
but at the same time, I found the driver code is really dirty,
lots of unused code, odd comments, etc.

The first thing I needed to do was to clean up the code.
My work is still under the way, but I decided to drop this series
for now.  I hope this series is easy to review, so I guess
splitting into a small chunks is better than a one-shot patch bomb.



Masahiro Yamada (11):
  mtd: nand: denali: remove unneeded <linux/slab.h> includes
  mtd: nand: denali: remove unused struct member denali_nand_info::idx
  mtd: nand: denali: remove bogus comment about interrupt handler setup
  mtd: nand: denali: remove detect_partition_feature()
  mtd: nand: denali: remove "Spectra:" prefix from printk strings
  mtd: nand: denali: remove unused struct member totalblks, blksperchip
  mtd: nand: denali: use managed devm_irq_request()
  mtd: nand: denali: return error code from devm_request_irq() on error
  mtd: nand: denali: return error code from nand_scan_ident/tail on
    error
  mtd: nand: denali: remove unneeded parentheses
  mtd: nand: denali: remove debug lines of __FILE__, __LINE__, __func__

 drivers/mtd/nand/denali.c     | 101 +++++++++---------------------------------
 drivers/mtd/nand/denali.h     |  12 -----
 drivers/mtd/nand/denali_dt.c  |   1 -
 drivers/mtd/nand/denali_pci.c |   1 -
 4 files changed, 21 insertions(+), 94 deletions(-)

-- 
1.9.1
