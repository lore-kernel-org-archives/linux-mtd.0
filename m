Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20145EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFyOTxy2GrjiAqMS0PPBJOMlLSzNBePbLAduAI+5n1g=; b=cXSV5LvT4c+5cI
	jyLC1ALzkvqW8UnZeXqWE5GsmQRcq1k4R/mBiAcmCKR6K5IuOye/D6KKEfKGXci4/SZFqpwkbkfPN
	DP4sUvAGEz2TIXYmQmoUTzHbPyKGQ/JdeUEHUS1uaPZA49jld3utOcL0qAO9TCF4RE0iXZL4kC5HI
	H5jrGFcS1RD8K2FbCqCsykAN0gPBxFf5oc8kKljAhxC8LaR6ICMnqJ+Pm8RMFvDricJcoWRlLI0Wr
	kAIcgrJs3MPeXvb0SVgFv3x10lTJwKwH+a9ykYqBz1sAL3FSmE8K2dO7Tl9s+fUqhZ6NxeLQnKyAp
	+8kxyBuz14J8b4Vm+67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHUA-0047xB-1b;
	Fri, 30 Jun 2023 17:00:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHSW-0046nz-1e
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 16:59:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31297125334so1909756f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144339; x=1690736339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RE5534hcGxVn/KNo4nNaHNAogiNWte5Y38IgWgMeyE=;
        b=gR6XOYdMaz4svBnafrAt8z5G3LWrxkXx+DHTJ3rnahYVDf05L/uW7OhXWeAWIqfQVo
         edwrNpWAfmHD/o9eGOgjuDipftZKWa8FzAaHW58dpkijnk56ldCGxmyCK6cPs3guGGFG
         s+8itEyQW84sAG5APGIGylBvPZKRmcrwxH0KM5ZIyKwbUsq0A7pSt4qK5PVnT04kSTbx
         8SH3WgcUUyG2AGIiwSEzrlBfALSCgC+x36PgqYPgBFdktRGSShh5gO4yLrlJRvfmPbji
         GbCP6PJZqhbajC2s8LN0ysfkZ67Cx07Wy20YrtJUyJ9WhQKPBLq2r88Z/kj7Auc6BBjE
         GJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144339; x=1690736339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RE5534hcGxVn/KNo4nNaHNAogiNWte5Y38IgWgMeyE=;
        b=CNl01oyEAzZAxMuluTrDzuBsRhGgqjBofC5GmJ4j8Sq4AJAFyjgK4qBjyRUwWFU5Ap
         kCotAdzu5j8zDD9ORGYYWdR8lNG2opHR1asmZKPdgCSMP3JXcRnOMtkF6kja7WlNdkql
         ejfhiSy+0NaSeWGmodoeAmhbnGabOwj27z65QJOH+o8UdrzSJ2oDHhrM0eWTro2QLUcs
         doPIj8u0Te91j2LzGVvWEaZgHr0kxRHhtjAaEzm8zKQClMMZUxU1Km2WnNR/i1ioYWAS
         DarePD8ZbDDI4OzeeyCIi8nud4M8Kutlaz7qPKdwhnMAD7aAM2LuLPEM8fEw3FO5t7yN
         WJyQ==
X-Gm-Message-State: AC+VfDxLs7v4idK+4NevYwAHi+s/Q0AU0tWZnWQ6dAjQMptCbrXAFpaW
	YjBv3QO+7WaBV4Eb8uHsW6eF2g==
X-Google-Smtp-Source: ACHHUZ67VHZg4s+SYrTR6+84c/ufKS7Q01De9EVEy+1Ktnx9SqhFoXMa/ALr5i7wOY4YYAh12zGPEA==
X-Received: by 2002:a05:6000:104d:b0:314:2c4:9fea with SMTP id c13-20020a056000104d00b0031402c49feamr7004552wrx.29.1688144339127;
        Fri, 30 Jun 2023 09:58:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:39 +0200
Subject: [PATCH v2 14/15] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-14-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KAyf/uprdG2/Uxev0fRE9woiE1KO/ssntpRa1SRTGCE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5ebaeq5y28ag1NJPXsR2UMRtXo/2vvtxyaCAH
 q7bNYGyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0a00D/
 949YBvowHmFLhM/PIxv1RNwEMg/gXdoG/wZrUvr3PALas1Cu0FQTMj4xevGv3DdfS8uo3ctM9oWYV6
 By90JIc1WSNQmG+KCH4hm+/qf5oE+Gw0Z3wEBD3rsvElYFEQ3fwuPrztim6PnbGy8QDBwms1IQIfzf
 h7RLWvZ+E8qGp3eltGC12OHkBIePX0rXXrxjdedr/j5FIw6tA75yvupH2hOl4NrPRBMFysio3ZkDWc
 9M8CG8/5lKHq46Y0YQxGe33JYEliELgFeuQZ2F2wAa8691MAj/qQgGvNkK+p0d3QC8ffPUSwyr3VmH
 5Q25o0x6lw7sIETB+MEPAkNIHmB/T6nlcBZXSf8KPxekM9p89ERPpyZVYu6fgo7AgnHZ2ViAWfT0aK
 vJMjzlAtrNbHtCUfuytjC+4kbC3bDd9vNFE29dLvMuhuZD+DnsX/UoP/WyAgt28L2k8BVEWwSbyCaQ
 2eYdh4Y+6SFl4s5/eClwjOvqKjGKgqEhW8aOec1A+m1QS5VYIk8pHdk0RSKLAMbNrghtIhbKMyQhU5
 860pnYTW31uqEHzSrRV62sO4Jd841tMmNAuImfY91tf2tLKDPYfECYF1tRp4lhsqUy9s8lxoRc4IJV
 mozMYh/oDrg2/3lH8mszi0QhKB4BvSDNTDFh/hQrDLMyXPR5es8ILH2xAzcg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_095900_595060_2A825B21 
X-CRM114-Status: GOOD (  13.32  )
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

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, mark the
OX810 and OX820 IRQ compatible as deprecated.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
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
