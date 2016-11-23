Received: from balrog.mythic-beasts.com ([2a00:1098:0:82:1000:0:2:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9hBU-0000gb-Pt
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2016 23:42:37 +0000
From: Luis Henriques <henrix@camandro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Henriques <henrix@camandro.org>
Subject: [PATCH v2] mtd: maps: add missing iounmap() in error path
Date: Wed, 23 Nov 2016 23:40:36 +0000
Message-Id: <20161123234036.9985-1-henrix@camandro.org>
In-Reply-To: <20161122192124.GF77253@google.com>
References: <20161122192124.GF77253@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch was triggered by the following Coccinelle error:

./drivers/mtd/maps/sc520cdp.c:246:3-9: \
	ERROR: missing iounmap; ioremap on line 242 \
	and execution via conditional on line 244

Since do_map_probe() is also invoked in this loop, it is also necessary to
map_destroy() any initialised struct mtd_info.

Signed-off-by: Luis Henriques <henrix@camandro.org>
---
Changes since v1:
* Changes according to Brian Norris review:
  - Ensure sc520cdp_map[0].virt is unmaped when needed
  - Use a for loop instead of an 'if (i)'
  - Prevent double-iounmap
* Added map_destroy() in the cleanup

drivers/mtd/maps/sc520cdp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/sc520cdp.c b/drivers/mtd/maps/sc520cdp.c
index 093edd51bdc7..9b1c13aa9f20 100644
--- a/drivers/mtd/maps/sc520cdp.c
+++ b/drivers/mtd/maps/sc520cdp.c
@@ -227,7 +227,7 @@ static void sc520cdp_setup_par(void)
 
 static int __init init_sc520cdp(void)
 {
-	int i, devices_found = 0;
+	int i, j, devices_found = 0;
 
 #ifdef REPROGRAM_PAR
 	/* reprogram PAR registers so flash appears at the desired addresses */
@@ -243,6 +243,12 @@ static int __init init_sc520cdp(void)
 
 		if (!sc520cdp_map[i].virt) {
 			printk("Failed to ioremap_nocache\n");
+			for (j = 0; j < i; j++) {
+				if (mymtd[j]) {
+					map_destroy(mymtd[j]);
+					iounmap(sc520cdp_map[j].virt);
+				}
+			}
 			return -EIO;
 		}
 
