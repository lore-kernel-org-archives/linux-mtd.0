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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0216C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5D820704
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jC/10a20";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ttoW4FJX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5D820704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zh7+Sze1jhzIOJS1ynDx2rJ0zC1pEhd+55w1//s2iF0=; b=jC/10a20Vf0jK//FWyt0OO5faQ
	Loh0k4Fwe3FvI9HsBLxAHMDrfJScBAk67/BOEi3t7XbLiI1cckBFmbXadZ+PxDAn0pK1OXfnE4/Cx
	QdxA2Xf0dFi4SHjR+36iTl/D84bCibz95NcB/0p3VYMqr6MpFZL73ldyOyoctQO3M35Utsm4lIClE
	iZPyMqmwaolCxopOs4EW2xl7Th2fkSV8LjacrUNvTtcNyx/JZeSj+bqfw4Df7fAwVdw8hJX0RfIa2
	mErnm7+3XXCYfEtp6dXqjGRwtT0x0HXdHBMUYQRkNJYEqjmm+h7n985JO2EyS77xHuodSynlOFxnH
	Iue8Ceew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv1s0-0003aw-DJ; Fri, 24 Jan 2020 16:31:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv1qa-0002TZ-3f; Fri, 24 Jan 2020 16:30:17 +0000
Received: by mail-wr1-x442.google.com with SMTP id d16so2689058wre.10;
 Fri, 24 Jan 2020 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hYFbabH/1+eJ5tgZu8gLApj2AMrLFA7PILlgYylYfww=;
 b=ttoW4FJX0uyIo4LvuzYHHh6Q2hKvvZTOmQ1R9vyPsn8wHAhh4UrcWnvxbYR6M8Lw5O
 VnfCpwIO34bxDsK2hKHXo/dc+uANQ3V76q0PsA0QV6N9/wTbxci2fcBVupoItf1DH9xb
 08R1vxFYvluoAXgpJjLElER8668aFhH+gda3dQe+uUOvjvIMWNzEqPHbWxNBl/5G/9uT
 6CdZahcOpZG2SlVgZqUGrXL16FPRdM6wNgimndjOqiwO9OxmPoC0TMvbWSwAdJJrGZnG
 rm1RxYAtmNzQNVKQKAVxuFdGYQ7m+4JyGQpo9UhZRqhPjkFVMQhAq0DU3S6fq4cjPgzy
 Nz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hYFbabH/1+eJ5tgZu8gLApj2AMrLFA7PILlgYylYfww=;
 b=F8pKNSforeW7IJPvW4Aj65D8XLVoiQ933iSjI42e37bcWByWv+rXAeLguZsYGeg0vj
 AO0pJ2SUU8U3Q8/9qBtyNUtHBaRIwpyJDr6bJrjoZIYDz9TyrgVOAbYWdIyxHIOIi9+h
 i4jH9+yVQnFmWAYFgCbiQutgyAPjoBC4q0p+jMVwLqN9k/eZG+JtxdGzp+nPJ8QBL8Pm
 zKybyZ18CtS5wfOCgjfStN7alFIwXlxWAcWtVkHMjN6r/uDlaVkugtaLhHqh3eUlKqIz
 uDl6zqgnNYdf+yZjevj+lOW/p5qM1MRkX3uOVyxZT3OFS9hOznGCAWkiRXEqZ78Voouw
 3iuA==
X-Gm-Message-State: APjAAAWnXbB9+MoeUnkYgtFCrLxA3tiXzlW8BnRF57t5t6nSDBg2Uxfj
 vZR+E/ITxo/uHgPnj6QqN8A=
X-Google-Smtp-Source: APXvYqykWcME/KmUDZrrd7CGyy/O95zP9Xfvvz6gjuR9vTr6EyI82sKy8dHM95zTWTcR0vjltX6/ng==
X-Received: by 2002:adf:f288:: with SMTP id k8mr5516067wro.301.1579883414238; 
 Fri, 24 Jan 2020 08:30:14 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id 205sm1977304wmd.42.2020.01.24.08.30.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:30:13 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v2 03/10] ARM: dts: rockchip: add nandc node for
 rk3066a/rk3188
Date: Fri, 24 Jan 2020 17:29:54 +0100
Message-Id: <20200124163001.28910-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200124163001.28910-1-jbx6244@gmail.com>
References: <20200124163001.28910-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_083016_167520_EBCEFFCC 
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

From: Chris Zhong <zyw@rock-chips.com>

Add nandc node for rk3066a/rk3188.

Signed-off-by: Chris Zhong <zyw@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 97307a405..221c30314 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -273,6 +273,15 @@
 		status = "disabled";
 	};
 
+	nandc: nand-controller@10500000 {
+		compatible = "rockchip,rk3066-nand-controller";
+		reg = <0x10500000 0x4000>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC0>;
+		clock-names = "hclk_nandc";
+		status = "disabled";
+	};
+
 	pmu: pmu@20004000 {
 		compatible = "rockchip,rk3066-pmu", "syscon", "simple-mfd";
 		reg = <0x20004000 0x100>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
