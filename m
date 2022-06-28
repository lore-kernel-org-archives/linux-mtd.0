Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7294FCCA47F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDVptYwcUqAK+EciOMBhxTI6LK5ImsGgDWe0gJ6NRMI=; b=eq//wVA/ZWzmfg
	kxf8sHOGkj0X2yqMT8/px5BIF4tQCaeKHeHz7ZrTo/bwEmFf63GGiLOWWrz8Nr2aH2aC/7n6DMebe
	gkmLmS1N5PmdbAQ6ZwdSjiBu26QNxEaSTNTi5ZN1UMtrmmwI4tTJwQ5ukPzkVEFrC+WPLf9Vw4HjF
	OcNLUEEtrtXcOgBf71hY7z/NVGnJjOQAUIX7LZ9t65ifvZQ4YCBj9i4OuqHR8V/ESEt8vPVLTu7I2
	1gCzeiIRqhhR0GePnKz6eXVBBhxA+h2wECgUkZSfyqbO4F6rN7N6aXGIfFS8jQKVThPdAt91cgeaP
	Iw/gPvN6xDqJCmy3TW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OF-005v7y-9s; Tue, 28 Jun 2022 11:28:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OB-005v4N-IO
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:16 +0000
Received: by mail-ej1-x633.google.com with SMTP id cw10so25131859ejb.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C7hxbvOysOVU/UTQ861hxTJENidUKbCv/fSaMWTU3aI=;
        b=Kb3GrCLoxkYt2/yVGmqqO4w8RxBfyYZ6rRu+LEu9FAzsG2xDTJNzh8tf9/B84y/aDR
         bOwn5BfibkkSmxciqncxsdkBGyewMT8FU18aKZ/SvMGZ+tTRZFGB9r1VdT/0TFZbe7M6
         LmMDTXWIeqrViuKl8dNo1OB8sHS1F4rT47JUY8ZaDQb0B8Bu5YS+mYbsvPLD/w9MH1Vb
         fF/AvomeNtZA4qcdckaJjf8slVctIuc8khfDjCv078OE3FYj/ILVVt70Bh8RiwchL59/
         LpchdbicFwJOTHOxjYYgkgXM4e3K8mwD95s+2mjFj7x0kuZl96pU8gCLnWNElYRi/xJk
         VTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C7hxbvOysOVU/UTQ861hxTJENidUKbCv/fSaMWTU3aI=;
        b=WZUuOe+MAX+vOYNLzrCOZeZNscjsFzVcHmi1aAwO8HkPxcxm2PBKyJTXBN2828xbmx
         CKM+9fqHysMRukkkthvgwuPom5wQlNk36mqv1XrijnqKSl76ghGLD4yyHKuYVqahqLk+
         7+v5BqNxmkZioIx/URWbMoa6uvOpIWvMWvJrdWr6oSHXcSlAioxVaMj0uMBeMfIwAagv
         9B4X+NWMywJjsdu2E67GuoxQJFXXJNCNtAW3ChXi28vIdetBumZTy+3F7GrARK5lwOfi
         XqW97qljwZzd6UfYIf8gEOT+IMz27RlEKc+fvOC86t+UIgAsJV5S/Z5/YJ11zoc4pqz5
         e19w==
X-Gm-Message-State: AJIora+pKj5RTEngX5GGOy4gDiAhs7UuuOwV7gaPJZ4ghTkqrOXRWzF3
	gdCiUVeMwGgCT7ooJaa6MHqzBk9/lb0=
X-Google-Smtp-Source: AGRyM1slseCRLwPgpXyPajn0dpOI3hl7Jgl4zNknGOXyGIQeIUZzYiCPMBFWkQQsyhJE0Hu+dqVM1Q==
X-Received: by 2002:a17:907:7f1d:b0:71d:ea75:e533 with SMTP id qf29-20020a1709077f1d00b0071dea75e533mr17799271ejc.78.1656415691749;
        Tue, 28 Jun 2022 04:28:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:11 -0700 (PDT)
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
Subject: [PATCH RFC v1 2/8] dt-bindings: mtd: intel: lgm-nand: Fix maximum chip select value
Date: Tue, 28 Jun 2022 13:27:25 +0200
Message-Id: <20220628112731.2041976-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042815_676517_5BA27D78 
X-CRM114-Status: GOOD (  10.95  )
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
index 763ee3e1faf3..04f26196c4c1 100644
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
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
