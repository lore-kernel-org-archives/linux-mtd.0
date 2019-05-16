Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D888C04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 16:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 403B32087E
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 16:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NGqg53Nw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHLggaIX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 403B32087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=z8GkbTqbgNwBanwj/JppSPSbyaiPbA4ZuTrECid4vz0=; b=NGq
	g53NwZo7X00ahVcYddvESFR7cFoVvkQmT/mLfhl723rVtbAB5ELdNxW0Fuxg+g1t/Sjml3baSdKm4
	MNj5XNthysuQWG2uWt38YTpwq50IPbqQNkNthsyHzF4MmawCSNqUObMVLNYjxxBcwultNNu6jsDFi
	iPZREvagXLKSeoRnzLjw6y0KGc+aFPY2Uh0/By2b601W9G+8AmEihx/oe8izX3Ok6Qnu9btUDjWE7
	99FDsDi+FE1xD8KM777cmTLGzBz20ZrZvP/LEafpQWZGJKD+9mIsTPQfBaGQgzb7HNUgiQQ3qiHLg
	PEInCB2IsblFWpSS1YBJzFOs/DDcYuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRInz-000558-MR; Thu, 16 May 2019 16:00:27 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRInw-00053C-NN
 for linux-mtd@lists.infradead.org; Thu, 16 May 2019 16:00:26 +0000
Received: by mail-ed1-x542.google.com with SMTP id b8so5928617edm.11
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2019 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=40SvhtWBUctj9+S+m8DxOe/VChkRebT6Ohk0rHAg6js=;
 b=QHLggaIX8qLntcteJprWDMNXEF4m5roi8ecviFniHZepI65lRi+cug/BSR1clU0ev9
 fW5E6RTikEbksO5qsROQycZ8/HcreUTmV7+HXXJ4hyvDHEJ5sivZd6rHRDG9EuEq68kt
 2ZmKV6qK6AJ6QR7QsLWebr/BZD2r+HcJcTevURhtkqdvSh6jmcpBUpcfjfJJ2+o2x8cl
 VrM1SwE3MrKa+AmtUbbm15ygkP0ZIMuugFXTt2/xoCihciOUQZsJcfUZnvyjvGDF1v5S
 Dyt19m7G/QY92CzMZg9ZfDEUyBWHRIiVBe9wlHDuEyLJuG5fy5aOjtT7cKfkOR4SERFL
 dlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=40SvhtWBUctj9+S+m8DxOe/VChkRebT6Ohk0rHAg6js=;
 b=EdiY7mbE3GXLgxOU4pA14VXt8Chv99EwRki1HzkRl/Phage3O997ZBXj4ksCBU24H/
 rfCfmFfKCAmhiQzg/OGRwETwD4zbjgSra86qYc2m6GmqVxkiF4RdB+Oeq0Ia3h75KR3X
 MN3rITJke+l5yDn8egXXJ4lM5kWNeOMQioKkvK8fvDcsmt3TfiQFG7gs+KNTJa8m8ojA
 V/KRxNy0yAIuA2Ub0/ltYysMxfmBlKzwRem/1t+lO/jJLnFeVQkvMYz3Grt/E/ZvotUT
 IMBui688FdV0Tk166j8uepPxOX+ILyi3XgAbdA2cfjgTf3TlSCXsj4PMi5uFppbEyzRj
 iebQ==
X-Gm-Message-State: APjAAAUmBoEnTLYzIO5s1jcgXQltrytVh89Bf/3PQF+pmgfqd6Ht06P2
 lBbNFtcRpu42S0ahkqG8rRf/pU7r
X-Google-Smtp-Source: APXvYqxFwA4MBXten7Nivfuff+a7/ozMhF32vXLiGMWKvNWcDBFPkoeJLEyW4+8wQP6T1Qwnx6OOmw==
X-Received: by 2002:a50:ad42:: with SMTP id z2mr52428235edc.9.1558022421720;
 Thu, 16 May 2019 09:00:21 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id n8sm348307ejk.45.2019.05.16.09.00.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 09:00:21 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: Add flag to indicate panic_write
Date: Thu, 16 May 2019 11:45:39 -0400
Message-Id: <1558022399-24863-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_090024_809458_E74F453F 
X-CRM114-Status: GOOD (  16.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Added a flag to indicate a panic_write so that low level drivers can
use it to take required action where applicable, to ensure oops data
gets written to assigned mtd device.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/mtdcore.c                    |  3 ++
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 49 ++++++++++++++++++++++++++++++--
 include/linux/mtd/mtd.h                  |  6 ++++
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 76b4264..a83decd 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1138,6 +1138,9 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
+	if (!mtd->oops_panic_write)
+		mtd->oops_panic_write = true;
+
 	return mtd->_panic_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index ce0b8ff..a30a7f0 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -159,6 +159,7 @@ struct brcmnand_controller {
 	u32			nand_cs_nand_xor;
 	u32			corr_stat_threshold;
 	u32			flash_dma_mode;
+	bool			pio_poll_mode;
 };
 
 struct brcmnand_cfg {
@@ -823,6 +824,21 @@ static inline bool has_flash_dma(struct brcmnand_controller *ctrl)
 	return ctrl->flash_dma_base;
 }
 
+static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
+{
+	if (ctrl->pio_poll_mode)
+		return;
+
+	if (has_flash_dma(ctrl)) {
+		ctrl->flash_dma_base = 0;
+		disable_irq(ctrl->dma_irq);
+	}
+
+	disable_irq(ctrl->irq);
+
+	ctrl->pio_poll_mode = true;
+}
+
 static inline bool flash_dma_buf_ok(const void *buf)
 {
 	return buf && !is_vmalloc_addr(buf) &&
@@ -1237,15 +1253,42 @@ static void brcmnand_cmd_ctrl(struct nand_chip *chip, int dat,
 	/* intentionally left blank */
 }
 
+static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
+{
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct brcmnand_controller *ctrl = host->ctrl;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	bool err = false;
+	int sts;
+
+	if (mtd->oops_panic_write) {
+		/* switch to interrupt polling and PIO mode */
+		disable_ctrl_irqs(ctrl);
+		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
+					       NAND_CTRL_RDY, 0);
+		err = (sts < 0) ? true : false;
+	} else {
+		unsigned long timeo = msecs_to_jiffies(
+						NAND_POLL_STATUS_TIMEOUT_MS);
+		/* wait for completion interrupt */
+		sts = wait_for_completion_timeout(&ctrl->done, timeo);
+		err = (sts <= 0) ? true : false;
+	}
+
+	return err;
+}
+
 static int brcmnand_waitfunc(struct nand_chip *chip)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
-	unsigned long timeo = msecs_to_jiffies(100);
+	bool err = false;
 
 	dev_dbg(ctrl->dev, "wait on native cmd %d\n", ctrl->cmd_pending);
-	if (ctrl->cmd_pending &&
-			wait_for_completion_timeout(&ctrl->done, timeo) <= 0) {
+	if (ctrl->cmd_pending)
+		err = brcmstb_nand_wait_for_completion(chip);
+
+	if (err) {
 		u32 cmd = brcmnand_read_reg(ctrl, BRCMNAND_CMD_START)
 					>> brcmnand_cmd_shift(ctrl);
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 677768b..791c34d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -330,6 +330,12 @@ struct mtd_info {
 	int (*_get_device) (struct mtd_info *mtd);
 	void (*_put_device) (struct mtd_info *mtd);
 
+	/*
+	 * flag indicates a panic write, low level drivers can take appropriate
+	 * action if required to ensure writes go through
+	 */
+	bool oops_panic_write;
+
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
 	/* ECC status information */
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
