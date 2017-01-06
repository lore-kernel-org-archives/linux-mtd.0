Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPYAx-00055p-7f
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 17:19:36 +0000
Received: by mail-lf0-x242.google.com with SMTP id v186so366824lfa.2
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2017 09:19:14 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: cyrille.pitchen@atmel.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, mar.krzeminski@gmail.com
Subject: [PATCH v4 0/2] mtd: spi-nor: Add possibility to disable chip erase
Date: Fri,  6 Jan 2017 18:18:59 +0100
Message-Id: <20170106171901.27565-1-mar.krzeminski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

v4:
* Rebased to git://github.com/spi-nor/linux.git next branch.
* Typos corrected.
v3:
* Fix/reword commit messages.
v2:
* Rebased to git://github.com/spi-nor/linux.git

Marcin Krzeminski (2):
  mtd: spi-nor: Fix whole chip erasing for stacked chips.
  mtd: spi-nor: Disable chip erase for Micron n25q00.

 drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.9.3
