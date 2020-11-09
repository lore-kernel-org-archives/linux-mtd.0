Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBEEC2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B38820663
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kKBNPN2w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Om0Q1XGn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B38820663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XXLzIcYnIocXXUDU3Os3Vt08t3M2frGdDIDcbT63o6A=; b=kKBNPN2weQr4FPhKPs9QP/w8L
	PGS9vsHh76e2v8fuiskn+CRFTksWXPerGuV1HIT+PQGXxleD8tS5pCPoMKJV6XcdORrE3XUsnMwG5
	FNn+3Fj0ZIvsZGAM7lclKmYAkNHeLy82c5HBa5tl8airGfj8oh6zndK7dErdN4StQjCpEsbj3Jopp
	kNLI1d44X3VoyWtS7A9P5Do9nE3j2OeWLBOkKAGpAhPMyS5KLGIIyPPlvNLHL3i+sTi0hmzPShu81
	YKptRnFEaSvr32mc9pwU+VYDxv1hBI7zHU78x/MfMCmBhkK+zNxscl1ufk3dKeWVeb3BUL+PLLlkk
	g/55hg6CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBsE-00030Z-Tv; Mon, 09 Nov 2020 18:26:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoY-000153-JA
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:23:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id p8so9004660wrx.5
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4FI0nTKy9xJSbbEI5xWFSlWi+PCjFwRWpkkSRoALdw=;
 b=Om0Q1XGn7g9LWqjDEE9rirPV/Bis1yJ4FPfeQFg7UtCOpxgiMsN42PJccIEVLNKGGq
 /OiOIi8mf8V0d6u6wacVBmr6rk5g2qrht3gNJoD3MKVqFB79F9/fKsbJpYSxTdNFWJGQ
 kUDobLHsoXc4F6Gr0MpobjEm+k7omT0DKA6FtHyCdi9pLItiaxItxxfGPmgVdfT4ULp0
 Tl8lfSWJgNOuzIRHdHfOhGqgCv2INPWqC5lifk+NOd2frkusO07YzAPscjRQRJlFkgDf
 bh3UgedxvyGASFljyBptJpwga1D+ARVKK7e7CwmNRO7pzKvCWPziYhG6vY06LABzAlz9
 n7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4FI0nTKy9xJSbbEI5xWFSlWi+PCjFwRWpkkSRoALdw=;
 b=CaBtfPpgiRLix9NAwdD09EVtb1VwWTYKCwpW2AKEO5bjt83WWH6yIwMpet3G0XiDcO
 UpGcdPwF8JDq5xyjsyiI2RNhZT7fxa3NDMl7aiDgE5PCUD4CRiFW5ZuP6hdcDWC7uB0x
 3O4R5OoEN+Cw7kp34C7132+A7LJkgb4UiOjr+5pKpthsZVvFawp0DwZWKRWUQxt3MnFy
 gMZCu1O7hqMkQ566USGKb31/yZ2sOd6mzOgCHEqFhbVLkzrkVpOq8hUWRurl6IdZuavT
 ikOY3He0j7bH3RlXZfQR/KmGXmXPV59nezxxoFA6/8iMlX+GqKgWuOJMYozoIJXn1ixA
 p29w==
X-Gm-Message-State: AOAM533uCzKMf+H5D7Gcb/RhLko3DAlkyF2pTO/Glbga+58MSKoj+Is0
 gAE4Nu4vhyRnq7UXmkl8Rdg4wQ==
X-Google-Smtp-Source: ABdhPJz43p+ov8G0fPIsIRmkRV4I/T93UNCy8svThTZ5Q9U/WL4EIbSOh4qqb1aE0xx7AU2OUIjlwA==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr5624510wrn.39.1604946169621;
 Mon, 09 Nov 2020 10:22:49 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 20/23] mtd: rawnand: sunxi: Document 'sunxi_nfc's 'caps'
 member
Date: Mon,  9 Nov 2020 18:22:03 +0000
Message-Id: <20201109182206.3037326-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132250_759638_56D83B79 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Sergey Lapin <slapin@ossfans.org>, Dmitriy B <rzk333@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/sunxi_nand.c:250: warning: Function parameter or member 'caps' not described in 'sunxi_nfc'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Dmitriy B <rzk333@gmail.com>
Cc: Sergey Lapin <slapin@ossfans.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1ec672bbd459d..923a9e236fcf6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -236,6 +236,7 @@ struct sunxi_nfc_caps {
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
  * @dmac: the DMA channel attached to the NAND controller
+ * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
 	struct nand_controller controller;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
