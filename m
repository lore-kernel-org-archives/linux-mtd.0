Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E916C021A0
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fqvGPeUYH2gOIaPE9I5ukNvErx7Kzf0ebuzH42kyoHA=; b=Hn7XOXzocn3DS1
	R5Z31HGvCYlFcfq9Q6PjylQkFfvO8dXQ0d0BIWUel9+yuCc1IS2qzNwpPtksL9JgBOcMWeGD+qMFk
	Er02ZQ8a6BDVXQkcJ86OM8OSUPMgI2tV/6vmSFHWMejHWWeOg2OPCqAuLTp9OIlJ8kmFGvqQes0G4
	xRe5Du9T3s2UItM2ZEzRkBCI9VHUi0w6LDUIBU4aZ5Yanknp0+dHd8yY+32SbMwEO1dTvRr6rBFBQ
	nBLggFZZTLgWSEyfdUGTBZy/jIRS3i/c2HIpA1ppbGlhQ6um8EfMFnY+e4UvD552DtDsAqf67Tr47
	svxqrqaCrB5N8blb4/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBaS-00000007IuP-3Ngf;
	Wed, 12 Feb 2025 12:11:28 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAvb-00000007BCH-2MHy
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 11:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739359756; x=1770895756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OGDeLMpT+fqb5J1J1pcI9yoVGmhCRmyuCU214VJYRsA=;
  b=LlZjv9o68Yz8UW/6cVgbMl8X11JyNPiceV2UiJSdLou8PWYOSJN27Q83
   J2GHo9ki/tkYnmf6H2fedLU4mJFKet3hpOgN495pAPiZeI4kwYPdclAuo
   88ghRDCqo9t1cHa6DuyAKynGNRUSW5gONIhG6u5jIjPn6r/D/dw1C8vYN
   FSqAVvg9VAX2RJzuz+me5EWTUhbKvR4R7VttoNs2STM9jUYKj24Kkaba+
   qq9CAV/qa++7scHLRUdHfnsEY/sVlLU0L0wAh4my3K3vDWiMRgUA11ORo
   1z4UL0D8gALtn5w/Ad7b1KpHkX7t8XJqIp1EmkwX1tT+e4ogs/RfaCF4f
   A==;
X-CSE-ConnectionGUID: dyCTJXJ0RiyqmPC7Q6of5g==
X-CSE-MsgGUID: frRIiekkS0GLjUxqV+L3hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39895741"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39895741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:29:11 -0800
X-CSE-ConnectionGUID: pewzGhOxQimaQeUOAid23A==
X-CSE-MsgGUID: JEyRhtHDSmGwRptfnxDjWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112648499"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2025 03:29:08 -0800
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] add clock-names property to nand node 
Date: Wed, 12 Feb 2025 19:25:33 +0800
Message-Id: <20250212112535.2674256-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032915_661582_77BA3F60 
X-CRM114-Status: UNSURE (   7.85  )
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

1) Document the required clock-names property because the driver
   requests the clock by name and not the index.
2) Add required clock-names property to the nand node in device tree.

Changes in v3:
  * Include missing Fixes tag.

Changes in v2:
  * Document clock-names property for Cadence NAND controller.

link to v1:
- https://lore.kernel.org/all/20250107084955.2750154-1-niravkumar.l.rabara@intel.com/

Niravkumar L Rabara (2):
  dt-bindings: mtd: cadence: document required clock-names
  arm64: dts: socfpga: agilex5: add clock-names property to nand node

 Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml | 8 +++++++-
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi         | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
