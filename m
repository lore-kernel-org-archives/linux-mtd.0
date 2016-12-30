Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMxA5-0004Td-Io
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2016 13:23:58 +0000
Received: by mail-lf0-x241.google.com with SMTP id x140so20230440lfa.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Dec 2016 05:23:36 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: cyrille.pitchen@atmel.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, mar.krzeminski@gmail.com
Subject: [PATCH v2 0/2] mtd: spi-nor: Add possibility to disable chip erase
Date: Fri, 30 Dec 2016 14:23:23 +0100
Message-Id: <20161230132325.14337-1-mar.krzeminski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

v2:
* rebased to git://github.com/spi-nor/linux.git

Marcin Krzeminski (2):
  Add flag to disable chip erase
  Disable chip erase for Micron n25q00

 drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.9.3
