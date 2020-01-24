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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F269C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 078D620709
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R+g0Ra5p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9DAU6TT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 078D620709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yH3QW1in28xNIoKUBchtv6Xt1NLbLYOVirVOYJYWV3E=; b=R+g0Ra5pD1SKP6h5UbTkLTKQLH
	r2KNWyVh0FIr7GXEb+GSSL/ORKfuB1ESrbS3Nkg1N9H7AJCDjfbdFwR9FCX809c0T98XPkgnFhMe1
	2pr8jJ7lb5/veg6ocIxU9+exdMqWf/vXH6Jlf18pJdML29i+vzlwbXZBX6Z58TS1MjdULsM0syLjF
	T9pYldZHN7iAW1O3/1QO96Ao3t42kYE3z53jj+t+ycEpQNnJDO6oOFXF1NGNvq2Q8SEyRcNkpy+09
	xCDVOFneV2/pXQjk+BRkwprYfoKlVN13CE7yJeNxrn4LTB5t4BxL4QdspqmyPDK4QeoMF5IoKnX4e
	t5CzeK1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv1ti-0005QJ-MV; Fri, 24 Jan 2020 16:33:30 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv1qf-0002YN-Br; Fri, 24 Jan 2020 16:30:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id z3so2724282wru.3;
 Fri, 24 Jan 2020 08:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m4uH+eGyV8vifXYAWHIYcpVOQ6Xb6SMallkR/M4Jzo4=;
 b=N9DAU6TTlHbKO4obm1WBB/8OVkXS9wDNxNScvOY9VzaXFRFu/d/gM8Wp4t8CmSJH6R
 kHQHSuTVqyVx6j2LUZWROmvEjPlv2DOwKeavv4wLM8XBO6nykxGMc3v8BKERBTVCoN0v
 J1TI/MM5xTGDHkGbpZ4mHIqv+Mb/yFqty+XiIUpARwIH2EowSELTyC2EsD4ifvA511ho
 o56I+WptcLEhBOpW1zTOoANtU2wjq+Rb84nkbarxGHN6sniP2hWtV+V4N0iKHxdY35MC
 ZWmtfkj27qFJuLxezcANfWgeyFmKVekOAumEjq3oje6dMAbxfbm+Fk2rRYn9aLRYWws9
 dA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m4uH+eGyV8vifXYAWHIYcpVOQ6Xb6SMallkR/M4Jzo4=;
 b=ZcyB/Wt4G8OH69TuWif8QcVGx7OV0TAdSJcsX8w0kgensdUyfM3t1VPIkZKwGIedD4
 BQte0ikG1Any+T50EhAfsvCWmh0Zuk0l1R/1+UCkbXRaaB+AEtDlz7ROmSTFy0BUVW+p
 f90APMM6E5rRCcOdhfSlhHVAc0jzMbeq9ncxuhk9mcH6pptobRtGlnRldRqjtp0M3S15
 d6GacuPTVnONJbmSF3idNJ4NAdriReR0oqJ0dJojKbbtcKCAwC5o+DSlFeD/h/C50w4z
 ygnqh+chL8j5dLnm9j+4XBN161Yoj5dPKE/ZDVraHS8NtyocNkDG4Q/seI8+g4rv0gW2
 beGA==
X-Gm-Message-State: APjAAAWoD8uRPuVM6y2mTldcwM1Vdyo+NVO+UBGGTKyoXXtOeOfXXaeh
 Va1kvO9Had235xDYmyIg7VU=
X-Google-Smtp-Source: APXvYqxD/FBeeFd3slUqJ5Vb/20lkgUjc3N2O4Q64GE49ZY7NRKOlNPUIY+qChA1pkM9tk0K61fYoQ==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr5156235wru.173.1579883420073; 
 Fri, 24 Jan 2020 08:30:20 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id 205sm1977304wmd.42.2020.01.24.08.30.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:30:19 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v2 08/10] arm64: dts: rockchip: add nandc node for rk3308
Date: Fri, 24 Jan 2020 17:29:59 +0100
Message-Id: <20200124163001.28910-9-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200124163001.28910-1-jbx6244@gmail.com>
References: <20200124163001.28910-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_083021_416702_CC1C5222 
X-CRM114-Status: GOOD (  11.02  )
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

Add nandc node for rk3308.

Signed-off-by: Dingqiang Lin <jon.lin@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 8bdc66c62..a6c98edfb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -627,6 +627,15 @@
 		status = "disabled";
 	};
 
+	nandc: nand-controller@ff4b0000 {
+		compatible = "rockchip,rk3308-nand-controller";
+		reg = <0x0 0xff4b0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
+		clock-names = "hclk_nandc", "clk_nandc";
+		status = "disabled";
+	};
+
 	cru: clock-controller@ff500000 {
 		compatible = "rockchip,rk3308-cru";
 		reg = <0x0 0xff500000 0x0 0x1000>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
