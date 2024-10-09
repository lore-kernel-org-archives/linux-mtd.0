Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD8ACEE355
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 21:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3rsogE0wpR9j/bQPejoiO4PSp2VU4t9p7l073XxJdI=; b=lI82oNDxkttrM0
	2TFL1KGv+FIBnhC+ctugstEUfzLGyhVzDZRX2S3OXJKREB+b/xJ4RmG/7F5rTP9p8QMcjnwLRusO4
	bFz5t9Pnj9TiAA4eZzkLbUZlpkVFoVjhm1+w3tLJUf1mSQRl2QuDe3iVq3B6XPNQ7enbscH39dP1g
	qQnxzjlq2R2fZxxAlCDM2B3roUTOe4FUeQeZqUFur/K+TWZr+3qSeUwki3M92+xr3PfFCHpB+GKRY
	ACIZ81RjWqGjVNDQ5jTYKBI9O0s7ywcqOzkQWESHiBOarPnpFjqnIa+XJNAB3l7fZ8Y3Ya5BTJKA6
	GEbCu7WiohFtN6+YWoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syeZW-0000000AqFk-2G7a;
	Wed, 09 Oct 2024 21:50:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeYC-0000000Aprs-0VwY;
	Wed, 09 Oct 2024 21:48:58 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2b9480617so254748a91.1;
        Wed, 09 Oct 2024 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510535; x=1729115335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=jDXSHI4/CbZGnspidNijegCVqNCpzXVSchd5kQF3A1uJw2VLcPQ3wsw/y8mbiRM/OL
         NxGqDFocgSm3Idnk9UR14PhpM2tzeFAog/VxVP+YUfsbQY2EjFMI5enPPb5nKFg18g6b
         WZy1poVnGNrQ5EZlrKPift8j+bfPZrl5l0TY3Nlo1KymaeG6S99bo93WR1yPz3Ra+SRu
         3vWpOJUJBgFUcHk6EXiUZlgAZ6njTBRjlOl/z024/GDiBBJhBrP8b7DCE0co7X6IT92J
         Bd42gb1UMxfbUesauZoU9kMwUJWMlW7XWGUPa+lCPF4bLe23ruhTZgb2tgQvOYQ8oBlX
         CMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510535; x=1729115335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=mikfvH+s7yEwexib8WL8A8BrrfE2rjKfrJVPGKmLgOT11+rKCmGB1PRa7DbCjRnoXF
         lJI1eDroLbp1lgXqqklM5zzPOFSpPvRPXKfrBpdiRTj09RDIbARRjWl0CWp0QaCp3q8u
         GX4uIX23QSmUMW4NOUkdt26iTkjduvYiUp7aPANZg1PZW9yxrNZEH+p6+cVaS19MMRgd
         cwSFcdqgYWsabrpiJnfjVNElsACIwzFLn9+mKNfNY1/4c+jH/47qW8DwXgtOxqRsG1As
         0t3rlAfSiGsypjthpXiYg8QDNNeFtjKWzS33UzDnu141WDD6w2ultJ3EnvJ/gnE6pZFw
         MZpg==
X-Forwarded-Encrypted: i=1; AJvYcCUYa5KYHFXHS1mxluoWWJNz+9A/K8bLnk/7VI7y+R4WBe+yo/FN2l5+y5FGMhRdOYF5fbGLRAlTgjgbT0L3RYc=@lists.infradead.org, AJvYcCV78iE54wgdHxmwtc74Ant6KIfwZa9e0hAAgZEbzKt9PGT9dbFZOCa6ElljphfsWOMmCOi9Y58fA+Rt@lists.infradead.org, AJvYcCVjPue1z7XizcjY9sOveELyKUA9Gdk64RkSiqEZjx6jK16gEl7gbtWFlBFOOFU/jS5ETllqf471zihZkpdlFPbF@lists.infradead.org
X-Gm-Message-State: AOJu0YxNFcZ/QST/S6M7zb3q0XRvLwVVfALp93Svzd8oF0W0TnjbCaxy
	1usL1XQanA13DbBvnQOFhpikRbzA83FfyDWLCKqrAJDueXp0xfMhcIcZoJKs
X-Google-Smtp-Source: AGHT+IGhwngumyAYyqZ1symFrdRfFaXP4R+sFpGQBU93XFua+hCTTIL0kqZrLusjEuP0mO4Kr5kc/Q==
X-Received: by 2002:a17:90b:347:b0:2d8:8175:38c9 with SMTP id 98e67ed59e1d1-2e2a2476181mr4650725a91.20.1728510534600;
        Wed, 09 Oct 2024 14:48:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:48:54 -0700 (PDT)
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
Subject: [PATCHv3 1/5] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Wed,  9 Oct 2024 14:48:43 -0700
Message-ID: <20241009214847.67188-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009214847.67188-1-rosenp@gmail.com>
References: <20241009214847.67188-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_144856_589890_6B3E2CF2 
X-CRM114-Status: GOOD (  10.14  )
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
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index 0d23c03fae33..a6d4390efa7c 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -166,16 +166,19 @@ partition@170000 {
 				label = "ART";
 				reg = <0x00170000 0x00010000>;
 				read-only;
-				compatible = "nvmem-cells";
-				#address-cells = <1>;
-				#size-cells = <1>;
 
-				precal_art_1000: precal@1000 {
-					reg = <0x1000 0x2f20>;
-				};
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					precal_art_1000: precal@1000 {
+						reg = <0x1000 0x2f20>;
+					};
 
-				precal_art_5000: precal@5000 {
-					reg = <0x5000 0x2f20>;
+					precal_art_5000: precal@5000 {
+						reg = <0x5000 0x2f20>;
+					};
 				};
 			};
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
