Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF10C76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeHj/tZ2lHiFBBA1RrMXa8+IN4YsC4HQ4DG6pLX/jj8=; b=J5/g7Pb6tqDr6l
	3GcA+Pd7XOnR+jKE2j0uNkhqCH59WLs1Wg8SqBcfiMJmasoqzY9p8JbtVMk5GxxO15CJIJaOBF2S7
	aT4wZJpIFc+U2gQ1HOZTOWsCnt88nAYx1yGhC4jefZoNRwUjjMFjyEbjqOP0OV8D7T9ZFhml0nXYf
	+L5RmK/xcnCAo8/+f3l+reG/Oy2Gt4ub13dV4TDxsV98sqsuTlaVU89zO2jT/59ov6yB6ZJz49VtJ
	hrITpUCysHsj8BrSOfpayX9gGkZVHP0U+yOwxWdLJgMFwE/PGE+BLXpSud/VvvHP9OtndSdM0baX/
	JP1hO2sxxdLVi5W1qUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAEP-006Qj5-2k;
	Fri, 31 Mar 2023 08:35:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piADn-006QL2-27
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:34:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id m2so21588854wrh.6
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0V8nry5kWVC4/7uVK2TIBPivIea0+SnMt7iP0mU4Cw8=;
        b=chZXAA03Ktj6cCYt4xjrNnHn2g3CbaZsDusqs4uU9Vhv0+pAm8jD8YNmIH6rxRpV+h
         vZbIeRwPEq02v7H1BQWanP2WxcrxIeZKG+trsgqWf+VelBUfmK5t3LKEmSAqUKxTZ13L
         +G9CVycFJ35xf9hcvHQ/5mpMm4vgT5JJt3pCOGXggW1pTaO5/XGxwGfSkh0l2D4lx3xm
         CdU9FttI+BGLbTmFYxZ4WJMPU0cKt87qQLmEz7fPijrzLc+aEfpd2hBm32tMeL2yzewe
         wa8ggH+56W4skf84z3SrfyGgzpsmcwI8xPuwXPLIfYxeKh5XiRGPo7geoXtpM7Y1dKG0
         wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V8nry5kWVC4/7uVK2TIBPivIea0+SnMt7iP0mU4Cw8=;
        b=zgLBGlbVt4YZVCUj6iv+HuhnkwIaPbe5JG55TWjD/AQaeARwRYWQiwmcfoYrN+1hxB
         4dS7oVeUyaPy3p9+aOKFoCBHUjzDUqKH1oIM0N/S0uJR2QwFyAPtBVAhpociNzFuMrrH
         kGiOlz54cXOv7hUFL6zIo5ch7erNGcKbtmWq43oSsU2h2iK+yKON8a2Up1GXg05eVDV5
         mHDL/2Ekps1ZZE6jQiZp2jtZibd+0MMfjHuviA3RdEGgUfGrI50UxDLr6RFu2/uLeLC4
         JbU4X9jkSF8mzCSyoShmgmQPgLBLi+Zp1clLJWTAKHatx/G6KIXFgKinSL+p0CHJFhMu
         51CQ==
X-Gm-Message-State: AAQBX9cC4WRfSC0FusnGK9THYDfUenW9zOlwGOvinpuE8NdoTYzqxtuw
	Y9YoUl3/oPKPUJ6RBkbwY0GCqQ==
X-Google-Smtp-Source: AKy350bhK+x7s++84IOWEFVO/gMXDRH9T/LCqh08NqEq24KOmp+VFPEpoLewHAutg0wJysva85qmrQ==
X-Received: by 2002:a5d:550c:0:b0:2d9:5608:ee0 with SMTP id b12-20020a5d550c000000b002d956080ee0mr20654106wrv.69.1680251695160;
        Fri, 31 Mar 2023 01:34:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:46 +0200
Subject: [PATCH RFC 08/20] dt-bindings: timer: oxsemi,rps-timer: remove
 obsolete bindings
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_013456_274786_3E8407D6 
X-CRM114-Status: GOOD (  11.32  )
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 timer bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/timer/oxsemi,rps-timer.txt      | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
deleted file mode 100644
index d191612539e8..000000000000
--- a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Oxford Semiconductor OXNAS SoCs Family RPS Timer
-================================================
-
-Required properties:
-- compatible: Should be "oxsemi,ox810se-rps-timer" or "oxsemi,ox820-rps-timer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The interrupts of the two timers
-- clocks : The phandle of the timer clock source
-
-example:
-
-timer0: timer@200 {
-	compatible = "oxsemi,ox810se-rps-timer";
-	reg = <0x200 0x40>;
-	clocks = <&rpsclk>;
-	interrupts = <4 5>;
-};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
