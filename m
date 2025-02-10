Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7139FC02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JcccxIHGPMWOZLP9fvCC98Eh0PLqcvdkPTZcm6kF5LE=; b=FBQYnhMNIzyzQx
	Q3WjQMogaWfolEgkC7dxeBeoV1TifRipPlDeDvPATwb5X0zuB5fVan/gR5DkDWJwMylZ9h530vMHq
	Bqq4r1x6RNsMiL6CN5wR0qMJnhjDu2qsRnXCyWLkGU0Y4nAAHA88E3eDnt8m1GOvT9+cmUsuOKs5p
	ua6Wcao/C3QeDaXY96AfOd7KmOZunXwZewe6wi8Ofsxw6gKfzyfp5D56wi5OpyIt3uV+W+WG7LLGe
	Vinwur5iMuV1pwQH2YLc1UMepS+f2DfF1tEV6HpyIB0RCCU2v7PUy6HK9xqo57ymRyDc+5iS9IpMi
	VDAi2M+zrVfKHCwidFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thNTG-0000000GOqg-07MT;
	Mon, 10 Feb 2025 06:40:42 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMW2-0000000GIAh-20mo
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 05:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739165970; x=1770701970;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ksfd3sS+urRxMxMu37a3Dqzf3ivVB4yAYamRm8eK3LQ=;
  b=b7nOkKV0xTlXG+Yfi+LoU5TmOAAcf26+RxCfMv68WEMO6cwes4ej2bMd
   Wieuq/ieyaZav4zKWDPhOmYhDJBP5GjzGvX2rkW2mSBYbHp+ju+wTthXS
   Nnmk7OZPeLArV473QSX0WBXppIjYbCActt9YesWNZ5o2TriMj2ubM/tQL
   N2N/XuD9SuBoAuWNVp6t5r8yCx0PISKBTI1BNLdvcHbkvQpNpodtEE2L0
   mFoFYG2ug/lK4eZweQO9GaawiJ5OIm6Iir5z6uYqpxOoCCsTbkpgbgl4P
   54dgHcqQZ8k/2Q9eLZr94t2iAiD+BcyNL6J6bsbpg2hM7/UXG4kb3AsfE
   w==;
X-CSE-ConnectionGUID: Bgmvmtr9SnKO48c6JDMelw==
X-CSE-MsgGUID: e85MIaL7RESJ4QPofT9PqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43657913"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43657913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:39:29 -0800
X-CSE-ConnectionGUID: nlFPBAaWS96PEwA9yPo2Aw==
X-CSE-MsgGUID: z8VdSwINTHugCccQgtorJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112318407"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:39:26 -0800
From: niravkumar.l.rabara@intel.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux@treblig.org,
	Shen Lichuan <shenlichuan@vivo.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	u.kleine-koenig@baylibre.com,
	nirav.rabara@altera.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 0/3] mtd: rawnand: cadence: improvement and fixes
Date: Mon, 10 Feb 2025 13:35:48 +0800
Message-Id: <20250210053551.2399716-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_213930_531798_19C107E9 
X-CRM114-Status: UNSURE (   7.54  )
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

1. Replace dma_request_channel() with dma_request_chan_by_mask() and use
   helper functions to return proper error code instead of fixed -EBUSY.
2. Remap the slave DMA I/O resources to enhance driver portability.
3. Fixed dma_unmap_single to use correct physical/bus device.


v3 changes:-
  * Update commit message based on v2 review feedback for better clarity.
  * Use dma_request_chan_by_mask() and helper functions to return proper
    error code instead of fixed -EBUSY error code.

link to v2:
 - https://lore.kernel.org/all/20250116032154.3976447-1-niravkumar.l.rabara@intel.com/

v2 changes:-
  * Added the missing Fixes and Cc: stable tags to the patches.

link to v1:
 - https://lore.kernel.org/all/20250108135234.3107502-1-niravkumar.l.rabara@intel.com/

Niravkumar L Rabara (3):
  mtd: rawnand: cadence: fix error code in cadence_nand_init()
  mtd: rawnand: cadence: use dma_map_resource for sdma address
  mtd: rawnand: cadence: fix incorrect device in dma_unmap_single

 .../mtd/nand/raw/cadence-nand-controller.c    | 42 ++++++++++++++-----
 1 file changed, 31 insertions(+), 11 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
