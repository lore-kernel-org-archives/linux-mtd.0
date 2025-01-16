Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B671BC02183
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gliYzr23pidp2vUsswbDsLF+1T4Sym6QdwsMDM0UHl8=; b=A0SNnP22o4Cor1
	suYJ7uTlD2K7Xs5Jx3uIa5rkSxHmQLww4PUlcR2tMgexM38fJ8CwgduHHuG1R+uNdcSxi/goMZSnC
	zVNFOiJCOUSM5Ew5vxEQegBUAK7qLVp7GmsFqRNCDAQKLQ1nIyrfkIOCJ7rRJg825tuydekhw17sk
	O4K1bisQPgtFV2MZRmcUTXG8vjvLMNt4C6HkZjy822cz+OClr0szeo3SfLId7B8CuXODP3+U1zeQK
	gMrk7LkeNLL5d+Ome8q7HqlRZh0u84xkmRYST8Go80HMVt0SP8Dkzo3wXOxreb1iu24gTNmNiWtHp
	Gk73pLUtAVycTtNMt2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGVX-0000000DidT-0D5W;
	Thu, 16 Jan 2025 03:25:23 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGVU-0000000Dici-1FbT
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jan 2025 03:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736997920; x=1768533920;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qh95bfftKSAqWbqh1JWGCL2eQxCGpzz4NwlXtWeDByk=;
  b=Uukde4kbR7vEUxUY8ionjrHtV41l0rnwSsSLJKvmmmRA0muel/wwj56w
   J+pbF7BgkY9ynnbdLRG4om6nUXAxCVG9w3iPALQxS+3ebiySuEIEvGt79
   fgomsAljemT23eaB4ECqSYFYB3s6Cp/LF4SCVSTYrKv5M6VV7X7ou1VDQ
   efkJBQmb92Zzh9WT+eZMy91C1UtnNbBh3f46LaISt+EVO5ehb+23yUGr4
   F9YHSke8o6qYML4AemXZz7BV5y4/0TXfWTNa81K+bPqbKZ5XvUlfACruL
   n5upyCnjT8l1Lf+nBSq3NYoDmxum9iYzOEhcMZdvMv7kZnMrG4gU4+LcR
   A==;
X-CSE-ConnectionGUID: JxF3/8qFSmKbCL3L99ONIg==
X-CSE-MsgGUID: ewldsmdaR1CtaBWJl6ZSag==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37478860"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37478860"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 19:25:18 -0800
X-CSE-ConnectionGUID: F+/z/oqMQ1OjVZPfvtHgNA==
X-CSE-MsgGUID: i5TgPROpRCCPvYlrGUipKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142604327"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2025 19:25:15 -0800
From: niravkumar.l.rabara@intel.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux@treblig.org,
	Shen Lichuan <shenlichuan@vivo.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	u.kleine-koenig@baylibre.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 0/3] mtd: rawnand: cadence: improvement and fixes
Date: Thu, 16 Jan 2025 11:21:51 +0800
Message-Id: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_192520_421481_30897B9C 
X-CRM114-Status: UNSURE (   7.05  )
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

This patchset introduces improvements and fixes for cadence nand driver.
The changes include:

1. Support deferred prob mechanism when DMA driver is not probed yet.
2. Map the slave DMA address using dma_map_resource. When ARM SMMU
   is enabled, using a direct physical address of SDMA results in
   DMA transaction failure.
3. Fixed the incorrect device context used for dma_unmap_single.

v2 changes:-
- Added the missing Fixes and Cc: stable tags to the patches.

Niravkumar L Rabara (3):
  mtd: rawnand: cadence: support deferred prob when DMA is not ready
  mtd: rawnand: cadence: use dma_map_resource for sdma address
  mtd: rawnand: cadence: fix incorrect dev context in dma_unmap_single

 .../mtd/nand/raw/cadence-nand-controller.c    | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
