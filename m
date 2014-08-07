Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO3-0002zP-Dl
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:20:59 +0000
Received: by mail-pd0-f180.google.com with SMTP id v10so2504899pde.39
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:37 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/8] mtd: spi-nor: refactor wait-till-ready
Date: Wed,  6 Aug 2014 18:16:54 -0700
Message-Id: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, zajec5@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This patch series tackles a few pieces of the spi-nor framework that weren't
abstracted very well. I did some limited testing on m25p80.c, and you can see
patch 8, which adds a few test BUG_ON()'s. If any of them fail for you, please
holler. I don't plan to merge that patch, although I could be convinced to
rework it if it adds value to someone...

I'm especially interested in getting test coverage on fsl-quadspi.

Thanks,
Brian

Brian Norris (8):
  mtd: spi-nor: eliminate duplicate spi_nor_wait_till_{,fsr}_ready()
    code
  mtd: spi-nor: handle timeout errors in spi_nor_write()
  mtd: spi-nor: move "wait-till-ready" checks into erase/write functions
  mtd: m25p80: drop wait-till-ready checks
  mtd: fsl-quadspi: drop wait-till-ready checks
  mtd: spi-nor: drop replaceable wait-till-ready function pointer
  mtd: spi-nor: factor out write_enable() for erase commands
  debug: mtd: spi-nor: add BUG_ON() prints to check for !ready

 drivers/mtd/devices/m25p80.c      |  17 -----
 drivers/mtd/spi-nor/fsl-quadspi.c |  16 -----
 drivers/mtd/spi-nor/spi-nor.c     | 145 ++++++++++++++++++--------------------
 include/linux/mtd/spi-nor.h       |   8 ++-
 4 files changed, 76 insertions(+), 110 deletions(-)

-- 
1.9.1
