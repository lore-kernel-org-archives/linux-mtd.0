Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8FEC2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqeEb0LPGuDRrDPL3ecf7w+eFyxd6GtdKlHmk7Pjbfs=; b=bItUD/eZVcD+QN
	TcnUkWOb2XDIbTcYQAbVR8YNKTnSsAEMOTb1+aY0FdTgUi8rlDSFmkrboG37D+SiZDjcg4Ep8iNVh
	tn09GpmVqiLRzZmpeCGkkFugDljw7+9fVxMkjJClTmNEo0yVO6+uCO3WHMfoY4PYUCtmd4kaINWzm
	3Qu7zQZK00XIg7b+qzA5yqPeDrieC4m/dBdIKH0zjesj0Jb/SxUMMKzB0sK7XomoJX/rJ7lcWMyE9
	1VS8FMx/nBV4dwolO4SiYKYoey10yDps0C2raKU/MUceiNJBAOpJEqxQg4hJGPMpgPLtirQZzmBFJ
	pWoY6rnAPSKJEV1g52mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqem-0000000AlrG-2GH0;
	Thu, 27 Jun 2024 15:03:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqeh-0000000Almh-1mxO
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:03:26 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52ce6c93103so6079859e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500601; x=1720105401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfvNY7tGM2S+4v6UaWLAdWnrWccCsZezGAwDSPje/fE=;
        b=MoJcdu1XAIgMjAs4RiQjkrQti/hELjZ165Ulze8/FqMZ7SKLhbsxEKjfRWNqZc2/9v
         AEWRQCtPOeVv90V2CHUaWhxsvPLA921pNJv/FioWR3e7Sz8DSkNWpSpGoprwYJaWyYmZ
         TUU6c5c9a6MR0aNbRGZhWUk63dbC1odsAxcWfRADfBDYG514NUvq1DxCr82SU1RaMh23
         chw1wckaDUO+Ayo+AWPzc9OAtUE/qfJI/5cIDHmQpnms2BRfF5FIunbaAkUDv8D4Ex+q
         h58DX1IiclKIuBsWUql2Co3r5+Odn1RhHIbxv1mPrvg8NcyHBzyNnfrGfV+Af+oxxfwc
         o80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500601; x=1720105401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfvNY7tGM2S+4v6UaWLAdWnrWccCsZezGAwDSPje/fE=;
        b=lsOGWbdKd5ALC9SaVGIT02ZDvK2KfWJKKJnlmYGMLY7CQGuw7sZMr9V31/xum/efSg
         zqAtkLFUateWsOiBxQGdbGD2rrQg1Frz+O69LXY8TLyS0Ctxo5DLYLeCZOyI14ickcTj
         IlMYSGnuSyKmLa7FckuTIfGVcQlYZJHX636GAqRN0Z4DShvLRzl6pQV+5tX0HJLg59K7
         YNfd6KBuDNyXtwCPO/mDIyq6gzx2WBwVVIvSxJD/IAlQBEBuBis/SBa5z+ZgYeilANUU
         HXMnFXy/oq1HnaJGLtKU9v6HmytdzS/hE+xgk8TmIDxAVwLoUP/T5fzNh9BpLO6yFbWM
         BRQA==
X-Forwarded-Encrypted: i=1; AJvYcCUMmvjT5y6nMlX9HPfWrYpTKgc5K8mc9VdmEpwN32Xe5L+KEeqiHgTeL1890CKQCu/TU4NqrXO6fPYXKDn/DH82Yi3RJhbzPYvOMCifVw==
X-Gm-Message-State: AOJu0Yw/YEEiEiq3ihWCiyS3/6iGzBVOE5GZuePt5R1jHrKMR6EMzSCG
	a3VyGrdHmznUayrdoG9aLdqVr5jrjw+/CqwCV77Zpf/gtd80wG1aNwPtIXUPr+8=
X-Google-Smtp-Source: AGHT+IHllh+sTlu3HrGAUtGTIRMnmFNSl2sKuSvILBbha0AGpyRun3RsrXSjlrG4YcRJnhpgiuUbGw==
X-Received: by 2002:a05:6512:3b95:b0:52c:dd94:bda9 with SMTP id 2adb3069b0e04-52ce185c196mr13457029e87.56.1719500601213;
        Thu, 27 Jun 2024 08:03:21 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:03:20 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 06/12] ARM: dts: lpc32xx: Add missing i2s properties
Date: Thu, 27 Jun 2024 17:00:24 +0200
Message-Id: <20240627150046.258795-7-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080323_610995_5F91B5FA 
X-CRM114-Status: GOOD (  12.24  )
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

Adds properties declared in the new DT binding nxp,lpc3220-i2s.yaml

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 6135ce4dde61..c58dc127e59f 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -240,8 +240,11 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
 				dmas = <&dma 0 1>, <&dma 13 1>;
 				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -260,8 +263,11 @@ sd: sd@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
 				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
 				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
