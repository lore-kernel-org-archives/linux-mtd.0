Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C76CC6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTm7k3SIUiWyN8h1v0m9xBLnq/ZcO7D8aoLNluNRg48=; b=y8sBNZAwg7tbON
	kHrBYH5eTXQPRejkD0O8aHKfEYlmAmzqz8acFHuVzh+d6hYeeXp+yzN5qSfSYStwKAjolIPl42m/I
	HkSojR1OBl2C0au4p1yh5uvu62g6LTgpo/i1w2HcE/5fAMP9xKnSpkV9bghJTxkhdfnC4GOvQCnWX
	S3RgvrrkvfWo2HkR7bbuY3MjCQ0/Gq3wl2z1LQD/ikTqmDschJLQLfgUwr0VldtdPdEEgdOVDrLlk
	PaZ+Pyal3AHCj8hgwDAOCDn4euqgSbFcObvvuTEXz0e+I0/ny0Ehshu4KU0N434IbI0Ssq+dS/syx
	KEGLLRZDGDew81P0R0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAFA-006RGn-10;
	Fri, 31 Mar 2023 08:36:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAE2-006QOP-32
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id h17so21570654wrt.8
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wf9SwyOhQz7g6EiRpZy5Wi8C0ELh2QJL8BxOtMQjNQ=;
        b=KOfHL6QnQCbHbqPXUqo6ZvEG2z1yZ++Zi9D2AelVIxvkp3v4CBUgHj9Knl5oyIiOkB
         RrLOU3ZwudVZ4jmfljtYSayheSg0vohkiDofTFnTQhoEha1hc0cuTi9XKRouKDzXZhEr
         J9XyeJo0ntnzkjZsx99LRBmjqS5GHaMww2M2xDFwaAvJzpSGXfs/qmrNrcmQRbSAdJ9P
         xmGZEQokLL06b9oHiwSanHGu2Q5TyyUzNnrPVGdbyUw9MDXkSyki0njbE2Agt7SfqB0D
         D7v/KRdGjRtIvJ2ttztoo255ZEcYzA6ZAXEMdFTzwMRTu+yhrAtLfGcHK4n+pYDtPeRB
         Recg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wf9SwyOhQz7g6EiRpZy5Wi8C0ELh2QJL8BxOtMQjNQ=;
        b=59g1//P5TF41hm5NyyEEQBBX/OdXgqf4GisdtOFxM3Y1xnILlmPq7v6F9EwXj8t26R
         OSlmtWs4pgw6zrs5PghKheLyElZ89vFttpCfI1/BGmR8hRd5tuOLI6s6uNCMj63o6x/g
         FiyqNJFfwkmqGVOQHe6koDKzePi1omEBH+W1A3xcJcsa+q2F+0WjczodkF9txmFL2f/u
         dcQEA6BkIVKeTvyU5ifM7LgI54crLXl3pZvnkxoPSCP9jWsa7+wQSyJxx1Cy1jHHodsE
         uO0W6m+pUtw5uGdMtpkKVFafk3+ZlYWXEne9GQN+hQJlBUkgAO+gIAwf1qdsLJgYTiH4
         F9zQ==
X-Gm-Message-State: AAQBX9fLe5XMDD1UizMDItgrePYD0/POL/rqbOEFeUKRT/3xedbyzchX
	19KD7ONa81lhVN6/0RvdYHiqmA==
X-Google-Smtp-Source: AKy350abqfIAr0v3P1V1HSk/CRdjBgvVisNOx4Kso+mcTsWdfBK5jYsqahojN5zQQJmGitx5MuUOFA==
X-Received: by 2002:adf:ff85:0:b0:2e4:aa42:787e with SMTP id j5-20020adfff85000000b002e4aa42787emr4054721wrr.51.1680251692431;
        Fri, 31 Mar 2023 01:34:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:44 +0200
Subject: [PATCH RFC 06/20] dt-bindings: clk: oxnas: remove obsolete
 bindings
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
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
X-CRM114-CacheID: sfid-20230331_013510_981879_8D5BECDF 
X-CRM114-Status: GOOD (  10.82  )
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
OX810 and OX820 clock bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/clock/oxnas,stdclk.txt     | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt b/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
deleted file mode 100644
index b652f3fb7796..000000000000
--- a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Oxford Semiconductor OXNAS SoC Family Standard Clocks
-================================================
-
-Please also refer to clock-bindings.txt in this directory for common clock
-bindings usage.
-
-Required properties:
-- compatible: For OX810SE, should be "oxsemi,ox810se-stdclk"
-	      For OX820, should be "oxsemi,ox820-stdclk"
-- #clock-cells: 1, see below
-
-Parent node should have the following properties :
-- compatible: For OX810SE, should be
-		"oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd"
-	      For OX820, should be
-		"oxsemi,ox820-sys-ctrl", "syscon", "simple-mfd"
-
-example:
-
-sys: sys-ctrl@000000 {
-	compatible = "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
-	reg = <0x000000 0x100000>;
-
-	stdclk: stdclk {
-		compatible = "oxsemi,ox810se-stdclk";
-		#clock-cells = <1>;
-	};
-};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
