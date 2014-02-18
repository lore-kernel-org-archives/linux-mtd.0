Received: from mail-we0-f180.google.com ([74.125.82.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFm6l-0007E6-Jk
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 14:57:22 +0000
Received: by mail-we0-f180.google.com with SMTP id u57so11511300wes.25
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 06:56:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/35] mtd: st_spi_fsm: Search for preferred FSM message
 sequence configurations
Date: Tue, 18 Feb 2014 14:55:37 +0000
Message-Id: <1392735362-1245-11-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
References: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
Cc: Angus.Clark@st.com, lee.jones@linaro.org,
 DCG_UPD_stlinux_kernel@list.st.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
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

Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 90fbd64..68fa12e 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -222,6 +222,18 @@ struct stfsm_seq {
 	uint32_t seq_cfg;
 } __packed __aligned(4);
 
+/* Parameters to configure a READ or WRITE FSM sequence */
+struct seq_rw_config {
+	uint32_t        flags;          /* flags to support config */
+	uint8_t         cmd;            /* FLASH command */
+	int             write;          /* Write Sequence */
+	uint8_t         addr_pads;      /* No. of addr pads (MODE & DUMMY) */
+	uint8_t         data_pads;      /* No. of data pads */
+	uint8_t         mode_data;      /* MODE data */
+	uint8_t         mode_cycles;    /* No. of MODE cycles */
+	uint8_t         dummy_cycles;   /* No. of DUMMY cycles */
+};
+
 /* SPI Flash Device Table */
 struct flash_info {
 	char            *name;
@@ -462,6 +474,21 @@ static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 	}
 }
 
+/* Search for preferred configuration based on available flags */
+static struct seq_rw_config *
+stfsm_search_seq_rw_configs(struct stfsm *fsm,
+			    struct seq_rw_config cfgs[])
+{
+	struct seq_rw_config *config;
+	int flags = fsm->info->flags;
+
+	for (config = cfgs; config->cmd != 0; config++)
+		if ((config->flags & flags) == config->flags)
+			return config;
+
+	return NULL;
+}
+
 static void stfsm_read_jedec(struct stfsm *fsm, uint8_t *const jedec)
 {
 	const struct stfsm_seq *seq = &stfsm_seq_read_jedec;
-- 
1.8.3.2
