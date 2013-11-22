Received: from mail-pd0-f172.google.com ([209.85.192.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjtWy-0002ye-OT
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 16:24:38 +0000
Received: by mail-pd0-f172.google.com with SMTP id g10so1457678pdj.17
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 08:24:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, angus.clark@st.com
Subject: [PATCH 18/23] mtd: st_spi_fsm: Prepare read/write sequences according
 to configuration
Date: Fri, 22 Nov 2013 16:22:55 +0000
Message-Id: <1385137380-28968-19-git-send-email-lee.jones@linaro.org>
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

Firstly we search for our preference read/write configuration based on a
given chip's capabilities. Then we actually set up the message sequence
accordingly.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index a56fb98..85abf9a 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -225,6 +225,23 @@ static void stfsm_prepare_rw_seq(struct stfsm *fsm,
 	seq->seq[i++] = STFSM_INST_STOP;
 }
 
+static int stfsm_search_prepare_rw_seq(struct stfsm *fsm,
+				       struct stfsm_seq *seq,
+				       struct seq_rw_config *cfgs)
+{
+	struct seq_rw_config *config;
+
+	config = stfsm_search_seq_rw_configs(fsm, cfgs);
+	if (!config) {
+		dev_err(fsm->dev, "failed to find suitable config\n");
+		return -EINVAL;
+	}
+
+	stfsm_prepare_rw_seq(fsm, seq, config);
+
+	return 0;
+}
+
 static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 			    const uint32_t size)
 {
-- 
1.8.1.2
