Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290A3C02198
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iMeM+mZ/VpYEhSMdtbhwku77CE9N3N/h3nOtiz16zus=; b=zFzBGUiOvwnRjy
	OepLB2thqANGHs1zc6aXdoaGLYwCfEXbblFXnB0URkl9vJM43cqbUSNpuES77Dyw438T/mtJm/8uR
	8Mo5XmY69YtgCiPv0Fx9qrqv8E8c3a09bcDpr5JTcGl6AChPidsTHu8ma1ceRaHZMnS4l9iAglh2A
	+5Z0dLrXHAZSMCCLOVftV7AIDoHwMtubi/dK+Vo1/R1hvKVt3oNKNaJjxz+IwPgfVqAeUTUjj0XCp
	Q5bBfNFHNdVY67ctAlNWWJ0Y/ocbyPtrug+2TPDl4eu2QN9hp/kLeJ37puqJ2pftbKTfpoxVD8Wo1
	fiIsiptpbtgWtVfhpV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9ke-00000006wgP-1OXh;
	Wed, 12 Feb 2025 10:13:52 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9V3-00000006tDP-3wmt
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 09:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739354266; x=1770890266;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RfajstfpTGLNdRrMN2hNwqxhrI3a/671OeateMPFz/E=;
  b=KOCOECGcp6DTePYDYwhxSj7ABlEUoqxCAjgc8vFoFWqMP/KRl/nifIAD
   QYX4IwAWim2PANdNazKM1JY61njvfq06UDaKpR0pKy19WntOuE88Pn/rK
   9znpNrW7PRNDud7FMdcEoL07D3g7akjYtBV8a1fu4rJUChZutBGRNWrrd
   cUqi8FjOeOWq/hILu3PEGmVHpb9qF4zqT+oCR0OORvi1WwN85/XxsDhVz
   8lI4zAPWUYjgLQuf3MKW3J4fYTMPUVGXl9kIe57rpJ/0dpBvZZ3UO6wD4
   Roq37q66WiImbE+TFTtOlyDnJNLzEYhiBsIvjTVCIUaDmMcLSMGKBdlXB
   g==;
X-CSE-ConnectionGUID: gzTUg2TPQ4et1yZY4cSttA==
X-CSE-MsgGUID: uo8EEcPIQFGmsr0VrphFNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50224533"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50224533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:57:45 -0800
X-CSE-ConnectionGUID: 7qg0NH+vTo2+M9Vz4tKZOA==
X-CSE-MsgGUID: wzou7DIlTqS+ykPjuGYoeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112632043"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2025 01:57:41 -0800
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
Subject: [PATCH v2 0/2] add clock-names property to nand node
Date: Wed, 12 Feb 2025 17:54:05 +0800
Message-Id: <20250212095407.2667743-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_015746_040443_1C04361D 
X-CRM114-Status: UNSURE (   7.86  )
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
