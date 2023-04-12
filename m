Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EAFC7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 06:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OHCetD4woNvQDdzD6WpCkNJzSFi291vUNDDZT0pLzo=; b=vlurxeEC+6iBDp
	7a7FodJV2O2xXj6RHLO0fZcy1ub5YSaNm+dVc7YeSnPAmPcGyLRqiJh1KlmQHqf+yUMai30fTGzoU
	XP7XwleER+Yls2H5/vP01zKZUaY3PCDH7XwKV92VZg9obJmtnE6DfUBm79fCbNUZu3NJDK41wJ2+J
	+SzroF8dqlRND7VWXr9IziIw1sCA0jQGPU4f+3QpXoNPlcd+JjO1b67E2siaOk/B2e3e03YiqN4hh
	+eGineqPG3M88ekhu43N7h7G12Tw3qJnIYiqRr1MCJUyIoJjhKqUirNF6qkE5JMiSQZs2lRHTUMm3
	a8iqKsKuyuZcwqNyKSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTrJ-001vrw-1y;
	Wed, 12 Apr 2023 06:21:33 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTr8-001vl6-1S;
	Wed, 12 Apr 2023 06:21:25 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 0E3E35FD62;
	Wed, 12 Apr 2023 09:21:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681280481;
	bh=ijR0GjfEvDOCR18/yaVWHDk9s/uQwtd45e8HbVoRBEQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PfZzkCq9CfP69XL505bFICG6fQTHQzkN70Rkt6pEOLy6eMuNbijDMoHHDAOY49mQo
	 q1cXnKYiwWKg2qrhAHi2oC4sHDDazFy2C7SO+2qlfiiuBMjh7uJqfRu1jI+84xxHF3
	 RF4PLF+/2LCXHbjA6gFaB408oiHijSXmao+vbdqEvGulBHdb/RSVLuv54sEjRLZ9Lv
	 tw8a/fB/sM9YPQQbl/x2Q0HNBBDLq0gNraT/NUC8T+NVAmscMoSkGh/ZWaCsZurxau
	 CQBrljvgymE+ZEguk0nVtlfO62vqMQIdoETUXJR+hQI4RahO7T1cBjLn0uwEbsp9Fu
	 ix43OXeg9E9Wg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 09:21:21 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/5] mtd: rawnand: meson: check buffer length
Date: Wed, 12 Apr 2023 09:16:57 +0300
Message-ID: <20230412061700.1492474-4-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 04:12:00 #21090163
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_232122_829754_352E180F 
X-CRM114-Status: GOOD (  10.53  )
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

With this chip, buffer length is limited by hardware, so check it before
command execution to avoid length trim.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 45b53d420aed..f84a10238e4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -543,6 +543,9 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 	u32 cmd;
 	u8 *info;
 
+	if (len > NFC_CMD_RAW_LEN)
+		return -EINVAL;
+
 	info = kzalloc(PER_INFO_BYTE, GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
@@ -571,6 +574,9 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
 	int ret = 0;
 	u32 cmd;
 
+	if (len > NFC_CMD_RAW_LEN)
+		return -EINVAL;
+
 	ret = meson_nfc_dma_buffer_setup(nand, buf, len, NULL,
 					 0, DMA_TO_DEVICE);
 	if (ret)
@@ -1269,6 +1275,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	int nsectors = mtd->writesize / 1024;
+	int raw_writesize;
 	int ret;
 
 	if (!mtd->name) {
@@ -1280,6 +1287,13 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 			return -ENOMEM;
 	}
 
+	raw_writesize = mtd->writesize + mtd->oobsize;
+	if (raw_writesize > NFC_CMD_RAW_LEN) {
+		dev_err(nfc->dev, "too big write size in raw mode: %d > %ld\n",
+			raw_writesize, NFC_CMD_RAW_LEN);
+		return -EINVAL;
+	}
+
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
