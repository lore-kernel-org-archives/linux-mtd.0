Received: from mailfe01.swip.net ([212.247.154.1] helo=swip.net)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3s7K-0000Ch-UX
	for linux-mtd@lists.infradead.org; Wed, 23 Feb 2005 03:43:35 -0500
From: Alexander Nyberg <alexn@dsv.su.se>
To: joern@wh.fh-wedel.de
Content-Type: text/plain
Date: Wed, 23 Feb 2005 09:43:25 +0100
Message-Id: <1109148205.2249.3.camel@boxen>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] Use after free in mtd/phram.c: unregister_devices()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use after free, found by the Coverity tool

Signed-off-by: Alexander Nyberg <alexn@dsv.su.se>

===== drivers/mtd/devices/phram.c 1.6 vs edited =====
--- 1.6/drivers/mtd/devices/phram.c	2005-01-05 19:08:36 +01:00
+++ edited/drivers/mtd/devices/phram.c	2005-02-23 09:29:59 +01:00
@@ -107,9 +107,9 @@ static int phram_write(struct mtd_info *
 
 static void unregister_devices(void)
 {
-	struct phram_mtd_list *this;
+	struct phram_mtd_list *this, *safe;
 
-	list_for_each_entry(this, &phram_list, list) {
+	list_for_each_entry_safe(this, safe, &phram_list, list) {
 		del_mtd_device(&this->mtd);
 		iounmap(this->mtd.priv);
 		kfree(this);
