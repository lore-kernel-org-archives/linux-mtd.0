Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8928C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:00:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD12223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s64etbX3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIKna396"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD12223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XXLzIcYnIocXXUDU3Os3Vt08t3M2frGdDIDcbT63o6A=; b=s64etbX3Jew4gxCR4exCmCJXV
	J3VwYLtH+0uKhRBoG3+1fCVk8WXKIQB0kslnASsVJ++xr4jJuRrTNLq99SzTtCUAkSF29SFZgBsfB
	FBHHdF6Ahch43jJHMKk921DgsEwf4w9RCwIDP8jnHY8xed6uDQqKDeEzRqhmRLbTvabJqIFoGK+QH
	ilF47JmgOwv0i2x/kj1b8XmJvFRVp4xzRmB/Iad4AflNSBnV8I8QPN7hletrW02NnE25OzEcg5Qtx
	QY4bH+5kLHsUprrnGwC9OKRW5XI2+Iels6kjiyls0zti74V/du2mUEDH3YkGfaRIyJrVfVtXFx++J
	6ZvI3eP+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYUQ-0000M7-OE; Mon, 02 Nov 2020 11:59:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYQ3-00022L-Ja
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id 13so9118054wmf.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4FI0nTKy9xJSbbEI5xWFSlWi+PCjFwRWpkkSRoALdw=;
 b=GIKna396jzOVW+ALh0LB6+ecSjyaVMvuapts/jRS1AqNPMqMaPpMtRni5IRlzcPth5
 fWQ/PlLb1/md7AvJMfC69ciSqX8M4lLEIclzXGaw+RPlrCU46vZiALNQJKmMl4eI8IBr
 KsWHqX+T9db1tHrO8uv0v61lGo2DlxMPpo65GWmqxcivzr58SBQxev/WLu06ZCZduafW
 pssLs7UNPdgQ38bxU17NKpRz7rKwuwH0flKDVlW1CPvRJrflwoY3jRsIxANw+lTCjt8a
 a9jPfJ76vophYgYYqayQZtEO+tgsVQmd8Hh7VPIqKGpOx1Ula0NxPGfKkUOU9ttuysIM
 xQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4FI0nTKy9xJSbbEI5xWFSlWi+PCjFwRWpkkSRoALdw=;
 b=IwJoA+DYoe97OGYbL6MYNpndx7wIlgbzwuUD7IirVAlb8lIOWym9mHvzax+ulWwYRn
 fvYefbP50nRLJDOrvj0PBBvq4+MQdkMHRBs5akk02EQ3HszFPkf1z2Z+FBsl3XuQha4m
 CdzYMxmyjCGWUmi+aIB3ePtYWmFmPZ2qZD2MC2sncNIm6xxrAWichxYJnV8NEUehbmtI
 lUyKkqAs8Wx/zfDa7duI+iD2c8TzXLPZwP6nNHgjnH69BDzGlgheCsaef7mb870Z2PWP
 4E3HLg5Dd+Vnxi58mbFeZsLGUKJbWzfG6rvTc3cRTwDl9tkC2gERF6r/BR6lf5nWMHeu
 kNOw==
X-Gm-Message-State: AOAM53263tru5GbxB6bk2ReZJwovQFRNABJj/pfgzhoYSjJ1AzX8aK+x
 qFOb0XXWI0Lht+7EiCJRxEew2g==
X-Google-Smtp-Source: ABdhPJyunu9SesmSMOXhFYwh8UpSFqq6TKtkRc/2EOGe+H0GSSE4EDyjDnhcCiPZINMH/kFiGK6WUA==
X-Received: by 2002:a1c:6484:: with SMTP id
 y126mr11934961wmb.141.1604318078529; 
 Mon, 02 Nov 2020 03:54:38 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 20/23] mtd: nand: raw: sunxi_nand: Document 'sunxi_nfc's
 'caps' member
Date: Mon,  2 Nov 2020 11:54:03 +0000
Message-Id: <20201102115406.1074327-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065439_792013_ABA0E097 
X-CRM114-Status: GOOD (  14.58  )
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
 Richard Weinberger <richard@nod.at>, Sergey Lapin <slapin@ossfans.org>,
 Dmitriy B <rzk333@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, Qiang Yu <yuq825@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>
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
