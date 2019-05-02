Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74964C04AAA
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 15:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF4C2089E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 15:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UV9tB3Wi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyhiUhGM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF4C2089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GiY0rXAfzygK1pK2FSIfgPD5Pg5wjPsUbAalBrN1DKQ=; b=UV9
	tB3Wiyh/cSY6suDs6cd2lm1V/3z0KFfcVBigZHr1riOhbylpTxLC/U790hYYmNs6J1fdzm3SlW8OH
	qlf3qcDa68DYI/+VA6Nlz8nm9qLogTSSJIgM+kBFy77FM83uspprhLTBcF8y5NxCJ6SP1GsTYns5T
	wWKxI0sVHZ4QdYA8v9/xnAwE65p9rxqvJyK/PnLboGAoWY+7E6YMYFAxG7P5QLWtKjF3IYpVvr4Sa
	BGtgHtR0IUcf3oiAbI+MjOapFLmIpVUjtaZgQcMNaMCYzCj5gEaaLfi5JlQ+1nXDfnhIXajBO8Gek
	Ikr3ZUMFJp4lceS2tsKV57OXNvZWN5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMDDF-0003TP-Fw; Thu, 02 May 2019 15:01:29 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMDDC-0003SX-N4
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 15:01:28 +0000
Received: by mail-pg1-x541.google.com with SMTP id t22so1176376pgi.10
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UuMFcOk4PKj91APfBr8006g4N2giQ/z6xm9K7QOYvPU=;
 b=RyhiUhGMu/07Fiptheef7l3Im7ZUgKwPpMGS171+3DfjyFghriz8AOvRTi8Me4ogUb
 5CDP5WtPupbfM5B0sODlecbeWn0+sDne5D+oprjQzCmrQwCx3oZHRp9+bKcQCBxlOyuK
 mT49R5DO+VPww+b/sKHXtQL8oDw/pvjKN8zcuitbVaLHAIGPfEv7mVB3lY3bpFfJq+Mq
 v9h9NoX2vL5P+ugHDTfKE5/6Fi/Undu5B1Dmq0AJ4FNV12IzcZaTIB9dhe2E4KCV+Bg7
 PDJJeYJAWaSL9/rdUNI7JYv8UcjtwGMqXUHaA61fFxQlkNwMnKC5k/iUotEXsQSOTTKj
 g37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UuMFcOk4PKj91APfBr8006g4N2giQ/z6xm9K7QOYvPU=;
 b=I5BkqfvQO6SzjWbH/t2tN1ywEOhhuJ7VSoOv0Oml21B05McVhvWPxUbwQyMqct2aBn
 fmpFlj9cHmfmk20eiQxlaVVkqXA1qFXFOFDyZh5pdX+OmLaUHdbN56QE9Fhy5WvXXz44
 yb0SO247g3jvq/MN66+OC9fWnr6Dr9e/iA6otj/hZxBPBeO8sVEoE/hP70SOs0Nj2nWx
 kL0i4JZ/cJKQqjOviN1KKVJEKKTFPwdW3p/Z2gu9S5VYF6iT3OvTtkdkcRDA2KOUAu89
 82CMs/nOIIX2D/3KMS7ZFu87SynNuIqesh/usdda1NKHxioB9gQRmfmTSnkftQc9zv0p
 YDpQ==
X-Gm-Message-State: APjAAAVvNAJV1lDBoLIu60W9w6jXMeEsxW0PAtr9rvgwBWK0JPJ5/TF4
 5B5uujYKhoA8TV3zUIM8zgCpYPYy
X-Google-Smtp-Source: APXvYqzp8Vsv3csm5hTN6igjY/ka0x3tKKPaQLzTG2OHdwte3ZIu4AHSVJo95JQxGCw4JKKtULZcqg==
X-Received: by 2002:a63:9214:: with SMTP id o20mr4452130pgd.203.1556809285953; 
 Thu, 02 May 2019 08:01:25 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id o15sm21581450pgb.85.2019.05.02.08.01.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 08:01:25 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: nand: raw: brcmnand: When oops in progress use pio
 and interrupt polling
Date: Thu,  2 May 2019 11:01:01 -0400
Message-Id: <1556809273-40009-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_080126_778150_9C3F4244 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If mtd_oops is in progress, switch to polling during NAND command
completion instead of relying on DMA/interrupts so that the mtd_oops
buffer can be completely written in the assigned NAND partition.
This is needed in cases where and there is only one online CPU and
the panic is not on cpu0 as all IRQs are wired to cpu0.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 55 ++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 482c6f0..128a806 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -823,6 +823,12 @@ static inline bool has_flash_dma(struct brcmnand_controller *ctrl)
 	return ctrl->flash_dma_base;
 }
 
+static inline void disable_flash_dma_xfer(struct brcmnand_controller *ctrl)
+{
+	if (has_flash_dma(ctrl))
+		ctrl->flash_dma_base = 0;
+}
+
 static inline bool flash_dma_buf_ok(const void *buf)
 {
 	return buf && !is_vmalloc_addr(buf) &&
@@ -1237,15 +1243,58 @@ static void brcmnand_cmd_ctrl(struct nand_chip *chip, int dat,
 	/* intentionally left blank */
 }
 
+static bool is_mtd_oops_in_progress(void)
+{
+	int i = 0;
+
+#ifdef CONFIG_MTD_OOPS
+	if (oops_in_progress && smp_processor_id()) {
+		int cpu = 0;
+
+		for_each_online_cpu(cpu)
+			++i;
+	}
+#endif
+	return (i == 1);
+}
+
+static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
+{
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct brcmnand_controller *ctrl = host->ctrl;
+	bool err = false;
+	int sts;
+
+	if (is_mtd_oops_in_progress()) {
+		/* Switch to interrupt polling and PIO mode */
+		disable_flash_dma_xfer(ctrl);
+		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY |
+					       NAND_STATUS_READY,
+					       NAND_CTRL_RDY |
+					       NAND_STATUS_READY, 0);
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
 
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
