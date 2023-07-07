Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F0CEB64DA
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lrQVxqv5cWq3uUoTegmXMEPHjmPFSt4MQv7YaMxG8E=; b=rLDoYV4B4F4dpi
	bk0FRUH5FcxDLv3yA1+qw200HZXWg35PTmeVitYWV7QwVu5F9R6pLvf1R/5FS86wCVrOzClhlkN+8
	2rYB54Dk1WfgJdRa0CgPDigUVfKERsnq54Q4xXjYyn6KsqTKW7balhhEVTLPGhZHMEWuQCSQz/2wu
	VRoBCY5agv8sHCWqZdl7L6qgnpCfecRsYAWky8oXvJp6s42h1euB3x6klHFk0FWoxfw3OfBYIXa1d
	10EQqCSFeY2tOmlyTHoU9Rwh7mS4EJCp8Potr77XvcSbRJSFfnNkY/jIxaUKcQWGGYCpJTJyv0eDJ
	YfoIMXPHiJeRyvBTKVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpTu-005KtD-0I;
	Fri, 07 Jul 2023 17:42:58 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpTq-005KpU-0U
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 17:42:56 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6ef9ed2fdso35105091fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2023 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688751766; x=1691343766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=zTQr0TfMcC4DlfkbUXm72Nl/XQ082bNObmI1yt8HMIW00TtkJeshukWttKsGR+I+8f
         3R2/dEQx2lxEUYIQMjps10V3ctk1wUJZlPQD4GBQnnHBxVaUIs8t3HAzyTGVsH9pDn/B
         sjpIygG3CckbYb9qVtfQ6n88mWrvy6v7fTw6xpLMgZxofqyneKD63sfi0EplDCc6mO4G
         vyLLAljhYZLmuRw9VkeS7YfIryYvhHTHWKttrK5yTA1eMSh2tn4Ox2XgXhq+KyfrtuHT
         4TfQwB/IEL5bdLLE6npGDdvVkIGm8UZpcejWnlAJ1kIdLFvxkdZeglH7MuGLySBZ8fMZ
         ndVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688751766; x=1691343766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=VAZJC4H6e2iBEaUEf8MjpGgbRGKiUftZUGLMGM332ciS/wHUAkk0Ng65q0apa6BzIk
         V17dvoPMM9O290QUF0sbVtIuQY9y/8tJrGpOCEzQQeFOjHEV8qFKvjjKn0KfyEBzKu6y
         EhbynMLn6k2B+AdpjJY6PpdaAGT1tsnLXFtohUfHvg7tPUU6nlpub+E9Ghm8fqJN1Jc1
         T8iiZtuwqJkrZfkZCRW/ZPswBt1WTfqWSIeQ7jz5BAs4H+gNPul3Z2xJv33x1P/qO5CX
         hqRZofwYZWgWPEZuJBAH9BUnTShGH6VqiCbjAwxVyDcdM4g8Jk7IUPgMnTJQXoI9uR1D
         nL+w==
X-Gm-Message-State: ABy/qLYdh4/aeeIbaVJ/6A/newfRK1z/z/3oHZJHpeRMMAdaqJEqYibA
	9K/sP9oHJhKccGspfCuN+3PzNw==
X-Google-Smtp-Source: APBJJlG58ikAkD6LHQBmGvRh+KpXB7nKpIJUjW3R2c4WpdveO+EhTkm4mWQdrN4UErqYnbLF5zcjQw==
X-Received: by 2002:a2e:9a86:0:b0:2b5:86e4:558e with SMTP id p6-20020a2e9a86000000b002b586e4558emr4641825lji.38.1688751766423;
        Fri, 07 Jul 2023 10:42:46 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 7-20020a05651c008700b002b6ece2456csm859163ljq.121.2023.07.07.10.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 10:42:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 07 Jul 2023 19:42:41 +0200
Subject: [PATCH v3 2/2] ARM: dts: bcm5301x: Add SEAMA compatibles
MIME-Version: 1.0
Message-Id: <20230707-seama-partitions-v3-2-6aa9391b46bb@linaro.org>
References: <20230707-seama-partitions-v3-0-6aa9391b46bb@linaro.org>
In-Reply-To: <20230707-seama-partitions-v3-0-6aa9391b46bb@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_104254_192020_055D84D8 
X-CRM114-Status: GOOD (  11.58  )
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

This adds SEAMA compatibles to the firmware partition of these
two D-Link devices.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts | 1 +
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
index 555fbe41dd8f..cf3000b07eea 100644
--- a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
@@ -33,6 +33,7 @@ partitions {
 				#size-cells = <1>;
 
 				partition@0 {
+					compatible = "seama";
 					label = "firmware";
 					reg = <0x00000000 0x08000000>;
 				};
diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts
index d945a20b06e0..3551f855ff20 100644
--- a/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts
@@ -149,6 +149,7 @@ partitions {
 		 * partitions: this device uses SEAMA.
 		 */
 		firmware@0 {
+			compatible = "seama";
 			label = "firmware";
 			reg = <0x00000000 0x08000000>;
 		};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
