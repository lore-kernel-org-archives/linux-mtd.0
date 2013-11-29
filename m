Received: from mail-yh0-f48.google.com ([209.85.213.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN3c-00037y-SF
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:20:29 +0000
Received: by mail-yh0-f48.google.com with SMTP id f73so6620302yha.21
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:20:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 19/36] mtd: st_spi_fsm: Add a check to if the chip can
 handle an SoC reset
Date: Fri, 29 Nov 2013 12:19:08 +0000
Message-Id: <1385727565-25794-20-git-send-email-lee.jones@linaro.org>
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

Based on information we can obtain though platform specific data and/or
chip capabilities we are able to determine whether or not we can handle
a SoC reset or not. To find out why this is important please read the
comment provided in the patch.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/st_spi_fsm.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 14891ea..4edd3f2 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -170,6 +170,40 @@ static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 	}
 }
 
+/*
+ * SoC reset on 'boot-from-spi' systems
+ *
+ * Certain modes of operation cause the Flash device to enter a particular state
+ * for a period of time (e.g. 'Erase Sector', 'Quad Enable', and 'Enter 32-bit
+ * Addr' commands).  On boot-from-spi systems, it is important to consider what
+ * happens if a warm reset occurs during this period.  The SPIBoot controller
+ * assumes that Flash device is in its default reset state, 24-bit address mode,
+ * and ready to accept commands.  This can be achieved using some form of
+ * on-board logic/controller to force a device POR in response to a SoC-level
+ * reset or by making use of the device reset signal if available (limited
+ * number of devices only).
+ *
+ * Failure to take such precautions can cause problems following a warm reset.
+ * For some operations (e.g. ERASE), there is little that can be done.  For
+ * other modes of operation (e.g. 32-bit addressing), options are often
+ * available that can help minimise the window in which a reset could cause a
+ * problem.
+ *
+ */
+static bool stfsm_can_handle_soc_reset(struct stfsm *fsm)
+{
+	/* Reset signal is available on the board and supported by the device */
+	if (fsm->reset_signal && fsm->info->flags & FLASH_FLAG_RESET)
+		return true;
+
+	/* Board-level logic forces a power-on-reset */
+	if (fsm->reset_por)
+		return true;
+
+	/* Reset is not properly handled and may result in failure to reboot */
+	return false;
+}
+
 /* Configure 'addr_cfg' according to addressing mode */
 static void stfsm_prepare_erasesec_seq(struct stfsm *fsm,
 				       struct stfsm_seq *seq)
@@ -442,6 +476,10 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
 		goto boot_device_fail;
 	}
 
+	fsm->reset_signal = of_property_read_bool(np, "st,reset-signal");
+
+	fsm->reset_por = of_property_read_bool(np, "st,reset-por");
+
 	/* Where in the syscon the boot device information lives */
 	ret = of_property_read_u32(np, "boot-device-reg", &boot_device_reg);
 	if (ret)
diff --git a/drivers/mtd/devices/st_spi_fsm.h b/drivers/mtd/devices/st_spi_fsm.h
index a0eafa9..0548511 100644
--- a/drivers/mtd/devices/st_spi_fsm.h
+++ b/drivers/mtd/devices/st_spi_fsm.h
@@ -239,6 +239,8 @@ struct stfsm {
 
 	uint32_t		fifo_dir_delay;
 	bool			booted_from_spi;
+	bool			reset_signal;
+	bool			reset_por;
 };
 
 struct stfsm_seq {
-- 
1.8.3.2
