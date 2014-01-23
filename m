Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Has-0007yD-PT
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:33:07 +0000
Received: by mail-wi0-f180.google.com with SMTP id d13so1590580wiw.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:32:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 25/37] mtd: st_spi_fsm: Prepare default sequences
 for read/write/erase
Date: Thu, 23 Jan 2014 10:31:13 +0000
Message-Id: <1390473085-24626-26-git-send-email-lee.jones@linaro.org>
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

Most chips require a predefined set of FSM message sequences for read,
write and erase operations. This patch provides a way to set them up,
which it will do so if a chip specific initialisation routine isn't
been provided.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 28d8ac0..a5b9d67 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -838,6 +838,38 @@ static int stfsm_search_prepare_rw_seq(struct stfsm *fsm,
 	return 0;
 }
 
+/* Prepare a READ/WRITE/ERASE 'default' sequences */
+static int stfsm_prepare_rwe_seqs_default(struct stfsm *fsm)
+{
+	uint32_t flags = fsm->info->flags;
+	int ret;
+
+	/* Configure 'READ' sequence */
+	ret = stfsm_search_prepare_rw_seq(fsm, &stfsm_seq_read,
+					  default_read_configs);
+	if (ret) {
+		dev_err(fsm->dev,
+			"failed to prep READ sequence with flags [0x%08x]\n",
+			flags);
+		return ret;
+	}
+
+	/* Configure 'WRITE' sequence */
+	ret = stfsm_search_prepare_rw_seq(fsm, &stfsm_seq_write,
+					  default_write_configs);
+	if (ret) {
+		dev_err(fsm->dev,
+			"failed to prep WRITE sequence with flags [0x%08x]\n",
+			flags);
+		return ret;
+	}
+
+	/* Configure 'ERASE_SECTOR' sequence */
+	stfsm_prepare_erasesec_seq(fsm, &stfsm_seq_erase_sector);
+
+	return 0;
+}
+
 static int stfsm_n25q_config(struct stfsm *fsm)
 {
 	uint32_t flags = fsm->info->flags;
@@ -1153,6 +1185,10 @@ static int stfsm_probe(struct platform_device *pdev)
 		ret = info->config(fsm);
 		if (ret)
 			return ret;
+	} else {
+		ret = stfsm_prepare_rwe_seqs_default(fsm);
+		if (ret)
+			return ret;
 	}
 
 	platform_set_drvdata(pdev, fsm);
-- 
1.8.3.2
