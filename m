Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13D2C83F11
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Aug 2023 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gtqA++65m4P6AyujkGzZcnOYcjtVwpg/yNLeMceypXw=; b=obHtoX14+8aOqp
	3VBXCrt2kPn6cVVlZQxzbgyC02u2bdHEj5HC5uqjHoseQGRJBPXCM/CN7RET+zZBMsVFQMEj/h8DX
	fPRTP5xhTKjyUkbSZIeHbqxRn8dcI1chETsxtugo7GfMOYqFrY/N2LEO/q57UTDWBw3SqekM8MGgI
	JCnnusLDaObS19LwuvhXRsjvm5kYsZtS0r9iCVZ1QkhYRoieu8STqyFAvEjEhSwinQy7yNOxICD0S
	P0uBn4wePw4xCuNNotJ/3nxhnv5rxpHz+eOJ8mivSKbrwOisAyHTqT2reQy9l1zKU62DAhgTcvg73
	X8RQ6y63ygkF4OWtHUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZpky-006dBR-2i;
	Sat, 26 Aug 2023 09:39:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZpkv-006dAI-1v
	for linux-mtd@lists.infradead.org;
	Sat, 26 Aug 2023 09:38:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bf3f59905so205481366b.3
        for <linux-mtd@lists.infradead.org>; Sat, 26 Aug 2023 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693042735; x=1693647535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrYqC/NgvPNZZPzsGiT/lg4ia/WmMQNaEEMcPhrqy+o=;
        b=Ho2ZKHMnGtGNdGBuf86HZIZy5cvOfdsx/KMTyiDrlVTzJ2p9I4hJoHcb21XFxbq794
         7kCprWerLTbqDDzakcT6GCYaPw6UVjpPRNQkBx16TJ7AIveo2Wg43tGSbUTle8ODEz2T
         zaRfar9T1WSVgnz/0RN22bVhj77cLh5rAwiyqIdOfTx5D1l3ZpWu1pXuSIyFwvVPiHJf
         9QcicRlmjb0M1cweqrnQlDcpUGb8N3+UZ5RA7T1xjy5XmfCqNIV6ojgJBPdB3RG5V3sd
         Aatvm5O6xThcji9w6UH/PcTGMMbFTyh+BxEo+1Rnu8+tEbp1WJ/pV9LN6m9dwamLS9va
         tkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693042735; x=1693647535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrYqC/NgvPNZZPzsGiT/lg4ia/WmMQNaEEMcPhrqy+o=;
        b=ftpsv9DIHtinRJ3Vp8m4l0bZSo1jC7ZYllJ6hkyHt6YuJWy9Rd7LJXsFSJ3UMcilDo
         PTGXLrUz9ZrWbXPZCxjZq6Yc5Qt0qlbQVYo9OkWOGRw5PM5+Trm0zaAtawggsf9VsY70
         m8rS7q4wit2DPU75fXP9REoY0PMnxejiRk6mefU+OzhCgQky/TRT8/ePXQjFE72o8EWY
         lFqLpqfPpIn5T4KFdIfVxyT70SO1e/+0yREvtjZtwlan1WsyDgByU+9r5oX1hqIuSeDA
         TfGcfFE1QOP5AiN9wXCq7AQcfX9Cl5Tv9ZJPE+cbwvR/l//WmYQvHBFEIIGsPk00qhkX
         qdGg==
X-Gm-Message-State: AOJu0YwJjXgA19x+8j6TAWSLI3f+BevrSrrmOueEgpjxWA7UsjAY3yvW
	HahALVkUU8z1sVswVBdRxlS8+g==
X-Google-Smtp-Source: AGHT+IHjmbFg1H57TDNIZjkNJapebQSvKKTp1AGIcQS1jr/gn0VFF7slvzzVWFYNMDNRDpABgPxOqw==
X-Received: by 2002:a17:906:2ca:b0:9a1:c352:b6a5 with SMTP id 10-20020a17090602ca00b009a1c352b6a5mr9915168ejk.69.1693042735263;
        Sat, 26 Aug 2023 02:38:55 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906718700b0099bcf1c07c6sm1952970ejk.138.2023.08.26.02.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 02:38:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mtd: amlogic,meson-nand: drop unneeded quotes
Date: Sat, 26 Aug 2023 11:38:52 +0200
Message-Id: <20230826093852.9334-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_023857_630575_545B093A 
X-CRM114-Status: UNSURE (   9.63  )
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

Drop unneeded quotes over simple string values to fix recently enabled
yamllint warning:

  [error] string value is redundantly quoted with any quotes (quoted-strings)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 1c79815e1f7f..57b6957c8415 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -67,8 +67,8 @@ patternProperties:
     unevaluatedProperties: false
 
     dependencies:
-      nand-ecc-strength: ['nand-ecc-step-size']
-      nand-ecc-step-size: ['nand-ecc-strength']
+      nand-ecc-strength: [nand-ecc-step-size]
+      nand-ecc-step-size: [nand-ecc-strength]
 
 
 required:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
