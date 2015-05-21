Received: from laurent.telenet-ops.be ([195.130.137.89])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvPCu-0001vr-G4
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 12:04:16 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial] mtd: maps: Spelling s/reseved/reserved/
Date: Thu, 21 May 2015 14:03:41 +0200
Message-Id: <1432209821-21096-1-git-send-email-geert+renesas@glider.be>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/maps/amd76xrom.c | 2 +-
 drivers/mtd/maps/esb2rom.c   | 2 +-
 drivers/mtd/maps/ichxrom.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
index f7207b0a76dcf9d3..f2b68667ea590412 100644
--- a/drivers/mtd/maps/amd76xrom.c
+++ b/drivers/mtd/maps/amd76xrom.c
@@ -138,7 +138,7 @@ static int amd76xrom_init_one(struct pci_dev *pdev,
 	/*
 	 * Try to reserve the window mem region.  If this fails then
 	 * it is likely due to a fragment of the window being
-	 * "reseved" by the BIOS.  In the case that the
+	 * "reserved" by the BIOS.  In the case that the
 	 * request_mem_region() fails then once the rom size is
 	 * discovered we will try to reserve the unreserved fragment.
 	 */
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index f784cf0caa13b03d..76ed651b515beef6 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -234,7 +234,7 @@ static int esb2rom_init_one(struct pci_dev *pdev,
 
 	/*
 	 * Try to reserve the window mem region.  If this fails then
-	 * it is likely due to the window being "reseved" by the BIOS.
+	 * it is likely due to the window being "reserved" by the BIOS.
 	 */
 	window->rsrc.name = MOD_NAME;
 	window->rsrc.start = window->phys;
diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index c7478e18f4858239..8636bba422009a1f 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -167,7 +167,7 @@ static int ichxrom_init_one(struct pci_dev *pdev,
 
 	/*
 	 * Try to reserve the window mem region.  If this fails then
-	 * it is likely due to the window being "reseved" by the BIOS.
+	 * it is likely due to the window being "reserved" by the BIOS.
 	 */
 	window->rsrc.name = MOD_NAME;
 	window->rsrc.start = window->phys;
-- 
1.9.1
