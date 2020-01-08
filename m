Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4081DC282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F2C520692
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pXtTy1Jl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2Wyve+5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F2C520692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OCW4m0HiY0i/aLbYAX3TxG5DrxEBvpkivWwVsVmwfJs=; b=pXtTy1JlPOIEgfPiDpD6eMDKqY
	7A+ZhTs4dtlmcnQdFrxX5SUCSTZIyr04R8k4PJfkZ0CD54smZZlnddv7wWNnCL6QwYcZmahqASr3Q
	nR2u0RngJXahTRTiMbcJ0S2dhGUFTc7QSd+KBL+0ZK283FuI5T+pV1mTOIHHfsxQa2WBIALWjHK25
	Ht46BBumqXPqXDZQlaM4IX38XKbTB1dSVUQPEaWEWnyOj9XtgwK7LV75CvvI5qDXoIHi2E6VON+q2
	dcJtYkArzYNqnpMsVLXMp6OekMfIGKCzzLzkb5m9GsOehJoNCQSy4sD2UapBm+YocG3Efk2FXAdAo
	CQAVoS8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIN4-0000yb-Ug; Wed, 08 Jan 2020 20:56:06 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIL0-0006Ru-P5; Wed, 08 Jan 2020 20:54:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id m24so412220wmc.3;
 Wed, 08 Jan 2020 12:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FkAincxU/WJ7jOpQKMPlD5I4b01ffq84HO5Ml3sTj2c=;
 b=j2Wyve+5xk5Ov/0MKJBp0yTzWvnwBPmz5aL4zgsz/toTWaQE4FmCBO5aOE75VekrVx
 Krl0GTcgGv3bTnu91YJEmyZJkwfLcrKKuYI3UC2hEN5Liym58QmqPpOO5HDf6oHQgcXu
 D8iHhi0G7sQPBZjcqsYfsdWJAqsT42T08eZCqm1JTzvcE8IjzFs/iDYDCn91TyBzKfTf
 8mu6luihXQekKd4jzRESrQhX+TfEl+UeYXdYX6P52L7M+G/RThnjRfWY6X5Bwi36hfQ+
 FneyV4NFNDGH3lF9nw81DEK7+wsuF96u6+/VK/2aFwRQcGXaCQ0cnJSU6iHw9uBtoEOd
 H62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FkAincxU/WJ7jOpQKMPlD5I4b01ffq84HO5Ml3sTj2c=;
 b=ocWIREM799LMcI/pZdggvRxlPpqBEvl97PMdJ5ymGWHUsRIU1uecVOO+EmO3BinHo5
 lM1yG5k73ggyR4GE6jXUx+wfeYRtLct7SYhiBN8M7hiZ7ET/fADN6g630jENaFuZjshs
 uaUDGc4tI5pLkStR6YVEjhow6/fny0KtEvAwL7T0EizEJbf63YfbahXZ9xQwpdqPHqzX
 1zuV3Zxc2WqapZTl5ccvN+GiUPeCxSR7xPA1KMAhyozL7pmnUxdPN+6BEeOF9aE0wNI/
 DW4BfgEXMzizzXziEecjazqWx/ASVKJrna1eP3BnT6B79a+v578CmrZXgJpsFjAmDUR8
 LJkg==
X-Gm-Message-State: APjAAAW0e8j0IU/Rvd9AL1Ga9QqYtd3LQ0PvQzouLKVi1N2hNpxhIYNu
 qLA0uNN/9Lrw2iRgunH+Oz1RkTLU
X-Google-Smtp-Source: APXvYqzVU6rte1v9V8nFFsc12GcEZAAxNc/vdUN0yEHJsTOtUlwZm6CkSPoIPzCh5PnqJKcAUpyCoQ==
X-Received: by 2002:a05:600c:244:: with SMTP id 4mr580221wmj.40.1578516835928; 
 Wed, 08 Jan 2020 12:53:55 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:55 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 09/10] arm64: dts: rockchip: add nandc node for rk3368
Date: Wed,  8 Jan 2020 21:53:37 +0100
Message-Id: <20200108205338.11369-10-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125358_861244_150FEA7D 
X-CRM114-Status: GOOD (  11.34  )
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
 richard@nod.at, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
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
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index fd8618801..7dff2e221 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -25,6 +25,7 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		nandc0 = &nandc0;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -508,6 +509,17 @@
 		status = "disabled";
 	};
 
+	nandc0: nand-controller@ff400000 {
+		compatible = "rockchip,nandc-v6";
+		reg = <0x0 0xff400000 0x0 0x4000>;
+		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_NANDC0>, <&cru HCLK_NANDC0>;
+		clock-names = "clk_nandc", "hclk_nandc";
+		#address-cells = <1>;
+		#size-cells = <0>;
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
