Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7763DCCA47B
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iv7WKdAy2U2NcTa2SXdFNRaK/B9bE/PXaEfWREkpGi0=; b=XP4fmM5JQQ/a0n
	g51eN41yXhClYAAY6clwfx0U0q40Or+GXGwlNiIyOwP/Yfvpgq0z63TozHXDF//bXkAo/xYoX3XwY
	y+c6CEOFXIGFEBVK9E0XFq/9lLvHRZ3ZGL21RYPNWAvSVJn/A3oe5PmGvGMgY4Exf8HH3TPPLFKZG
	yqv2EKvYtNWmhjDbn6ccpPvzMyqBcaFg9UrJQmsSrd2WduGhJDS8YB/PGkEuQCqiSozaECspHvN3m
	QF9eDwu7zePErT7zLI9HLK6y+4k0uXct47q9qnM/CXu82CJoIK3O84tvbnPehHYwMxEKV2OcJBJ+m
	oFmgoyD2TRlarVMdQXOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIA-00C91v-OG; Sat, 02 Jul 2022 23:12:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mI7-00C8zp-9U
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id sb34so10236239ejc.11
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jtcfJDlBtIQgsJctsItB2jzUjAIsrPcb5sLRSibvewY=;
        b=qed6BExX6r9RFcO7N/YaPXvv0CuF4LZlMKFRZXUeWaKTX/oo0mMQ0CtWdqXxVK/Pe8
         tSmMt0syPx0daH/cypM0v17Kii6YdnDYYxAbqphyO7eHeuVf2CwcCNdXT+jIeKK5v/KG
         gI2C/gfRJmZ09ZKXZE4nK0Kr8eAteRL76xpgvq1HTQxuKUFR7ZTTnwiou1W49TV2xFrQ
         aVJr8Qdl4HOoixPdSH1HSkHp+qhQdFiLuF9ZUYnnoh7YtC+j7Oti5EtFatHJrSyvhYnQ
         2L1ybUFJu2Y1KPwc3yfmnkGKC4LiyZO2YCD7imITIa8sdgVNjI92w+oFjLPSnVTJj+qW
         Bo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jtcfJDlBtIQgsJctsItB2jzUjAIsrPcb5sLRSibvewY=;
        b=HSf1k86YcPINO3Fea1PcJtF8bplFgEBY4+MCbzBmj2ajqO4V/HY1GONUD2k4AKkgXo
         8cHrkllvIZFniyZ+k5oVcbnzb50JMVj/MXmk61ZHunExK7XeFXr2YZgHoRZA9yxIjoJ/
         FNL+ehgtaUENFwrsN6qw5PMDUslFI6mV36SuwW2v13dAxTvXlSWrF9uc489QmnSICV4I
         M1SXX5mv2G7LpK6Qsz4UrrmwdIT8JUNqQoPnukTpbb9xpIr0hGlufEiqNvyK9oa8Y/ER
         7vYuqhpEbondf1BQ6zXjGrPksfm82Vmbb9WMt+rRpznm3MB3iKHOWVjVsHWK2QD+LLCI
         e8ow==
X-Gm-Message-State: AJIora87VIDONg6YlGTcqScogF40zQCeaqQuN7Dp8EKSdVKu7lpHYk92
	rDAb9pdgjqhYyXEbNREX9JBt+t+L0YI=
X-Google-Smtp-Source: AGRyM1uPubQUBkUKfCj6Pab0PNni4xlv9AST3IHTvB/EK4KaVO/XfMVh/qyaIxTVFiFgUYRv+RmQCw==
X-Received: by 2002:a17:907:608b:b0:722:f954:6e3 with SMTP id ht11-20020a170907608b00b00722f95406e3mr21619271ejc.550.1656803561997;
        Sat, 02 Jul 2022 16:12:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/8] dt-bindings: mtd: intel: lgm-nand: Fix maximum chip select value
Date: Sun,  3 Jul 2022 01:12:21 +0200
Message-Id: <20220702231227.1579176-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161243_366115_4953C13A 
X-CRM114-Status: GOOD (  11.61  )
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

The Intel LGM NAND IP only supports two chip selects: There's only two
CS and ADDR_SEL register sets. Fix the maximum allowed chip select value
according to the dt-bindings.

Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index 763ee3e1faf3..04f26196c4c1 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
@@ -51,7 +51,7 @@ patternProperties:
     properties:
       reg:
         minimum: 0
-        maximum: 7
+        maximum: 1
 
       nand-ecc-mode: true
 
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
