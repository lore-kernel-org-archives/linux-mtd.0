Received: from ey-out-1920.google.com ([74.125.78.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZnno-0006L0-PB
	for linux-mtd@lists.infradead.org; Sat, 08 Aug 2009 15:25:54 +0000
Received: by ey-out-1920.google.com with SMTP id 5so730383eyb.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 08 Aug 2009 08:25:47 -0700 (PDT)
Message-ID: <4A7D99D7.5050101@gmail.com>
Date: Sat, 08 Aug 2009 17:29:27 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] MTD/JFFS2: Read buffer overflow
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Prevent a read from mtd->eraseregions[-1]

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 578de1c..f4359fe 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -393,7 +393,8 @@ static int flash_erase (struct mtd_info *mtd,struct erase_info *instr)
 	* erase range is aligned with the erase size which is in
 	* effect here.
 	*/
-   if (instr->addr & (mtd->eraseregions[i].erasesize - 1)) return (-EINVAL);
+   if (i < 0 || (instr->addr & (mtd->eraseregions[i].erasesize - 1)))
+      return -EINVAL;
 
    /* Remember the erase region we start on */
    first = i;
@@ -409,7 +410,8 @@ static int flash_erase (struct mtd_info *mtd,struct erase_info *instr)
    i--;
 
    /* is the end aligned on a block boundary? */
-   if ((instr->addr + instr->len) & (mtd->eraseregions[i].erasesize - 1)) return (-EINVAL);
+   if (i < 0 || ((instr->addr + instr->len) & (mtd->eraseregions[i].erasesize - 1)))
+      return -EINVAL;
 
    addr = instr->addr;
    len = instr->len;
