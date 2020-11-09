Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF1C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A79020663
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YX1mLksV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TaApzXVB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A79020663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/yoUgR3Mj1LU7MFNvezDlP9oaQHyS8yiRUPU5faGu54=; b=YX1mLksVM/PIl2Dhf7NrEYvsl
	K1JQFL2HreUKafMTozNFf384npY3azwSWUVDUvSs+74EDhPW7nG4oZ5e6dR2dHVE85bTBrT0qoB0m
	dHbPeHwuT0U4dI/nqAl5ks0xCoWHQl5/ElncY/7RqcxGL3Xi0JOrKxjlixbUw77r88TgbU6ysYqJa
	Amvi9ZlljRQJkJPXGcNMtPHj8j5S3o7OvD0BY0zI19oiY2sD8foFXK8jHbTwygSmMrWsmJjZo5dVE
	7etCaqxuNro6kKvn6LQ9GQY3ze7lebkbi1hApplUdpEWDl95z3bf9TTuUPsCbYdRJMsTCupSe/gS0
	MpHWFnvUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBrV-0002dM-4Z; Mon, 09 Nov 2020 18:25:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoV-0000zE-ID
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:58 +0000
Received: by mail-wm1-x344.google.com with SMTP id s13so373955wmh.4
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc+oP6vugsB/NFox5ee2E+FED0ZhjBIzS6GFVD2ExkM=;
 b=TaApzXVB+tjWY3O4ygHBddamqEspK3W5/FCL3tALWaidy20HXcEGe/exoLio7ssBf5
 DQP2B1k+qr2JChEFw/ixG2OK3MnjcZS6+23BWHVJ18cyf44vwHJJMs8AT6MkfHtOmNP7
 QO43bdNHlqmp0/cBHz+D5TtlWJQtRbRXnq/1uYHXebIMkgqEroEoUukkKz90r90P25BF
 OdOBfI/PVdWsfHd4wcjwi1H85tRiGY1pQoMF8z8G2fG9lAOoWbppPZJj+tS1/ihgYdXr
 jgZBbqNIXljmWAios30Ay7Z8g5Zn/J7hviWe8OT97sawUBMywVISBq+umUkvHHwzCOVh
 A9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc+oP6vugsB/NFox5ee2E+FED0ZhjBIzS6GFVD2ExkM=;
 b=OvQ2A27uIDtI27h+cNj5IPn4kGQ4UHl0bwJLTb4X5AluhE07Jge9KV9sbjEp1zv4gY
 f9FvKwj2lA92RdQeHkLCJHG7wn4d1w2Rc+c/GkVVyP/4ZD4s4OFMGbYdP34VN189QvUp
 5x+DJROTg4mu12Qy/T9sstsOtJs/OESQYF+OA7spu6c8CmqZp52DEPKkt2nvs+4L6RH5
 tcbI9qC6pIxqD1FRLOCxQ+2xkrZL7cmsbT8Q3RbX4V5KjKRynjrV3IFETTitSkwHIcUQ
 K7mOjByZr7OJrc802YLLl+AVFz7JJKnLbNVnS79Zx9wir6bxRtsV3xAZMtU+gt6POgZn
 +3/A==
X-Gm-Message-State: AOAM530DJz21bWvM21jPZA7ElmvasNk4c6gt9OdPsgHHzpp7+UMeTFP4
 j3W5vUg9XdkkjXvasJmSuON8/Q==
X-Google-Smtp-Source: ABdhPJxSRRGwBeX/TCcBX23yoBR7/m9pAcOOBQ3TTFvjG732s1aPClv25Re189MM3cNFPQrfHpWL5w==
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr497070wmc.118.1604946166577; 
 Mon, 09 Nov 2020 10:22:46 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 18/23] mtd: rawnand: omap_elm: Finish half populated
 function header, demote empty ones
Date: Mon,  9 Nov 2020 18:22:01 +0000
Message-Id: <20201109182206.3037326-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132247_652131_460BBA1B 
X-CRM114-Status: GOOD (  14.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/omap_elm.c:102: warning: Function parameter or member 'ecc_steps' not described in 'elm_config'
 drivers/mtd/nand/raw/omap_elm.c:102: warning: Function parameter or member 'ecc_step_size' not described in 'elm_config'
 drivers/mtd/nand/raw/omap_elm.c:102: warning: Function parameter or member 'ecc_syndrome_size' not described in 'elm_config'
 drivers/mtd/nand/raw/omap_elm.c:440: warning: Function parameter or member 'info' not described in 'elm_context_save'
 drivers/mtd/nand/raw/omap_elm.c:488: warning: Function parameter or member 'info' not described in 'elm_context_restore'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/omap_elm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 4b799521a427a..550695a4c1ab0 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -96,6 +96,9 @@ static u32 elm_read_reg(struct elm_info *info, int offset)
  * elm_config - Configure ELM module
  * @dev:	ELM device
  * @bch_type:	Type of BCH ecc
+ * @ecc_steps:	ECC steps to assign to config
+ * @ecc_step_size:	ECC step size to assign to config
+ * @ecc_syndrome_size:	ECC syndrome size to assign to config
  */
 int elm_config(struct device *dev, enum bch_ecc bch_type,
 	int ecc_steps, int ecc_step_size, int ecc_syndrome_size)
@@ -432,7 +435,7 @@ static int elm_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
-/**
+/*
  * elm_context_save
  * saves ELM configurations to preserve them across Hardware powered-down
  */
@@ -480,7 +483,7 @@ static int elm_context_save(struct elm_info *info)
 	return 0;
 }
 
-/**
+/*
  * elm_context_restore
  * writes configurations saved duing power-down back into ELM registers
  */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
