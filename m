Date: Thu, 25 Sep 2014 12:20:08 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org
Message-ID: <2002674283.65675.1411665608272.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <103889901.65008.1411665422229.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 1/2] mtd: physmap_of: Add read-only fallback
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Joe Schultz <jschultz@xes-inc.com>

Previously, when probing a CFI chip which was write-protected at the
hardware level, the probe would fail due to the fact it could not put
the chip into QUERY mode. This would result in no MTD devices being
created.

Add a fallback to probe using the map_rom driver if the user-selected
probe fails.

Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/maps/physmap_of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index c62e1c3..efbf416 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -272,6 +272,16 @@ static int of_flash_probe(struct platform_device *dev)
 			info->list[i].mtd = obsolete_probe(dev,
 							   &info->list[i].map);
 		}
+
+		/* Fall back to mapping region as ROM */
+		if (!info->list[i].mtd) {
+			dev_warn(&dev->dev,
+				"do_map_probe() failed for type %s\n",
+				 probe_type);
+
+			info->list[i].mtd = do_map_probe("map_rom",
+							 &info->list[i].map);
+		}
 		mtd_list[i] = info->list[i].mtd;
 
 		err = -ENXIO;
-- 
1.9.1
