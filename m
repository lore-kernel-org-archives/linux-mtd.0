Received: from mail-we0-f178.google.com ([74.125.82.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Hhj-0003nc-B3
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:40:12 +0000
Received: by mail-we0-f178.google.com with SMTP id t60so931215wes.23
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:39:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 04/37] mtd: st_spi_fsm: Supply framework for device
 requests
Date: Thu, 23 Jan 2014 10:30:52 +0000
Message-Id: <1390473085-24626-5-git-send-email-lee.jones@linaro.org>
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

The FSM hardware works by setting a predetermined sequence of register
writes. Rather than open coding them inside each functional block we're
going to define them in a series of formatted 'sequence structures'.
This patch provides the framework which shall be used for every action.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 5badbe4..c7daeca 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -204,6 +204,24 @@ struct stfsm {
 	uint32_t                fifo_dir_delay;
 };
 
+struct stfsm_seq {
+	uint32_t data_size;
+	uint32_t addr1;
+	uint32_t addr2;
+	uint32_t addr_cfg;
+	uint32_t seq_opc[5];
+	uint32_t mode;
+	uint32_t dummy;
+	uint32_t status;
+	uint8_t  seq[16];
+	uint32_t seq_cfg;
+} __packed __aligned(4);
+
+static inline int stfsm_is_idle(struct stfsm *fsm)
+{
+	return readl(fsm->base + SPI_FAST_SEQ_STA) & 0x10;
+}
+
 static inline uint32_t stfsm_fifo_available(struct stfsm *fsm)
 {
 	return (readl(fsm->base + SPI_FAST_SEQ_STA) >> 5) & 0x7f;
@@ -225,6 +243,37 @@ static void stfsm_clear_fifo(struct stfsm *fsm)
 	}
 }
 
+static inline void stfsm_load_seq(struct stfsm *fsm,
+				  const struct stfsm_seq *seq)
+{
+	void __iomem *dst = fsm->base + SPI_FAST_SEQ_TRANSFER_SIZE;
+	const uint32_t *src = (const uint32_t *)seq;
+	int words = sizeof(*seq) / sizeof(*src);
+
+	BUG_ON(!stfsm_is_idle(fsm));
+
+	while (words--) {
+		writel(*src, dst);
+		src++;
+		dst += 4;
+	}
+}
+
+static void stfsm_wait_seq(struct stfsm *fsm)
+{
+	unsigned long timeo = jiffies + HZ;
+
+	while (time_before(jiffies, timeo)) {
+		if (stfsm_is_idle(fsm))
+			return;
+
+		cond_resched();
+	}
+
+	if (!stfsm_is_idle(fsm))
+		dev_err(fsm->dev, "timeout on sequence completion\n");
+}
+
 static int stfsm_set_mode(struct stfsm *fsm, uint32_t mode)
 {
 	int ret, timeout = 10;
-- 
1.8.3.2
