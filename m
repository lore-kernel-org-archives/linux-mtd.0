Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5dpd-0000rr-Qs
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 19:51:35 +0000
Received: by mail-qt0-x230.google.com with SMTP id n4so23209935qte.2
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 12:51:13 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 0/2] Add NAND driver mach dependency constraint
Date: Tue,  2 May 2017 16:49:50 -0300
Message-Id: <20170502194952.4188-1-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just two tiny and silly patches I came across while doing
other things and testing with tiny_defconfig.

Changes from v1:

  * Add COMPILE_TEST, suggested by Boris.

Ezequiel Garcia (2):
  mtd: nand: Add Hisilicon machine dependency
  mtd: nand: Add Mediatek machine dependency

 drivers/mtd/nand/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.12.2
