Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E0CC77B62
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eld3aa40Aih9xicf+uiMMY2ZgqqoD80syc+HBfM4aG4=; b=Tcspa8lrJn99q1
	zQR3pzqrC0YvhUkuedQoUGoXrsRTC2RL1C86zK51+8deb4MFjyqolbZZhFQjju4ZMuf5vHNnTeOVN
	iqkvVABin+mFvgzOC3tti2z+DjRXt2DNrgJW37autuLGpNcTbKGL0DZmHb1hF1Gnf135NSMHp+OO9
	um+AtDVIxfZuqMwaPdl/URwofNfkxFpNaDs1WVhVkdAdTmR/jZNIMz0okmwmLfP+8uG4ASTqN6jby
	9u6t3joETuSmbsWcQw9KCSn3bC19Er82iV5d9NDMf7so4arH+aQ+q3GXvrVYE0kX5tFBnAuP/UxVm
	DT/Mnns84wNNFhF7eWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAEM-006QhI-24;
	Fri, 31 Mar 2023 08:35:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piADk-006QMl-2z
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:34:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id l27so21596986wrb.2
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqQMlPFjpwyJDFMp/Q+5qT+SRMNMN9WWVCzGVB/CCjE=;
        b=Z8O/YlVKluZ3frIjBWHinHyf35Hl9tXFgyrb2DvpZeBIUlCdj7trg1eKmtw4ORy470
         mjOyF9tBJQi2Ey8HheeRE65rpBTqzTq9i3mTVsYp3fwCYypvkM8U5gPx6qo1NyW4w1AT
         RfYhDtpld7nV252R85LScU8iMrj1F28/lGNNhzXDXFzbXr5XuNt/qTx3rFv33Dysc9qj
         ng2S0S7/e4gg8Qc0+fK2hotP9nkIwGeMnI0zHMmxfcMcDiw6soURCd1MEiMLog9EoaiT
         Chmx1245yKaUYuvICD7WIsPKuFiAmHnlmK5dBY5gRvaOBgG75ZXytjZ5wMeIuLRKYD2k
         uZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqQMlPFjpwyJDFMp/Q+5qT+SRMNMN9WWVCzGVB/CCjE=;
        b=xXlKSUqCL4UDbrmwgGU9fhZThKj4S8ts5f9Sc9yHr58/J02aZPXiNZva715JLkmyz3
         Du1cQCxA7gZ+GQbBA9bpWV8aIXnXpDcVtXGu4s2c6/zn7Kk87iSa6J6B+ynqg+0L/KHu
         BaK79U5y6jOTmarELGMQ+lqOkmui6esmYkWR+Y22gDyJ3f/EcO1JVgfxD+cs/H+1F39K
         y/bROJLENYv8ULJgoRyYWJ8Bzai+lMVSmW4Wqg6usO4kuT2r8jBUFvUweZ4LVzadwszc
         Kg2kg4laO3D+XTDAQcKL+ui+fONcscNpOEKEbrf8z5/3s9gt9NXM3Gwz/29r0WfZMCac
         OcGQ==
X-Gm-Message-State: AAQBX9foN2bZHJjTWIWngb29wpBR0ouykq8v6wVSs2uu/3GW2v8ow4Ks
	6PBNHhosa+C8sfdaO+eMlOCDeg==
X-Google-Smtp-Source: AKy350aYMRhuGCU7lgJkqotrX72DL9blN95WJq8/pg0rFFj2/jBzU25Plf3PTEmdwgAKOY8ASbmEgw==
X-Received: by 2002:a5d:5742:0:b0:2d0:c37a:5ebd with SMTP id q2-20020a5d5742000000b002d0c37a5ebdmr19721443wrw.64.1680251689686;
        Fri, 31 Mar 2023 01:34:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:42 +0200
Subject: [PATCH RFC 04/20] dt-bindings: arm: oxnas: remove obsolete
 bindings
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
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
X-CRM114-CacheID: sfid-20230331_013453_053229_43A58F84 
X-CRM114-Status: GOOD (  10.18  )
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
OX810 and OX820 SoC and boards bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/oxnas.txt | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/oxnas.txt b/Documentation/devicetree/bindings/arm/oxnas.txt
deleted file mode 100644
index ac64e60f99f1..000000000000
--- a/Documentation/devicetree/bindings/arm/oxnas.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Oxford Semiconductor OXNAS SoCs Family device tree bindings
--------------------------------------------
-
-Boards with the OX810SE SoC shall have the following properties:
-  Required root node property:
-    compatible: "oxsemi,ox810se"
-
-Boards with the OX820 SoC shall have the following properties:
-  Required root node property:
-    compatible: "oxsemi,ox820"
-
-Board compatible values:
-  - "wd,mbwe" (OX810SE)
-  - "cloudengines,pogoplugv3" (OX820)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
