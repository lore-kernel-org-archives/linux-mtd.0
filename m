Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F254CEE356
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBP+wH1AHr6/+pNtbcB5uPJ5ZEvwsqzl7fgH6bfySV0=; b=d0M2cDnUmjKmQJ
	4QgIqftkik8mvBfbAe2H2sXOxv8SsOlT8Oe6BRgGCitZXxw5APpmMuCR9k5UMsAzp54L0N3VSp4D1
	vfUAF1Rf+r5fft9V3OdN/VCAsUnab3Tr0scRrcpMtXptlCmaOclUaU/KXc4ykTUBUmjS2y0bRpJBc
	vxrulswf1osjrxW5Xvt1se/1yeFVwcaCZK6qXxq3g7XUXesI0/GnWeRiXvbLX30pbYErQxPB0uCHr
	9W9qoOZZlOgmkAC6kaVmfmp8F5ShGwRSwFxCi4Xl1L9VRsmZuLbxtzroRgeFTrgL/r3E7l2whiips
	/ihb+km9dsQ8WSWP2ZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syeaq-0000000Aqf3-3iej;
	Wed, 09 Oct 2024 21:51:40 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeYE-0000000Apsa-18dg;
	Wed, 09 Oct 2024 21:48:59 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e18293a5efso242330a91.3;
        Wed, 09 Oct 2024 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510537; x=1729115337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjMZ4asDtbZI1OpBAaaU9600/p3BCgdIVo5rxbXzhhs=;
        b=HlgAqDy52ZiqLjh+LOlPRphppYqyY2yvXpEsP9LDJ1gfS4xkjMjSypz8NivGSoEXj9
         f4bcIcqt8feRYNl38G8DMT+AWFQaBoFYNOJ8NHXzj7NdheqYq5BipHCQ+9GL8mw+22m8
         Mr6F7V0ZrCgL9LjlqhFtMVqaf0L/mPoXac8b5VREITn4QYYesVWlE/5G2KxieeG9MXE2
         WLfjA2p5vSfuk/XPmE4sZl6UWL7yVeuKGU1qvA8VLF27JsTs7SrKoDKk6cabzKKebWoD
         7WIv0CDCXKz9j0WTP7cCfU8lsc29PDH6atq8p7BSctyMdhMG/WHqw+fwvIJvHEJzuPJA
         L3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510537; x=1729115337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjMZ4asDtbZI1OpBAaaU9600/p3BCgdIVo5rxbXzhhs=;
        b=Zd3HMeKGLiFjJL70ScDe7popvgM1TIlc3FizieG+oM65K/Z/qbNd3SaGkUTOVmRkPx
         adgOId6qrbbPQqd4uinugDSI8JfuChOCvpAmICPowAHPxBwoID0hnYW8CH4seEqZHotg
         3h7x99f/ovw8nHNb7fF25+xtU1uhJs6sUCH07mLW4WyUFbBybe+lXmGrgIU7Q97hPSxj
         zUi83svxdhtX432B19D0rtvyV7yFVpUPNfzzVTYgWgkX0QjM/RaSvBzfBotDtcdPpcFU
         bQKI7SpcKLmvHWVVjV8p4HEJrHhW7YKOXquIcQpmKhtS9ghGwrCMtAFJiUtptI5cM2G0
         h8xg==
X-Forwarded-Encrypted: i=1; AJvYcCUKQGtPKecQ2OpQQVNuZBxithqorNqhdeT1TUun872d35wjzAVN8hc5AAnsEfSvYSe4z84BUjgbTD6S@lists.infradead.org, AJvYcCUri67rN3tOLCtLmXUVWJaMuXzo3bMBhBNeN2mi6uCW5ebzB0/4gH/FEi/7aPPtRmTn7tXjaA43lGkc5lPs+S31@lists.infradead.org, AJvYcCVKu9/vZMIPWdN+8GcuW5U5MYSphOQCwCLgq/GIKGFhAaxDn2LMWQopU7cIHiDwt0Mk+kSRH/mWvx494jcI7K0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP4mC+bczJHZxxYTl7sibRgJI2Nhld1mfWxrBIu966RJ16HQLs
	23FenkqM0vbS19wsbcUZ14YD6OWGjUlGEHnnNxCGNW90KPCT/394
X-Google-Smtp-Source: AGHT+IELYP0yGIhGAlZNDRXRCQNBpF6TBCDwk0p6CIeGBqN+IhhJq6fhE5zhJrcK45Fi8aeSvj9fuQ==
X-Received: by 2002:a17:90b:d85:b0:2cb:4c25:f941 with SMTP id 98e67ed59e1d1-2e2a2471edcmr4392095a91.17.1728510537440;
        Wed, 09 Oct 2024 14:48:57 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:48:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 2/5] arm64: dts: bcm4908: nvmem-layout conversion
Date: Wed,  9 Oct 2024 14:48:44 -0700
Message-ID: <20241009214847.67188-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009214847.67188-1-rosenp@gmail.com>
References: <20241009214847.67188-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_144858_335581_A9B86DB2 
X-CRM114-Status: GOOD (  10.07  )
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

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
index 999d93730240..a5f9ec92bd5e 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
@@ -144,16 +144,20 @@ partitions {
 		#size-cells = <1>;
 
 		partition@0 {
-			compatible = "nvmem-cells";
 			label = "cferom";
 			reg = <0x0 0x100000>;
-
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0x100000>;
 
-			base_mac_addr: mac@106a0 {
-				reg = <0x106a0 0x6>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				base_mac_addr: mac@106a0 {
+					reg = <0x106a0 0x6>;
+				};
 			};
 		};
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
