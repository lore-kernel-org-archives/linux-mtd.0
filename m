Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8414AC3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 20:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448152080C
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 20:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dqVa9n15";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCt6b3cG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448152080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XGTCIiY6qNjt+/0RxEemZDbF+yFpJ6rULAPAdWVFOFA=; b=dqV
	a9n15Xo7iH7eh5WAVtpXANaOBNsr+ZdG0nKs8tl65jDO0dMk3rcZyKAYXic7dVpY9O3ds3imYSg0B
	dQ+vjR9POnfNffpLKO/T4vRN64dY9x4+lbtauH7Shc8Bqe7Rn5kVBo2Qj0VZ3vRZZ6yTy2dlViUYk
	8pv2FU1Bczu0VveJjnrVcyBDUBxev2adASy4MAqQ/NDCsu18jpHSWA3uU0TcIhYjK9S4m1ZcGQbb6
	9q6XRIiBnr4E3v57vC7Rs0BnT2671A3hq+vBPkcLm0rhP2tZOtyVLFjo8EW9il5/g6YzNba2iXVZA
	q8c88Xjg3mY/63YW/DGXK1+E8y/d3UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUyxa-00005g-77; Sat, 02 May 2020 20:42:06 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUyxX-000056-8d
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 20:42:04 +0000
Received: by mail-pl1-x643.google.com with SMTP id v2so5094749plp.9
 for <linux-mtd@lists.infradead.org>; Sat, 02 May 2020 13:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nSeRL+v4vCg/JlCwuxAlOvIi6+lQZ0s1gPbPPC1SQo4=;
 b=OCt6b3cG0YLdLxYA5cJvtZbCTTAHTEI7a0AtEVm8ffCG56DV3uQk+vhc3LN3vL+BIE
 sEC8sUGDEOhYxyJX5cwjYJJgL23kpAe9kh8n8gHqwS6vjFW4X/wd6CIjaf3jVIPg1H4i
 peRikUnM20G/bQgUF2frryCueKkWtPAP070g1OG8SrgYpdNQZ1NMe+2/Mx6cObR36vgR
 jHf+NhXYuyOMASrtrLD6Q1CAyG+XVmbIpDq/hwi3G4MZXcmMdiCIka28Bmc8uVrI4EmB
 RE6dc8q6NO3c9CPNxPXciQZmqApUbrS59U8Z9AgUp50mQPeNZLLvcqiASqCLqMDPkgEv
 43og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nSeRL+v4vCg/JlCwuxAlOvIi6+lQZ0s1gPbPPC1SQo4=;
 b=lt3rEsjzw1TuZrI2WCWhPHm1Gf9/goMmTXZlX847SVJAhGo4DKWsJw2Tn4JOVqkdrO
 ZgoSXP62dyqEicReGoCck1V49cENN4+m8eJOUsWlvMLECYdTJLwJeg0gLSFHTEVwQdmW
 Q8gSeHS42BxdgWK34iRl6nlOdATmvt+ReCWbrRJBxFynHhioP8mF8inTl+uMN7sbYLuQ
 8ggdOx9re5lrxb2bWLhpUI/7EoOz478dTQU0A1G0DXCpjJ1nM69CDZAjwn5rfmESkXc1
 ECGVJJKnzoqOxUEdnXCi6PDt1bdAnIB41uh5JS55hcdZW4pWLsNDKeouxEgSEjrRjdqr
 Ql5A==
X-Gm-Message-State: AGi0PuZoLNxGkhpOJ2lFFu8xVuWc0m+b8HFcsBoa3XwAhmH3TkVGkAwU
 +Uv7SKjiXBXGV7cvITSpKwU=
X-Google-Smtp-Source: APiQypIxaji5kSHFkExlIHwZrR5Ew04BoUZDXSNrqnvkxTM6b2AlFyL4Fwjiv6RXBufl6jAVF44AVA==
X-Received: by 2002:a17:902:ee15:: with SMTP id
 z21mr10489150plb.71.1588452122460; 
 Sat, 02 May 2020 13:42:02 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id b3sm4683469pga.48.2020.05.02.13.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 13:42:02 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [Patch] mtd:rawnand: brcmnand: Fix PM resume crash
Date: Sat,  2 May 2020 16:41:36 -0400
Message-Id: <20200502204137.37134-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_134203_329422_08A955FF 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change fixes crash observed on PM resume. This bug
was introduced in the change made for flash-edu support.

Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..8f9ffb46a09f 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2728,9 +2728,8 @@ static int brcmnand_resume(struct device *dev)
 		flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
 	}
 
-	if (has_edu(ctrl))
+	if (has_edu(ctrl)) {
 		ctrl->edu_config = edu_readl(ctrl, EDU_CONFIG);
-	else {
 		edu_writel(ctrl, EDU_CONFIG, ctrl->edu_config);
 		edu_readl(ctrl, EDU_CONFIG);
 		brcmnand_edu_init(ctrl);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
