Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2098C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:27:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB8720663
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SogMxk39";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JG0FKV/X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB8720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qkYE1Tk9hAOiJP1UnW5g7zE9R+5aItbEdl+ZdhI2/XI=; b=SogMxk39ZlS8FeynHM5RxfRZK
	bJm8ZKSy6TVj2qt4fuYKusk4Uo2/isocHv5ouxtaoBHm2gI0b7KKU4bodRbFIO4JSGVuJoz23WbYn
	vlpaQ5TNDvzuhtzqPWKAt0vt+pRmE7pOW+DDdXcWMbVJPdK0mJppbn3gYHbdkNUjZyhP1mzyMW5Zm
	RBjE6XU9vpI6gzfal8KpmwEyYZA5beNXKLdjFLUTMTHDvMJ2kjZWti1EYKzpyG4PHtHOcbv1FVUgq
	zKrrIapzXC9Coh1dQEZ5g00jrTChAbCW/m4VyQP3/7xKfEkynZHZ7Fn/EuqFgVwFVGRM5EzpTHCQt
	yg37jjbMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBs3-0002t9-Hf; Mon, 09 Nov 2020 18:26:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoa-00015n-KG
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:23:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id v5so405316wmh.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2abslax4xTZx4NcG965UPlBWLqxdXR2VSBh/TqhIys=;
 b=JG0FKV/X2yDwIdPtEatbJ1X6LQYXklus6P8onB6/u0tn7V68yNLntZy1sSn4Wzs2k1
 4/An9IgzQ3F0k5B0fP2oVaO+arqq4X3MOnfd+4DmKaMczl3kWck7y6cNF0eOWi9gShVs
 hNt5ALd0WDJ0Sop62dYKiCz928hWnMqJ3ax5z+6v1IGCNFpNhv4Dqo6n+2jz7cXBDRDV
 0aldMnpz8A4X527dr3varaz5iZ0nWv+z0942SIUPEh2J7cISPwYb7bOiiBA/AaVr2A0z
 IL+U5UKCTR+ySA6BmYJgkUdJ4I2BFaK8X6vX9VTY5lPVWkZdHFyXJecQHkQNjVyf8ppP
 +OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2abslax4xTZx4NcG965UPlBWLqxdXR2VSBh/TqhIys=;
 b=PEpAUmyj5KH9zfUvyjpIW58tNpNL7/Nwg9abx9Fh2rD4B78Qh8F5wmH70ARj4MOEFK
 rYcncwQSN6ifdeD1blC10nrPFJFrooYlOiVtLTrHQOkw9BxqCOdh3MszIHMh1S12IGoq
 WGgsOTeku2SNo/gLRG6MczYhrtwPR5d1sMt5CD8Fc5JmFEUCTN/hbM0QbXy0BZZtZ7MR
 Rz5BwsqWHMXR6GmE73WLECBJfMDpbt6UCJ2iwMkzoycFwDsXBmHlM2duPVSKKW+xadlL
 O4Ja2hlM1MF6fDLqDVIQZ+kM1iyBuAHecCJJ2s4gz5AOdimBYfGkevkJuQ9yfsQ36JWv
 it1Q==
X-Gm-Message-State: AOAM530y5eh6ArCsq2lKdYRxDFiKeY4F7DW5GKhCM1obI4nfEN8WnlM4
 GUH/NgLDWKQI0B9AmwUqAdCspQ==
X-Google-Smtp-Source: ABdhPJyzi7fMuTPBZNRbNWcG3+uL3rszDHNeNnPzZvInmK8lsw4JADfODH3gkvoM5Do2k4q7dS28uw==
X-Received: by 2002:a1c:67d5:: with SMTP id b204mr495254wmc.92.1604946171618; 
 Mon, 09 Nov 2020 10:22:51 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 21/23] mtd: rawnand: arasan: Document 'anfc_op's 'buf'
 member
Date: Mon,  9 Nov 2020 18:22:04 +0000
Message-Id: <20201109182206.3037326-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132252_733761_A049103A 
X-CRM114-Status: GOOD (  13.52  )
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
 linux-kernel@vger.kernel.org, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Choudary Kalluri <punnaia@xilinx.com>
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
