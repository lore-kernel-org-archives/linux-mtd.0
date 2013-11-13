Received: from smtp20.mail.ru ([94.100.176.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgZ75-0006AE-8p
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2013 12:00:04 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: nand: diskonchip: Request memory region prior
 ioremap()
Date: Wed, 13 Nov 2013 15:59:25 +0400
Message-Id: <1384343965-29682-1-git-send-email-shc_work@mail.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 Artem Bityutskiy <dedekind1@gmail.com>
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
 drivers/mtd/nand/diskonchip.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index b68a495..0afafa0 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1440,10 +1440,13 @@ static int __init doc_probe(unsigned long physadr)
 	int reg, len, numchips;
 	int ret = 0;
 
+	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, NULL))
+		return -EBUSY;
 	virtadr = ioremap(physadr, DOC_IOREMAP_LEN);
 	if (!virtadr) {
 		printk(KERN_ERR "Diskonchip ioremap failed: 0x%x bytes at 0x%lx\n", DOC_IOREMAP_LEN, physadr);
-		return -EIO;
+		ret = -EIO;
+		goto error_ioremap;
 	}
 
 	/* It's not possible to cleanly detect the DiskOnChip - the
@@ -1629,6 +1632,10 @@ static int __init doc_probe(unsigned long physadr)
 	WriteDOC(save_control, virtadr, DOCControl);
  fail:
 	iounmap(virtadr);
+
+error_ioremap:
+	release_mem_region(physadr, DOC_IOREMAP_LEN);
+
 	return ret;
 }
 
@@ -1645,6 +1652,7 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		nand_release(mtd);
 		iounmap(doc->virtadr);
+		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		kfree(mtd);
 	}
 }
-- 
1.8.1.5
