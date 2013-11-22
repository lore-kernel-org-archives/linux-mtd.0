Received: from mail-pd0-f172.google.com ([209.85.192.172])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjtWh-0004qc-Uu
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 16:24:16 +0000
Received: by mail-pd0-f172.google.com with SMTP id g10so1457285pdj.17
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 08:23:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, angus.clark@st.com
Subject: [PATCH 12/23] mtd: st_spi_fsm: Search for preferred FSM message
 sequence configurations
Date: Fri, 22 Nov 2013 16:22:49 +0000
Message-Id: <1385137380-28968-13-git-send-email-lee.jones@linaro.org>
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

Here we provide a means to traverse though all supplied FSM message
sequence configurations and pick one based on our chip's capabilities.
The first one we match will be the preferred one, as they are
presented in order of preference.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 15 +++++++++++++++
 drivers/mtd/devices/st_spi_fsm.h | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index a66dbac..0b32fef 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -82,6 +82,21 @@ static void stfsm_wait_seq(struct stfsm *fsm)
 	dev_err(fsm->dev, "timeout on sequence completion\n");
 }
 
+/* Search for preferred configuration based on available flags */
+static struct seq_rw_config *
+stfsm_search_seq_rw_configs(struct stfsm *fsm,
+			    struct seq_rw_config cfgs[])
+{
+	struct seq_rw_config *config;
+	int flags = fsm->info->flags;
+
+	for (config = cfgs; cfgs->cmd != 0; config++)
+		if ((config->flags & flags) == config->flags)
+			return config;
+
+	return NULL;
+}
+
 static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 			    const uint32_t size)
 {
diff --git a/drivers/mtd/devices/st_spi_fsm.h b/drivers/mtd/devices/st_spi_fsm.h
index 60341f2..737ecd9 100644
--- a/drivers/mtd/devices/st_spi_fsm.h
+++ b/drivers/mtd/devices/st_spi_fsm.h
@@ -254,6 +254,18 @@ struct stfsm_seq {
 } __attribute__((__packed__, aligned(4)));
 #define STFSM_SEQ_SIZE sizeof(struct stfsm_seq)
 
+/* Parameters to configure a READ or WRITE FSM sequence */
+struct seq_rw_config {
+	uint32_t	flags;		/* flags to support config */
+	uint8_t		cmd;		/* FLASH command */
+	int		write;		/* Write Sequence */
+	uint8_t		addr_pads;	/* No. of addr pads (MODE & DUMMY) */
+	uint8_t		data_pads;	/* No. of data pads */
+	uint8_t		mode_data;	/* MODE data */
+	uint8_t		mode_cycles;	/* No. of MODE cycles */
+	uint8_t		dummy_cycles;	/* No. of DUMMY cycles */
+};
+
 /* SPI Flash Device Table */
 struct flash_info {
 	char		*name;
-- 
1.8.1.2
