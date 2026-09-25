Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3943C9832C
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fh+rLrxauhF+nkHl831hq0NLXdSv3pdjvzkX9Q/hDZc=; b=bD75yqaSGrSy+t
	zLXvWLW1bsGafDYBRAk1bhbGyyUq9xhMgPMlJMOZeIWYZdtVGE5x7okhnbfQOAHMEOct3zQewc+qQ
	/ddRnLF1xmBsrJsenZ+o+25Q3J1piRGuRIjL/x9SaAQix5R6AFyAPhwWFMlFbmzXpq6TKAKWXzc4K
	5W+3e8c8NC1FSfB/km64BUV6d2w5OzwQYKVNCEsqiThwcd7cJs60xai6yyibFVharKqHlEN5xPtXP
	YB/6mHdkDdQsKP6fpVPUxC97J6DvB1JoXGFP8z5NATN/vwNswkFhu0FJPCy3dIncFt7RbgTtmgek0
	af8FoKKy9SILb5hCPuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFi-0000000EDY0-3w2D;
	Fri, 25 Sep 2026 19:06:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFh-0000000EDXE-3NdU
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Sep 2026 19:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sg0ZYzOcfsY4Z5izNeP33bopaC20kArbvAiber1DDPo=; b=jeKDQBzlM4gZ2xJgYeVja1Kxjv
	9N4ZRQL5miZ9Spf8z+f1bVAEZEGF0ma0TJFRu5cRDrrYGm+OdIn92hoDRKZwnjbjg7NPhajbYWdPX
	hn0m37Jerj/FIItVEmEta4aLRQNkCNBOgZJ85/X9Qy70fGvz46RAmsi67HqofUkKOsdRQFiWoOAoG
	FYbsa5mV3Nwr9DyWq2UPZXceFvPSjuoTFfcrapuDh1D/szTauTGQkeEdMxTprx5jeimcDVjD7ttRk
	hW1TFb0YZUliyErlsSEe6CeAmXsHOdTFFhVsXX/MBS8X1qaDPmGMGUNSUdAdqJC8Os9i52NJ5sz94
	LDVWjVrw==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xABFe-0000000HGd7-3UsO
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so711700f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363189; x=1790967989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sg0ZYzOcfsY4Z5izNeP33bopaC20kArbvAiber1DDPo=;
        b=q8i/72K73Fo9pHhXf4UNdTKnUU8q0CFGjLq/1mkqgOzpUSXgihvmXC9FosZp+1fU6x
         Wz/3ZdRFZsbUsAiRj3/TH4kAsz0bYLMB4OdO1tYKSkr0Pw9w+GGO1e+JkASm7+7Dfnjg
         PKTl71HF5d7Up58EQ/Iz4ibiftxNmpAC9j+0w5ZD3ggKPvsO00G3bqnrHLnzlVapK8Lr
         SOBYLC+jgOL8DhtAw0Y4zgR+tt54/Ut4hQ9zn6HYd3n7kH6OuQXLhbYANRpVeQfJctym
         +i1MB6SCwZ4HOYfSPjfwWoN3kJGht3oMKg1+6z6zHXlss9mVS4EIiJ/k7HAP45LwtGMX
         hCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363189; x=1790967989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sg0ZYzOcfsY4Z5izNeP33bopaC20kArbvAiber1DDPo=;
        b=EasI1M96cXctCnXIV2BNmR7uM/VFIQ6iUCpvGOGanN6vxkkFNQR1K684h/DFZiepDY
         jabaOMwopEhoXLtYimgNvrRli6j31JdGkdwwjuyZFYwhXNT77/UBUTV9V770hCiJgJKd
         G6fWvhTi0xSrZ/6XKSuTqieDHyv/2bu4+rslPZMnxoK7q58j6sW30Cpql4vIAxHAl04f
         X2Jtr774mv0O/TcXzgcVWZeR5tkEYRSXs1znPRUHTrkT0BsXVPxyz7RTeuYIdvthrFRm
         3BHikQyzypIqukCmQI8HC4NPAoGxP8/Rz9xzoqZXoFN996e9eEnVDRwmXYkCI0CQ34Qs
         jR4g==
X-Forwarded-Encrypted: i=1; AKwUvBz7n3A8JE/MYnmC606aRqN8aXYoXne4M06UWHBTZEjKAJqxAnhBMZykMmClOESO7MUC9vXpdlI7gY0=@lists.infradead.org
X-Gm-Message-State: AFuF++lKKjhb+FhEJkSiReAj816ptAENcaY2BB5dREVuawOrh39s9QZv
	IhoVkFCC6464tpAOh3tJph5nBNlP930pCnFYh30wU2iPd/aMaqgcA1ZC
X-Gm-Gg: AYBFou3+qB+vGmt5GA9KiGOuugtkA7bpRtRz2QkGpPiE5nEZE3N41QwgUrqL7i9Lk9V
	i2cMMqc88wBCrUcu5xQhvpnGJ3d2/V0PTNit1asbo34OLdLZFT0NjTRLZOsbmlsTAnOQSzA5qCC
	yRlNKacPpLUtoaMq7gROUgL88x6kImP1DNG+qzbKYhQUADBgoiuR3Lq5kbpl4Ue0/OnPs7idQGI
	OY/FhpnHkj169epIBz8XaaiPZwrfnOZ0ZJbsHituzcL8QX25Sj9y7PJ7X29UFEUxiFkIzP6nAQ6
	F/e7PFpfkhGUR4YhFMiol+C1PSlJpPEwYYxBJH7fVmt/G6MsGqpI2fnUg1pyzeqzY1zeW7bVAvE
	rlggsCWImdQQDihD6YuY8yNJz1F7EBj0+sdWHdELKEKvwjXpzviylzy4Nqc8ZgIhhKXvAr0hYdY
	MHiKax85XxGeediUD/O4XBqXaR+otXdbKkNiRWDHAlwioRf6neuvEtkg7ZNJxQLQ/OGZxi0/mpe
	aRZU2t7Mqk2VOS9Hmyh3DcdCts=
X-Received: by 2002:a05:6000:25fe:b0:488:8352:cbfd with SMTP id ffacd0b85a97d-4888352ce66mr3102447f8f.46.1790363189125;
        Fri, 25 Sep 2026 12:06:29 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:12 +0200
Subject: [PATCH v2 3/8] mtd: rawnand: qcom: make config_nand_page_write()
 more generic
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-3-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_200631_061580_87EB458A 
X-CRM114-Status: GOOD (  15.79  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c65a8416c3f5..1f3c00823309 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -365,10 +365,8 @@ config_nand_single_cw_page_read(struct nand_chip *chip,
  * Helper to prepare DMA descriptors used to configure registers needed for
  * before writing a NAND page.
  */
-static void config_nand_page_write(struct nand_chip *chip)
+static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	if (!nandc->props->qpic_version2)
@@ -989,7 +987,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 
 	host->use_ecc = true;
 	update_rw_regs(host, ecc->steps, false, 0);
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
@@ -1059,7 +1057,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 
 	host->use_ecc = false;
 	update_rw_regs(host, ecc->steps, false, 0);
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
@@ -1143,7 +1141,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false, 0);
 
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, data_size + oob_size, 0);
 	config_nand_cw_write(chip);
@@ -1219,7 +1217,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	set_address(host, host->cw_size * (ecc->steps - 1), page);
 	update_rw_regs(host, 1, false, ecc->steps - 1);
 
-	config_nand_page_write(chip);
+	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, host->cw_size, 0);
 	config_nand_cw_write(chip);

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
