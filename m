Received: from atl4mhob10.myregisteredsite.com ([209.17.115.48])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSMdi-0001U4-Eu
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2015 09:27:51 +0000
Received: from mailpod.hostingplatform.com ([10.30.71.203])
 by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
 t229RFR2032716
 for <linux-mtd@lists.infradead.org>; Mon, 2 Mar 2015 04:27:15 -0500
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com
Subject: [PATCH] MTD: m25p80: fix inconsistency in m25p_ids for Micron devices
Date: Mon,  2 Mar 2015 10:26:51 +0100
Message-Id: <1425288411-6888-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, michal.simek@xilinx.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As stated in a5b7616c5, "mtd: m25p80,spi-nor: Fix module aliases for
m25p80", m25p_ids[] in m25p80.c needs to be kept in sync with
spi_nor_ids[] in spi-nor.c.

This patch fixes the mismatches for the Micron devices, the
"n25q256a" and "n25q512a" do not exist in the spi_nor_ids, so
replace them with the correct names for these chips.

This repairs the disappearance of NOR flash on the Miami boards since 3.18.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/mtd/devices/m25p80.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b2b33e4..402172c 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -280,8 +280,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{"mx25l3205d"},	{"mx25l3255e"},	{"mx25l6405d"},	{"mx25l12805d"},
 	{"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
 	{"mx66l1g55g"},
-	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q256a"},
-	{"n25q512a"},	{"n25q512ax3"},	{"n25q00"},
+	{"n25q064"},
+	{"n25q128a11"},	{"n25q128a13"},
+	{"n25q256a11"},	{"n25q256a13"},
+	{"n25q512a11"},	{"n25q512a13"},	{"n25q512ax3"},
+	{"n25q00"},
 	{"pm25lv512"},	{"pm25lv010"},	{"pm25lq032"},
 	{"s25sl032p"},	{"s25sl064p"},	{"s25fl256s0"},	{"s25fl256s1"},
 	{"s25fl512s"},	{"s70fl01gs"},	{"s25sl12800"},	{"s25sl12801"},
-- 
1.9.1
