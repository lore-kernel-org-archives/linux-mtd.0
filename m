Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F2CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  6 May 2022 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4DTxyQc4A9OH+Knyg6YJG4ZXVV5hMDHIkDKGedCgKi8=; b=u3w6nyYpaQLoHF
	8ANILajLTLz963By2JXuRxqIzcrKRk2ol8lW0fX1uqnMWQ9i9k+l+NP/i3fO8Q+GH5mzY+EVAOvCb
	i9RYs6zRRpUvl37vjGxUvwQvlAfZDz6BJCrG4N5j9o3WNaLHtDUWt6JdXKoFsFdcnizAPW6yiPif7
	gFkpduzGgIxeX0EzvBpqcJgsiQaiC9kGPIBeLhjOemSjAt+K/YhIIshkRDtNPm+/llkD1K3cWGwI8
	A5CLnnJ+QVGqm9pRRVw8M+F6qNuIoCMIVje036Qyh28AlfLmCye15sSQViaZxteW3St7sdeL9kNYX
	3Y3jQd/xUeXhdXoqAe6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrzk-001jeB-7I; Fri, 06 May 2022 07:03:20 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrzg-001ja1-1f
 for linux-mtd@lists.infradead.org; Fri, 06 May 2022 07:03:18 +0000
Received: from kwepemi100010.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KvhMx0mNHzhYmj;
 Fri,  6 May 2022 15:02:37 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100010.china.huawei.com (7.221.188.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 6 May 2022 15:03:08 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 6 May
 2022 15:03:07 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>, <arne.edholm@axis.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>
Subject: [PATCH v2 0/2] Fix high cpu usage of ubi_bgt thread
Date: Fri, 6 May 2022 15:17:02 +0800
Message-ID: <20220506071704.222501-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_000316_327785_E8DB57B1 
X-CRM114-Status: UNSURE (   5.13  )
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

Zhihao Cheng (2):
  ubi: fastmap: Fix high cpu usage of ubi_bgt by making sure wl_pool not
    empty
  ubi: fastmap: Check wl_pool for free peb before wear leveling

 drivers/mtd/ubi/fastmap-wl.c | 115 ++++++++++++++++++++++++++++-------
 drivers/mtd/ubi/fastmap.c    |  11 ----
 drivers/mtd/ubi/ubi.h        |   4 +-
 drivers/mtd/ubi/wl.c         |  33 ++++++----
 drivers/mtd/ubi/wl.h         |   2 +
 5 files changed, 117 insertions(+), 48 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
