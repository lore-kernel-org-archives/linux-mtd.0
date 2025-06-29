Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3F0C7EE39
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jun 2025 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fnh2V30Sq+UnO6NCUbWZkqVHQGEo7h42yvm3ZeHqQAc=; b=YJiXMSQM+4vJSJ
	4qJART5yaWYEkuzL43Zxv743DH8HGKM30NzgowPxq0e+PO3iiypQXtMNo9CMPVsElBBBFf/xiCJy0
	cPqiHPi7pCVl4wsrmHibGlk70eKVWsqqPuxzSHSfwVo+8Q07w/eKNnvO230CgBdL9eunc8fOacWhw
	7Tz0DFrLvq6mcB+9WQmO3m8ZlTq8OGEX593ZDI1lg0lBdexfPikS8FNmcA7IppOEcK7CNgBVd9OZP
	k9+qaTPrZs75/7jSKtmYNS2K44E+F/8+BGk63JWIC3t6XRRlToBknnWq1Dov3jWNPPzyOY22S/Em5
	HFpqvAZnmWHfGgjpzx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKG-000000001WD-0slo;
	Sun, 29 Jun 2025 08:23:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKD-000000001VA-2k3E;
	Sun, 29 Jun 2025 08:23:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23526264386so8898045ad.2;
        Sun, 29 Jun 2025 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185425; x=1751790225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5t0qkAHCUwUVEonnqGFQqn/6cdBXFEA5e8qoGS3Oz8=;
        b=Ihrm/7CMYTx543vPA68PG7ONVeNyQ/NB7SQZriRE1xzx0WE9fj0kLqdhEnpQjkycfm
         m69h1cbQeQiqjKoXbm78nDNtP0K85xa5hjYbBOpj9X7mj5JCP6PEEq0uwiTlC4nphCMN
         2P8sE2PeX6OP7xkHBG4HxnkBWDy9yjb8LsEuqI5uez3apZgSy8TsqmgEvoBHYIh47W49
         ssnUzFFHHKWUCpYhA0dc5ioEbgDggIgTNJcB2psAqhA19kTD6WDzMji4Y68MevDX/hxi
         KZEf7kkPdZ2PHo0CkPoI8quDfjMnCT1qIRLvMnMLF5We+QlpdzGLiA6FsTJQ/0zGMW2S
         o5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185425; x=1751790225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5t0qkAHCUwUVEonnqGFQqn/6cdBXFEA5e8qoGS3Oz8=;
        b=qAA0dsZP/DTDvud9JrP7zS/i77lrtbXKI+LPxEYaL18Qq/lu86rDOk7nGfTMtCssXB
         nhP5R+Kp66dQaNWuz1b9R7dzJJSfbV1NHmoM9CgQMVqXaQZlpb/gBlBqSZVKCBAECRxQ
         NkhoQ0Va6M5HqTQnfjZw824knXN3SoDZn47OkYybeGfJxxwmxF4OwU1Y50DILgSHOCEo
         kUqNjU25sQg9vTT2pt1IXuIAlaaId3ulubdZ3xr1dk/WONdXk7i1nPC6OWb10wFU0eCN
         sJaCvIn89mPt0BRUe8Ytl0DIyvW38zvhKsx4EBJCibrj1FI0yeUO27ZoBb9Nylaku4Ff
         UDMw==
X-Forwarded-Encrypted: i=1; AJvYcCUaUeMwflZkqQuXbYQcEezAS+Yz/09rB2ou7OeskN1IdDRVSG4bursOS8CUIZ0NujBfPdFwT5Q97/O0GA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYPsXH18Cfxr9+XX/IgGvefMb7svFEoW2fviu8mNr2GH7UBWHx
	ft6NUiCa+R/g1JvrzLp4I4Lz/2Uz+Fx+ZHb49XJQUM8C1HKU4wwRuahw
X-Gm-Gg: ASbGncthg4z3ghHP03kGOy10t6egUdwRwDOC2E2nm2jpEfqzeX9/+fVUod9p8q9kcXN
	lVGSGdlr0CZqx4J0P2dGAc2PPE+Aw3aqqzX43ZmxMfouo3mHwt1MWfpkeqz45+8DPc2owC/v0SM
	5Tsgglyu7v+pBvpw0ZKMsMuEcCL5lb/bowZLmROddrIgOuMFipKsaMy0npG1q4IC+W5njIG+q8P
	1KFfa7Iljb8yXaSJ2og8giW9j8tAcYxcBuFkkV7wEwSlUe+kzBeKF9mzLhhtYINEucPZBBhzZUl
	H3y2Xeh+I/s5W30ZIrqet1RcexL7lGlk6ZPbPtlqOD4ozwgSBlNDhw==
X-Google-Smtp-Source: AGHT+IGbMuEWFzEQmcPfSGUyuO/vpiR0F/dpgN6q2wxjWT/5kSKuK3KVHvhvvINAfAKvfiDaNX3KCg==
X-Received: by 2002:a17:902:d607:b0:235:129a:175f with SMTP id d9443c01a7336-23ac46527famr141581505ad.34.1751185424260;
        Sun, 29 Jun 2025 01:23:44 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:43 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:10 +0800
Subject: [PATCH v3 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
MIME-Version: 1.0
Message-Id: <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
In-Reply-To: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=953;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ETMNqPLnrAXwhjSmox3seEy1rdOzecBNyCB7CgBbOLg=;
 b=Ua4qsIQdrMlRlRlRmLVxWOFnI0KLWyYbMeNhHAXkmgvG83CASwH+MS37sIVU/oD/jeC60bVwg
 AhYJmFtW6lHA+b5WGe/HJJWjLetKnjitOuWS/eOms3fYxuQnZejtDr+
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_012345_705293_5DE55E10 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

SG2042 is not fully compatiable with SG2044,
So it is necessary to become independent const

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 66e54dedab140a167ad84c43f312f93af2bfa06a..1299097a210d5074cb23b644d4f102a2fb1a0e3a 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -16,10 +16,7 @@ properties:
   compatible:
     oneOf:
       - const: sophgo,sg2044-spifmc-nor
-      - items:
-          - enum:
-              - sophgo,sg2042-spifmc-nor
-          - const: sophgo,sg2044-spifmc-nor
+      - const: sophgo,sg2042-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
