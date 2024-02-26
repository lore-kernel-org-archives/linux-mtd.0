Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5156DC54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 11:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g1zDmPr231V0rvlwUkh39N1Npu1AY6Sh+wJ+75IVxWM=; b=rg+okyb4sD4A8J
	ZieXYDvVIetkuBkGlfN9sN2wAsvKrPxkLvVleSiTDw9zN+bHju03xu3/QKFbKea+gQNVai9z9Hy91
	hQ5xK6E6OWNcIy0N1j1vgnzoD2foCj68qzTouMkGVSejz/0x+1wMUsTd/+PTg6qempprXBSGouqVO
	lllDm0xq1j0Mr2OmzQ7H/qLnRjEb3m2RDT5HYczbaOmPGu/pYm+RH/N9KIC+o2BVDUMfNxGiL9UPd
	o9mVTwSTVPZZPuq/B+uwiwad+gtTEa4fyh/NxTAJVfMCrCYmEU4CksvLjwnWSH27HuiA4r1qC1Kqi
	ST8+b1GgDc6J9V9I0UJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZXE-00000000QjC-2vP6;
	Mon, 26 Feb 2024 11:52:40 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZX9-00000000Qfo-0UkV
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 11:52:37 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3e85a76fa8so265064966b.1
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 03:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708948349; x=1709553149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qB8hWXSvkZbqLJ31D8l/uDsLKWgY2404VtdI5HHKIEY=;
        b=kJrtqrBzWu91kH92DLZXHDmqC+b+XX4SU6l9NJVRGJXFGyuBdmR91WCn04G3rOlNG3
         vqq3N+dwgNlhcCs/iVfHmvO8nBAa6e576qeJ2N9c42aa+6ycz2RN1dUQJFnfg5brM8EI
         7a9v19fpn4ojYp7dO0+saaWeQ81t2DoCRvWQ+Ui662j7VHzU93oToH3xVzUF08D1RoXj
         TziJmfj3fIOG5LQ6dZhAaG2Q2Bq4GzEEcaPzI+L84Q+kbm3HdUPURXBVa9Rw7SUGlptq
         oU3SumgITUxfFQ95oelXzWYAeu1cnWJdTd2EZxy1D3B18E27U6AL1U6E86u/dHodf67h
         rB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708948349; x=1709553149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB8hWXSvkZbqLJ31D8l/uDsLKWgY2404VtdI5HHKIEY=;
        b=nFjiGH2lXw846NyrY+YXZY15Lg4PKNdqazsnK2ku37jN0fpQqsvYiE7wt/Aqq+W0BC
         jkmxkBf2zQkCCwf+u2hqDSZcYAZPN29Yy1DyxteWqNd8ujB8Kj4PH6phxdFiy2UvkKam
         Fnj0YKySPJI1bo7PFZPzKahG6mo+TE6B0RB7dtllsLD/GD0gls+bPrhXAMLv85syQ5g2
         Zakc9WUmFMbsb8HW7dvpLPoXzwJZvWYocWHUSY7c8NfzL5KLPRZWn5dp7fKIutXqpFxu
         ODagRLLmOIt9jVNP01WCG0I6BBCnhTn5/y9lTLog4aFBzsmLWBFoc9RJ0i+P/Ldr/2Ke
         rQpA==
X-Forwarded-Encrypted: i=1; AJvYcCV9eA88CAPAIM3TBOeUZPPxVp4vPRu47/7esonzy19ULbrSmV43vvSxdbjTT7SRADjXgQ+CiTKb7a7sjt/yi9MQ47Fka0qJFi06IvXzxg==
X-Gm-Message-State: AOJu0YwE5i8g8fjHqY0R6MtkmrqqRvR71RQe0a4UZxqRpGcLIBIMFYMQ
	vSOraADkjdY8KWYEXRVb6IHLzhaooDU8tGwcV3fkzFov1Q+FQTUEw9f38xinaxkLdgLfx5pmXPz
	A
X-Google-Smtp-Source: AGHT+IF8nZj2AxIU8pGo453OtUaGq+NyQ4OirQx0LwfQNcLkXJfG2Vu4AamqJIoyTfiPDFE9fbm0Ig==
X-Received: by 2002:a17:906:2e89:b0:a3f:5144:ada2 with SMTP id o9-20020a1709062e8900b00a3f5144ada2mr4942148eji.2.1708948349541;
        Mon, 26 Feb 2024 03:52:29 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709064a0900b00a3d153fba90sm2328999eju.220.2024.02.26.03.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:52:29 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2] MAINTAINERS: Remove T Ambarus from few mchp entries
Date: Mon, 26 Feb 2024 13:52:25 +0200
Message-Id: <20240226115225.75675-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=tudor.ambarus@linaro.org; h=from:subject; bh=BCspbtwrDy65BB7rOp5vz3y81XTaY6XHQSQGB8e5Fo0=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBl3Ht5X/XCQnIus7mvWtg0Lsru8nzZ50DOo0DbB MejgeqpNFOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZdx7eQAKCRBLVU9HpY0U 6Q0OB/9/8s7uW+XXz7vgrg8wAJxmRQkx0Dkl1yCpnGHa8UxC3I8g3KZx/LyeB4cZAIDa3lyLDLI dbPlxvq+sB4jGQkzIZumZEIf/DCIbx3TcDxiTqtNl3Q6GaBMuCarpXsK7/E4g2Ho1DGAmBbuRid XtP2GTIu06CaR9ctAoPrdbr2RFiAr0nB2yOLcSjxiHmLIXop09uU4iAIlbOUziE+4cM70AbOMLX A2uMAPr+t/0ORkizGNJT8/zIvisNxpdMxTVhAHBD4y6kpENvKaShsop8mAFy8X70+TNxP+7aWtX ddrEC5AxeDtAMdNq7sfBwInmw3zlYXFw4BXbOymWMnCZlvew
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_035235_383967_FB68517C 
X-CRM114-Status: UNSURE (   9.38  )
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

I have been no longer at Microchip for more than a year and I'm no
longer interested in maintaining these drivers. Let other mchp people
step up, thus remove myself. Thanks for the nice collaboration everyone!

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Shall go through the at91 tree.

v2: make entries as orphan instead of removing them

 MAINTAINERS | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1475ca38ff2..bce0ae12d599 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14350,7 +14350,6 @@ F:	drivers/misc/xilinx_tmr_manager.c
 
 MICROCHIP AT91 DMA DRIVERS
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
-M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	dmaengine@vger.kernel.org
 S:	Supported
@@ -14399,9 +14398,8 @@ F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 F:	drivers/media/platform/microchip/microchip-csi2dc.c
 
 MICROCHIP ECC DRIVER
-M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-crypto@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/crypto/atmel-ecc.*
 
 MICROCHIP EIC DRIVER
@@ -14506,9 +14504,8 @@ S:	Maintained
 F:	drivers/mmc/host/atmel-mci.c
 
 MICROCHIP NAND DRIVER
-M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-mtd@lists.infradead.org
-S:	Supported
+S:	Orphan
 F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
 F:	drivers/mtd/nand/raw/atmel/*
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
