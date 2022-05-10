Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7731AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YH2OpfbuVNn3IHQo3XgaqUVpzm0FBcK6nAi5FT1zCDY=; b=TNFBVYaFTsjlQP
	6XR5SnAruGTdbogMdj65dtQG17xLiRSHtgHkezDnxbLqW88GN5HvrOSbsYDDTrb8IY3YQcu/ASD9R
	oFPtvFG7bhomc8NungMxKXsX+srx4YL6vrUhLRATqfDXswnxDU9ycC4vY/6RILPTRMWKSk20OTzcH
	b3Nwj0god0XJTg+I/+/EDk1JwZ66ZgQ6AalbDcwfOEUOT14pLezxLYyPWED8GX7RqWYxVVyNDZv3i
	hw6SJySHGw6JQhrqG9Ey3X/DW19Ud2QfJcs6nvt+YegYrNcOH402WFHWCnJqId0oEOjD4xAcDFmcL
	XUbSaSN6M4f/bGzg0M5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noOoQ-001ntX-1G; Tue, 10 May 2022 12:17:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noOoM-001nkr-RY
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 12:17:56 +0000
Received: from kwepemi100004.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KyH6J0BxJzGpfZ;
 Tue, 10 May 2022 20:14:48 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100004.china.huawei.com (7.221.188.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 10 May 2022 20:17:35 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 20:17:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>, <gregkh@linuxfoundation.org>,
 <arne.edholm@axis.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v3 0/3] Fix high cpu usage of ubi_bgt thread and an uaf problem
Date: Tue, 10 May 2022 20:31:23 +0800
Message-ID: <20220510123126.1820335-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_051755_089079_DE512528 
X-CRM114-Status: UNSURE (   5.54  )
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

v1->v2:
  Update fm pool filling strategy, consider reserve enough free count
  for fastmap non anchor pebs while filling fm_wl_pool.
  Remove 'fm_next_anchor' and check 'fm_anchor' during wear leveling.
  Check wl_pool for free peb before wear leveling.
v2->v3:
  1. Don't reserve beb_revd_pebs while filling fm pool.
  2. Fix an uaf in ubi_create_volume()'s error handling path.

Zhihao Cheng (3):
  ubi: fastmap: Fix high cpu usage of ubi_bgt by making sure wl_pool not
    empty
  ubi: fastmap: Check wl_pool for free peb before wear leveling
  ubi: ubi_create_volume: Fix use-after-free when volume creation failed

 drivers/mtd/ubi/fastmap-wl.c | 121 ++++++++++++++++++++++++++++-------
 drivers/mtd/ubi/fastmap.c    |  11 ----
 drivers/mtd/ubi/ubi.h        |   4 +-
 drivers/mtd/ubi/vmt.c        |   1 -
 drivers/mtd/ubi/wl.c         |  33 ++++++----
 drivers/mtd/ubi/wl.h         |   2 +
 6 files changed, 123 insertions(+), 49 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
