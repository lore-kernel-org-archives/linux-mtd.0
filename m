Received: from mail-yh0-f49.google.com ([209.85.213.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN3g-00037w-DI
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:20:32 +0000
Received: by mail-yh0-f49.google.com with SMTP id z20so6533814yhz.22
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:20:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 18/36] mtd: st_spi_fsm: Prepare read/write sequences
 according to configuration
Date: Fri, 29 Nov 2013 12:19:07 +0000
Message-Id: <1385727565-25794-19-git-send-email-lee.jones@linaro.org>
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

Firstly we search for our preference read/write configuration based on a
given chip's capabilities. Then we actually set up the message sequence
accordingly.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 7d690c7..14891ea 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -267,6 +267,23 @@ static void stfsm_prepare_rw_seq(struct stfsm *fsm,
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
 static void stfsm_read_jedec(struct stfsm *fsm, uint8_t *const jedec)
 {
 	const struct stfsm_seq *seq = &stfsm_seq_read_jedec;
-- 
1.8.3.2
