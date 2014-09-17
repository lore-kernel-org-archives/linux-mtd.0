Received: from xes-mad.com ([216.165.139.218])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUJgp-0007HK-B9
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 18:10:51 +0000
Date: Wed, 17 Sep 2014 13:08:18 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org
Message-ID: <1456841230.234377.1410977298299.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1388169775.233775.1410977001530.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 1/2] mtd: physmap_of: Fix ROM support via OF
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "ROM" and unknown probe types within the obsolete "direct-mapped"
probe function used the nonexistent "mtd_rom" probe instead of the
intended "map_rom".

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/maps/physmap_of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 217c25d..63d82da 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -103,7 +103,7 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 		if (strcmp(of_probe, "ROM") != 0)
 			dev_warn(&dev->dev, "obsolete_probe: don't know probe "
 				 "type '%s', mapping as rom\n", of_probe);
-		return do_map_probe("mtd_rom", map);
+		return do_map_probe("map_rom", map);
 	}
 }
 
-- 
1.9.1
