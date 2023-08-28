Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F3C83F12
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HP/CeGP5GQ3gq9zImvLzmCo6Fq7L4DkMyK40KgaSlUo=; b=kslXwyfcT9c07w
	JOMgvSglTqgG9ZFsDS/Gl3hSh2dGFLKknSiAHdaZNgQTtFMx/6yuk5YwqlQsmZxj/XxdONh27S7oG
	GwwK+F4xJ30GfbR/Vj34kkKCYTdi5E/FX2XR/jaNYLnT/cJeaQcLZHyocBDfepRaEWmlLeT3YbqfN
	9Y3uaidpvnkMDThTo0MIqwcndAIYropDFHG4EiACIkJpJ8ZyzSDQacp49vrygZWMo1cxxtrv0tFcQ
	cTFhmuSFiJ9RbnnE9qewKGSFWWtY0JhUnoRV441OMix7DRtc6SZoXIVrFhNAx/tuIhSg61Iq82yYf
	ulFcSuAb+k2VlEb7ajEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVyC-008yIL-16;
	Mon, 28 Aug 2023 06:43:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy5-008yAq-1B;
	Mon, 28 Aug 2023 06:43:23 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RZ1B22c9GzhZGk;
	Mon, 28 Aug 2023 14:39:22 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:10 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <bagasdotme@gmail.com>
Subject: [PATCH v2 00/12] ubi: fastmap: Fix a series of wear leveling problems
Date: Mon, 28 Aug 2023 14:38:33 +0800
Message-ID: <20230828063845.3142561-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_234321_581409_4781DA92 
X-CRM114-Status: UNSURE (   9.35  )
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

This series of patches fix three problems:
1. Inconsistent erase counter from wl entry and disk, for patches 1~4.
2. Same PEB is always resued for fastmap data, for patches 5~9.
3. First 64 PEBs have large erase counter than others, for patches 10~12.

Besides, patches 4/5 bring an improvement of the UBI service life.

Regression tests are in [Link].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787.

v1->v2:
  Patch 6: Change wait condition in wait_free_pebs_for_pool(), there are
	   two situations that cause waiting infinately:
	   1. __erase_worker schedules itself if -EBUSY returned when
	      shutting down system.
	   2. The 'min_expect_free' cannot be satisfied when bad block
	      occurs and ubi becomes ro(The erased PEB should be the
              last one of 'min_expect_free', but it becomes bad in
	      __erase_worker).
 PS: After re-testing, the testing results in [Link] is not affected.


Zhihao Cheng (12):
  ubi: fastmap: Fix missed ec updating after erasing old fastmap data
    block
  ubi: fastmap: erase_block: Get erase counter from wl_entry rather than
    flash
  ubi: fastmap: Allocate memory with GFP_NOFS in ubi_update_fastmap
  ubi: Replace erase_block() with sync_erase()
  ubi: fastmap: Use free pebs reserved for bad block handling
  ubi: fastmap: Wait until there are enough free PEBs before filling
    pools
  ubi: fastmap: Remove unneeded break condition while filling pools
  ubi: fastmap: may_reserve_for_fm: Don't reserve PEB if fm_anchor
    exists
  ubi: fastmap: Get wl PEB even ec beyonds the 'max' if free PEBs are
    run out
  ubi: fastmap: Fix lapsed wear leveling for first 64 PEBs
  ubi: fastmap: Add module parameter to control reserving filling pool
    PEBs
  ubi: fastmap: Add control in 'UBI_IOCATT' ioctl to reserve PEBs for
    filling pools

 drivers/mtd/ubi/build.c      |  25 +++++++-
 drivers/mtd/ubi/cdev.c       |   3 +-
 drivers/mtd/ubi/eba.c        |   3 -
 drivers/mtd/ubi/fastmap-wl.c | 112 +++++++++++++++++++++++++++--------
 drivers/mtd/ubi/fastmap.c    |  66 +++------------------
 drivers/mtd/ubi/ubi.h        |  10 +++-
 drivers/mtd/ubi/wl.c         |  48 +++++++++------
 drivers/mtd/ubi/wl.h         |   6 +-
 include/uapi/mtd/ubi-user.h  |   4 +-
 9 files changed, 164 insertions(+), 113 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
