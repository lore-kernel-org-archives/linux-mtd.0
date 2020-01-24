Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B410C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C34720709
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqzcyKQw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klhHUcz5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C34720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/tLTC1f9m74IxxK2l+ld9v23/8xoA/ZODZL9Aas5fLU=; b=BqzcyKQwlLSS7V5P25UB558GlQ
	R5kjlqbEc1+YGKHzQPYUM/CLzeDGxp0CF7Lihopydc4VfyTvMKujTWOSj+JIgJB0hC53laP04ZET+
	QiwSbx3Xm9xLfPJuTYQKbm1KoBcnHcS9g7EZMQHJXrp6wvmL3mkArb8xwCQZMYyZkZAMcbKBkAb55
	jGixv6S4iN21uJ0pEfBq6uk+FrRiO8vJ2kixPCyvLaW3jP5zmluYTJZ2FIMkXuDI0ZGwKYnSYAb8o
	QvqrIt6kt5Ag9HfGKU7bnkX6ge4ZY9woNJzDZf0QfUSA7iETDk+htwCx+iSlP3GCINX0slBIY5pOu
	p8MHmzGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv1tO-0004zz-Ef; Fri, 24 Jan 2020 16:33:10 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv1qc-0002W9-UG; Fri, 24 Jan 2020 16:30:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id y11so2714030wrt.6;
 Fri, 24 Jan 2020 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QIn/ekjPN/8iXXGp7E1y+nPWPExusw+RM1dMcjlqWMY=;
 b=klhHUcz554C1wRT2sjn4IaqxVA4Patl8xOwKsmIyZKZJjc29Itt9BaTsyYMCZHIZIH
 egX0JlOPfx0qQIIQuYj2weYwn/Hl3ydE3GuWJ6Gx448DmZR2tj2DRrRQeSxrs21driLX
 n7hPjtACFDRGmlZTrl5PiTIzkpbE4NZ0xY4tWQ6n7hfuqnR/8us/5Mst/ifE85pb9aty
 iNK2bHIbfg+vd3Cu0B/zjLSLagz+Fsmv9w4q28iBGs+pEX1MnI8Wu0ro6C2xD92xlXMB
 aM/FJ00Io64zkp7TvJHNBpgjt97cOj6sijDt81O7HknYSrwRbH+DfejEcMKUUzioo6wd
 bZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QIn/ekjPN/8iXXGp7E1y+nPWPExusw+RM1dMcjlqWMY=;
 b=B+MvbR26pPH4qT8CWEQifkbvgtd0IsWfV4OEqiPy0shD6faAkojLvIxpO2EL65QqDQ
 sZuS7uRkiqZ1/q1lYMsYBU6FTFngjJwco6fJX6tyDy9IXBm+R/GYHXv/Rw260tp4EFL8
 6M/ECoQLB0bnSFjvZrpJ6SVurvd3LaE5K8urRXatZYlo7wK4ppsv8IXREL48W6IIkrFZ
 vY+FFrG3+sJoIhXXI9TXqJMb4WA9/t3O3yLkeOttn65uW+4r1i9y0W0BKh2mAVL/NQU9
 mqu6gLo/oqmhvV5ETOg7NxUzlPDu0/xQN6isyLhOyq/Wob+QeJ2peejIgsua0TYTeUvd
 K0gg==
X-Gm-Message-State: APjAAAXKUTc8Ne+hzu+Y7sf13hGFLkwjCp+lHzDTYUnF+dorgiWyiyGJ
 cRlIDQefbw5if6y4Baj0zKo=
X-Google-Smtp-Source: APXvYqw7CIGAG3ZFB6XdbEJQoiV5N2eZpSn9bhSYo9ISaZGS3uiIABvz3px+HqgatIrQN/6z9wwJ6A==
X-Received: by 2002:adf:f606:: with SMTP id t6mr4960508wrp.85.1579883417532;
 Fri, 24 Jan 2020 08:30:17 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id 205sm1977304wmd.42.2020.01.24.08.30.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:30:17 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v2 06/10] ARM: dts: rockchip: add nandc node for rv1108
Date: Fri, 24 Jan 2020 17:29:57 +0100
Message-Id: <20200124163001.28910-7-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200124163001.28910-1-jbx6244@gmail.com>
References: <20200124163001.28910-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_083019_030075_63C58465 
X-CRM114-Status: GOOD (  10.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, yifeng.zhao@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jon Lin <jon.lin@rock-chips.com>

Add nandc node for rv1108.

Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rv1108.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 5876690ee..d7b9aadbd 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -456,6 +456,15 @@
 		#reset-cells = <1>;
 	};
 
+	nandc: nand-controller@30100000 {
+		compatible = "rockchip,rv1108-nand-controller";
+		reg = <0x30100000 0x1000>;
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
+		clock-names = "hclk_nandc", "clk_nandc";
+		status = "disabled";
+	};
+
 	emmc: dwmmc@30110000 {
 		compatible = "rockchip,rv1108-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x30110000 0x4000>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
