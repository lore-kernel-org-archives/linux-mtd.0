Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F5BC77B7F
	for <linux-mtd@archiver.kernel.org>; Sat,  6 May 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lrQVxqv5cWq3uUoTegmXMEPHjmPFSt4MQv7YaMxG8E=; b=I/f/IR3rUjndxx
	49unw+7lRPpsWCZB8qeyPhK+WA+ZGV6humlrftc2ovSy1fBkOMS7fniVc0UCLEcT85Qww2iz07gOh
	Ck/VL6ye91WfkuDPkWO6TuH7alLgR/I8P5mq5OXf72AtDPhJDugI/PfYksA9FMG/s9FeOFMZmjz65
	NEMPlttDe4DCC4FVXuHxq8En0UfC6vYKtLSJQcAKRyF+SnFZ3aHPZpjSPdjhS8ylBRZ8E7MFa4bGM
	LigbzzoB1PoPD8SwiYvClyQ7OUtP7LCrS/Ofnx467qTn2+JxLQTu5l8ANd8Ixjuf32Br0nOqxzW2T
	1VIkONNylypCayXYO6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJr8-00DuI5-00;
	Sat, 06 May 2023 15:29:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJr3-00DuFO-2L
	for linux-mtd@lists.infradead.org;
	Sat, 06 May 2023 15:29:51 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f1394cb0d1so3287209e87.3
        for <linux-mtd@lists.infradead.org>; Sat, 06 May 2023 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683386987; x=1685978987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=rhuQY7bo7jkXWsQzOXHpflGgCgLdqnVRcCihN51Y9WQwdrcHNtLEMKbqkNuARXYgi/
         NcTP6lA8O/JTb+wbiiXPdeyw2r4vOVb4c/2oZz7oOvpvX7xszULlw2HX1O9sFU2A36n8
         IQHdV/NcGoUKxnChKWA/OiaSOnxeMS5SuH8leoPO18dpv0pto3li4LFhpNP2QTu/OURc
         jY93voIUXGtjUAp0WAR75xrNW4pkQFozS4OM0KWwTcGj2hLrvevxDLnuSWz7Dw5KMSHl
         J3NhFjjRCU1rsuN6LcF7erX3lQIXqAl3uNGXuJzMIRbrJFcm5OjTPPsb/4/6phXQ9fNA
         EhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386987; x=1685978987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=ND+Dm3EJGOngBLkbnRy2I2p1Zqi70FyTV7dGc7tqkr+YQe63TZ8EAF257tFWWWHRz5
         daZDgdEaaLaGtzFp9jdrdlbCL/MYPE1IN09rx//PybXE1ld35T5gZ84OD6KDSZYoU/6q
         RBkJrFlRlsM6H9cGvw8KruMpaZGpHMQArOlt4gsWTsIyiNgEi5S7Jzx4aGzvfpbB+K2X
         BLEkvW+CNBvaGNtgVANBiBXzSEnS/KhB9o+NmLx+KjoaSlFpbRCUQCvR+nJxN4jf74dp
         AFtXXSuuLjnTdfmzfDl+b/1GZldZ3JmW5gnvGFlkK+4YaiSv6BnfxWpecAo0V+gDtBy2
         DZtQ==
X-Gm-Message-State: AC+VfDzl3Ef68mpAj69A5xVbBzLglZADLQF+7DUac67KZPez+ZGPBM/N
	dQR9EhPdo0dhvfpXz0E0Zgk6lg==
X-Google-Smtp-Source: ACHHUZ4aE6ybHgPo+un8T6iOuQhf3zQ+v7vONYr//+SCABjwwSjCNAQ2+Qt3Fv5hsQU1ukHnWuA0/A==
X-Received: by 2002:ac2:4470:0:b0:4ed:c3a1:752a with SMTP id y16-20020ac24470000000b004edc3a1752amr1189012lfl.45.1683386987504;
        Sat, 06 May 2023 08:29:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v5-20020a197405000000b004eff32d6a21sm680814lfe.121.2023.05.06.08.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:29:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 06 May 2023 17:29:45 +0200
Subject: [PATCH 2/2] ARM: dts: bcm5301x: Add SEAMA compatibles
MIME-Version: 1.0
Message-Id: <20230506-seama-partitions-v1-2-5806af1e4ac7@linaro.org>
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
In-Reply-To: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
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
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_082949_767780_B5B39575 
X-CRM114-Status: GOOD (  11.37  )
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
