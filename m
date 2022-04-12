Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhRW8WpL1y519Zb15BzPaiDrjeVR2a3vKEFBs0veF5w=; b=HUVQw9bKNIlINC
	4E9vFP/ABK6xpmEP6/CUeKLZ7PN31tcl626iEPd9cHCFVid1+eMtJ2+kclHJ/0yxAPSX+li+yngaF
	T906s7L0JD1062XVj02JggZ+HZ8keptNKyqJdd8Cxc3RVMFs6iMo+ygWLMvMKAbq7hoSn7UB7NP9R
	TEGZX6tS+Z14F5xDttsLLAZ2CCozuS8oD4Jr2/VrWe7laiPr5Ab1wtG7neCNcgElUdZsACB9S/UxI
	PxVOYRKlHelcyKb+pnxaKtK34NvoWBABsXBtfFw25tEobWrW2f99V1pogQywKu/Ax2eEJzQvnj30q
	MH+DZlqpErb9e3pkdm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBz8-00Capp-Fr; Tue, 12 Apr 2022 08:34:50 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBz4-00Caoo-AC
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 08:34:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so2060823pjb.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 01:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=+WheqzFQw/mKqTJlEa8kndueE2loy7UspcQexqwzXmw=;
 b=Vqv4gi/uGPp5SLs2obfxsCHDo21INQQAbLQkR1wMBQyr93jRnWSO26Ur20TltdF68V
 ZzhOBDdCs9FqY5FxFfaOlcZO2fM9F3v1eaYdCSvQAfJ5Jx6qKd8VxUX3eelLdzwldHpz
 B99PeOCux6eWQTI8eEwdA2tJLNlPGUf+8wN0WUmEoJKRZYPPRefVklFRFaOFJco4wUWO
 zWDAJyfA9PiB9ot/WrZGFRt5mKR9CBI5FOmZwKnCXe/tognhuUU1bJkqOVO5vNowFhFR
 M/tNgS7fKpYPTTW4c8v3qWPZMIwYdZGNr+KT/MywRtUzyLYdIh3W9Rsp3Ej8X45fzxzv
 kEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=+WheqzFQw/mKqTJlEa8kndueE2loy7UspcQexqwzXmw=;
 b=6I82l67g9FXM79Eu20Y0idv7RirDs86yMnMb2RUq3Fwj6C/88dn6xH11YmUMgye2If
 yaP0roDxo3DEjmYvr5LrThfTRKvDqkhYxO4Qc+IrDI2sahgUy8E3SKDAgmF7WWRhaxfR
 WTRkUQR9FanhtwXPlI5QCbSKHpVq4BLet2TrlivaooCxuFp/A+OZEPGNji4YRsaEgCRt
 bqIsqt8DFUsHz6Oo9QAcWJ/J5Gq0JCQodsIUI4pdn7Qbh8hqTF/bHlSKix8uC0KttJv3
 kkjtO5m5O/KXrsf0n5geINVB0ZJD7qY/Br+z87RCNLTRqTnukqGbwLbNspsWTfnf0Z0K
 mYxA==
X-Gm-Message-State: AOAM5323dvHQD+VTMcjLh7p6gdYRSc3wrEweVc9QTOc3AJA3gG6B5DmL
 dSOB8Jlz+vDw1d19HoEG0Xs=
X-Google-Smtp-Source: ABdhPJzndHO6DEKejPo2dn5FN/qzpFSvwLx/XYVSbZrrJOqWrWYZUJ1iBg56pQ+CvENlgjGfwn3hwA==
X-Received: by 2002:a17:902:8c96:b0:158:9135:98d3 with SMTP id
 t22-20020a1709028c9600b00158913598d3mr586986plo.171.1649752484531; 
 Tue, 12 Apr 2022 01:34:44 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 ng17-20020a17090b1a9100b001c9f79927bfsm2174289pjb.25.2022.04.12.01.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 01:34:44 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Paul Cercueil <paul@crapouillou.net>, Miaoqian Lin <linmq006@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Bastian Hecht <hechtb@googlemail.com>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Date: Tue, 12 Apr 2022 08:34:31 +0000
Message-Id: <20220412083435.29254-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220412102832.09957c35@xps13>
References: <20220412102832.09957c35@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_013446_412684_11916FB0 
X-CRM114-Status: GOOD (  15.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

wait_for_completion_timeout() returns unsigned long not int.
It returns 0 if timed out, and positive if completed.
The check for <= 0 is ambiguous and should be == 0 here
indicating timeout which is the only error case.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
change in v2:
- initialize ret to 1.
---
changes in v3:
- initialize ret to 0, now ret==0 means success.
- update condition check in caller.
---
 drivers/mtd/nand/raw/sh_flctl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index b85b9c6fcc42..a278829469d6 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -384,7 +384,8 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	dma_addr_t dma_addr;
 	dma_cookie_t cookie;
 	uint32_t reg;
-	int ret;
+	int ret = 0;
+	unsigned long time_left;
 
 	if (dir == DMA_FROM_DEVICE) {
 		chan = flctl->chan_fifo0_rx;
@@ -425,13 +426,14 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 		goto out;
 	}
 
-	ret =
+	time_left =
 	wait_for_completion_timeout(&flctl->dma_complete,
 				msecs_to_jiffies(3000));
 
-	if (ret <= 0) {
+	if (time_left == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
+		ret = -ETIMEDOUT;
 	}
 
 out:
@@ -441,7 +443,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 
 	dma_unmap_single(chan->device->dev, dma_addr, len, dir);
 
-	/* ret > 0 is success */
+	/* ret == 0 is success */
 	return ret;
 }
 
@@ -465,7 +467,7 @@ static void read_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
 
 	/* initiate DMA transfer */
 	if (flctl->chan_fifo0_rx && rlen >= 32 &&
-		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_FROM_DEVICE) > 0)
+		!flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_FROM_DEVICE))
 			goto convert;	/* DMA success */
 
 	/* do polling transfer */
@@ -524,7 +526,7 @@ static void write_ec_fiforeg(struct sh_flctl *flctl, int rlen,
 
 	/* initiate DMA transfer */
 	if (flctl->chan_fifo0_tx && rlen >= 32 &&
-		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_TO_DEVICE) > 0)
+		!flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_TO_DEVICE))
 			return;	/* DMA success */
 
 	/* do polling transfer */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
