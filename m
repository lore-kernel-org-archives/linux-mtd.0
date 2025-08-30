Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFE3CA0EFF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Aug 2025 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hknlk3eF1Np3wD88ccEM3at/YIBi9lVFUpMvRTQTmJ0=; b=Eeq1Fb3i3b4Zd5
	kko9oewKYcShqjgPnnkJ+vw3b7YYkIDRcZRzg9T0hXJsAgM6U9dqp5SThX22Qi04aD5x3jMY4UXRK
	2DrR3Ym63GvTOa5Hz6LOIdQENJtzkrG4Freh2Vfhue/qxsTZOzoC3TxjyEBZ+hWqs/bjkOx+09e0n
	h2jrfSyVfB1N49Wm0BWPDttWwEsKN/OyS+eR0y7942Ky/L+Bx+moSuqXvnCbnhkM24eKv34HMPfNS
	MFsK6K45iO12qoSeJj7EbTPvRLWPb33ck0rOYM5ktbPeq2N6T6Y7wUTl1xqPI+dAMnaaIMUOo2IuN
	VdhX/3pMskcU1WaKctzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP43-00000008CJz-42X3;
	Sat, 30 Aug 2025 17:08:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOx3-00000008BZU-3yM6
	for linux-mtd@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b041264542eso3674366b.2
        for <linux-mtd@lists.infradead.org>; Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573276; x=1757178076; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJLZ5CKo5DabaRRE0JZ2IWfxRuXGLF8UirDus01xVko=;
        b=doLE9MFOiEf8wXIEDb6y0RHFUGLOghb+6vH8vl/QJs2fe7KsFA7Fux6cvYE0GmhxRY
         WzQx1rFKWGjeKaj6artpULDZBX+k3FTq6mgWoE85uX6ha97vzDnxI5KSz1B7gDD5g1NK
         PiyqWybjCSRyOJSrFz6kTav3BgM4vpO5PaDWyGDDFuScinXvZqSsUQ4fTZA1cMhteOUG
         ZXMHbeT7sCnUI9Y9MIrAb0eXfLTGIPm/ohPiyZynQKQ/ZTSivlQ72euCstViQ7pykRXl
         nHxO/CzagHrIGEGblPcGv89jr+3domGfgw0RQDR/N/uUeX8tdFoMRoSKkKr8v2hC7UCj
         Xa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573276; x=1757178076;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJLZ5CKo5DabaRRE0JZ2IWfxRuXGLF8UirDus01xVko=;
        b=AkXENgKHPYsbNwg0N/7ZzcIw2v1KOUrNZijOow745CMoGRBwIjuhz9un80HoQ0HDiI
         Zjr7RI5XAcu5XTaVLiHPdmdSh858koA++qLTxJvMbUA9gxTOLkADj3A7TTUiGC3VMX2a
         ISVaRlyjQPpaKCLjTLbzlQuFWVc/EBHh6OqGiZrMgx1O7AR64S/pTwyXlMqwFAXtgF2n
         HIti1AFwpQ4w8pwmLcBM2BCPYGINyNtyM+RSv+AESW+KAcUl3eBT+oGw4tGMN5kDgCTQ
         AsRJ+sDsuM3YMBMwUhQvzK4yAJILybE8pgLvzhZiJ0UQaPx3ENnEcG5IltAfymNUgjHx
         FReQ==
X-Gm-Message-State: AOJu0YzID2RgpuvK3060Z3vAuSmyfPrkPRXYm0vESXAcS1+OjQC5AzWx
	domGqkvo16Oe9AkKET2VvH400o2MAS1NxvL5P3IZNOGiMTvTnYbj2x6ZjRhYlhXErqZw1PpyuZq
	YiED8
X-Gm-Gg: ASbGncvYT1Q1MDhUPKYk5hGhbdrd9sQAFsIEOm7m6P1UHE38fpJDaYPbjTZN99XNwBp
	vtto1R4thm6Q2rNSKIaXQV/ZDObZQ+mmKGyroabmIX1jFU8TYQW3hL6waYZJCQ7Ym1wuwvcxW8q
	5RhZ8w98Ed35Uy7wQd4pxiLLcjaexAUPzcmHLS0IjtnF13se/wxRdBhJczsLzeWS94TXSS5B3sv
	Y8P4rzudJ1e2kWJQ65/elNAk6SZSIbWgpkWnKEKApfXqDVGd5/kCLpHaZFTB6WInOpD7cv4LAgP
	zlHlCmMZNY7Dnz+mJ/CkI7QoDfZo0yBR5aqUdiOer88q92arVEAkIWJANem6bWgHFokyv7ok2aJ
	hWS/d05HbNhEBHygmPpqh33Mont8wzijpPjhEOpgfhaLMnYyGng==
X-Google-Smtp-Source: AGHT+IGwW7z6ZZeWMRWTPz9Z3XwH2Y3BmJLkP+pAxyiHYWItazh7A81qCVLqms2areFztK92EQUEqg==
X-Received: by 2002:a17:907:3c95:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-aff0e28a1demr277259966b.0.1756573276279;
        Sat, 30 Aug 2025 10:01:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] mtd: rawnand: s3c2410: Drop S3C2410 driver
Date: Sat, 30 Aug 2025 19:01:08 +0200
Message-Id: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFQus2gC/x3MQQqAIBBA0avErBuwLJSuEi1MpxqIKZQiCO+et
 HyL/19IFJkSDNULkW5OfEhBU1fgNycrIYdiaFXbK6sVJu3R7+TkOlGcBAzWzL3tjAuNgpKdkRZ
 +/uU45fwBRz7XeWIAAAA=
X-Change-ID: 20250830-s3c-cleanup-nand-d87b5847ad10
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jRpxpUf4uEqnnfvpWME5IzFTj6kezYWwWNy6sI9Jnlc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5W+DzfByrBp7P1cypFBMFE0CLR2K5gNj6mx
 kR0wWKWBmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuVgAKCRDBN2bmhouD
 1+eVEACVF2Mpcy6HzBCklOTJZflAQhOnWjfatgC59+l3hDngiFdxrTn7vIaugnHzXzVlGfvQf/7
 YoKm5zM7h2AVnRUNma4I+mDGmOFCQBmEpvk3YU9YFUOfkmM+CoWu0/PsKsvyUVqKZytmEuwvple
 5GDHSCkUsQC1Xf1S/KkE/V9wdPBGRXIki5T6JOcJkDksc/dgq6DTHOxnwFV9p9i9Nj1ITA+2hDN
 O3TVyJsWAU3jHlmovAXZr9yNq9ilT+05by7sIJC3OpyAKJfED03j3E3m9kKV+A8ebjLS65C10mW
 W7+HYdMHQCIg1qkDMo4GSzcEEVo3y1DmPzCEuT4fy98aQH8ECV3znQbn1yah9NReptaFDbhCSDm
 nYzLQdCDeg4EZ6+LqUXhw9B/IYiVrxcSrDT3MtOkdwiAYsVPARpdHfbZLi3pahLHeGTG3maIG/d
 za1pf+vxR7Ar5Ik+5jBVDjg1izKKz3mglIBmkf17Np2ZAaQH19UuBSL58Tu2kfzTAaCT1RuH8aU
 FhRnF9FTDeVRibJHEFnfpbWP5DHd+Aymtfai6eFstznmLlqUnn/f/fr2uE/zMXUueJCOoUGoEQc
 8SLDl8E8GNekwLgKnVG/rmCBRbx4b5XbSyZVPQ9Zam7oAx1M7Xcd0wrdBrN3+YsxkrTDRm+tuRb
 kBY0supEFn1RWxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100117_992901_E566AF5E 
X-CRM114-Status: UNSURE (   5.73  )
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

Drop S3C2410 NAND driver because its only two users were:
1. S3C2410 SoC: removed from kernel,
2. S3C64xx SoC: does not reference this driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      mtd: rawnand: s3c2410: Drop S3C2410 support
      dt-bindings: mtd samsung-s3c2410: Drop S3C2410 support
      mtd: rawnand: s3c2410: Drop driver (no actual S3C64xx user)
      ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410

 .../devicetree/bindings/mtd/samsung-s3c2410.txt    |   56 -
 arch/arm/configs/s3c6400_defconfig                 |    1 -
 drivers/mtd/nand/raw/Kconfig                       |   26 -
 drivers/mtd/nand/raw/Makefile                      |    1 -
 drivers/mtd/nand/raw/s3c2410.c                     | 1230 --------------------
 include/linux/platform_data/mtd-nand-s3c2410.h     |   70 --
 6 files changed, 1384 deletions(-)
---
base-commit: 4e9ae4ca11b35e6a3e9a1175201d8c55406d9301
change-id: 20250830-s3c-cleanup-nand-d87b5847ad10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
