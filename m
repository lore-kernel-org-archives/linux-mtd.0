Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSqs7-0004Y9-MW
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 16:40:19 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so2043909wiv.15
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 09:39:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/15] mtd: st_spi_fsm: Update Macronix 'QE' configuration
Date: Wed, 26 Mar 2014 16:39:17 +0000
Message-Id: <1395851969-13520-4-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
References: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 lee.jones@linaro.org, kernel@stlinux.com, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Angus Clark <angus.clark@st.com>

Update the configuration of the Macronix 'QE' bit, such that
we only set or clear the bit if required.

Signed-off-by: Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 31bbf28..fabba2c 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -1163,12 +1163,27 @@ static int stfsm_mx25_config(struct stfsm *fsm)
 					      CFG_ERASESEC_TOGGLE_32BIT_ADDR);
 	}
 
-	/* For QUAD mode, set 'QE' STATUS bit */
+	/* Check status of 'QE' bit */
+	stfsm_read_status(fsm, FLASH_CMD_RDSR, &sta);
 	data_pads = ((fsm->stfsm_seq_read.seq_cfg >> 16) & 0x3) + 1;
 	if (data_pads == 4) {
-		stfsm_read_status(fsm, FLASH_CMD_RDSR, &sta);
-		sta |= MX25_STATUS_QE;
-		stfsm_write_status(fsm, sta, 1);
+		if (!(sta & MX25_STATUS_QE)) {
+			/* Set 'QE' */
+			sta |= MX25_STATUS_QE;
+
+			stfsm_write_status(fsm, sta, 1);
+
+			stfsm_wait_busy(fsm);
+		}
+	} else {
+		if (sta & MX25_STATUS_QE) {
+			/* Clear 'QE' */
+			sta &= ~MX25_STATUS_QE;
+
+			stfsm_write_status(fsm, sta, 1);
+
+			stfsm_wait_busy(fsm);
+		}
 	}
 
 	return 0;
-- 
1.8.3.2
