Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9743C021A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OZiyJ9HMMfihzUmrC5aQ6F3VB6tQTqEnXD2ZAgvFZo=; b=L2ua3YWAKYrN63
	xY4pSzqga+vJJB67IN5ON08rl85HpfvDgPLXlwN+ZMKX7P/80IWGxPZQfFbaVYKVQKYKsaeoSjdsO
	7IX3IdFl5U1DAGhEwGmFPZ6/k2dzMpqBRiGsc02Dj5FHH77V+jU+KwReoRkTTeIS3LEbhGGX7ctRs
	mswMJia8BHrT9/6x6zsQfG1aIZUjlzLaqCmoBmtARmZOlUyyhDm8P6mw9K0H+Zd9TSXUYLPywBQei
	BfFSHQNRxSj1lkE/rFb5hNIbgdzF2xVPlV7an9gX6cxl+qVi+S7YDWOjl7OumPxmgAXSSV5Y6DWrE
	7sxVk6VfyCBwP1GuSk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBaT-00000007Iud-1Qtd;
	Wed, 12 Feb 2025 12:11:29 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAvf-00000007BEZ-3biv
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 11:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739359760; x=1770895760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkCZwKSdx0DSw7NKE/kuifcxpWJJ6EApm7Ls5SmmHYA=;
  b=eIEQHlT8eT7Yo8OpOrf+xB1B6v7fdCrUNVeBJwuj7/a3IP0vJErRqHRT
   d0wPHkXvpTg5gx6iCgaUvapIzE6MBZC0d7SYI4FPPk0d+jxTbKolHSSCI
   BJQIFn9KMzJU2nwXx1L64vMMUsn2XFzp3Vm+nilt32PpfV3zi3RDe7FHq
   Mx6lqz3JZe7Ei2ufMjHxSql+WqLVRULXc69bJO9nkFMsRJohw6cEjenK6
   2pbj3LD7cLHHmoQMxbF5qwj7PoqqBzElz4kSmEULhBqSYAixmKFIzHl/5
   UHXmfT7WqEQTSfpV5prxaLrb9XBSey0ApGwrA/LmeuoWf6J+Cyv+eXK67
   Q==;
X-CSE-ConnectionGUID: 0/QIaSNuTsKrAzWNem+fbA==
X-CSE-MsgGUID: GLEREZo2ROCr18af+H6LEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39895767"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39895767"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:29:20 -0800
X-CSE-ConnectionGUID: lQEPo361RRaeXAR1ueUlwQ==
X-CSE-MsgGUID: dUehkeDKTryCLT4/qPXviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112648516"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2025 03:29:16 -0800
From: niravkumar.l.rabara@intel.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/2] arm64: dts: socfpga: agilex5: add clock-names property to nand node
Date: Wed, 12 Feb 2025 19:25:35 +0800
Message-Id: <20250212112535.2674256-3-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212112535.2674256-1-niravkumar.l.rabara@intel.com>
References: <20250212112535.2674256-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032919_956340_F69152DE 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Add required clock-names property to the nand node.

Fixes: 2d599bc43813 (arm64: dts: agilex5: add initial support for Intel Agilex5 SoCFPGA)
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 51c6e19e40b8..27f75e1bc8eb 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -271,6 +271,7 @@ nand: nand-controller@10b80000 {
 			#size-cells = <0>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_NAND_NF_CLK>;
+			clock-names = "nf_clk";
 			cdns,board-delay-ps = <4830>;
 			status = "disabled";
 		};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
