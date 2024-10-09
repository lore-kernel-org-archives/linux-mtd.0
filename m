Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21DECEE355
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 21:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKDdAvtko31Ftg9kAyNYWIutzC2iOMR2n4vS85K56Vk=; b=vWQE1/TS3tLpyV
	/AI2bMM9+1o793YjoUjbrsaxmTOLHm0X13nB4v6Rowyrjbayxr+jJdVOi/OyGxgu3KNhhZui/ueLq
	apmKscGpvSUDtjf40+d4cXGZ0MkMMZCb3AHhk/hYp1hQx53VBEANHw1Ny26VF6jnjZnmfPZRyGJKl
	cDp/NbxkbXF2mVSta47DJSBz7FAYbrmtGZoKlmVrAnMKzvhAApJQ4g4dVCnzJcAKpSdmIvbnhJexy
	WHSL3SOfDOaW94ieLb3GDGPWODkNDhjiQMbWinxzg3T2nwrU/WGmVlR8FSDpxlC8MswWxfPgJXphl
	lEGq1GLbyuJZ+mBOZYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syeeo-0000000ArOU-2Bqm;
	Wed, 09 Oct 2024 21:55:46 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeYN-0000000Apv4-3Irh;
	Wed, 09 Oct 2024 21:49:09 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7e9ad969a4fso154601a12.3;
        Wed, 09 Oct 2024 14:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510546; x=1729115346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omks9Q4h4Sk44JoHLzJxf+QUQKqJEvhZ1YL1d9UMfmc=;
        b=G+1bojzFXYf7QyVhXK6Yv2a3DH9sAyiEuhzYqGXk6mPtgOhZXFz9ryB365sYBme9+B
         UOAqg/zDLvRsqbOptTZuQPImufUWMhCoE10fJ+0y7Fe28stzVgj61DugDybFxs7EHkhw
         9uo0vojUCei5YoS+rhTVhy+i4YqRc7RuYbutoDICVAq3Vk+utqBHp3sjLz3okNj470qV
         Z14N6RfFIriRGFjDx4c5C/dmGHCRC2PnQWNyIYH7sxvMY+pvF9PM3swO0zkhCE7/jJo+
         V1O5R2URtaGxj23sN6jTgYfFjJ5+Mv6mU8wabBS9O0wNycvKuknt32kccrZc1okZkbTY
         WD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510546; x=1729115346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omks9Q4h4Sk44JoHLzJxf+QUQKqJEvhZ1YL1d9UMfmc=;
        b=WDMC5bbdDlo/NX4/5vGiL405zFXqdtoR6JKvODVdKn4nSi76BDkY8mMzZxuYIgvrAo
         ois5K//c5J0TCeSPFNePUX2SpcvDhSJ6eOplnFWdC5ggzfKCCYTPr7moZy6F1o4iqGV2
         C4e9RkYYQFAoTc1vTPpVVqoT9GHGVTnKWCEE2Qlnmd7W1KuDIMBkIjAE6Ge29QKhELlU
         IYXYhq0n0DoSYlvlWpXVcMOfz4NtsIvbN8OJ2UZkbZdRfcApeoU2zeYIhY5ICiahqJW5
         m3PYvXZH9xdOYePxSxHM5J7uWQqiGpYJwW+VzbhIgEzhAQ7lKcrY3ZAX0Ei+4aO9XxLt
         9u9w==
X-Forwarded-Encrypted: i=1; AJvYcCUowtS8Q1N1UfYXwhXMUz6t9iPxRaQC1Sl+1q27IdmZItuXglCB5f5DnPmegHKuJGgMXP6RPaR8U0po@lists.infradead.org, AJvYcCUp3Gp+Z2fF+FE53b2D62uU7ESa94ccVU12zTKEUutmvdxXxZmtPwcCrPp7cL3HK2Y/+GMdPgYFVSdU2LOBqmI=@lists.infradead.org, AJvYcCVJ+IUJPhb7lpVVWKovSDrBdHB0RaR0o4MPZcwOrmiSknFslbI2l2BR0r594m5U0iLb4L+n+6/BaEtasOWD6M+0@lists.infradead.org
X-Gm-Message-State: AOJu0YyCThy9GqiCo6obkArJsvAoOYVI4c/qHkj+HRjUo12rsHwNlIyu
	BEAzDwvkAbiWIGl8mZDhhM3CN9IR3mDjOMPpbsP/gEICY46Zt4vX
X-Google-Smtp-Source: AGHT+IGJTDWb4p1RVq8AM/pshnbsRHxFVfsJRJKLsj6ouxokCYwq4RiFeILnKKSnnCg/FTOOAbILsQ==
X-Received: by 2002:a17:90a:fe82:b0:2c9:6a38:54e4 with SMTP id 98e67ed59e1d1-2e2a2599211mr4000173a91.41.1728510546505;
        Wed, 09 Oct 2024 14:49:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:49:06 -0700 (PDT)
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
Subject: [PATCHv3 5/5] documentation: use nvmem-layout in examples
Date: Wed,  9 Oct 2024 14:48:47 -0700
Message-ID: <20241009214847.67188-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009214847.67188-1-rosenp@gmail.com>
References: <20241009214847.67188-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_144907_848935_6504424B 
X-CRM114-Status: GOOD (  11.23  )
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

nvmem-cells are deprecated and replaced with nvmem-layout. For these
examples, replace. They're not relevant to the main point of the
document anyway.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 21 +++++++++++--------
 .../bindings/net/marvell,aquantia.yaml        | 13 +++++++-----
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index 1c2b4e780ca9..c2cc11286d80 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -23,7 +23,7 @@ properties:
 
 patternProperties:
   "^partition-[0-9a-z]+$":
-    $ref: nvmem-cells.yaml
+    $ref: nvmem-layout.yaml
 
 required:
   - compatible
@@ -45,17 +45,20 @@ examples:
             compatible = "qcom,smem-part";
 
             partition-art {
-                compatible = "nvmem-cells";
-                #address-cells = <1>;
-                #size-cells = <1>;
                 label = "0:art";
 
-                macaddr_art_0: macaddr@0 {
-                    reg = <0x0 0x6>;
-                };
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    macaddr_art_0: macaddr@0 {
+                        reg = <0x0 0x6>;
+                    };
 
-                macaddr_art_6: macaddr@6 {
-                    reg = <0x6 0x6>;
+                    macaddr_art_6: macaddr@6 {
+                        reg = <0x6 0x6>;
+                    };
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/net/marvell,aquantia.yaml b/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
index 9854fab4c4db..5d118553228b 100644
--- a/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
+++ b/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
@@ -98,15 +98,18 @@ examples:
             /* ... */
 
             partition@650000 {
-                compatible = "nvmem-cells";
                 label = "0:ethphyfw";
                 reg = <0x650000 0x80000>;
                 read-only;
-                #address-cells = <1>;
-                #size-cells = <1>;
 
-                aqr_fw: aqr_fw@0 {
-                    reg = <0x0 0x5f42a>;
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    aqr_fw: aqr_fw@0 {
+                        reg = <0x0 0x5f42a>;
+                    };
                 };
             };
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
