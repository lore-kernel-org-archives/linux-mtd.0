Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmOXW-0007Qd-17
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 14:59:58 +0000
From: alison_chaiken@mentor.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: m25p80: fix inconsistency in m25p_ids compared to
 spi_nor_ids
Date: Thu,  6 Nov 2014 15:59:19 +0100
Message-Id: <1415285959-5279-1-git-send-email-alison_chaiken@mentor.com>
Cc: shijie8@gmail.com, computersforpeace@gmail.com, ben@decadent.org.uk,
 alison_chaiken@mentor.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alison Chaiken <alison_chaiken@mentor.com>

Signed-off-by: Alison Chaiken <alison_chaiken@mentor.com>
---
 drivers/mtd/devices/m25p80.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index ed827cf..dd8f66c 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -300,11 +300,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{"m45pe10"},	{"m45pe80"},	{"m45pe16"},
 	{"m25pe20"},	{"m25pe80"},	{"m25pe16"},
 	{"m25px16"},	{"m25px32"},	{"m25px32-s0"},	{"m25px32-s1"},
-	{"m25px64"},
+	{"m25px64"},	{"m25px80"},
 	{"w25x10"},	{"w25x20"},	{"w25x40"},	{"w25x80"},
 	{"w25x16"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
-	{"w25x64"},	{"w25q64"},	{"w25q128"},	{"w25q80"},
-	{"w25q80bl"},	{"w25q128"},	{"w25q256"},	{"cat25c11"},
+	{"w25x64"},	{"w25q64"},	{"w25q80"},	{"w25q80bl"},
+	{"w25q128"},	{"w25q256"},	{"cat25c11"},
 	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
 	{ },
 };
-- 
1.7.9.5
