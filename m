Return-Path: <SRS0=VZvC=73=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7326C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jun 2020 03:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DDD220747
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jun 2020 03:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4wjh+N9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="T4DAA+LZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DDD220747
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=umn.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27elU4R6pZmFUcuBjwlGnN93nDuS+tT56C0kPC3StNE=; b=l4wjh+N9KNoS2E
	1IXXiMFYwK0h9pu2XvXtcftJh8hYAAqAmdNeOfTsZbKqhZEEZ8Ne/MMo+7xNTazCHEMrqmAzO+qun
	1DLAGYDDmH7irg7B7cRbMrvvUt4UeDYWJtnFMm3wNzsAbLwLz3AWsh+xi7TdDeyb9BYkAHt2hBMMN
	eqKq+KDxnCkzSdL7wXASezaEmFApKFX5sF0gk4DRiu7XM1SrZqDQGFmNQ6yW5RBmhPY6ptHj1LF8r
	nwRyA7U/1JJeGo40Hu95FH2Ojb0WMjWdix5LCf0FEsWGYP8QHIiSXuHeFq7VaKbBfS23EWQQACDXw
	KL9Faa0zPAFQRl36/8GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkJgM-00048b-D0; Sun, 14 Jun 2020 03:51:42 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkJgJ-00048H-1q
 for linux-mtd@lists.infradead.org; Sun, 14 Jun 2020 03:51:40 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49l0fc47S0z9vYV0
 for <linux-mtd@lists.infradead.org>; Sun, 14 Jun 2020 03:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_OeZ481fxaj for <linux-mtd@lists.infradead.org>;
 Sat, 13 Jun 2020 22:43:04 -0500 (CDT)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49l0fc2WG4z9vYTt
 for <linux-mtd@lists.infradead.org>; Sat, 13 Jun 2020 22:43:04 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49l0fc2WG4z9vYTt
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49l0fc2WG4z9vYTt
Received: by mail-il1-f197.google.com with SMTP id l20so9537558ilk.22
 for <linux-mtd@lists.infradead.org>; Sat, 13 Jun 2020 20:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dsq6JbO1KTJtMtuBdfOmtg9IIO/0JLFGMvczoxyNm9E=;
 b=T4DAA+LZ5GvUJNBZqkmFvpNjZBqfkE7QhM4rWMXq/kmwrLYY0xDGVuET3GGxcTSj5Y
 0/01MOWxwMX01wgC4hG+mc89jDDMIG0WncLf7xawjYyTvfxHGFdZOUkwPLYI7Hfjtxo4
 J/N4R6w2AzdcTaUUsQWIz1wTR8ZbbeAZFdfqWMISBCas1Q1p0GskAv8WV7oNTJ+HEoLy
 hRFvMbtyMR97QTXbpi1C1POLR/aY3qIyPecTa3eq2SiyEzoqvzOrrOgbq/ObIfBmelzY
 tFQc54Sz8krFe14pdhodgigY+3BhrLx+nWjhOtmpoOq84RrubzP8/yTXZwKEPom+ofuM
 OkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dsq6JbO1KTJtMtuBdfOmtg9IIO/0JLFGMvczoxyNm9E=;
 b=KPBM4pBu7+8yD7Wtb4aYUit1bGrC4Z33XnccSIr7r7Zc8tErPW+0uQcrh/4zxlvNgn
 aIK6Vy88cQxGX8NKN2m3QBdU6xYccYnsIT/asy0lcz4A/+ln9LXqxDxwjYIIfrtRTnZS
 Nf1anDRq4qSUPmjLsG1atNm5Bin5x09kYN8oSBVjQqjmYV3lej09W20uTjf5qjPWCqd7
 mim32S/KX2tvjKASfH9yGyPW8w8HZmFoMMkRpxof3oVUY7i5IRTJulG8K3+LVNx/X3mj
 fsH9fNpn2Xu4j3hRetm7AHSi4R9QjFncRwKq++RsFCn0WgSpysvsIzZk07xlHk7TVxH4
 UGWQ==
X-Gm-Message-State: AOAM532BdStZsZgbaYMeVfPD//kpylMzeH1f3DTl4FIW7odiuie//L2d
 GK4mi36g3GGaSgXZr6b1dyrZH/8Lj3w1m6IC02m811odF/81T52hzK/EofXZypVUjEkPgjj5vPm
 SQuNYJGmRs4sjv3JL7HLHdi7M0gVpHw==
X-Received: by 2002:a92:584a:: with SMTP id m71mr20962741ilb.242.1592106184008; 
 Sat, 13 Jun 2020 20:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoNop5k3uJVr4tvaCfJyJYvbOpD1zjbwHZv2iLs92oN14zJzdrBPq0kVVYB2M3oPSPKyxOFQ==
X-Received: by 2002:a92:584a:: with SMTP id m71mr20962733ilb.242.1592106183851; 
 Sat, 13 Jun 2020 20:43:03 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
 by smtp.gmail.com with ESMTPSA id m3sm5670202ioc.10.2020.06.13.20.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 20:43:03 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] mtd: rawnand: gpmi: fix reference count leak due to
 pm_runtime_get_sync
Date: Sat, 13 Jun 2020 22:43:00 -0500
Message-Id: <20200614034300.130385-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200613_205139_181227_85E8EDF2 
X-CRM114-Status: GOOD (  11.50  )
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
 kjlu@umn.edu, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 wu000273@umn.edu, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 061a8ddda275..657c0be5c038 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -149,8 +149,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	int ret;
 
 	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(this->dev);
 		return ret;
+	}
 
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
@@ -2264,8 +2266,10 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 		this->transfers[i].direction = DMA_NONE;
 
 	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(this->dev);
 		return ret;
+	}
 
 	/*
 	 * This driver currently supports only one NAND chip. Plus, dies share
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
