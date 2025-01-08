Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A7DE77188
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2025 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6kdP0gnL7FBqcmCq4eb3T7uihoLxtjhoDX2yMvtDmis=; b=tFEQDkwcKJgYCY
	PI89FMRMVETOURFefE+/RlP/pSTXPuMH+0cuctxc/Bi1j/CJD1twbaITBmx+rN+5IO7Qmq6W6rbk2
	KVED5rTSqWHuISA5l1EVmCEmVt+2qLeUzltLpB26DJcX8rVP6fjVFydgE10NX0NttHndhUgppiqua
	tU2vET/uoTuboavG8Y7WHyRjxfrVk7s24rKtzA7d+eqQ4SldeiS2Y0rLVtCQUu6V2MdKn9hkCgF9l
	0QUh1r/16/2+9scSs3yINe9beeDqfPeZ5PDWLBydWp1gqw3B9s5qXsfj4M4tB3gxulPoDAXOTAz1a
	54kwYxjU7JKvlS2Futvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWXS-00000008he5-3Wy1;
	Wed, 08 Jan 2025 13:56:02 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWXQ-00000008hdQ-0Ftk
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jan 2025 13:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736344560; x=1767880560;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QktZoudbaRr9UsJ9hM91ZrjDCX+Mc3aqc8qTLbJ3id4=;
  b=BynawzmQcntZ9I+h+DJKBfN0MiXv/isqWizv6lfQ1ZNUzSnMuoifv+UP
   43RijVKqZxdWyqvZRLOhKKhoxT8WWjVWuwFPF6JbX4ZB0DxlZXuTsaIgi
   KY8GeE9g3Uk0DQ4v0jpj4IiHCImV1IEdaq5CnYjkF5Ht29hMa8W3MW6Iy
   ayTtkS01Xj/24ZvR+in536AGOljbs9EXTjEzecDZtm4Vu5vEhn8qphr2a
   rl7NlQIJ4qaOEfZr4WLLOvSb17j7B8Pq0C6QwTjWIIqhJJPVLTu1Tu1Sn
   qrEMkgUyQIbp3qKjyKyu3N8yv1/J2Ck3u+dCa6GS8oB44ANZdxp9jOZir
   A==;
X-CSE-ConnectionGUID: p4ZlxtBOTMK5t8u8QkkKng==
X-CSE-MsgGUID: 2yMMvewcQeSA3DeQrlNjhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="61948133"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="61948133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:55:58 -0800
X-CSE-ConnectionGUID: jwbD/pJvRM2bErq5+Nr+iw==
X-CSE-MsgGUID: 3Vw+/q1GQ9iKdPIDnIWtEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102971626"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2025 05:55:56 -0800
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
Subject: [PATCH 0/3] mtd: rawnand: cadence: improvement and fixes
Date: Wed,  8 Jan 2025 21:52:31 +0800
Message-Id: <20250108135234.3107502-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_055600_107752_89B9CDE4 
X-CRM114-Status: UNSURE (   6.56  )
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
