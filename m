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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCF5C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B8720692
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BcDV9D7N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPjM1+R2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1B8720692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F1y44UzfBy/BHcE+Nbc7wJkz2OWsitwcObx9V3e6dMo=; b=BcDV9D7Na1ullh+zzt5YweMYen
	JcL5BbA/qDaY8qQ0lFoFl1QDvEayKy6Q+aS4LTvEpiMnvE9/uduYHCodhAz4avAV9/zBh45wNABTK
	pHMh+PReYy8GevLSK0SmgjaB6ebFjUIHAcesjd51cCFAKHPv0hdsEwoXOol4kLGs6MUzjbZdxTfL4
	oEClHAzDVaAs4KS6+LZXOW1C49aiFjQYZH265/lMCtKlNLa6t2/nTaI+uBvx0Na2FBF1CZqjIBAM4
	BihH1b1KFXc0rG5RWCz12Z0I91PycmzHu0Si3/uTn5gPpviHXBigM60SB3pOgneE/dX5YJ0xYJpYk
	CO90Novw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipINd-0001Qj-Ca; Wed, 08 Jan 2020 20:56:41 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKu-0006N8-Cx; Wed, 08 Jan 2020 20:53:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id y11so4921637wrt.6;
 Wed, 08 Jan 2020 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AxMtdkZbidqU4qSegQIGbWKhDhQTzvUyCgxXQsTeiok=;
 b=dPjM1+R2hMGVCwZTYrExkk5iU0B49uue9XETtcEtJTcoRMImhBwubvXCiLyuu317dw
 KpR1dEz6Wx7hAKOQeYeiobvyxaBFA0ZRfa4sEnyzqEeGoM/P7iD5tbz8GEf9gEuChD53
 8CS8h9TGGZSV9BRwPa5UAbFkIcAVKpX8ATkvg+Ljk0Bp/BQHYfzJ060OL1pmKVCiYEKT
 k0kBkxFv0tLhh9H2PrSagNcFQzY6F10KeqiO7pN0zgkL4snpQ4Fy4GmLqjbEfIRy6HGr
 80Ua+dfQ6wD+5ur/kLj6XOnyL2sw1NXnUT8Ofq67YjmngRa4dp0PEi2+FwD1R/nuQV5J
 zJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AxMtdkZbidqU4qSegQIGbWKhDhQTzvUyCgxXQsTeiok=;
 b=QBqalz4rvygt5Dowus8ZLNxX9gsrmQaxE3feiz7NSOQuAogyX4RuC1wN2FHoU51RX8
 awlZLfZqm4jPHiBub0Hq1ZkHK85JDZ5Eca2DW1SBHKc3Yvk/rvkXuqAEK5OXsS9V9SHF
 VEu0d9SMpd3TfhISEL55v67wpGIm9T4VPC1PmwMv1oCJw4sVUW+w4Zw5sI96PxBl+SEK
 jPBx7YNgG/kz1LvTdCBJpsHPQuBTMrFfB238a81qaA0wRGXe79DJLcWGFWsYJOmy28r0
 x4/nucmW/Vibrr+ZyREG0FaFKjrJIzHTmnBqwe32O3rLyszl02jVoN6ZVC5GtdoAo1F8
 RW2g==
X-Gm-Message-State: APjAAAVIUv9IZ8+zATjEMtnORaqJ90QFtI0cssr+vIW+7Tv60rVbqYVV
 JQF1rGJCuf8/jPtYmelQ0Kg=
X-Google-Smtp-Source: APXvYqz9RmWiol10rgzy3SRvE3DRlViUR+ALbAmkaXPnGDjuiszM6MaKzkQe22GqqlG0JDGp9p/e6g==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr6800400wrr.211.1578516830934; 
 Wed, 08 Jan 2020 12:53:50 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:50 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 04/10] ARM: dts: rockchip: add nandc node for rk322x
Date: Wed,  8 Jan 2020 21:53:32 +0100
Message-Id: <20200108205338.11369-5-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125352_498512_59E32240 
X-CRM114-Status: GOOD (  10.75  )
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

From: Wenping Zhang <wenping.zhang@rock-chips.com>

Add nandc node for rk322x.

Signed-off-by: Wenping Zhang <wenping.zhang@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 340ed6ccb..44d612faa 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -707,6 +707,17 @@
 		status = "disabled";
 	};
 
+	nandc: nand-controller@30030000 {
+		compatible = "rockchip,nandc-v6";
+		reg = <0x30030000 0x4000>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;
+		clock-names = "clk_nandc", "hclk_nandc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	usb_otg: usb@30040000 {
 		compatible = "rockchip,rk3228-usb", "rockchip,rk3066-usb",
 			     "snps,dwc2";
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
