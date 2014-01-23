Received: from mail-wg0-f54.google.com ([74.125.82.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Hax-00037O-Ll
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:33:12 +0000
Received: by mail-wg0-f54.google.com with SMTP id x13so1248205wgg.33
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:32:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 27/37] mtd: st_spi_fsm: Write to Flash via the FSM
 FIFO
Date: Thu, 23 Jan 2014 10:31:15 +0000
Message-Id: <1390473085-24626-28-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1390473085-24626-1-git-send-email-lee.jones@linaro.org>
References: <1390473085-24626-1-git-send-email-lee.jones@linaro.org>
Cc: olivier.clergeaud@st.com, Angus.Clark@st.com,
 Lee Jones <lee.jones@linaro.org>, linus.walleij@linaro.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, DCG_UPD_stlinux_kernel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we write data to the FIFO the FSM Controller subsequently writes
that data out to the Serial Flash chip.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index b43fed1..c64f741 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -661,6 +661,20 @@ static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 	}
 }
 
+static int stfsm_write_fifo(struct stfsm *fsm,
+			    const uint32_t *buf, const uint32_t size)
+{
+	uint32_t words = size >> 2;
+
+	dev_dbg(fsm->dev, "writing %d bytes to FIFO\n", size);
+
+	BUG_ON((((uint32_t)buf) & 0x3) || (size & 0x3));
+
+	writesl(fsm->base + SPI_FAST_SEQ_DATA_REG, buf, words);
+
+	return size;
+}
+
 static int stfsm_enter_32bit_addr(struct stfsm *fsm, int enter)
 {
 	struct stfsm_seq *seq = &stfsm_seq_en_32bit_addr;
-- 
1.8.3.2
