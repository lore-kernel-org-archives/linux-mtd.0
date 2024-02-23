Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560DAC54E41
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4U/xUUpWuCv5M7eTIXAfdmfyj5f0iX06eGlD/oyZyxI=; b=m69NMC5OTmOH7U
	7NQZ2bYn3YJ3fJ+uZPDsXWE2lZC7gwa2TIclgguvgJnyjjk/gTsvcVPj5NYkxvGMEyRtH/AF0NPkK
	PlBIMjr+cbPiDnoug3pi8065bJut+pMhxVp/gFRB/Sdv117kwySxAiagSzuF/iJRcRqQfdz6vU4QU
	JguslDKSVkNnL4v4owQEPNyrMZw1yJqUiwiO42coz2ZGKaCQc4hgOVykQayU/WcX8DqB2mq8Rx4up
	vPaTMEl4+FvQUv8nWYEDC25qWLY7A9//268eD4nvKCg106dxJrDkl3aIYTVT1982x75TKKF1SsniI
	+slzaQwYqH3LtifM960Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMbe-00000007ku4-3DbZ;
	Fri, 23 Feb 2024 03:52:14 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMY8-00000007jbu-1WZ3;
	Fri, 23 Feb 2024 03:48:40 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8D4D9C001C10;
	Thu, 22 Feb 2024 19:48:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8D4D9C001C10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660111;
	bh=w50MmwQoRzVkuX4F/IPvMazeJ04ok/bzThtfo0MpKFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJmsP4vczPk+TDrmhnZPh36fICCN+Ihc9+w88ZGBJPbR6Qlgex+0Km8gJYMWFUO5u
	 a6OhhkKUPeNwfDAgJ1r9wdSsEyMZm+B+yTiwzHk4ltif2mdmTfn6OOgscK3uOpoqtq
	 3uGNKnLQ69r1RGIyexqZZx5N5tl8KItkN3vv0gMw=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 219FA18041CAC4;
	Thu, 22 Feb 2024 19:48:30 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH v6 09/13] arm64: dts: broadcom: bcmbca: Update router boards
Date: Thu, 22 Feb 2024 19:47:54 -0800
Message-Id: <20240223034758.13753-10-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240223034758.13753-1-william.zhang@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_194836_579712_EB8B57F3 
X-CRM114-Status: GOOD (  10.65  )
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

Enable the nand controller and add WP pin connection property in actual
board dts as they are board level properties now that they are disabled
and moved out from SoC dtsi.

Also remove the unnecessary brcm,nand-has-wp property from AC5300 board.
This property is only needed for some old controller that this board
does not apply.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts     | 5 +++++
 .../dts/broadcom/bcmbca/bcm4906-tplink-archer-c2300-v1.dts  | 5 +++++
 .../boot/dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts     | 6 +++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
index 78204d71ecd2..999d93730240 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
@@ -125,6 +125,11 @@ port@7 {
 	};
 };
 
+&nand_controller {
+	brcm,wp-not-connected;
+	status = "okay";
+};
+
 &nandcs {
 	nand-ecc-strength = <4>;
 	nand-ecc-step-size = <512>;
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-tplink-archer-c2300-v1.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-tplink-archer-c2300-v1.dts
index fcf092c81b59..19fc03ef47a0 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-tplink-archer-c2300-v1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-tplink-archer-c2300-v1.dts
@@ -155,6 +155,11 @@ port@7 {
 	};
 };
 
+&nand_controller {
+	brcm,wp-not-connected;
+	status = "okay";
+};
+
 &nandcs {
 	nand-ecc-strength = <4>;
 	nand-ecc-step-size = <512>;
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts
index d94a53d68320..52f928dbfa3c 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts
@@ -166,11 +166,15 @@ led@19 {
 	};
 };
 
+&nand_controller {
+	brcm,wp-not-connected;
+	status = "okay";
+};
+
 &nandcs {
 	nand-ecc-strength = <4>;
 	nand-ecc-step-size = <512>;
 	nand-on-flash-bbt;
-	brcm,nand-has-wp;
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
