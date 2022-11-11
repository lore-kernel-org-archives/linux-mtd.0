Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D388FC43217
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Nov 2022 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ohpsySUTSbUcv8LqXk/NwVldGxef4osWKREJeDc48ZY=; b=PiUr0+22U94TWr
	O8c+gCwfQXYplzEnLLdGVaBRQ/duyGUdyL8+Js0YmQDsU00dVaBdfpDPgbUZNGlXqehbEbqlgZp+h
	0mwhfXBedU9v0nGT14nB3IcMI9vsN2brp/7YXUsTBjDzHs6NskVCjvmkz00eB87W9iP3Tk0fJk9Hy
	mKo6DQn4X+Rgz4O35+9clyzQJbtyijr39cTOtjD/C+TOvWKZM4gkYsp+9rsQXB31RhgiGHg0ZHXwU
	DvG687GTXh21YZ3fycbGoTWeroVt6YN4lASGQ0+3IUE6t2zkWN4IdkFnT6Dzfx/k9dPNyp8cA5h6j
	ZSlAAxHvDEjMzd7vvt/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVLn-00GL79-9N; Fri, 11 Nov 2022 14:49:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVLj-00GL3x-7I
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2022 14:49:46 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N81nJ32N4zRnwr;
	Fri, 11 Nov 2022 22:49:24 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 11 Nov 2022 22:49:36 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 22:49:36 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<yangyingliang@huawei.com>
Subject: [PATCH] mtd: ubi: fix possible null-ptr-deref in ubi_free_volume()
Date: Fri, 11 Nov 2022 22:48:12 +0800
Message-ID: <20221111144812.2423577-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_064943_540143_08CE94BD 
X-CRM114-Status: UNSURE (   8.95  )
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

It willl cause null-ptr-deref in the following case:

uif_init()
  ubi_add_volume()
    cdev_add() -> if it fails, call kill_volumes()
    device_register()

kill_volumes() -> if ubi_add_volume() fails call this function
  ubi_free_volume()
    cdev_del()
    device_unregister() -> trying to delete a not added device,
			   it causes null-ptr-deref

So in ubi_free_volume(), it delete devices whether they are added
or not, it will causes null-ptr-deref.

Fix this by adding some checks.

Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/mtd/ubi/vmt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 8fcc0bdf0635..c379b8739f52 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -614,8 +614,14 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 	dbg_gen("free volume %d", vol->vol_id);
 
 	ubi->volumes[vol->vol_id] = NULL;
-	cdev_del(&vol->cdev);
-	device_unregister(&vol->dev);
+	if (device_is_registered(&vol->dev)) {
+		cdev_del(&vol->cdev);
+		device_unregister(&vol->dev);
+	} else if (vol->dev.kobj.state_initialized) {
+		put_device(&vol->dev);
+	} else {
+		kfree(vol);
+	}
 }
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
