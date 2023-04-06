Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA36C7618D
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 07:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xA5j4moRa5cIm7HXX6eDSCqtrCGTwV5ey2nrlY25kMQ=; b=lkxAbhq3eRBMmY
	RjxpMmyxvm/CymQVQ62PaQ/EJv1DYeWV8TF+HGpVXdUg069369YNjAxyil0Z4x40ZuyTU4W+ba5Ab
	2Aw8lUmG49pCFZJECYRF1knq22/zCW2rc9e0mPbXalt6TUFPfJziCVLYrcxlahUkXS0C8Y9g8/my9
	8IJnvqg6eg+r8fbBA7JCQPBqs6Ged9kFtElZLHKW86tb5qE5fVUFN8rLuuY+riuSS8+RcYwbgEGB2
	7mu/zICzo2BMFfZw3tpFYvIcZ+dl1cVBpYwCXT75ew3vWckxFlxQtBDAU/RKvXjxCcCYPemCFkgPX
	yu78sUnrsv2jKlP+tcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJof-006bI5-1p;
	Thu, 06 Apr 2023 07:13:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJob-006bFA-2m
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 07:13:51 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PsXjC0wnbzKx4H;
	Thu,  6 Apr 2023 15:11:11 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Apr
 2023 15:13:40 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/2] Fix some bugs in ubi_resize_volume() function
Date: Thu, 6 Apr 2023 15:13:29 +0800
Message-ID: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_001350_063023_D53D2B1C 
X-CRM114-Status: UNSURE (   5.89  )
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

This series of patches does two things:
  1. Rebase the patch commited by Guo Xuenan on the latest mainline.
  2. Fixed an issue where the number of PEBs is incorrectly displayed.

Guo Xuenan (1):
  ubi: fix slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130

ZhaoLong Wang (1):
  ubi: Correct the number of PEBs after a volume resize failure

 drivers/mtd/ubi/vmt.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
