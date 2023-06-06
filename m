Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2D6C7EE45
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 19:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Tz1Z/QKb1lsIecHxhFaz6TtKLY3mQhgQ2Z++GLXOOU=; b=tQ2NP0jD3Xru7Z
	mHEeUhPzeIDFh3nDKMDvsRdFiwv95pQXrf1BGP2eLXG08L+kVVKz2Omj90SHN6thmSOKyCBEUORN9
	AEJLcqO04XrIjLZ1VaTIBz2kjChBXXcDO5ob1INHgcPiZ37NXa2Tifw+vNsm4UITmGWDBttCg8boP
	pwu+V94CWNhWzzfo4gJ/2Yw4JdyofFV+7g0wLgimgNs9a7o0uxayE86eyyq6sFuPllrb9y2A4WJJi
	t274/Z1LEbfGvSvRrM1s/oucpTWLdiTJDKNxPpwCvBY0Tksu70vOgs7muKDM3kFAeFJ/2oEX7lL4N
	LkY/ISpltco0dETidKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cnO-0033am-0O;
	Tue, 06 Jun 2023 19:56:46 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cnJ-0033WV-1P;
	Tue, 06 Jun 2023 19:56:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 9194B5FD0C;
	Tue,  6 Jun 2023 22:56:38 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686081398;
	bh=xDJUjgp6TQV9LR69Y8CgT9NmcDiSez9hE02STaqbw+U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rF9yDeEO8qzX4zf+yvs+qbed3/bdnmtDCius/vEASNxx6YlxKGa9qVNc/tBBWFyfg
	 4RVizPu3Nslo8yWpSynwYpVzkX7gIDCmlXIxR2ZYswGbYsSw2yOff9Q/fTG0UON3x2
	 cmvc/rEmF92ryFK39bquZ6yhjNpZXNWk0t8Rlvd136ziJ9tNzTKbw5Uuj2Pd4YBbnN
	 tuD4l4X47TRTL1qXQFTB934ozHe4s6t4t+xU4VKk/lpU0tWzNfdtkPz5O9l+AnZA2z
	 8YQ6zRq/Jx4LSHYfpAmzzqm7TfXkzaL0MXBqqucthJcScBqYdNROIfhvGEgu48Yb7y
	 erMPoqSQ7XL4Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 22:56:38 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: waiting w/o wired ready/busy pin
Date: Tue, 6 Jun 2023 22:51:27 +0300
Message-ID: <20230606195128.83432-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 14:43:00 #21444531
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_125641_831388_08FE39E9 
X-CRM114-Status: GOOD (  18.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If there is no wired ready/busy pin, classic way to wait for command
completion is to use function 'nand_soft_waitrdy()'. Meson NAND has
special command which allows to wait for NAND_STATUS_READY bit without
reading status in a software loop (as 'nand_soft_waitrdy()' does). To
use it send this command along with NAND_CMD_STATUS, then wait for an
interrupt, and after interrupt send NAND_CMD_READ0. So this feature
allows to use interrupt driven waiting without wired ready/busy pin.

Suggested-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 58 ++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 074e14225c06..f4c5309a9527 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -38,6 +38,7 @@
 #define NFC_CMD_SCRAMBLER_DISABLE	0
 #define NFC_CMD_SHORTMODE_DISABLE	0
 #define NFC_CMD_RB_INT		BIT(14)
+#define NFC_CMD_RB_INT_NO_PIN	((0xb << 10) | BIT(18) | BIT(16))
 
 #define NFC_CMD_GET_SIZE(x)	(((x) >> 22) & GENMASK(4, 0))
 
@@ -94,6 +95,7 @@
 
 /* nand flash controller delay 3 ns */
 #define NFC_DEFAULT_DELAY	3000
+#define NFC_NO_RB_PIN_DELAY	5
 
 #define ROW_ADDER(page, index)	(((page) >> (8 * (index))) & 0xff)
 #define MAX_CYCLE_ADDRS		5
@@ -179,6 +181,7 @@ struct meson_nfc {
 	u32 info_bytes;
 
 	unsigned long assigned_cs;
+	bool no_rb_pin;
 };
 
 enum {
@@ -392,7 +395,41 @@ static void meson_nfc_set_data_oob(struct nand_chip *nand,
 	}
 }
 
-static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
+static int meson_nfc_wait_no_rb_pin(struct meson_nfc *nfc, int timeout_ms)
+{
+	u32 cmd, cfg;
+
+	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
+	meson_nfc_drain_cmd(nfc);
+	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
+
+	cfg = readl(nfc->reg_base + NFC_REG_CFG);
+	cfg |= NFC_RB_IRQ_EN;
+	writel(cfg, nfc->reg_base + NFC_REG_CFG);
+
+	reinit_completion(&nfc->completion);
+	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_STATUS;
+	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+	meson_nfc_cmd_idle(nfc, NFC_NO_RB_PIN_DELAY);
+
+	/* use the max erase time as the maximum clock for waiting R/B */
+	cmd = NFC_CMD_RB | NFC_CMD_RB_INT_NO_PIN | nfc->timing.tbers_max;
+	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+	meson_nfc_cmd_idle(nfc, NFC_NO_RB_PIN_DELAY);
+
+	if (!wait_for_completion_timeout(&nfc->completion,
+					 msecs_to_jiffies(timeout_ms)))
+		return -ETIMEDOUT;
+
+	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_READ0;
+	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+	meson_nfc_drain_cmd(nfc);
+	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
+
+	return 0;
+}
+
+static int meson_nfc_wait_rb_pin(struct meson_nfc *nfc, int timeout_ms)
 {
 	u32 cmd, cfg;
 	int ret = 0;
@@ -420,6 +457,23 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
 	return ret;
 }
 
+static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
+{
+	if (nfc->no_rb_pin) {
+		/* This mode is used when there is no wired R/B pin.
+		 * It works like 'nand_soft_waitrdy()', but instead of
+		 * polling NAND_CMD_STATUS bit in the software loop,
+		 * it will wait for interrupt - controllers checks IO
+		 * bus and when it detects NAND_CMD_STATUS on it, it
+		 * raises interrupt. After interrupt, NAND_CMD_READ0 is
+		 * sent as terminator of the ready waiting procedure.
+		 */
+		return meson_nfc_wait_no_rb_pin(nfc, timeout_ms);
+	} else {
+		return meson_nfc_wait_rb_pin(nfc, timeout_ms);
+	}
+}
+
 static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
 {
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
@@ -1412,6 +1466,8 @@ static int meson_nfc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	nfc->no_rb_pin = !of_property_read_bool(dev->of_node, "nand-rb");
+
 	writel(0, nfc->reg_base + NFC_REG_CFG);
 	ret = devm_request_irq(dev, irq, meson_nfc_irq, 0, dev_name(dev), nfc);
 	if (ret) {
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
