Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5bwP-0004mT-4J
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 17:50:26 +0000
Received: by mail-qt0-x22d.google.com with SMTP id m36so118472937qtb.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 10:50:03 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 0/2] Add NAND driver mach dependency constraint
Date: Tue,  2 May 2017 14:48:41 -0300
Message-Id: <20170502174843.6877-1-ezequiel@vanguardiasur.com.ar>
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

Ezequiel Garcia (2):
  mtd: nand: Add Hisilicon machine dependency
  mtd: nand: Add Mediatek machine dependency

 drivers/mtd/nand/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.12.2
