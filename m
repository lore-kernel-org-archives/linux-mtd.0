From: Vignesh R <vigneshr@ti.com>
To: Mark Brown <broonie@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@arm.linux.org.uk>
CC: Huang Shijie <b32955@freescale.com>, Vignesh R <vigneshr@ti.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [RFC PATCH 1/5] spi: introduce flag for memory mapped read
Date: Tue, 28 Jul 2015 14:11:12 +0530
Message-ID: <1438072876-16338-2-git-send-email-vigneshr@ti.com>
In-Reply-To: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
References: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
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

TI QSPI controller has SFI translator which exposes entire flash memory
as memory mapped region for read. With this interface, the CPU
can copy data from flash using normal memcpy call. SFI translator
takes care of generating appropriate SPI signals to read data from
flash. This interface works only with SPI flash memories and cannot be
used with other SPI devices.
Introduce use_mmap_read field in spi_message struct. This can be set by
mtd devices (m25p80) to indicate to spi-master (ti-qspi) to perform
memory mapped read. This helps to distinguish whether the spi-message is
from mtd layer(hence mmap read is possible) or by other spi devices.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 include/linux/spi/spi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index d673072346f2..f1a0329ee63f 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -640,6 +640,8 @@ struct spi_transfer {
  * @actual_length: the total number of bytes that were transferred in all
  *	successful segments
  * @status: zero for success, else negative errno
+ * @use_mmap_mode: Indicate to spi master to perform memory mapped
+ *	read if possible.
  * @queue: for use by whichever driver currently owns the message
  * @state: for use by whichever driver currently owns the message
  *
@@ -681,6 +683,7 @@ struct spi_message {
 	unsigned		frame_length;
 	unsigned		actual_length;
 	int			status;
+	bool			use_mmap_mode;
 
 	/* for optional use by whatever driver currently owns the
 	 * spi_message ...  between calls to spi_async and then later
-- 
2.4.6
