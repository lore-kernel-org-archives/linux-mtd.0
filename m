Received: from mail-we0-f171.google.com ([74.125.82.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6HZw-0002uJ-5D
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:32:25 +0000
Received: by mail-we0-f171.google.com with SMTP id w61so950913wes.30
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:31:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 03/37] mtd: st_spi_fsm: Initialise and configure the
 FSM for normal working conditions
Date: Thu, 23 Jan 2014 10:30:51 +0000
Message-Id: <1390473085-24626-4-git-send-email-lee.jones@linaro.org>
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

This patch uses default values to initialise a connected flash chip. This
includes; a device soft reset, setting of a safe working frequency, a
switch into Fast Sequencing Mode, configuring of timing data and a purge
of the FIFO.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 127 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index ccee749..5badbe4 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -74,6 +74,10 @@
 #define SPI_CFG_CS_SETUPHOLD(x)		(((x) & 0xff) << 16)
 #define SPI_CFG_DATA_HOLD(x)		(((x) & 0xff) << 24)
 
+#define SPI_CFG_DEFAULT_MIN_CS_HIGH    SPI_CFG_MIN_CS_HIGH(0x0AA)
+#define SPI_CFG_DEFAULT_CS_SETUPHOLD   SPI_CFG_CS_SETUPHOLD(0xA0)
+#define SPI_CFG_DEFAULT_DATA_HOLD      SPI_CFG_DATA_HOLD(0x00)
+
 /*
  * Register: SPI_FAST_SEQ_TRANSFER_SIZE
  */
@@ -185,19 +189,136 @@
 #define STFSM_INST_WAIT			STFSM_INSTR(STFSM_OPC_WAIT,	0)
 #define STFSM_INST_STOP			STFSM_INSTR(STFSM_OPC_STOP,	0)
 
+#define STFSM_DEFAULT_EMI_FREQ 100000000UL                        /* 100 MHz */
+#define STFSM_DEFAULT_WR_TIME  (STFSM_DEFAULT_EMI_FREQ * (15/1000)) /* 15ms */
+
+#define STFSM_FLASH_SAFE_FREQ  10000000UL                         /* 10 MHz */
+
 struct stfsm {
 	struct device		*dev;
 	void __iomem		*base;
 	struct resource		*region;
 	struct mtd_info		mtd;
 	struct mutex		lock;
+
+	uint32_t                fifo_dir_delay;
 };
 
+static inline uint32_t stfsm_fifo_available(struct stfsm *fsm)
+{
+	return (readl(fsm->base + SPI_FAST_SEQ_STA) >> 5) & 0x7f;
+}
+
+static void stfsm_clear_fifo(struct stfsm *fsm)
+{
+	uint32_t avail;
+
+	for (;;) {
+		avail = stfsm_fifo_available(fsm);
+		if (!avail)
+			break;
+
+		while (avail) {
+			readl(fsm->base + SPI_FAST_SEQ_DATA_REG);
+			avail--;
+		}
+	}
+}
+
+static int stfsm_set_mode(struct stfsm *fsm, uint32_t mode)
+{
+	int ret, timeout = 10;
+
+	/* Wait for controller to accept mode change */
+	while (--timeout) {
+		ret = readl(fsm->base + SPI_STA_MODE_CHANGE);
+		if (ret & 0x1)
+			break;
+		udelay(1);
+	}
+
+	if (!timeout)
+		return -EBUSY;
+
+	writel(mode, fsm->base + SPI_MODESELECT);
+
+	return 0;
+}
+
+static void stfsm_set_freq(struct stfsm *fsm, uint32_t spi_freq)
+{
+	uint32_t emi_freq;
+	uint32_t clk_div;
+
+	/* TODO: Make this dynamic */
+	emi_freq = STFSM_DEFAULT_EMI_FREQ;
+
+	/*
+	 * Calculate clk_div - values between 2 and 128
+	 * Multiple of 2, rounded up
+	 */
+	clk_div = 2 * DIV_ROUND_UP(emi_freq, 2 * spi_freq);
+	if (clk_div < 2)
+		clk_div = 2;
+	else if (clk_div > 128)
+		clk_div = 128;
+
+	/*
+	 * Determine a suitable delay for the IP to complete a change of
+	 * direction of the FIFO. The required delay is related to the clock
+	 * divider used. The following heuristics are based on empirical tests,
+	 * using a 100MHz EMI clock.
+	 */
+	if (clk_div <= 4)
+		fsm->fifo_dir_delay = 0;
+	else if (clk_div <= 10)
+		fsm->fifo_dir_delay = 1;
+	else
+		fsm->fifo_dir_delay = DIV_ROUND_UP(clk_div, 10);
+
+	dev_dbg(fsm->dev, "emi_clk = %uHZ, spi_freq = %uHZ, clk_div = %u\n",
+		emi_freq, spi_freq, clk_div);
+
+	writel(clk_div, fsm->base + SPI_CLOCKDIV);
+}
+
+static int stfsm_init(struct stfsm *fsm)
+{
+	int ret;
+
+	/* Perform a soft reset of the FSM controller */
+	writel(SEQ_CFG_SWRESET, fsm->base + SPI_FAST_SEQ_CFG);
+	udelay(1);
+	writel(0, fsm->base + SPI_FAST_SEQ_CFG);
+
+	/* Set clock to 'safe' frequency initially */
+	stfsm_set_freq(fsm, STFSM_FLASH_SAFE_FREQ);
+
+	/* Switch to FSM */
+	ret = stfsm_set_mode(fsm, SPI_MODESELECT_FSM);
+	if (ret)
+		return ret;
+
+	/* Set timing parameters */
+	writel(SPI_CFG_DEVICE_ST            |
+	       SPI_CFG_DEFAULT_MIN_CS_HIGH  |
+	       SPI_CFG_DEFAULT_CS_SETUPHOLD |
+	       SPI_CFG_DEFAULT_DATA_HOLD,
+	       fsm->base + SPI_CONFIGDATA);
+	writel(STFSM_DEFAULT_WR_TIME, fsm->base + SPI_STATUS_WR_TIME_REG);
+
+	/* Clear FIFO, just in case */
+	stfsm_clear_fifo(fsm);
+
+	return 0;
+}
+
 static int stfsm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct resource *res;
 	struct stfsm *fsm;
+	int ret;
 
 	if (!np) {
 		dev_err(&pdev->dev, "No DT found\n");
@@ -234,6 +355,12 @@ static int stfsm_probe(struct platform_device *pdev)
 
 	mutex_init(&fsm->lock);
 
+	ret = stfsm_init(fsm);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialise FSM Controller\n");
+		return ret;
+	}
+
 	platform_set_drvdata(pdev, fsm);
 
 	fsm->mtd.dev.parent	= &pdev->dev;
-- 
1.8.3.2
