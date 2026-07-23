Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5588BC531C9
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 02:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0z2HhO/0toEue1V5Vdx8zUDDG+OGXg+cG0R19YXpBtI=; b=i97cR0XLx0Kr9s
	tDLr5uC+Na9ZzZyRs1tbAlmsxPOyzPzOu2PvhtUh+Ho3JSg0TvP/QA2HqWC//M0LJ69CqGGy/9Ccc
	JyZOFliFHu6KSEHefNogvFr9h+1bWqmdLMXDwswuuYXnqIVq9eSqdtzK8dwNBdser+ZQoZGjoUqAo
	+OZLvgqm/HajhUsyrD+cqoKwE8cXTsSZI9BcUyDgCvpOzTBF/WmlIstF5ui/ij8al65TBZhhvMm6P
	u71xoTiWo4SEaTkIhrvlbHJXe/jF4YnC9+S2yg29vulYmUA7QQMpM5E5Y4Ffr74JsIk4gX36XyVRC
	Y5byRuUgnDq3wJJPYLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmius-0000000DCLo-3izf;
	Thu, 23 Jul 2026 02:12:06 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmium-0000000DCJU-0qgR
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 02:12:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qoEAz0O377RHYFEBFeemHDjRbCWq/pk3mlrg1Wq9+3k=;
	b=OsROysVcyFjeR7wCVWeo+LCB9Xh7ovf1v7LnX3QuV+1w6QNituKMJRCcaUtuOkq1qyNbEKb4D
	MlXh6nd9bMNWrWAn0DFtDl1v7gQM21qOks2JxT+WKRCU1cvb23q4SyZQMcq0y+wTOdtNFi4h/M3
	kVZFGnoIareTvwTrezvQI0Y=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4h5Ds718Nqz12LFy;
	Thu, 23 Jul 2026 10:02:19 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id 94FA92025F;
	Thu, 23 Jul 2026 10:11:52 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Jul
 2026 10:11:51 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<vapier@gentoo.org>, <artem.bityutskiy@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/2] UBI: fix ubi.mtd MODULE_PARM_DESC issues and add per-device wear-leveling threshold
Date: Thu, 23 Jul 2026 10:02:31 +0800
Message-ID: <20260723020233.3079997-1-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemr200001.china.huawei.com (7.185.36.96)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_191200_394069_164C779D 
X-CRM114-Status: UNSURE (   7.94  )
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

This series adds a per-device wear-leveling threshold for UBI devices,
with a preparatory fix to the MODULE_PARM_DESC.

Patch 1 fixes two pre-existing issues in the ubi.mtd MODULE_PARM_DESC:
the parameter format string was missing the enable_fm and need_resv_pool
tokens, and the bad-block reservation note was misplaced after Example 5
instead of after Example 3.

Patch 2 extends struct ubi_attach_req with a __s32 wl_threshold field, 
plumbs it through the ioctl and module parameter paths, and replaces 
the compile-time macros UBI_WL_THRESHOLD and WL_FREE_MAX_DIFF with p
er-device fields across wl.c and fastmap-wl.c. 0 means "use the kernel 
default", the accepted range is 2-65536.

Ran Hongyun (2):
  UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
  UBI: support per-device wear-leveling threshold

 drivers/mtd/ubi/build.c      | 43 ++++++++++++++++++++++++++++++------
 drivers/mtd/ubi/cdev.c       |  2 +-
 drivers/mtd/ubi/fastmap-wl.c |  8 +++----
 drivers/mtd/ubi/ubi.h        | 21 +++++++++++++++++-
 drivers/mtd/ubi/wl.c         | 39 ++++++++------------------------
 include/uapi/mtd/ubi-user.h  | 10 ++++++++-
 6 files changed, 79 insertions(+), 44 deletions(-)

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
