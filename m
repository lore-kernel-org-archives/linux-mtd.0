From: P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>
To: Michal Simek <michal.simek@xilinx.com>, Soren Brinkmann
 <soren.brinkmann@xilinx.com>, David Woodhouse <dwmw2@infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Javier Martinez Canillas" <javier@osg.samsung.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>, Jagan Teki <jteki@openedev.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Harini
 Katakam" <harinik@xilinx.com>, Punnaiah Choudary Kalluri
 <punnaia@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, P L Sai Krishna
 <lakshmis@xilinx.com>
Subject: [LINUX PATCH v2 2/3] mtd:m25p80: Assigned number of dummy cycles to
 dummy_cycles.
Date: Thu, 7 Apr 2016 20:09:28 +0530
Message-ID: <1460039969-9835-2-git-send-email-lakshmis@xilinx.com>
In-Reply-To: <1460039969-9835-1-git-send-email-lakshmis@xilinx.com>
References: <1460039969-9835-1-git-send-email-lakshmis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Assigned number of dummy cycles to dummy_cycles member of
spi_transfer structure in m25p80_read API.

Signed-off-by: P L Sai Krishna <lakshmis@xilinx.com>
---
v2: 
 - New Patch.
 
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c9c3b7f..7c9fac9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -139,6 +139,7 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 
 	t[0].tx_buf = flash->command;
 	t[0].len = m25p_cmdsz(nor) + dummy;
+	t[0].dummy = nor->read_dummy;
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
-- 
2.1.2
