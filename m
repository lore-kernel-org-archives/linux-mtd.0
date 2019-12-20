Return-Path: <SRS0=9iyA=2K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C284C2D0D2
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 11:33:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD6B24680
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 11:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TyaIW24t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="q9tqyp34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD6B24680
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jKud0ho6WOa3AeIfoDIUEpbpy4JMYq3GhNKqwjtZZpM=; b=TyaIW24thue6VNc0CW2oYOWegH
	bGBAALiMKHf+ri3z2WPDjrU+d+4Qhv66EPC29rQpOT1w7Ab/Li+emTEe5pk1r2ZNLloZ0lPpOi6x+
	OWuOO+YfMcsAWQ9hV5ZTGP+PM7tTcxWrlEASi80+p55VdcNUUszh31SpwbD4yuGTpYu0NDfCtd4fy
	iHSWc3F2/CJ52NUcFLbFhQVaVkUlVdRsRY2W+KCp6ZBVdL2KyU//FVTUg4ftFHb6vjLLfRFnfpGmE
	oa8r45mpY4VXMATG9/xiiosorS+6MoqrSytn8Lpbf7P3JyCE/ICuKiU/uY7VJm3mVTR0jU3Ctsoek
	sJYCHL0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiGXN-0001E2-1g; Fri, 20 Dec 2019 11:33:41 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiGWK-00008z-0v
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2019 11:32:37 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id xBKBW2Ww010984;
 Fri, 20 Dec 2019 20:32:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com xBKBW2Ww010984
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576841527;
 bh=ebkAQxjiSXSHSZJ50xrvpwnSGWgbaQckYjuIVK7i+/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q9tqyp34bhuaZ8GMgUE6ux1iJpphWD4rLGw+wcOCE6Rmvg9RsG2iADpLVJq23mfEH
 EKszhamf4xolnnBF9Tk0a1T51iAqU7ozV67syYV0bhjRgOZwTMjiD0uz+7A+MPhhsd
 KrNKu4L6JeP8gJk9W68BijvkwYfn1N2tSDJ6Ul2f/pwakP53oMZNTbpVpNwOqV6p/6
 y7dDFdFHv6qW4DFaiwqtHxF1OQI+s13YiYpijQCjUGiIpkuxxZJBdcYiUOL9n5csuR
 v//dM1ziup0I4YKIn1nhiMEdKFJWrNuyJeEgzyplbWpUZgmdZ2cLmL3Vzuf8uALnPo
 oFqGr1ohj2VOw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 3/5] dt-bindings: mtd: denali_dt: document reset property
Date: Fri, 20 Dec 2019 20:31:53 +0900
Message-Id: <20191220113155.28177-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220113155.28177-1-yamada.masahiro@socionext.com>
References: <20191220113155.28177-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_033236_287266_C2A4AC15 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

According to the Denali NAND Flash Memory Controller User's Guide,
this IP has two reset signals.

  rst_n:     reset most of FFs in the controller core
  reg_rst_n: reset all FFs in the register interface, and in the
             initialization sequencer

This commit specifies these reset signals.

It is possible to control them separately from the IP point of view
although they might be often tied up together in actual SoC integration.

At least for the upstream platforms, Altera/Intel SOCFPGA and Socionext
UniPhier, the reset controller seems to provide only 1-bit control for
the NAND controller. If it is the case, the resets property should
reference to the same phandles for "nand" and "reg" resets, like this:

    resets = <&nand_rst>, <&nand_rst>;
    reset-names = "nand", "reg";

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v3: None
Changes in v2:
  - Split into two patches

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b32aed1db46d..98916a84bbf6 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -14,6 +14,11 @@ Required properties:
     interface clock, and the ECC circuit clock.
   - clock-names: should contain "nand", "nand_x", "ecc"
 
+Optional properties:
+  - resets: may contain phandles to the controller core reset, the register
+    reset
+  - reset-names: may contain "nand", "reg"
+
 Sub-nodes:
   Sub-nodes represent available NAND chips.
 
@@ -46,6 +51,8 @@ nand: nand@ff900000 {
 	reg-names = "nand_data", "denali_reg";
 	clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
 	clock-names = "nand", "nand_x", "ecc";
+	resets = <&nand_rst>, <&nand_reg_rst>;
+	reset-names = "nand", "reg";
 	interrupts = <0 144 4>;
 
 	nand@0 {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
