Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74DBC388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:59:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411D9223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jhb/tl/G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+m8SyGw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411D9223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qkYE1Tk9hAOiJP1UnW5g7zE9R+5aItbEdl+ZdhI2/XI=; b=Jhb/tl/GlBxxBOQ8fal1HDTa7
	dstKXiRs/i+zfLArK0FnpECGwCMXsqqEkKUX4Nh6kh6sv2JoNP/3RDhILk44cJaHJB1sXFJmSWkxl
	qnLxD7hi5c3246Vccc+epV+Wa6e7mB+11FWQ9/H4tSQ5xr1yB8n1YztipkrY7xhNqBlG+Dza9wCs4
	kRz3FAqTJzw84FOz0xuQra740o27haXfAAVEvo/a/O3jR89LtwLqK7OpisaaOzIED0fw3TxvtYNDg
	1WkK4hmK5oAnbn5OZu5ndeycEfb0SqehdU5WJVaqLxA4jrpxnDeiEPtjS0dp2hoWNxyCj8wyN7i6k
	e90p5NX6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYUS-0000MI-Sw; Mon, 02 Nov 2020 11:59:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYQ4-00022l-OM
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id e2so9222157wme.1
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2abslax4xTZx4NcG965UPlBWLqxdXR2VSBh/TqhIys=;
 b=k+m8SyGwdyAZD/uE6UskLvlqqTDE0Zdmc13bxLxJNTOcT6bdgr//rlE3Uq0VvHoh4c
 L77qIbJGPIze8rBOXShkZjSLdm1Yh4fJeSGogRMqgDJqeNwbxd9FEyaQ6/21e8s/jQP0
 ZtdkjCgFsAGHqMrfLzpN0e92IoNVi3hRN69is0zOA0ceu/HTIx5q4uzamVc3B3JLjX7h
 zdKjOpZ8vUA2xpuSYQyaFY/uUJsPe95QNOT6rYg4ZSDQ6t22alLiKgTXEaDLUoHUkrun
 1jLb+ugkygHiMiPSNKSD2vo2QxSGd35Hs5XLVUB177RbZukpKURgRQ4NPCIuqHcIlmPf
 e0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2abslax4xTZx4NcG965UPlBWLqxdXR2VSBh/TqhIys=;
 b=Ya4mql9bU2n/H1Y+f10r72+oaYU8J07EqPh/CsYcpmZ6IUZ5mSaGgzwp6SBpGoK0nw
 hRk7R9oh9u+C7QuiecDtbBqRedSUNO/nrFCqHby13Fs0/3a1YVPeYeRAx7OCilZiVoQE
 HlAsUHSEiLF59tGy0MO/oQsZoJVkzpWOb7knfGb1VnER9fagk/qcHgcwHKtZjA2osB2Q
 HFxcsgyS/ZzJJhyljh2N9wR3p5L3iUabLLkco8YXbcnK0xYHrx1d8zGlgbnRtkKfqjoD
 uMrmAk92es/tNWEoICsZxMxJQNtlecshHyI9FCi/aC5dK9CC2xBPpwyB8TglDLeVg/CY
 G7EA==
X-Gm-Message-State: AOAM532ZtDHdPTesnNyQXfQOAEijzk48ceClo5nMel1BVsCpAPJF8QfU
 i9WZfcYA+Gt+pTbYCHSCSAvVSA==
X-Google-Smtp-Source: ABdhPJxULnli5YuM/+UwFfCgpMpztcQccJXd4pmVDfFOBvacZYK17w/mFel1HAK/kzz/eK3yaka/iw==
X-Received: by 2002:a1c:3c44:: with SMTP id j65mr18144388wma.13.1604318079703; 
 Mon, 02 Nov 2020 03:54:39 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 21/23] mtd: nand: raw: arasan-nand-controller: Document
 'anfc_op's 'buf' member
Date: Mon,  2 Nov 2020 11:54:04 +0000
Message-Id: <20201102115406.1074327-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065441_128254_8CFAD5F8 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Choudary Kalluri <punnaia@xilinx.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/arasan-nand-controller.c:133: warning: Function parameter or member 'buf' not described in 'anfc_op'

Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Choudary Kalluri <punnaia@xilinx.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index fbb4ea751be8e..549aac00228eb 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -118,6 +118,7 @@
  * @rdy_timeout_ms: Timeout for waits on Ready/Busy pin
  * @len: Data transfer length
  * @read: Data transfer direction from the controller point of view
+ * @buf: Data buffer
  */
 struct anfc_op {
 	u32 pkt_reg;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
