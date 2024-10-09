Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2540CEE357
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAMFZAMtDZIsrPTQrR1zI86lvz+AveMAhS6htI2CWrs=; b=Qgojv4MEc/azrw
	FWg4WWqHA0y7wGZsxzZCNrpf1rE493JSAbchZKbcTPFYUKVyTLWbjNloPk3w9CvScnn1lwOvjW7bL
	KDzY8G/hqtdrTdY6CC2U42uHCTzNlNPopXZsVTEtYe+OCfpIbHuqRU3OPyuKDylzSsJqUc6GHp7qe
	BqmRg5Hd/s9ZAGtYDorW9eJlgyqdUWIq7yLhHJSa8yEefXujYk8l2PUlIJWYH6TSbIf8CUuCgwQty
	G6TQ2Sfi600m0qdZaHyotaf79nbYLXglWhKGPVL+81xDNWV6/+b073EP5qmxXRKAd5YX9ZSBhdzLi
	Z8K9cCyN/WeeG0ZpCOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syec9-0000000AqxJ-3rWS;
	Wed, 09 Oct 2024 21:53:01 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeYH-0000000AptH-0y55;
	Wed, 09 Oct 2024 21:49:02 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7c1324be8easo1007565a12.1;
        Wed, 09 Oct 2024 14:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510541; x=1729115341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=igNKUVvnDtl+FUbV5vtmlNs2XGtARyXzUNMxvftYkcH/hW1Ca0rE2aqL8PhuI77ve9
         WQlYTrRG/yI63dMZ9ecOCMwC/Hh1d/GffYmkho+P3eQPApgjlv4XWiJ4ZvXoh5JUOXUy
         KJxFqSQn4HJN2uEZBQrJpbw1Bli34bpPDz1QjsXNVJ6QwHD3eB8MpC2sawnzcf8QgHy1
         QEUPSSc3+f7km7B+DNiRPkXDTIL4nddAR8hirGpgANSVXy3CdDv/3bldDIfLUs9lG9/U
         vxXSyKVVitBPYl1HAmD2NzsDXXPwuLYPnCv0Sv3k20cRT6nLiHJbTVN0bJ4YADA/p6aI
         91sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510541; x=1729115341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=CKZE8IPf+I3evsFiKgKItIQqra/UIDZ9nl8/Y7CBUAB7elKTGpWQRcbP8lH63vQKiN
         UhzxM9iiohRfkZe1DzHrMkAoBUHpndCU2Tw3djbK9pmebgHr1WKLDJ1gp1v+LRgFGuQ6
         q/vtVdzju2JaJhG1ZlzdrN7fHB5CJ1IygR/EEpYrNlyJCg4GjOWxdb6VdunU7Nvs+79v
         Rr8BsR1/QBcGXZg1AD7G70LeISM3gnVhbdD8mq+G6ag+eo3LjJWgNKwxKi0dodR6bQ/9
         wkxoPSH9Jfj0x2OI1D2t1XGV6voAsgim2UwXhUT0NcVb1/sQorGd+S7bA+JGZRXoTflG
         cuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiXQcf/HttOsgvq9twRvfqKU0Xpo/gwAYvPI5+YP5ZcjdPa6+gHSkpBObBpB9TehF3msoDU4PcWUVpviOtCAQ=@lists.infradead.org, AJvYcCWns+Mu1W1IzfWoZ8N1dd7VsJ/Z3pnsdgdKdfEyATNzohNKGzB1H8bbYMCelhvuYzuc6JXoT+Td5Gju@lists.infradead.org, AJvYcCXMWOXqsxCCxnJnAI2B4TXaa3LluEuNlb8IaZ59t5WMQKq90CeXRtkGby7qCpfcuagknmxpc25FFzNi6FHN6u+F@lists.infradead.org
X-Gm-Message-State: AOJu0Yxht7220SIHKxZvnYvp/5HsP9d+5rlOCAYk7OxV0K7bpKlCn1o/
	YZcWEB5IqKpCav1k0CJGFhssCDHeLh7W2aHLKRMRCAGQR+kAIewy
X-Google-Smtp-Source: AGHT+IH1PO060N+LN83MEtxQiIs1yeGS3MqDF3lj4wBSmoDLk5QqHdMEkb5sAG9gkJ8bgAD+wSlxHQ==
X-Received: by 2002:a17:90a:f40d:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2e2c800c77amr1697173a91.3.1728510540499;
        Wed, 09 Oct 2024 14:49:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:49:00 -0700 (PDT)
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
Subject: [PATCHv3 3/5] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Date: Wed,  9 Oct 2024 14:48:45 -0700
Message-ID: <20241009214847.67188-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009214847.67188-1-rosenp@gmail.com>
References: <20241009214847.67188-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_144901_290499_F89D9213 
X-CRM114-Status: GOOD (  10.02  )
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
