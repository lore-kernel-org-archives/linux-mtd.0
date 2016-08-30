Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bejwv-0006fB-Ph
 for linux-mtd@lists.infradead.org; Tue, 30 Aug 2016 14:23:41 +0000
Received: by mail-wm0-x241.google.com with SMTP id i5so3410318wmg.2
 for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2016 07:23:16 -0700 (PDT)
From: Harvey Hunt <harveyhuntnexus@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add maintainer entry for Ingenic JZ4780 NAND
 driver
Date: Tue, 30 Aug 2016 15:22:55 +0100
Message-Id: <20160830142255.23468-1-harveyhuntnexus@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71aa5da..28d2d5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5992,6 +5992,12 @@ M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
 S:	Maintained
 F:	drivers/dma/dma-jz4780.c
 
+INGENIC JZ4780 NAND DRIVER
+M:	Harvey Hunt <harveyhuntnexus@gmail.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/jz4780_*
+
 INTEGRITY MEASUREMENT ARCHITECTURE (IMA)
 M:	Mimi Zohar <zohar@linux.vnet.ibm.com>
 M:	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
-- 
2.9.3
