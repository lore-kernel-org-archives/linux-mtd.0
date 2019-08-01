Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8726EC32751
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 03:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5941F20B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 03:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3LABfow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5941F20B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LCylJEgaybQxrH8CzjsGMYjxkrj0RNfmx07iaYL8RkU=; b=i3LABfowvQDQPLEPHpgnFO6bdt
	SP9nUIlVV3snK1j/xLLJ4vwWFb7lZX84gKDwp2CZwfOeNuGOaKR9YH3B+YL6OEyOpewc3+xllxHLN
	+mURW23F0I0PzRsV+QbnIGNSkmBLh2Y+yGfECfiLT8/oOQKxwQ9S2px/de1uTnmM5Bp3GWJQPmr2U
	AHsvTcBlG29MisOG8a+KoeQzdnnggGRKX5vsXaG9XWiTKvWEr/fSTV5y+mPaExJA6D2nqwrJeTd7Y
	HqFGpiWqGz3BB0oZrp8VsnJRUJt7UNi3yDCw+kMsK9JSuxc8dNavL+jhLFuLBs34tjQHJ152/oz29
	k7bDKpCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht1p8-0002ry-5l; Thu, 01 Aug 2019 03:32:14 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht1p5-0002r7-4J
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 03:32:12 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x713UuOW087114;
 Thu, 1 Aug 2019 11:30:58 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, marek.vasut@gmail.com, bbrezillon@kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com,
 richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, mark.rutland@arm.com
Subject: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Thu,  1 Aug 2019 11:55:10 +0800
Message-Id: <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com x713UuOW087114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_203211_449875_A8A45C54 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, anders.roxell@linaro.org, juliensu@mxic.com.tw,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, paul.burton@mips.com,
 liang.yang@amlogic.com, linux-mtd@lists.infradead.org,
 christophe.kerello@st.com, masonccyang@mxic.com.tw, lee.jones@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Document the bindings used by the Macronix raw NAND controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 Documentation/devicetree/bindings/mtd/mxic-nand.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
new file mode 100644
index 0000000..de37d60
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
@@ -0,0 +1,19 @@
+Macronix Raw NAND Controller Device Tree Bindings
+-------------------------------------------------
+
+Required properties:
+- compatible: should be "mxicy,multi-itfc-v009-nand-morph"
+- reg: should contain 1 entry for the registers
+- interrupts: interrupt line connected to this raw NAND controller
+- clock-names: should contain "ps", "send" and "send_dly"
+- clocks: should contain 3 phandles for the "ps", "send" and
+	 "send_dly" clocks
+
+Example:
+
+	nand: nand-controller@43c30000 {
+		compatible = "mxicy,multi-itfc-v009-nand-morph";
+		reg = <0x43c30000 0x10000>;
+		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+		clock-names = "send", "send_dly", "ps";
+	};
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
