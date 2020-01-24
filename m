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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61137C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 266DD20704
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FOQXmVzU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSgXE3T8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 266DD20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=el/zcQI5xrgmHNLbEV3zj4Wy/G7gz+XDCr+bqpsgd+E=; b=FOQXmVzUMqXYgUuhJhSRGxbgCV
	b8km+KcSb2szsfuSm+zDp9JoLj+QjMvz+ynyMUA7QCV68y0IJbSIPKg/V4IszmNuxuqjGeOSxDmPx
	OzqfQVpoUmHnvvCWvWuQK6P8I2dIyzYimX+61ugNHAEXb3bQE/pSRQauHFt4l2nTodSq7ZAAuih7V
	igG35ILI543qR8D3+NGsA3sGUj32Z/HYoVWc6QVMysGk/9T4PY/kAmGOmhZQfHQTKul/Z7CNWWQ4U
	9OhyeR9OEV5XUrtshYR0SIjnhgZTo+FQLLhHPd8IaTrlSf0+uOj/U0vqh2Zeksx19ULFXrb/PE2Dg
	NijSU0/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv1uD-0005rr-U1; Fri, 24 Jan 2020 16:34:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv1qe-0002Wo-B9; Fri, 24 Jan 2020 16:30:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id q6so2688712wro.9;
 Fri, 24 Jan 2020 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/nBc1idIrTwhJFh2qLcvWt1ZlcdSJDY72KjH7Mzfc/k=;
 b=YSgXE3T8mt/EvF+QBdSHJ+8QtQoLULOKFX9+kmB/k0ZO+uQ/MQJA3Y7awKMrnSU+6g
 fXP9+FuM88lRM5LDGPsE2AKXP6TTCsFqyjIYaMcr4Q8MU2yoRHYmAvcBZHpysGBGHx7a
 SIN+WNlKdgHNe3yHHDaEfx8CWGTbwGE/Gz10Z0Gyfb73QarMhqMx3NBscurLgeF2J23y
 p52IG04Buf1H0FXxIDixiMQta4GxO7pKsKJhzl796RmlvED0xvx2kyRkB1SEVMBi+qnw
 aLiMFbYbNbhxe1bFQq05lTkhFp6ejMQT1xTGhdS1RCZ6384QMAfMNTDt6fNxVofcBu6I
 UzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/nBc1idIrTwhJFh2qLcvWt1ZlcdSJDY72KjH7Mzfc/k=;
 b=PFypT9lzbua4Uq1Rlw0k5vWAEoj6SiXIsTSR5Q6UNxteftbVe+WrMnAwVObRiUvWVT
 y1XhFXrGZSUmN3JcxR4bv5Qicg2yNzLK9zRPVm7P6pFHWf+Vki/Daj9oUc0RMkSb4dE7
 K5RQEpmUcYA12KffUBXspIeCzlt8+PxHIn7tjpE/CiaeQ8ZZfUKbkm6MZBLEd2FF+m46
 erCU+CIvaaq0QsMzc/ETsO85B5ZlGKjjdZwv9MQZuR8cvcz6xd5zp1ILbxAzLtA38Vrm
 MT8vgoAsApIsUfN+tuNjqSyiE4g63itw5hC8cA7urXaOubdsMNnfuOAxaOVFTvrKVX/O
 shaA==
X-Gm-Message-State: APjAAAXmCMdR/3xO6ykPo98EDpEN4y1SiqLEDNL53ClHcuqF+a9PXMn4
 sGak0ndz/ng4VxoZuTOYBgc=
X-Google-Smtp-Source: APXvYqyl7Gc1UX6AHRXTGZ6is7tIQEw78voWTsF408bHyHQ4F4/LAx7SDI0+T/jobj0CLg/ilLdF3w==
X-Received: by 2002:adf:e887:: with SMTP id d7mr5105370wrm.162.1579883418665; 
 Fri, 24 Jan 2020 08:30:18 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id 205sm1977304wmd.42.2020.01.24.08.30.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:30:18 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v2 07/10] arm64: dts: rockchip: add nandc node for px30
Date: Fri, 24 Jan 2020 17:29:58 +0100
Message-Id: <20200124163001.28910-8-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200124163001.28910-1-jbx6244@gmail.com>
References: <20200124163001.28910-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_083020_464437_EEBA7651 
X-CRM114-Status: GOOD (  11.05  )
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

From: Dingqiang Lin <jon.lin@rock-chips.com>

Add nandc node for px30.

Signed-off-by: Dingqiang Lin <jon.lin@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 8812b70f3..5560e5b35 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -865,6 +865,18 @@
 		status = "disabled";
 	};
 
+	nandc: nand-controller@ff3b0000 {
+		compatible = "rockchip,px30-nand-controller";
+		reg = <0x0 0xff3b0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
+		clock-names = "hclk_nandc", "clk_nandc";
+		assigned-clocks = <&cru SCLK_NANDC>;
+		assigned-clock-parents = <&cru SCLK_NANDC_DIV50>;
+		power-domains = <&power PX30_PD_MMC_NAND>;
+		status = "disabled";
+	};
+
 	vopb: vop@ff460000 {
 		compatible = "rockchip,px30-vop-big";
 		reg = <0x0 0xff460000 0x0 0xefc>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
