Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F147AEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuZ6A5wv4MB6Ui4EjYU/u1h92Ymc4xbWRchypfs65Ig=; b=rwYsVXfyS/hYgc
	kbJtZS+kX7A97sqMCiUgjo1jHeAQiWGul1PJ9viYEbBJQ13HyE8WApmMSp54fj6VtUIVXf6AlqFAp
	vPMogPg/70U8v/EsQ0yPM4xtVftTES9di/NZgevU5LsumIP3Fu7dcgGf7bC1NtPaD+4VmnFS9m0rz
	A117W5jal5AYVd5LWXa3DKsS224178YLsxW3V7uYdb5I0W4+Qe5W53hqVjeTSPhk66UK+n6D0sKrM
	+Y1t0AMhswpGpXHJmpUVTEQ5maGQw+FSHyaxkmMFTq/Gr2GZagntPdO6J7siyiI2WBzYLk35Dx/mu
	PNqKAoTqwsvLtu6+h15g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH052-00FeGR-2G;
	Wed, 05 Jul 2023 10:49:52 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH04x-00FeCI-0L;
	Wed, 05 Jul 2023 10:49:48 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B8A2A120062;
	Wed,  5 Jul 2023 13:49:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B8A2A120062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688554185;
	bh=nKCAk3CURTbAaGdu/4XW28wHRq4gX1MBZxHD357NVK4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dYgNKbh73XfSAbYT+STUUYbXrlhI+czkt+r0nRDQnjC4LpWCi7gkA8DBTcOICGKoB
	 lr0dh4RF2LqsyzlP/RgkWoQwoyr5POMmywpDwreerqXkFcH1BeLUEzt3sm23Pv3J87
	 87dMMTsmzXqxXVgpZFMtGgAP094Lfht9wE3SAhHheWZ6w4LVoEU6GnRyUkDIthNMHl
	 JTxEbBvPmkv9lO3zdS22P5FBpqHaWXbN7sUkiPurINyZ4mnQrd3rKOCtBcEZdHrHyu
	 hvFUwj6T5qHlKSYn47/E1ioqNVQu6926XlAEFphcYNC/t5mrtARRNnN2X0kZN/zfIZ
	 hIKXWg3LS1RaQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 13:49:45 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 13:49:42 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Adam Borowski
	<kilobyte@angband.pl>, ChenXiaoSong <chenxiaosong2@huawei.com>, JaimeLiao
	<jaimeliao.tw@gmail.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] mtd: rawnand: meson: use NAND core API to check status
Date: Wed, 5 Jul 2023 13:43:58 +0300
Message-ID: <20230705104403.696680-3-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230705104403.696680-1-AVKrasnov@sberdevices.ru>
References: <20230705104403.696680-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178444 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 05:28:00 #21565829
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_034947_492101_2A91DDF1 
X-CRM114-Status: GOOD (  15.62  )
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

NAND core API already has functions to send NAND_CMD_STATUS and leave
status checking mode by sending NAND_CMD_READ0, so use both of them
instead of direct access to the controller registers.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index c7213f03a773..54e7fdbf0706 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -422,9 +422,10 @@ static void meson_nfc_set_data_oob(struct nand_chip *nand,
 	}
 }
 
-static int meson_nfc_wait_no_rb_pin(struct meson_nfc *nfc, int timeout_ms,
+static int meson_nfc_wait_no_rb_pin(struct nand_chip *nand, int timeout_ms,
 				    bool need_cmd_read0)
 {
+	struct meson_nfc *nfc = nand_get_controller_data(nand);
 	u32 cmd, cfg;
 
 	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
@@ -436,8 +437,7 @@ static int meson_nfc_wait_no_rb_pin(struct meson_nfc *nfc, int timeout_ms,
 	writel(cfg, nfc->reg_base + NFC_REG_CFG);
 
 	reinit_completion(&nfc->completion);
-	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_STATUS;
-	writel(cmd, nfc->reg_base + NFC_REG_CMD);
+	nand_status_op(nand, NULL);
 
 	/* use the max erase time as the maximum clock for waiting R/B */
 	cmd = NFC_CMD_RB | NFC_CMD_RB_INT_NO_PIN | nfc->timing.tbers_max;
@@ -447,12 +447,8 @@ static int meson_nfc_wait_no_rb_pin(struct meson_nfc *nfc, int timeout_ms,
 					 msecs_to_jiffies(timeout_ms)))
 		return -ETIMEDOUT;
 
-	if (need_cmd_read0) {
-		cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_READ0;
-		writel(cmd, nfc->reg_base + NFC_REG_CMD);
-		meson_nfc_drain_cmd(nfc);
-		meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
-	}
+	if (need_cmd_read0)
+		nand_exit_status_op(nand);
 
 	return 0;
 }
@@ -485,9 +481,11 @@ static int meson_nfc_wait_rb_pin(struct meson_nfc *nfc, int timeout_ms)
 	return ret;
 }
 
-static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms,
+static int meson_nfc_queue_rb(struct nand_chip *nand, int timeout_ms,
 			      bool need_cmd_read0)
 {
+	struct meson_nfc *nfc = nand_get_controller_data(nand);
+
 	if (nfc->no_rb_pin) {
 		/* This mode is used when there is no wired R/B pin.
 		 * It works like 'nand_soft_waitrdy()', but instead of
@@ -499,7 +497,7 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms,
 		 * needed (for all cases except page programming - this
 		 * is reason of 'need_cmd_read0' flag).
 		 */
-		return meson_nfc_wait_no_rb_pin(nfc, timeout_ms,
+		return meson_nfc_wait_no_rb_pin(nand, timeout_ms,
 						need_cmd_read0);
 	} else {
 		return meson_nfc_wait_rb_pin(nfc, timeout_ms);
@@ -709,7 +707,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	if (in) {
 		nfc->cmdfifo.rw.cmd1 = cs | NFC_CMD_CLE | NAND_CMD_READSTART;
 		writel(nfc->cmdfifo.rw.cmd1, nfc->reg_base + NFC_REG_CMD);
-		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max), true);
+		meson_nfc_queue_rb(nand, PSEC_TO_MSEC(sdr->tR_max), true);
 	} else {
 		meson_nfc_cmd_idle(nfc, nfc->timing.tadl);
 	}
@@ -755,7 +753,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 
 	cmd = nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
-	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max), false);
+	meson_nfc_queue_rb(nand, PSEC_TO_MSEC(sdr->tPROG_max), false);
 
 	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_TO_DEVICE);
 
@@ -1071,7 +1069,7 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms,
+			meson_nfc_queue_rb(nand, instr->ctx.waitrdy.timeout_ms,
 					   true);
 			if (instr->delay_ns)
 				meson_nfc_cmd_idle(nfc, delay_idle);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
