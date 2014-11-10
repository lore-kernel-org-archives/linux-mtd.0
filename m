Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnrJl-0005np-A1
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 15:55:49 +0000
From: alison_chaiken@mentor.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] MTD: m25p80: fix inconsistency in m25p_ids compared to
 spi_nor_ids
Date: Mon, 10 Nov 2014 16:54:54 +0100
Message-Id: <1415634895-3082-3-git-send-email-alison_chaiken@mentor.com>
In-Reply-To: <1415634895-3082-1-git-send-email-alison_chaiken@mentor.com>
References: <1415634895-3082-1-git-send-email-alison_chaiken@mentor.com>
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

As stated in a5b7616c5, "mtd: m25p80,spi-nor: Fix module aliases for
m25p80", m25p_ids[] in m25p80.c needs to be kept in sync with
spi_nor_ids[] in spi-nor.c.   The change here corrects a misalignment.

Rebased on linux-next.  Replaces an earlier version with a more terse
commit message.
Signed-off-by: Alison Chaiken <alison_chaiken@mentor.com>

---
 drivers/mtd/devices/m25p80.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2783e94..f5cb8d5 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -291,11 +291,11 @@ static const struct spi_device_id m25p_ids[] = {
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
2.1.1
