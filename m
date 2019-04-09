Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCBFC10F13
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 02:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C36213F2
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 02:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTf5UApG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C36213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CN7alKBu8CqgpInWuhQy2rt2HsN65mFqqMRe588DljQ=; b=rTf5UApGYe/IztRVT3ah3TqgSN
	DETxOReMk5VACJsQt0KtoOUiljT/+5WteaEXjeKjaFdD1xIVvCj5CcAikEJh39lXEmRO8MNR0rXQO
	XYB6G/i0K5Q5kuF1bLxg4s2eEu61OkhRkK+tm37NpbLTlDX8pvQQ1hDK9897aGisjQfWAL00GuSgl
	fXrWEHb2x2fqJ71vI5UJWaU5Tu7SwW4F+NLJKscyM7okemC4ZwoRW6Uc1oqtNZ3vImj2c8GiW7UOg
	Fr9UMPrLv7sk6Ov7YTATKd0XI2wZyuXWeyPy+oDwwC68/QBIQEG8Lio53GCPcdWA6tY1iRpApPOxT
	oRzcmXUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDgE6-0005sk-O2; Tue, 09 Apr 2019 02:11:06 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDgE3-0005qq-JC
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 02:11:05 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x3929vUm032141;
 Tue, 9 Apr 2019 10:10:00 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, bbrezillon@kernel.org, dwmw2@infradead.org,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 computersforpeace@gmal.com, paul.burton@mips.com, stefan@agner.ch,
 christophe.kerello@st.com, liang.yang@amlogic.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org,
 richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH v2 4/4] dt-bindings: mfd: Document Macronix MX25F0A controller
 bindings
Date: Tue,  9 Apr 2019 10:30:00 +0800
Message-Id: <1554777000-10542-5-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1554777000-10542-1-git-send-email-masonccyang@mxic.com.tw>
References: <1554777000-10542-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com x3929vUm032141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_191103_984966_61745C60 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 zhengxunli@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Document the bindings used by the Macronix MX25F0A MFD controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 .../devicetree/bindings/mfd/mxic-mx25f0a.txt       | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt

diff --git a/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
new file mode 100644
index 0000000..7f3e0f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
@@ -0,0 +1,51 @@
+Macronix MX25F0A MultiFunction Device Tree Bindings
+----------------------------------------------------
+
+MX25F0A is a MultiFunction Device with SPI and raw NAND, which
+supports either spi host controller or raw nand controller.
+
+Required properties:
+- compatible: should be "mxic,mx25f0a"
+- #address-cells: should be 1
+- #size-cells: should be 0
+- reg: should contain 2 entries, one for the registers and one for the direct
+       mapping area in SPI mode.
+- reg-names: should contain "regs" and "dirmap"
+- interrupts: interrupt line connected to this MFD controller
+- SPI controller driver:
+		- clock-names: should contain "ps_clk", "send_clk" and
+			       "send_dly_clk"
+		- clocks: should contain 3 entries for the "ps_clk", "send_clk"
+			  and "send_dly_clk" clocks
+
+- Raw nand controller driver.
+		- nand-ecc-mode = "soft";
+		- nand-ecc-algo = "bch";
+
+Example:
+
+	mxic: mx25f0a@43c30000 {
+		compatible = "mxic,mx25f0a";
+		reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
+		reg-names = "regs", "dirmap";
+
+		/* spi */
+		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+		clock-names = "send_clk", "send_dly_clk", "ps_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <25000000>;
+			spi-tx-bus-width = <4>;
+			spi-rx-bus-width = <4>;
+		};
+
+		/* nand */
+		nand-ecc-mode = "soft";
+		nand-ecc-algo = "bch";
+		nand-ecc-step-size = <512>;
+		nand-ecc-strength = <8>;
+	};
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
