Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MS9gr-0008DF-Ra
	for linux-mtd@lists.infradead.org; Sat, 18 Jul 2009 13:11:02 +0000
Date: Sat, 18 Jul 2009 14:10:44 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: afs: fix build warning
Message-ID: <20090718131044.GA4120@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/mtd/afs.c:244: warning: format ‘%5d’ expects type ‘int’, but argument 4 has type ‘uint64_t’

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

---
 drivers/mtd/afs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index d072ca5..e29e81d 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -239,7 +239,7 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 		parts[idx].offset	= img_ptr;
 		parts[idx].mask_flags	= 0;
 
-		printk("  mtd%d: at 0x%08x, %5dKB, %8u, %s\n",
+		printk("  mtd%d: at 0x%08x, %5lluKB, %8u, %s\n",
 			idx, img_ptr, parts[idx].size / 1024,
 			iis.imageNumber, str);
 
