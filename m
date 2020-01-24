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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F06C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E6A20704
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AvP+FFfj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYSolAY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E6A20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fGPNxnFp9M3daFI8cqa6MbJ5j9pkQZyKI+fwJ5Y7Ehc=; b=AvP+FFfjt120qiRPtN2P981mMK
	Ez0J4EzlGcq/9PQKBRY2f2AiJF5IaYqfoFPSgaT2iQBLE6pcT5LgfseTfFc9gnmUHD2pyQbcjr8BW
	cmt7l0zVCxChUFt5XSG64bv05HbcIYdd5zCmVVmKGMbf/NAx6/iQPqItqMiD1vcGxIroCHpVequPs
	LYt1ENHi+ctEC/RVJH9XGasVcYRaBMRyECgteMR+/mKTIKa+QSW0FKJaUfzBNFUUUI02Zc+jFKu1Y
	HXu6YCbzGvF+ViDsENDsL8xT6yDrd5ljxYRUGPhfHc783yztuS2sTx6Nc16uqwdWFHzO904/UlIGN
	zz8J4MGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv1us-0006Os-K5; Fri, 24 Jan 2020 16:34:42 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv1qh-0002ZR-85; Fri, 24 Jan 2020 16:30:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id b6so2732188wrq.0;
 Fri, 24 Jan 2020 08:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7CT1HFdVWS9Kqks9wgmn9tKbM4f7DejmQgot2NDLU84=;
 b=WYSolAY6S4WbAez6asDGNrvm9HWgMKgD/rmvi4wHu+pRvN1EmwWnClM+acTJRDPSbr
 uC/nEOUK2eOmah6Q5Ax3HR6Z0vD8Z/MJK6ZIarCt8SJ21BYk3xMJQVol58N2H9M4yYWV
 ZYSxlCb6uygXUNcrZ1Hq/Dn40sXJIqtKJva4FYKm+WGae/dwIQmXBCLu6EdNlhfYGHiC
 axm5UX7P47U0IMyBEXovcN+BcrqbQTMY4gucmaWYL+XtOdp3Vvyans5wjgCljtyqrWfs
 snRj2BRdfiAQ/jyXUtZ64s9+pcu3Od76Dr8JFuGpYquqPWvD9Z71cxV47zHjijNejWdy
 iyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7CT1HFdVWS9Kqks9wgmn9tKbM4f7DejmQgot2NDLU84=;
 b=jDwNGpjgS9X9F2fh2G4lJLYmK4ydD83r8vj1tr3AuBX4HMlG0XDZKAAUFr18HEmTre
 PFn1+9Og8gABvjgWgw+J3MlnCjg7yJTaucHVZiiDRVRkT6XXLTsJUaia+LR8ScxyiyH4
 hNwntd3kYmJJvI/dkak9S919AjTZ0qF47yF73S/+zVXZ+04H/S0EXDg44vHn215Kkehd
 e0EBdbND/DcZgHLvvGUPP4G+qHAr6S1JXZlgnatfjMfQDIPJXt9KZARfIyUoHfGl2PM0
 H40lrqA9/C2PqJ9KjCziQwCVkGi2kU2iLUP/0VrUULrb55zOMQjeDQA0gpauzqIFDFZ6
 fXhg==
X-Gm-Message-State: APjAAAWEY/FDn7ZBlYZ4eeW466zd0FAZsrb+zln5+v+aI+B67oyz2pmv
 I4BOCO/sTd9Br9uanIdDlko=
X-Google-Smtp-Source: APXvYqyReDgSFOPL1dqk0NxO2V+Xd5blLAgfHdZ6znaq9ryVBBfkZGn9OJywGm8Dwc8e09qhMr7jZQ==
X-Received: by 2002:adf:fac1:: with SMTP id a1mr4951928wrs.376.1579883421174; 
 Fri, 24 Jan 2020 08:30:21 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id 205sm1977304wmd.42.2020.01.24.08.30.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:30:20 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v2 09/10] arm64: dts: rockchip: add nandc node for rk3368
Date: Fri, 24 Jan 2020 17:30:00 +0100
Message-Id: <20200124163001.28910-10-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200124163001.28910-1-jbx6244@gmail.com>
References: <20200124163001.28910-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_083023_376184_2939DB3A 
X-CRM114-Status: GOOD (  10.83  )
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

From: Zhaoyifeng <zyf@rock-chips.com>

Add nandc node for rk3368.

Signed-off-by: Zhaoyifeng <zyf@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index fd8618801..22a1feed5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -508,6 +508,15 @@
 		status = "disabled";
 	};
 
+	nandc: nand-controller@ff400000 {
+		compatible = "rockchip,rk3368-nand-controller";
+		reg = <0x0 0xff400000 0x0 0x4000>;
+		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC0>, <&cru SCLK_NANDC0>;
+		clock-names = "hclk_nandc", "clk_nandc";
+		status = "disabled";
+	};
+
 	usb_host0_ehci: usb@ff500000 {
 		compatible = "generic-ehci";
 		reg = <0x0 0xff500000 0x0 0x100>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
