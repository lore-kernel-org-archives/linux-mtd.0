Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278F3CF34CD
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 22:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T66wdr60CWhxJ3blGYBP8lWYPOl4M/CIhpf0L8OFqMA=; b=LCcDRBI7Xdp941
	kdnwjTVBzisZMDU3XNKdgnqZSEZqasX5UntXNmo+QPpzp0SM0PDSYtFC9fQxEgQCoCHPRx8BUfgEk
	RV9rF4EE1Je6wtGoGkAUdM8vcez5/kM4UEQXwXPhBsEmOMjBmPEQQLYgNpn07Eu5FdX/Fw448XNSE
	lf551Z/cY50O0duc964W0LX/JrCcbN7BSmkbu/PSa1WPqIWB0IX5WgqQgIL2wU5WicuGJgejk/GKK
	PImjgz8W7HJ0YfJCwmYWKOKnQL2j0776x6t1RVFMgU1c3X6cIiL4aMRFhyIS07OtfEPK3hWNqvkbO
	4pBpZg6wkLsxK+YsxNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swTvk-0000000ASzr-3OIo;
	Thu, 03 Oct 2024 22:04:16 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swTpm-0000000ARon-0LFT;
	Thu, 03 Oct 2024 21:58:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7db908c9c83so879164a12.2;
        Thu, 03 Oct 2024 14:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992685; x=1728597485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoWKDt0SpQuuIThiGyg8a6unwje1fIaaXWcdpLVdhAs=;
        b=RrUUM16ot4GUFW+r4as8rVBawGW5Oh2b7nxfLOP3Xeo+4lcAvoNtaQkJI+Y+xZVgSE
         yJ1OrZBPP5PYNG6QDWlgmljcLmubdiAQTSfwcqJn/CayaUZnc+c7E29WtnJ9jNiOBkAG
         F5mVyXExyf+IWcp3hI4NrAm+tWbKL0ILcYh12BMC0EiyKPtOrlAfGVeuXj4KSU0e/NcP
         aRCK6/O2p145aI+tKDlcqBJZ0PeCki3QE0ahcFP+EqXIpMZkhcxgk3QGBE6rpbQvOIyq
         iET82i05/T22GfLNeyJjrVqU/ltov2gQ7GmdPUmQjIpoKLBafZ67OVU7E3mO3itKHK0W
         d+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992685; x=1728597485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoWKDt0SpQuuIThiGyg8a6unwje1fIaaXWcdpLVdhAs=;
        b=xBrDpq7ZEhvT3IerB75Q4JIvB0THN7ovSIbuGXeR96SoWi7GTMklB/J3Rr2TkrR19y
         Zu6B1KU55M8RKp3bAflCGQvWGDZu8o/0P51kMoWrAvtcyxpA3j7kZqb2jSDYBaYA9Fmo
         n4ufE5DY7ikLAILw4ButXo34wepnDuoUSFQciHtqsT964Cg6f6TIG9EUdiOL7HB1gQkJ
         K7FiE+hWJcRSnHfdpdPinUu6fymDnlSCJufa7fCG8iD2NfUIn4PJj8CL/o32ZMjJN7K9
         G01uoUn4I9euHe5cT5aYjnLkGFniXZ96RC829uAt72Yft9zULACThWZFabU6YaGf3j8d
         Md/w==
X-Forwarded-Encrypted: i=1; AJvYcCWVThB92j1+5dBvUeW8QDQdJPZuBgbOmoyfabnzLifgm/ySD9dxoA5mxPZICqPDDmDXCdzhAdLYzOlb@lists.infradead.org, AJvYcCWrtHpAFlfv9Ss9pqNlGbg00b2YowcKkVkPgOwY1QAAkoo+MJWJgo4/OYpjI8U4rElk17DKk1nlhISM6T99qDd6@lists.infradead.org, AJvYcCXMSHtwCv1zMUfXDYlAA4ATnss1dRfFarPt8tQvQYaYeQPfDcepTbi6SfrAW7CsU5a1KDZ2vv+H7Cgo8EpEXqc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUoQjl6rEHJigYq7hCiCNaYJXD06tJVM5kFf6P486Nnjeavsp1
	x6wvKM7o5VSS2UdhlzW+JWj8KgZR1CyDYqE+KU77G6LWK/lMjRNC
X-Google-Smtp-Source: AGHT+IGKkbd3xJEakgda96Mzg7E21a6ZE9bsKsHRDvZzyTa8MLym/gUdPLpgQwzRTLIL4veRP+kBKw==
X-Received: by 2002:a05:6a20:9f0f:b0:1d4:fac8:966 with SMTP id adf61e73a8af0-1d6dfa27e8emr889256637.10.1727992684786;
        Thu, 03 Oct 2024 14:58:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:58:04 -0700 (PDT)
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
Subject: [PATCH 5/5] documentation: use nvmem-layout in examples
Date: Thu,  3 Oct 2024 14:57:46 -0700
Message-ID: <20241003215746.275349-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003215746.275349-1-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_145806_142507_3C710B2F 
X-CRM114-Status: GOOD (  10.58  )
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
 .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++++++--------
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++++++-----
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index 1c2b4e780ca9..8ae149534b23 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
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
index 9854fab4c4db..f57a6e7d0049 100644
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
+                    compatible = "fixed-layout"
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
