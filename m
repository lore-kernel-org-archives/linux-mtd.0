Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjtWH-0002rB-UV
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 16:24:02 +0000
Received: by mail-pa0-f49.google.com with SMTP id kx10so1504317pab.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 08:23:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, angus.clark@st.com
Subject: [PATCH 05/23] mtd: st_spi_fsm: Supply a method to read from the FSM's
 FIFO
Date: Fri, 22 Nov 2013 16:22:42 +0000
Message-Id: <1385137380-28968-6-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
References: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When invoked the driver will attempt to read any available data from
the FSM's data register. Any data collected from this FIFO would have
originated from the flash chip.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index e671029..73c55b4 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -65,6 +65,32 @@ static void stfsm_wait_seq(struct stfsm *fsm)
 	dev_err(fsm->dev, "timeout on sequence completion\n");
 }
 
+static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
+			    const uint32_t size)
+{
+	uint32_t remaining = size >> 2;
+	uint32_t avail;
+	uint32_t words;
+
+	dev_dbg(fsm->dev, "Reading %d bytes from FIFO\n", size);
+
+	BUG_ON((((uint32_t)buf) & 0x3) || (size & 0x3));
+
+	while (remaining) {
+		for (;;) {
+			avail = stfsm_fifo_available(fsm);
+			if (avail)
+				break;
+			udelay(1);
+		}
+		words = min(avail, remaining);
+		remaining -= words;
+
+		readsl(fsm->base + SPI_FAST_SEQ_DATA_REG, buf, words);
+		buf += words;
+	}
+}
+
 static void stfsm_clear_fifo(struct stfsm *fsm)
 {
 	uint32_t avail;
-- 
1.8.1.2
