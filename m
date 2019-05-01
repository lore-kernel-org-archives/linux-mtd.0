Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71CBC43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 17:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B398620866
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 17:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kkVld89L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3pNtOCl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B398620866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Xtud+ApMLs739ThI7HFnXX3ursbFyd1t5ib5IrfanoQ=; b=kkV
	ld89LhOdAAkkw56AWQo1SXO+QSw7qm4Pdi7EXFjdpzY4f1DHUuR5pLRpUUD8J3Ss2YNi2a/dWGYG2
	mlgCGd4uovBKyt6+gUj0xNKgrMtNeOkeCB6AKhypGQqg05K0dmW76XcUF3O1j0yUL2cLoRdOdprE9
	pCyQLliR08YVBlx5fYhDdRhRE8EyyvcxkpYihPPqbhX/n3YGLNM1jrcDn5VuOwvY3aCwt4Nt5JFbE
	4RwEh/KdtBjJhul3+LRLJUrZr8gqfwY3t7avwrZHwhZ8BkwfeIk4MJw0bZ8lEASa/TtUkXegiqg7c
	cDN+4qtU9as4Mj/kfxzWqRubRlfRj3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLtPE-000620-DY; Wed, 01 May 2019 17:52:32 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLtPA-00061L-Sq
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 17:52:30 +0000
Received: by mail-pl1-x643.google.com with SMTP id a59so1127337pla.5
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=c4GVYXdtGXK+NpA236Nt4eW2tTRsHxltrkwbVfBnPco=;
 b=J3pNtOClY2+lUvtAtbd2zfi7C3Bh0DJu8CPT7XYaBWgulAPLIWCZDKrOSyO5FPUKT5
 BwzjMNsitZNFmAJd5BM/edhuoljJoT3hkYvQz1Bmx7MtNhijbPKlJAukPx+FyflryLiM
 ysG9pN82/50/qOb3CjLWDbXer0cYdfiiuQMRT4JZRdt0IaK86LnuEhZJ/+vSwB7PpuuJ
 RLemfSoMn67+eXCEfxwG+6YhS0FAgfTYoRwQlMOtNqM3x2odcvV3qCe346FBw06OLyeX
 qKTvJLvp8WaSr5KYqNE/6VLF4UeIGpDgWD6tdc8qPm9LdX0Fdv8r48TI3mJrpGk+dWmJ
 O9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=c4GVYXdtGXK+NpA236Nt4eW2tTRsHxltrkwbVfBnPco=;
 b=c5TWgic4SYHrwplTEceEpv61gL5kLrwexwDCa6x4naboAO/RnyKpgtHHp3eS1ZLy/i
 iiroulH5CHKKrg88GhmU3RB01ig/OBlOsePBnT6YECkHnjJXgbyQIB4i9YFuoyyKfZFw
 KuQP1kye15zhSuOrgewDmGINBeNUxqP22MjmbqbOWRtvhh9k325qdmUtPvTV6gwKvAoY
 ZrDrXtmrpoa1yqhp6rbCGTF+x+w8WYq2IshrKgkzeqYbUxBid6O/vHS8hHo+heo3Fs1X
 vZshZVLjmdXammoUL4aka0My0qiTj0Jh1jacLMV8jShN++rOehjH4FC9yFXFAlu8JIqd
 cZzg==
X-Gm-Message-State: APjAAAVDvV+YWuFQbRfNSgeopjdPrmQmP88mxd7Wog4J6cgLinXO7erP
 Y6jBIeCdCsOagg9KAwCRSiCyvR87
X-Google-Smtp-Source: APXvYqyLj2w6QJeDUo/CBCheOxjdP1ZWlHLztJ310vNkx6Gcd8jk+hQIhOsniYvjqD0JY8yQPAKO9w==
X-Received: by 2002:a17:902:b210:: with SMTP id
 t16mr78192056plr.84.1556733147678; 
 Wed, 01 May 2019 10:52:27 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id j5sm54182472pfe.15.2019.05.01.10.52.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 10:52:26 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: raw: brcmnand: When oops in progress use pio and
 interrupt polling
Date: Wed,  1 May 2019 13:46:15 -0400
Message-Id: <1556733121-20133-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_105228_956058_881900CD 
X-CRM114-Status: GOOD (  15.07  )
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

If mtd_oops is in progress switch to polling for nand command completion
interrupts and use PIO mode wihtout DMA so that the mtd_oops buffer can
be completely written in the assinged nand partition. This is needed in
cases where the panic does not happen on cpu0 and there is only one online
CPU and the panic is not on cpu0.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 55 ++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 482c6f0..cfbe51a 100644
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
+	return i == 1 ? true : false;
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
