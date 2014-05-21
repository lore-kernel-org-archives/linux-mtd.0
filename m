Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzqM-0000iO-WB
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:17:39 +0000
Received: by mail-pd0-f179.google.com with SMTP id x10so1063160pdj.24
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:17:18 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/6] mtd: small cleanups
Date: Tue, 20 May 2014 23:16:57 -0700
Message-Id: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series consists of miscellaneous fixes and cleanups, mostly caught through
some sort of static analysis (gcc warnings, sparse, Coverity, etc.).

Brian Norris (6):
  mtd: pfow: remove unused variable
  mtd: slram: fix unused variable warning
  mtd: maps: sc520cdp: fix warnings
  mtd: nand_bbt: remove unused variable
  mtd: nand_bbt: handle error case for nand_create_badblock_pattern()
  mtd: nand: r852: correct write_buf loop bounds

 drivers/mtd/devices/slram.c |    4 +---
 drivers/mtd/maps/sc520cdp.c |    6 +++---
 drivers/mtd/nand/nand_bbt.c |   13 +++++++------
 drivers/mtd/nand/r852.c     |    6 ++++--
 include/linux/mtd/pfow.h    |    3 ---
 5 files changed, 15 insertions(+), 17 deletions(-)

-- 
1.7.9.5
