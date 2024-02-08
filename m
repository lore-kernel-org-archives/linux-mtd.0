Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C572C4828F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Feb 2024 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LlLMrqjnYQCqeEL2lF1YkeXzxTl5kNW0amiAwVXWCWA=; b=zUA46Yqk1xR9mK
	yuBokvTsDWJNtPhcceeH/86pnBPQ61/fdrzHhUxjH/OHIEp48xSsO7f12rRWYs2npXj3nBalHXSoq
	wrJrTxTmL851AQjZkjL5K548ql+f9WO/ed4AP5YG+JpI1hvAr3gaYF9kSF2WotBSHtW/VmW5f6ego
	61tu2DoUnbqKsQM139+nYZSwJsP1YOD4sd482eANBtGdLUJrE9CDjh1N4YKH0x4UMYKbIa3oHyjwu
	FBIX7jM3rlhG/QD7r+hQAKUoDdyZNDo6VEzHSJfYiyjXySUrfHivrYOCZ5skGxqz0zTwlTbzr+A3j
	s9x57aRRuri2K/GkTl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYAti-0000000Eqm8-0ZRy;
	Thu, 08 Feb 2024 20:21:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYAtd-0000000EqjM-07S9
	for linux-mtd@lists.infradead.org;
	Thu, 08 Feb 2024 20:21:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5114c05806eso282197e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 08 Feb 2024 12:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707423679; x=1708028479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYrd6d2Vrj5LAMP1/VHvIQz43NZRkWAQemJpz+Uzi6Y=;
        b=TCooaBDG24lI9otitvjRlXVsxA7IfQx05DzzjS0Q/EJBfhqYTK7XRiDdMROIhQWV2f
         D5OI9ppyRHPsFMh0fon7hOqTH6xfe6kyEgtx/yS1ROUeX1AYSjNHIP0ascUyR/PYlj//
         E/EXO/XM0btwJxAiUuiiiEVCT847GNL5+PqCQ/qIum+P+Ev1MqTdaCwxNx2x5pCERlTw
         wdjw7hlRXY1tx/K3XW7CLm2ga8CXcgjZa/7ZvcL+geS7TMDFQWxFskfETpZ+MgMz0yLb
         r7sD+Hc+/PSKn1f9qnjfDNqpfTyXMkc/eEMm8oxWMNILpwIYI0GTLFBoFO2lVLJ1TtHK
         1aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707423679; x=1708028479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYrd6d2Vrj5LAMP1/VHvIQz43NZRkWAQemJpz+Uzi6Y=;
        b=ulBuiGbiIV9aen3JyumTazlVhdEXVc3YYq9pKXNF/gTLngeHc9CqEgwLrC/TGTRepP
         4Rs+G1em8CKe52RUiVlBJjg5CVp6d7lK+OcdO82r4zv4iCFYTaToVnJEuEnaAl5cBfop
         tvmnX0+HkHSnNgPHAwNNmvSOecAKCBUOnhon4Db4WPDw9ybDg9yoynWS6a4motLnE0CF
         9/n5u4Ohws8A7UYWIhGy1eRR/5PwEo1mn0JBQxfXgd6HBRy7/fOx0lcUE6Dptsirvt4r
         tInkdjhQzmoBa0F4BBc7omYuj/xKrX5p5AonE8xNFLsIXMVU4i3HIq0xCltSBZT/cUih
         uHPA==
X-Gm-Message-State: AOJu0YxpKV+gdJnjyde73fA6IPFFXr4fGz5pULtfLAQPbFt7m1y7S3yq
	2u3xebMO9qXHpkvoVKlUklla1F3lwIyMnrMqn/SK0eTiDe2s6p5DeSuKWQQCN5k=
X-Google-Smtp-Source: AGHT+IHQanfxPW2CcC4hKnkMVwYvaA2KgElAkpb0g6w3+l0Q0oHVnoKZEhCdQCXZhKeHl/8aGWT4OA==
X-Received: by 2002:ac2:5397:0:b0:511:3489:507b with SMTP id g23-20020ac25397000000b005113489507bmr233368lfh.19.1707423678591;
        Thu, 08 Feb 2024 12:21:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBp2VGAIbDEkqCBR+eL3L/pt9z1QVnyLKjRsjGe3EtECzfO5TbNlfgzw7l6G9m0/RtVCLV8ZE1KZB/JfIq7CzKAW6PKZA6e4pJ1wzxByP34AdEjuP7aBB4enXHfxlkplJJg0uA7C4fKfhsSwPePv+rkZBoI0ZRiKmB+bgvb0X6qbkNS0z+IlD7BFBPipHtE0u+uesQzNxsNH18mEnal9X4Bq9tAoZMkz2qm9iFbT3U1fCQEhmim1/GPaQTpbc/mAM=
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id bi14-20020a05600c3d8e00b0040fe5994d0csm402866wmb.0.2024.02.08.12.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 12:21:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] mtd: lpc32xx: use typedef for dma_filter_fn
Date: Thu,  8 Feb 2024 21:21:13 +0100
Message-Id: <20240208202113.630190-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_122121_266469_4349F502 
X-CRM114-Status: GOOD (  10.84  )
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

Use existing typedef for dma_filter_fn to avoid duplicating type
definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/linux/mtd/lpc32xx_mlc.h | 2 +-
 include/linux/mtd/lpc32xx_slc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/lpc32xx_mlc.h b/include/linux/mtd/lpc32xx_mlc.h
index d168c628c0d5..35e971be0950 100644
--- a/include/linux/mtd/lpc32xx_mlc.h
+++ b/include/linux/mtd/lpc32xx_mlc.h
@@ -11,7 +11,7 @@
 #include <linux/dmaengine.h>
 
 struct lpc32xx_mlc_platform_data {
-	bool (*dma_filter)(struct dma_chan *chan, void *filter_param);
+	dma_filter_fn dma_filter;
 };
 
 #endif  /* __LINUX_MTD_LPC32XX_MLC_H */
diff --git a/include/linux/mtd/lpc32xx_slc.h b/include/linux/mtd/lpc32xx_slc.h
index cf54a9f80460..a044b806566b 100644
--- a/include/linux/mtd/lpc32xx_slc.h
+++ b/include/linux/mtd/lpc32xx_slc.h
@@ -11,7 +11,7 @@
 #include <linux/dmaengine.h>
 
 struct lpc32xx_slc_platform_data {
-	bool (*dma_filter)(struct dma_chan *chan, void *filter_param);
+	dma_filter_fn dma_filter;
 };
 
 #endif  /* __LINUX_MTD_LPC32XX_SLC_H */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
