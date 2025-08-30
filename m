Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED70CA0FFF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Aug 2025 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TTEUH8TlsmfnH8VMAegN3qB06gN/sNAW1YO0qkjRRU=; b=EfSgawbYLcbys5
	hM570cpD5pmHVTBu/U6zl1FVayL0x25erxz6O0hdiULwvZrGwU2Ygv83HY1An/I76L4yurpJR/Z/x
	R+Fhnx5646Y+QhjaXiCR8/7nc42ezKO9usqVBPqz/33VuZzexmUrq1kWTyoVZ93rsA0c0P8kHtOeY
	thvlab59LUm/fEzDyqDyc//1doqaY2OwDFOtQou7HGfki/BxJxThSOsBACtZc1OTWcRiwYWtPno9z
	FzLFW0CqugkzSWHEZNiv5D0X8ah5NbLhaZdLm4G7YBt1hZBQP7PSc+OJm1RD09rGpPYJG62kZ2HdE
	xXPYiXXtNLT+keeH0S1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP6p-00000008Cug-27wM;
	Sat, 30 Aug 2025 17:11:23 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOx6-00000008Bb5-3q3E
	for linux-mtd@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso718227a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 30 Aug 2025 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573279; x=1757178079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=us4cNYtwID9TjD04hpr8jvahpWc5vnsHqsFH+7B5S9o=;
        b=PAjtMkw/Qh7hKGQLoGcpVLw97eeLz/JWOkQ8EIOulJJk00Hl338jsJOYq7fr+Vxg9V
         LDc89ndN7gue7SxkSyHHAAAhP4URNKIioCKslcPDkVI0VCkazAgFioHX24P9h96FoObo
         7/SL5lo9VzoJAIhx0PvazGTBK5rGx8qxzbIlwJkJwPYH0oJpejGMF1k1MgwUmzvB/QjP
         PsOoYlDU4GSvKiQDDMJWA35yJLBEx2ml+QzvoJ0UhssFmNGqbStT7DDJj/jjoVo5DN2C
         mChq0TDMogSb8pSC0mXyZQbdkHwJpr2hX3IPX1FTKUSgjhkT69Nw/CL3tZkUYhtGQDRk
         gf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573279; x=1757178079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us4cNYtwID9TjD04hpr8jvahpWc5vnsHqsFH+7B5S9o=;
        b=Dd5/7Jy7QQI9rSHYvP5hGezmgtdvdHZk1vcEx6a+ZRABtLUFnVvkGdf10E3XvgNisB
         vhjyrg72KE0RQqTa2no/5izmf0V/Aqnass9m5l7XO/ywkWv77F/CHwPmMj9gzP+A9cNT
         ch3ffRXo1unBjo3oi79UHJJTM68cU6Bemw01uM5QzsXjZIU74hvvZnmtpT0nGrNQfZ8e
         r0JBzkaT3aA+PLpkUCxy9In4XG8vmQZUyuEB70xU+1ikKLLZHRcoAs6q02u0gYwYjyOB
         I2W+jli3MYZCm3IljWuPSnpOU0gdrU3QNvj8J7LymR5tC7Ra3WlcRkwspKbaRm6NRzSi
         2bFQ==
X-Gm-Message-State: AOJu0Ywqxtd9EdqOTu+fQ1907/1WS0GqHKkJTTh9IvOO7mLLJT2lK7wB
	GyrL8/Gsu6yWevSe5IoOgdG3GRrrRAMRsQKKnCgZSiqytWO2hIqmFZg4ZRe7MdDk+xI=
X-Gm-Gg: ASbGncvca0LP45JLJOqID0gmoEtHOlGhhVqbz77oOsrAr/ijHuYh7phBcJE1PqCEkJ0
	KsuLwElyd5/0bklrH80dWOdBft1q4/i0B4Bki8tXbCan9ehHBgYoC8CrL7Th6Bj71tcn7GE2Irq
	72RqoFRFske0kvVAiad7gXwuTdXytBJG5dfZVeaRz2/rfNizOidP7UqRr5l4oE+g5BBoWFHzcN2
	3K1ebybXI1VWUUZ6lRiA7XpVFmWnVFK34EoohhPBJuVfBiM1d8Urui6dHKeSSxZy9PSuIml72pY
	bvhPgq9Q3kcsFkZ6NSim3C5Q4cszBBIBy0iNfkS2C7Nz5UYcSHqwvqieEtMnEhLMgySn65NLwln
	rkHxf5FDpQ/gD+usSbKBEV9F4t7CwyiNVqmj+fQbwQi+Wz8b6KA==
X-Google-Smtp-Source: AGHT+IEa1VI1o8sCudVEZfhZ3gaC0zyMofPPT2ZBfSOCrdhwJHioZOMNxGzq3r24F58nX/VQxYQy5w==
X-Received: by 2002:a17:907:7e99:b0:afe:af91:2e54 with SMTP id a640c23a62f3a-aff0f15c2c2mr290241666b.9.1756573279207;
        Sat, 30 Aug 2025 10:01:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:10 +0200
Subject: [PATCH 2/4] dt-bindings: mtd samsung-s3c2410: Drop S3C2410 support
MIME-Version: 1.0
Message-Id: <20250830-s3c-cleanup-nand-v1-2-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QqWeYHPVLq//RwXvGMYa4TqqaGs9IG7D/NPVlveQnRw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5Yy3SpNOt0HGF2AczXJ3AfabDf8t8/xXbJl
 wARVHKMzUqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuWAAKCRDBN2bmhouD
 179DD/9+2t3OdNYd4i3brhoOrz4Kyz/N483Dm/aOqEzp3IwdOT6Jo+xN65Iw6AYjfqprAWKoy8Q
 4Wb0iynxRE7k+s0vA4+B+Oz7PB88lqEIrVPQyv8qRuRrUXV2tMUMB3Lyl93ky8xPOVoI36Dg8W8
 ATsAenaLvUrsH6Dt6xn1Ivx0Au5J3cnA420wk5GAK/Wtapt1rj+o0WjKL/15V9nIehpsY9qO5Hr
 ZG9w8rv/vZuNdlqrvv9JKvpqWniEcdj88JcjyzuxFkKSlTPrSUU/M4lLJpc0BY2nTJWpaXHh1XI
 GVxWW12/Mqeru3op0jgKXZW1ffB/36DS5koHwuQOkIx8vQ8FA7jc5e76pL8R7vFU2f29iqtyDsc
 2BmKuq/m391sk3V/C6GCUeP1LaFgiaFLsi5hJZ3ml49u4lnyXcBH5c+ZhjjlTJ6KNiD1XBStNcI
 exXQrh9LaigQgHWkI6kFbAwoU8tuDjcUzZAWrlSbV3JP/wGvDk5O4n4pTTNmrQxrQv3/hauBQ13
 PLdI7t355zMZna0djeTokra2SWNBuqEMRAx4fO8vYHNEogO9yyXMQ43u/Ax1nwFOqFPEnydUV8Z
 RDhoecH3Oc+LKFPgdCbAJZV8a3O7P1lFx8hFBUdvgwKAzhoyzdFv0SU4VdhyConflzyjHdFozOy
 hSPZD7UNMnmIdPw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100120_963714_58165DE3 
X-CRM114-Status: GOOD (  11.00  )
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

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of its compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 56 ----------------------
 1 file changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
deleted file mode 100644
index 6354553506602d452acd02dbac48c854b8b59cbe..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Samsung S3C2410 and compatible NAND flash controller
-
-Required properties:
-- compatible : The possible values are:
-	"samsung,s3c2410-nand"
-	"samsung,s3c2412-nand"
-	"samsung,s3c2440-nand"
-- reg : register's location and length.
-- #address-cells, #size-cells : see nand-controller.yaml
-- clocks : phandle to the nand controller clock
-- clock-names : must contain "nand"
-
-Optional child nodes:
-Child nodes representing the available nand chips.
-
-Optional child properties:
-- nand-ecc-mode : see nand-controller.yaml
-- nand-on-flash-bbt : see nand-controller.yaml
-
-Each child device node may optionally contain a 'partitions' sub-node,
-which further contains sub-nodes describing the flash partition mapping.
-See mtd.yaml for more detail.
-
-Example:
-
-nand-controller@4e000000 {
-	compatible = "samsung,s3c2440-nand";
-	reg = <0x4e000000 0x40>;
-
-	#address-cells = <1>;
-        #size-cells = <0>;
-
-	clocks = <&clocks HCLK_NAND>;
-	clock-names = "nand";
-
-	nand {
-		nand-ecc-mode = "soft";
-		nand-on-flash-bbt;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "u-boot";
-				reg = <0 0x040000>;
-			};
-
-			partition@40000 {
-				label = "kernel";
-				reg = <0x040000 0x500000>;
-			};
-		};
-	};
-};

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
