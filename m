Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4553CF34CC
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 21:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3rsogE0wpR9j/bQPejoiO4PSp2VU4t9p7l073XxJdI=; b=pftBMLfZw5uO5P
	6/sUfIe3OnUCIpzmJoxSc8xSPzAR3yQdsiIideycm7C+6Ec5LpJDihmBepznR4V31CdWDu2lcqg9n
	n4koq71yCBTy3IilxbRMf0gvTWO1zrPGgapthcaS+SOsa/Bi1nkHFD0aIltCw+ubkbt2ASZkGUwW8
	v2tdu1tXzMdu+4W4LYsGK7CVvC7bWsP2I7zpr/CxD/s/Z6+OJWXUZpg9ArZbFGrBtkOowV4GoFmLw
	B2fkNjH7Fkve7YhrsaS6z1ebgzgcAsMYsDvF+enqunr3CpvyJ6DwfGlI2TDcwNa6lG8QePkL+9jIR
	U9xGAmHuNgumN2TcV2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swTqp-0000000AS49-261A;
	Thu, 03 Oct 2024 21:59:11 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swTpa-0000000ARkM-2whx;
	Thu, 03 Oct 2024 21:57:55 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7d7a9200947so935198a12.3;
        Thu, 03 Oct 2024 14:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992673; x=1728597473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=mVJV8sYyKIPY3bQM/fBRbCsMRxf/4kz3c2HLQABS7ZuXP0wQwNsVOEKBlEJ3s4ZrA8
         GLktz8/HjEed5tnHRgFAb4m12wSlbm52heo9rgyt22nngxa5XWijhacidLcIQxLiold0
         UM65EhhvSe0evE4fADRSOLt7EQ/zlOsg5vhDwXjYN+XhM9g2P7b0I9dQkdNaEv2k+fA8
         EfAaqQFmFjXCfJjPJ82V/2lj68Cm8DBIkg3Zvi/a25Eo68DHWF2JK9sR3kKE0gaeTtuU
         QqyLgjzLoF5XZa4Wqg8Ed1/GJKATDjYGqienEJyAbPWqNc7/thTXZ76MhVeeDKrtx6ri
         Ptbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992673; x=1728597473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=p4N54zHMX+lsDkfjoIPJ/htiHrTOTdlzzhGdDV8QmNTSdP/QZLXSpeyREcdFA5boxh
         63ofmuSVZAIqaslbfQAr7OvmGAXMUPmB+Gh8Yr5C3rGiEezM5f8G2yOZxp+DMuddC+t0
         7lpShrIEdfMuZp+Z0QnnuWN/cyTE6m4M6f6+izC33dC1DN5tRBQpwE4baBF/Atf5YgGc
         uYZeYOfHVkCH+lT2/1GbWYNh5jNd6/DA7ScTfO1wvAxMOvDSI4rUqckCtDEuHTusaDTj
         S6ULzuCFRK+P9T7I2N4kBnmmP7E9RaWFpVAjLf1CO89fNsVCFdQhVX6qc7D+D1YUi+qx
         vhBg==
X-Forwarded-Encrypted: i=1; AJvYcCUZHtHyu08HGAd5o963Plsm1GouXOtS62GIscb+nhCDW+Lu1C31F6fAAX8cyWovyScfbAPTSXgX65hZUKpZn2o=@lists.infradead.org, AJvYcCWIfCisrwpwpJnJPdKNLKO+SEWGDjJFg+kcBts5eU0JqUxlMXMX+ZiibjFyrOdqWZg68fvZvC13aYaRuvdBHcc8@lists.infradead.org, AJvYcCXJ2aPNsHQ9lCbSFkoFr4sRiXHgVimJpWEUqXLERGLvt7QFPFCbb1NdYqcSaL2ab1LtwnHTOOVs2pSU@lists.infradead.org
X-Gm-Message-State: AOJu0YztA18MUJT+xumW+xUz1o05tK6QjeTGjx13zdqQWpCMRBhADBvI
	cTUUQeYSfwyzAxAQRU6OzDy/7wF5Xgb1XGgQL1iYysxM6zOP6x3Y
X-Google-Smtp-Source: AGHT+IHV0ZruXNJv6AzhOrEEhOLFYJ67nUgRR/hs4aYDbbI5bNfk9FeWWoW2cIPBdRwzo2izo5msvg==
X-Received: by 2002:a05:6a21:a34b:b0:1d2:eb91:c0c1 with SMTP id adf61e73a8af0-1d6dfaef79cmr986798637.42.1727992673503;
        Thu, 03 Oct 2024 14:57:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:52 -0700 (PDT)
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
Subject: [PATCH 1/5] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Thu,  3 Oct 2024 14:57:42 -0700
Message-ID: <20241003215746.275349-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003215746.275349-1-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_145754_760449_17AF7A49 
X-CRM114-Status: GOOD (  10.34  )
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
