From: Vignesh R <vigneshr@ti.com>
To: Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>
CC: Michal Suchanek <hramrach@gmail.com>, Russell King
 <linux@arm.linux.org.uk>, Vignesh R <vigneshr@ti.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH v2 3/5] mtd: devices: m25p80: add support for mmap read request
Date: Tue, 3 Nov 2015 15:36:12 +0530
Message-ID: <1446545174-14193-4-git-send-email-vigneshr@ti.com>
In-Reply-To: <1446545174-14193-1-git-send-email-vigneshr@ti.com>
References: <1446545174-14193-1-git-send-email-vigneshr@ti.com>
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

Certain spi controllers may support memory mapped interface to read from
m25p80 type flash devices. This interface provides better read
performance than regular SPI interface.
Call spi_mtd_mmap_read() interface, if supported, to make use of
memory-mapped interface.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 drivers/mtd/devices/m25p80.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cd3631170ef..3978bcb513b9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -133,6 +133,11 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	/* convert the dummy cycles to the number of bytes */
 	dummy /= 8;
 
+	if (spi_mmap_read_supported(spi))
+		return spi_mtd_mmap_read(spi, from, len, retlen, buf,
+					 nor->read_opcode,
+					 nor->addr_width, dummy);
+
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
-- 
2.6.2
