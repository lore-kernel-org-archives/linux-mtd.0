Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE72CC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nq9cKbkuHNnKcQ8lJsEGYOrdDfc1MPh01AfM0OLV4E=; b=BzQvFBnon4/rTt
	oVs4472eExdhTg6t0zLar9D2mjCgQpag7j8bcys3TOukUwJ9TFSVOwdye8xUilXbe3RURRDxsAN2O
	F54ebrKD5XUJYu3qLPOU67eQTci+OLCqvIbEIuO+cBspHvvkTv65KY4t+J+sjQFJ/zGwO32ItIG7l
	88ZxFRkjQPZ/Ofs+EsoZ0J5Xgs4tgLF6PUNVS8QvdHuGAZvDsG+1qTWi6Jg95l9m1q/12Odu6PMHE
	XDdb59cLHsNWUZh+k5DBI8aH8WiKfob+xZXVcd4RYeD2iok0Bj9VbJugmGaUCU0KJpvPCtW3lLqUA
	GRkd44Os+34TlMx1FhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLP-00E8MQ-2a; Wed, 29 Jun 2022 21:35:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLJ-00E8J2-7w
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id sb34so35083153ejc.11
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A93wKO/uXTQv/8Lh6Y6CctCekOaGpcWQXQjkcifmHes=;
        b=BK8Xcuk69Pi7Vcppuxoa+Xe5GLLxHngkMGUtbUTjq/tpvoIMfVnBJ3YUS2uHE0dNw3
         BZEEy4xyp7PVyOvANndESZMvaT+Ki+DBIuljFgYfZRb2DDjfTzUAMFkFUPg2v9x8XorF
         OHSi7vhRmbPEIRsnsQno9Lr/udNjW9Emk8dK8/Z/rrSycmP/QM0KW3IYRz6cOwTO5AYE
         jmOHOQ9+FINk73uU/bOTMhn8FG5X4D8NiVMJ0IGxe0dHNT1l7HT/WZR8as5MZ/i5GUW6
         52tgRhtL7xnZ1gpRRg4T8kGy62ljse0BY9R+UWDUX8ZbOBW+O4rB3A3WpToxDrhiQMjF
         wh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A93wKO/uXTQv/8Lh6Y6CctCekOaGpcWQXQjkcifmHes=;
        b=Gz7MgCUTkFj91qDYxP8aok2qS7vNtanZm3Q7DhgCGLTjDPsUvAV+BUNFyYOdfqCrBs
         axmw5hGiZ8JyM73HnkxJuJ1vQPNh2rxXhY1FgB+aoaGMnHK8IVXIDSaTtood81QaZazK
         qBS91axYe73e8nPOsVep7QtttST7WPk9mqhD20yojzjpna67XFqX47dOPTHS692GXT18
         FNHP9UhiYGarBse436w+QOfX0IGmkDjIIGmfid6tFQAQ1CfCeZVlfFi6FMHWxUhQgiyF
         nu15GVKj2sOKjgSCf5O4JARTl9L0B+Gztg/EbX2VyOrVRHb0oVAFj4D0INY704PM10sh
         d1OQ==
X-Gm-Message-State: AJIora+Dw/iIEWG/LWfI0A0gugfy2zM+g6usP3oUN3FLxfKTRjQCRANU
	Roz1XwKygXBt9PNq8LznY8EDMRuOoaY=
X-Google-Smtp-Source: AGRyM1tBntq0h6DliMrGtytOQadSYCkcjalAx1tGOtnkw69zz1fNwRpCsF5zmzmJHIhNklr2sSXAaA==
X-Received: by 2002:a17:907:868c:b0:722:bc0b:500e with SMTP id qa12-20020a170907868c00b00722bc0b500emr5671151ejc.703.1656538521359;
        Wed, 29 Jun 2022 14:35:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/8] dt-bindings: mtd: intel: lgm-nand: Fix maximum chip select value
Date: Wed, 29 Jun 2022 23:35:02 +0200
Message-Id: <20220629213508.1989600-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_143525_317864_3BF546AF 
X-CRM114-Status: GOOD (  11.85  )
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
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
index c45dd87fb5fd..af99b8f7c681 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
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
