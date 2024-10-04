Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F68CF34D5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAMFZAMtDZIsrPTQrR1zI86lvz+AveMAhS6htI2CWrs=; b=eYj1qCjq/zoYdx
	Q3w/5Hzu5YZ7bmePkW6C2xOo1B1pJX7WJtErFJpoK5zq1NZxADswWRjdWDDXCmF7eGb8D5+5jygMM
	fvDsFhqzRzz7H6UIlvlOX5xDWdhc3lddDLnHBHGW5OhpNDPnkRNCaRaJNe7/fZzTAXg2ZXD6Zf7XN
	ct7Oe6mgyysoXoZnnf5c0TjJM3U2BmWheO3PzAS3hI3kju4gboVcH+o3ICO6RqQ21BqkjLFwtI39m
	28hXmaSSLnt0YfFFZzcgWOCtvzBOa/7S6KcxytBz3zn0tCCQa8+MR2lpD4I8in1W0LyYtDRZtScsm
	g9eTq27yxSXX5leSFtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swVnr-0000000AhVf-0C1Y;
	Fri, 04 Oct 2024 00:04:15 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swVkC-0000000AgT2-3BaQ;
	Fri, 04 Oct 2024 00:00:30 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-718d606726cso1206046b3a.3;
        Thu, 03 Oct 2024 17:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000027; x=1728604827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=IIDofYrGJM9gE+V4ELHm3Ybln5vQebByZgL6hdF6IzESztrYboxUq0n+XTz/dfIsgE
         5cw1OWBWeMSf6041GcJZQGN5Ld1qoQvCvsIKjcLKKbXIRM0Accgtajlkx1kmsLatklfT
         cmActUMaSv4j7FQSROwFh3KcBtQgKKtzCRnlxlx1CIjGwq9RKjp8b4FojET+DfMcJOMB
         MkxXt7GKSFXTWF6+tB2HNgYHLYQl4//5QVVvTQ3gyqQx1c50AkZ5FVqJkuS0I+hA+Fva
         Yr4s0cjcCvFld90hafuXMxxdRJ7kNy/eVwSlauMIKVI8jIy41+oKhuFCNw3MhLNtUGEj
         sG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000027; x=1728604827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=tdK5Sgq/q3Rjx0ZhYfMqRecYwbhIrkQ/7JEbC728Fegjsg7hSjoDvaTXxch/fDH1Iy
         6/XOfuvB4mmz8kg694wHdWJ5w6M48DPkno9o7GWY0GhCSHx4QWx/OZLRcWNOBF8d68vR
         v0ZmGV+mLIc0laXdTAcVXbxgtVOokcpYIFTNO2SPU8bsANoQGXueVUsy2chN29eVRuIE
         AFAEyUsOY4nwzZd7R7jb8Wd2r+eRt8On0YzdcxcHHZnbLzUoPp7a54xL9tj45lAIbb+i
         mzLDTEqFogaN06SOncrdu8XjO13iS/yQQI1Fkc1J5yFn61H/VEXM95khTIHkU9q8Rf4C
         pnAA==
X-Forwarded-Encrypted: i=1; AJvYcCVHZGzsqLDYNC/JZJIbWsHloEdvBaMe2b57VHcCYcG0f7TnwKpl65HV4KnMFbaalz3FgiM8Mil83sPRucD/jjs=@lists.infradead.org, AJvYcCVYK0YkeUoR2gcbX+AXf/XPyy+cn31GthEB49Ddh2+s5oNo9Mv+LnXzW+Zh5IiN4gPU0ZjvGI9zIzps@lists.infradead.org, AJvYcCWIV8fDQwps2yJpTpiif8WaPpo0/c8diCEc0OoNz3Jkc6Rtx2WwIjmpD534ME65ipzM2izQ+CNPIvNYQ/GpIqg0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh3ex1/zTz3SPHkzQWqXNpYRSGdVY4ge//cFLvRkkn/o8gsbGe
	h/GFkam9/bMBiUstT+kgz5uHL1GOBpjP7RiVe8DFnzhcqpOtD0Nn
X-Google-Smtp-Source: AGHT+IFirYSitUaPcXPvdVFW+sI34fhLOYlzJmIShM+NEy17p4CN90ldDLXW0bq76BW0YT7QsOaESQ==
X-Received: by 2002:a05:6a00:3cc4:b0:714:2d05:60df with SMTP id d2e1a72fcca58-71de23e8e50mr1190663b3a.15.1728000027633;
        Thu, 03 Oct 2024 17:00:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:27 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 3/5] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Date: Thu,  3 Oct 2024 17:00:13 -0700
Message-ID: <20241004000015.544297-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_170028_805546_E6CFC335 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index 56930f2ce481..7b801b60862d 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -98,10 +98,24 @@ partition@f0000 {
 				reg = <0xf0000 0x8000>;
 			};
 
-			factory: partition@f8000 {
+			partition@f8000 {
 				label = "factory";
 				reg = <0xf8000 0x8000>;
 				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					macaddr_factory_0: macaddr@0 {
+						reg = <0x0 0x6>;
+					};
+
+					macaddr_factory_6: macaddr@6 {
+						reg = <0x6 0x6>;
+					};
+				};
 			};
 
 			partition@100000 {
@@ -221,17 +235,3 @@ fixed-link {
 		full-duplex;
 	};
 };
-
-&factory {
-	compatible = "nvmem-cells";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	macaddr_factory_0: macaddr@0 {
-		reg = <0x0 0x6>;
-	};
-
-	macaddr_factory_6: macaddr@6 {
-		reg = <0x6 0x6>;
-	};
-};
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
