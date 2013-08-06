Received: from smtp31.i.mail.ru ([94.100.177.91])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6d7B-0006oO-Mr
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 08:59:41 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND] mtd: nand: diskonchip: Request memory region prior
 ioremap()
Date: Tue,  6 Aug 2013 12:59:02 +0400
Message-Id: <1375779544-510-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds request_mem_region() prior ioremap() for diskonchip
driver. This will allow to check if memory region is occupied by any
other device, for example in case if we have memory region for several
optional devices and only one device can be used at once.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/diskonchip.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index eaa3c29..bf5682f 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1440,8 +1440,11 @@ static int __init doc_probe(unsigned long physadr)
 	int reg, len, numchips;
 	int ret = 0;
 
+	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, NULL))
+		return -EBUSY;
 	virtadr = ioremap(physadr, DOC_IOREMAP_LEN);
 	if (!virtadr) {
+		release_mem_region(physadr, DOC_IOREMAP_LEN);
 		printk(KERN_ERR "Diskonchip ioremap failed: 0x%x bytes at 0x%lx\n", DOC_IOREMAP_LEN, physadr);
 		return -EIO;
 	}
@@ -1629,6 +1632,7 @@ static int __init doc_probe(unsigned long physadr)
 	WriteDOC(save_control, virtadr, DOCControl);
  fail:
 	iounmap(virtadr);
+	release_mem_region(physadr, DOC_IOREMAP_LEN);
 	return ret;
 }
 
@@ -1645,6 +1649,7 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		nand_release(mtd);
 		iounmap(doc->virtadr);
+		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		kfree(mtd);
 	}
 }
-- 
1.8.1.5
