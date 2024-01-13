Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6AFC4706C
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jan 2024 13:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LE4BBtKaQVBvUeeQ0r5mKIbA9KnljULkGcAB661D0E=; b=Golj3ijJ8r6x/q
	Bd4Kivi641bHNwU97Xc7Ql1gxBZk/aWWsTPm9YyiQ3iU4XO3etvuxVox0Jr64kAwK4X11sFbyrXuB
	dl8rccbeAYO0IfOlVUD/BrLB3dbzfVAiaXuYhekihjSmNWTThBNtvJDVybMUHSiQn+UbEH/A7HRPm
	+paaRsSsgPc74F7tGcWWYabRKCwNUd8eiz/rMveWElEanliXO431KebxRaFUplvw3bzirzJcW11Rp
	Y4/XuETruO69vn7vEBryKBhc2uMUr8lCUWwndlKyTECmoZTiwYHX1/BTVbJWEk0K1gCD6Qh/ugEKh
	WWn9K2Z757GuFJK2ma7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOdiX-005AMN-2c;
	Sat, 13 Jan 2024 13:06:29 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOdiR-005AKP-00
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jan 2024 13:06:25 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TBzCm6myXz1xmCm;
	Sat, 13 Jan 2024 21:05:24 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id A074C1404F7;
	Sat, 13 Jan 2024 21:06:05 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemd200001.china.huawei.com
 (7.185.36.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Sat, 13 Jan
 2024 21:06:05 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v3 2/2] ubi: Correct the number of PEBs after a volume resize failure
Date: Sat, 13 Jan 2024 21:06:01 +0800
Message-ID: <20240113130601.2502095-2-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20240113130601.2502095-1-wangzhaolong1@huawei.com>
References: <20240113130601.2502095-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_050623_214219_3AE81E8A 
X-CRM114-Status: UNSURE (   9.67  )
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

In the error handling path `out_acc` of `ubi_resize_volume()`,
when `pebs < 0`, it indicates that the volume table record failed to
update when the volume was shrunk. In this case, the number of `ubi->avail_pebs`
and `ubi->rsvd_pebs` should be restored to their previous values to prevent
the UBI layer from reporting an incorrect number of available PEBs.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
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
2.34.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
