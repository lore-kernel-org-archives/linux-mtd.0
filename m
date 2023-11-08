Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F594C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KY7II6JslXMTJrIQ8Q1V1mmrOaUAb2b5FzbD3S8afI0=; b=Wq4eEC/Yyjw70w
	41Wnk30NyaUOqIAieM6hrhebAdZVY4C2Rshn12+PmmDjBYd8ZB5VFCQG1eDR5DDgkoSCS9KpwdFa3
	tQrEFyPZiD1n0d/sCX9Mnlxw5PB8XrbmYVh3uWyKytuaK2+CwgUTWmzCGoE4aWXgkLIDKtTYXOHvW
	Vvuhlh7R/p30DLu3RlGJlEXFpr96reKW9wGBDQZ6/SeNHNcFY2zVHQ5xmar8hvBT4SwDwNJiQKczg
	r2HNwU64PLbwG7uLoIbvLprDdI+mWb0UNt0aCxyQGxRBl6ODDlbxHCYuhedXIeRXF344/65Eqa2Z1
	lpIwDeUYrhiATkmc5Tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jdD-0041OZ-1W;
	Wed, 08 Nov 2023 14:34:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jd6-0041HC-1w
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 14:34:07 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507be298d2aso9098025e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454041; x=1700058841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XORLfLOVJ2jQDbg32nclaixgD4oigISmdEZzRfl6mkQ=;
        b=Kw8zkziQQmIk48fQWMi7lP62iuBKowGkgnS3YgQNEVQPM8LtQoipPbeUlEXor8fXBH
         RXBZ8BKcTb6a4e9CXPwWyM1UP1QBgU52TuMkI3zQW9BOjKXRk17C1fFY7zDXpO984Wg4
         sWnga2tKGi4WAKBfdu4SlLIOWQjeDi3NjTZIugxVRT616a9JnC1ZJILR6FrfetJd2nu0
         K9QvAFDv6jV417F7bdZ0tap1HCcimdbGNaA9XmzhT8vwJ0bPYdEkSVyjTdx6SRw1lj73
         t91ICYkdV29mk2cSQBCeRIDxWiQUAIW6Z7U9Dnb+H0UT8OjsKGnMnQUdGZUD9pu2kRTo
         YzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454041; x=1700058841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XORLfLOVJ2jQDbg32nclaixgD4oigISmdEZzRfl6mkQ=;
        b=JbcvLL9nCiV2dKhci3Ht9yNeAYl6wZVCnXZ28uI0j433j50ouyeksf6WG1e8vEoUds
         rGQCQcAXJH+p2yoJhomoJ1xWpixGfHLXpG+/9Up1UDpHprIC2AVScMSWAYV62k0IDfOr
         7EmJvcynzos/mOkTSCLNmifbb7R7eyFvepgeaLkjevd5UT82KIKCooO86ZZ6hhcbPcYs
         zyplccazMshhmwQxvWlBvkkjuHTwYGJGCTqxOtzcbePL6y98yr8beO2gG+nWDQSgL1uw
         J1+VU1yJ26zU+vA6dat4xoLmLf65QD+EPLFSkqUTg1ZhU2ox8fni/K37WKvRl/Suc/Q9
         H7pw==
X-Gm-Message-State: AOJu0Yz1i/3pQNWL3d1LvQJmgqOzZBBNBhl1gc82XcGxxHSozVfWuVlH
	BWN0MPOoXRsewoSROlYtz9NHCQ==
X-Google-Smtp-Source: AGHT+IFUUB+MEIyguPoyxj1+fLJV+aOZb8wF1YqAbqWQ7eWQC+wzmv7GE9RSys2AiakbuL3fuZImwg==
X-Received: by 2002:ac2:5d2b:0:b0:500:7685:83d with SMTP id i11-20020ac25d2b000000b005007685083dmr1266850lfb.48.1699454041779;
        Wed, 08 Nov 2023 06:34:01 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:34:01 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 08 Nov 2023 15:33:51 +0100
Subject: [PATCH 3/6] MIPS: NI 169445: Fix NAND GPIOs
MIME-Version: 1.0
Message-Id: <20231108-fix-mips-nand-v1-3-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
In-Reply-To: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_063404_657986_8F11744D 
X-CRM114-Status: GOOD (  14.34  )
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

This changes the GPIOs defined in the device tree to recommended
practice, which is also what the Linux NAND GPIO driver is actually
using.

In the process, fix up the CE and WP lines to be active low, as is
required for proper hardware description.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/mips/boot/dts/ni/169445.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/ni/169445.dts b/arch/mips/boot/dts/ni/169445.dts
index 5389ef46c480..3e7b46d5072c 100644
--- a/arch/mips/boot/dts/ni/169445.dts
+++ b/arch/mips/boot/dts/ni/169445.dts
@@ -1,4 +1,5 @@
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	#address-cells = <1>;
@@ -57,18 +58,18 @@ gpio2: gpio@14 {
 			no-output;
 		};
 
-		nand@0 {
+		nand-controller@0 {
 			compatible = "gpio-control-nand";
 			nand-on-flash-bbt;
 			nand-ecc-mode = "soft_bch";
 			nand-ecc-step-size = <512>;
 			nand-ecc-strength = <4>;
 			reg = <0x0 4>;
-			gpios = <&gpio2 0 0>, /* rdy */
-				<&gpio1 1 0>, /* nce */
-				<&gpio1 2 0>, /* ale */
-				<&gpio1 3 0>, /* cle */
-				<&gpio1 4 0>; /* nwp */
+			rdy-gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;
+			ce-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+			ale-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+			cle-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+			wp-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 		};
 
 		serial@80000 {

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
