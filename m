Received: from balrog.mythic-beasts.com ([2a00:1098:0:82:1000:0:2:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c793u-0006qA-Cd
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2016 22:52:15 +0000
From: Luis Henriques <henrix@camandro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Henriques <henrix@camandro.org>
Subject: [PATCH] mtd: maps: add missing iounmap() in error path
Date: Wed, 16 Nov 2016 22:50:16 +0000
Message-Id: <20161116225016.29958-1-henrix@camandro.org>
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

Signed-off-by: Luis Henriques <henrix@camandro.org>
---
 drivers/mtd/maps/sc520cdp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/maps/sc520cdp.c b/drivers/mtd/maps/sc520cdp.c
index 093edd51bdc7..7a27ed345d0d 100644
--- a/drivers/mtd/maps/sc520cdp.c
+++ b/drivers/mtd/maps/sc520cdp.c
@@ -243,6 +243,10 @@ static int __init init_sc520cdp(void)
 
 		if (!sc520cdp_map[i].virt) {
 			printk("Failed to ioremap_nocache\n");
+			if (i) {
+				while (--i)
+					iounmap(sc520cdp_map[i].virt);
+			}
 			return -EIO;
 		}
 
