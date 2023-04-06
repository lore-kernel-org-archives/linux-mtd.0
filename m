Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E68C77B6C
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iL+nl1tAFngzQYj9XLm18/4sCDN5Ls2kMnqQD2IUdoo=; b=rLyxaMJdwTmiM7
	I8dzHnhpIBLM6w51VTXuDuGlGVqCP7S80Hv+qoL5s42LrAejpXcVMx0jBhkMbHC9TSQRKCi7I7eSE
	YbRSl7P5vw+pC+088FsZo9h8GSRfS27U8ANMkBWcr2pzGTQuEvSYrs1M3a+rh0jN6hbkSsRMTbxn9
	WEBHTyC4TLMWVpEpZZIiM7zRUaR/0TCp7hOx4wlZ9GBacwgn5EVtl0wDUjexV53B+WO6ieCbZoxEa
	4OkilL7LXAK22a7wKaOsXbYvOpGVFmMHd5jpeqdENpMeCL24VhaIB0nWLlwAxIPJiHD4IsoYXc7+C
	XkxdDDgfWwHJX13UCO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJof-006bHw-00;
	Thu, 06 Apr 2023 07:13:53 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJoa-006bF9-22
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 07:13:51 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PsXh76ks4z17R7c;
	Thu,  6 Apr 2023 15:10:15 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Apr
 2023 15:13:41 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 2/2] ubi: Correct the number of PEBs after a volume resize failure
Date: Thu, 6 Apr 2023 15:13:31 +0800
Message-ID: <20230406071331.1247429-3-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
References: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_001348_835338_6B3D04E4 
X-CRM114-Status: GOOD (  10.08  )
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

In the error handing path `out_acc` of the ubi_resize_volume(),
when `pebs < 0`, it means that the volume table record fails to be
updated when the volume is shrinked. In this case, the number of
ubi->avail_pebs` and `ubi->rsvd_pebs` should also be restored,
otherwise the UBI will display an incorrect number of available PEBs.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/vmt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 97294def01eb..990571287e84 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -515,13 +515,12 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 out_acc:
 	spin_lock(&ubi->volumes_lock);
 	vol->reserved_pebs = reserved_pebs - pebs;
-	if (pebs > 0) {
-		ubi->rsvd_pebs -= pebs;
-		ubi->avail_pebs += pebs;
+	ubi->rsvd_pebs -= pebs;
+	ubi->avail_pebs += pebs;
+	if (pebs > 0)
 		ubi_eba_copy_table(vol, old_eba_tbl, vol->reserved_pebs);
-	} else {
+	else
 		ubi_eba_copy_table(vol, old_eba_tbl, reserved_pebs);
-	}
 	vol->eba_tbl = old_eba_tbl;
 	spin_unlock(&ubi->volumes_lock);
 out_free:
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
