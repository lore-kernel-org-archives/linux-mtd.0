Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4D9C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=js8mzBcXrZmreE53hMklt5jnUZD5G3+9MbQ+aYTi+Ls=; b=zV1Z00LAwKViUn
	UmtLg1urOzfV18+gWMfqKDsWG0EMhCDCOCN/HUCwYmpfQt0V2T0LYnwmHfiiZvmG7oV1Wtdm1+3/P
	IQbls6Xw5HCXkgGpfAsqEIXkinlllKElm0BLZpmZNCzw/JPOSTig9uw2xBCat6fuQ9AOLlf9Xs4qq
	DDVwSmS0/KUxPIUQTcd0Ba5XKI97Q7Pger4Q3yVMKALR6HY9dtjurYTnCSr+v9zpUfAsBy9RmYf7i
	uqA4kZWja56jZ+W1SNmt1qXk4Cbf7Zadd6cKn8TB6JjN6baif+QLG2BqN8zzETpv0Oj1987rcldlC
	tbANdDS0aJhPMWThbTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAFR-006RWr-2w;
	Fri, 31 Mar 2023 08:36:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAE9-006Qau-1E
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id j24so21631982wrd.0
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S8DS7MwX0eSMjECdngcIupXRvdIfBFKmoZZhwAEom0=;
        b=tnfnYtQdWHkb+imXQ5cdS0qz5r299xH4jhkGPSnNJ2hyhvDgzphIZ+JrRafIpmAM9p
         AYZ75Po2o2Z0SH8MZ2PJlbzGo/n61VmC8VnuZ2JuYUqUV2XrQWwn3l07chxkJqnSXjPP
         5f1CEgxiSVpvn2h1nzoHxbtdANfxsiKSj6kGo5Gn+zXB98k4Ll0nq2FYEQMcqg9qKycl
         SaFHJ31SA4vogcCrvZnJv61gFMikTvHDNS7J+H+by9jPFBPOVQx/EaIZbfwOl1I2Oqqc
         0h4V53L2ZH7bwDuc5XrqWaqkZAcFFMRby1EyH50XYnZmPSj9SLb8FRQWZxdM2RBBTVHm
         BCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S8DS7MwX0eSMjECdngcIupXRvdIfBFKmoZZhwAEom0=;
        b=6X8bctvykH1qKJzBEuvGrpJQ9tYYRGjjr+TIBwDoQPsHeqgI3WPWRHTKZB5+yHEvZP
         5Dc1wmA+Mq5UrBUlK4zHekOxVxIkAErPVpQcBelv9//6yMVWHZ6BwFUxEoRylRToYgYK
         fyF/ZR6tS1ayY7EixW5Mkdw/k5KhXi2BgDewN+FNRw7Du3X+N+ims6v7qlLW2exMroTg
         cpr54MavswAkcxUgQLTdhrq2/sgB/wh19rYWohb61dQSEEpZkCdR5MKtz5depxLige++
         Vg+/rrEqCU21H0yB4Xw2FHcXzt3YIVDoPrLncOGEZ+mjSQLoox/emFzGM1ztzqg7thep
         nqPw==
X-Gm-Message-State: AAQBX9cd4/+u8KPkvMwE9gymZfHhnUnmeHBIbi32K/KR5JHAbqFOp05m
	kQ+pyNmQn6n6Q9t/zPLFL1/bXg==
X-Google-Smtp-Source: AKy350bVO2xvOdcujlPweNogfEF/aS/RwRjRN7oD1rhoaEfLODuiLQvDCF4zUxggrf8oM3l2ae/tZg==
X-Received: by 2002:adf:fa09:0:b0:2dd:cb8:2299 with SMTP id m9-20020adffa09000000b002dd0cb82299mr20102833wrr.11.1680251710872;
        Fri, 31 Mar 2023 01:35:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:57 +0200
Subject: [PATCH RFC 19/20] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
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
X-CRM114-CacheID: sfid-20230331_013517_421392_1774321C 
X-CRM114-Status: GOOD (  12.94  )
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
and since no new features will ever be added upstream, mark the
OX810 and OX820 IRQ compatible as deprecated.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
index 2a1d16bdf834..ea939f54c5eb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
@@ -6,7 +6,7 @@ controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
 instance can handle up to 32 interrupts.
 
 Required properties:
-- compatible: "arm,versatile-fpga-irq" or "oxsemi,ox810se-rps-irq"
+- compatible: "arm,versatile-fpga-irq"
 - interrupt-controller: Identifies the node as an interrupt controller
 - #interrupt-cells: The number of cells to define the interrupts.  Must be 1
   as the FPGA IRQ controller has no configuration options for interrupt
@@ -19,6 +19,8 @@ Required properties:
   the system till not make it possible for devices to request these
   interrupts.
 
+The "oxsemi,ox810se-rps-irq" compatible is deprecated.
+
 Example:
 
 pic: pic@14000000 {

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
