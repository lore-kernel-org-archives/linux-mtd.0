Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72AAC2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUDgwEYcFsxSFf8NMKPm1viuGq/P8UL3veNCp9B3BZA=; b=QCUnlD0EK7d42q
	r7EszTXW5wt2c+VZgFnLYnIVE45azC9ElSHvtsMk0e8cqEPMWzE7Zv+Te2+dqtu1XH2BBq7ibnnWd
	e/AB4/sPTBD6N1SnHXRIeu13zWHCs9TyH9T4d7IECSuelBvIEr9zWavenFH6kFSP13lgReN6q5mWs
	0xZGcs7wyZ1RSsBdNdMAK7SjdbCZvfTedn8G+tCOPGAGENU4G9Gk/rEWB7Ccgix0Zk66i9g0XNHqs
	sIGp+knnRqsHvo8+ySxrVdeFPya0ZUS+HrUxcCETsh18/s7aiXrWxfqJkjVwVY/5Ipl7Tk8CP/8A8
	eUzwGp10YZecK0wJsBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqeC-0000000AlTr-1wtP;
	Thu, 27 Jun 2024 15:02:52 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqdz-0000000AlMX-3Wxs
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:02:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a7194ce90afso703697766b.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500558; x=1720105358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9ppopi9ppNssy3Y6kMvZbEvjKhcjUNqGrL0dAUL4ao=;
        b=zD/wcUArasPg3fHAJswJT+kjg/LzBo5iwFQIyE8O+sTL52nMgK0yMnsUn3Ut8oNLDs
         /ScJQbnHZStqzfdGi9KMKkEQNrZQkbrUwQRcAZOANHJm/oF6Vjj4KCo0VIYIB3rC6UnP
         eBaMjNsGIDll+f4Yo1ms+eXVG66rbWH1LhlBr4nKSsa54q8uR9dFWTZzRFiVzKZvcAEn
         omKbt/YtjTQwKB+jANuB2kGTbVpwB8vlcHqCHUxufWQE354++mNcfbG0CGLDVkqV0nRF
         ups0IRoXyP5staXuopwYDPe6Bn9MT5r6H+cH9o/IldtpWnnWMAEGrw8lsoB/jtH2rUgz
         +zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500558; x=1720105358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9ppopi9ppNssy3Y6kMvZbEvjKhcjUNqGrL0dAUL4ao=;
        b=cdjQw8kP+bF3kg4CZzV5+A/yrE63SPbLbqTSl62IUe/wDN576mp+BnQ3Vd5JBlmfSM
         YgNMFNHwrB3HhRzDuT7YJcXiY1ay3GFuoxaHKbNMvalJgbXJGp+evnc7JhJWXQXsxXZf
         vTjI6ZvSNmo+YJ9jUci20oehKyOSTpjMtKUGiXqVzaWAMKunwQ0GxT5CE82qdAdp0WTl
         KucVS/hsAkMSnpZQV/cFr2NFRF2So1G5o/q8CBKM97zqUNYjaCeIw065GjePph1gPtGa
         yVoNvx/wQqWG5jWInA+d5gLfwLw8cfkSxdncKhsA532SICAORZB9D2bZ012QOYLMoOMj
         ZzcA==
X-Forwarded-Encrypted: i=1; AJvYcCWoc7YtOIjzbxYOUQkMFI/nsvFsSrRXL8YiQsqcTGXxj0z8egQC7Mq0/g2G5WeWk/u4Y0yzsWiDg5M1P1wQg0qfVZ+T71lD39+Mp2C5/Q==
X-Gm-Message-State: AOJu0Yz/JJGsl7Bs9RMVKj7jYyVbu52mXqZrntiZ1zVYXvz4aOcoa53M
	fMaSLEjoSwwWpXyL5JHIgxJRB0We6ZCpM5bnK9MAmsO33E3SLvJIrcKDydizQBo=
X-Google-Smtp-Source: AGHT+IHNxN4PmRPFk0RxdcCHSntPRfVHwfmOqM6zTS7G+/s/UPca4WGfngbQvLyYCR5O6HreQqUr+w==
X-Received: by 2002:a17:907:6a0e:b0:a72:8296:ca42 with SMTP id a640c23a62f3a-a728296d1cfmr421637966b.49.1719500557261;
        Thu, 27 Jun 2024 08:02:37 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:36 -0700 (PDT)
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
Subject: [Patch v5 04/12] ARM: dts: lpc32xx: Use simple-mfd for clock control block
Date: Thu, 27 Jun 2024 17:00:22 +0200
Message-Id: <20240627150046.258795-5-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080239_972319_1F68381C 
X-CRM114-Status: GOOD (  13.83  )
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

The clock control block shares registers with other Soc components

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..8bf88d141e5b 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -312,18 +312,17 @@ fab {
 			compatible = "simple-bus";
 			ranges = <0x20000000 0x20000000 0x30000000>;
 
-			/* System Control Block */
-			scb {
-				compatible = "simple-bus";
-				ranges = <0x0 0x40004000 0x00001000>;
+			syscon@40004000 {
+				compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+				reg = <0x40004000 0x114>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				ranges = <0 0x40004000 0x114>;
 
 				clk: clock-controller@0 {
 					compatible = "nxp,lpc3220-clk";
 					reg = <0x00 0x114>;
 					#clock-cells = <1>;
-
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
