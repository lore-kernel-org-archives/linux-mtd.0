Received: from mail-yh0-f42.google.com ([209.85.213.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN3C-0006hs-6q
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:20:12 +0000
Received: by mail-yh0-f42.google.com with SMTP id z6so6683557yhz.1
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:19:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 05/36] mtd: st_spi_fsm: Supply a method to read from the
 FSM's FIFO
Date: Fri, 29 Nov 2013 12:18:54 +0000
Message-Id: <1385727565-25794-6-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linus.walleij@linaro.org,
 Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org
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
index 8ac8cd9..05fa834 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -81,6 +81,32 @@ static void stfsm_wait_seq(struct stfsm *fsm)
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
 static int stfsm_set_mode(struct stfsm *fsm, uint32_t mode)
 {
 	int ret, timeout = 10;
-- 
1.8.3.2
