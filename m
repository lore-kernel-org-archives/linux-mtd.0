Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F323AE6FE53
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jluqpHfC4zjHi/ujuigmRK7AGXDJabVCY2UJyrBYGmI=; b=ME78l9UgtyNLQC
	Zx8vrD/QgSmhi6j5uVLK6yo5pKFhLQfd9YoXUW29Rd9W2XU6ATotP+uEj/XeGHfjRcEbpZnhws6TN
	wX1bKtq9HuS7Rie9cTqzKqGmTCEb7PrmUSRHSOdzAitlmz8RBrBT+DvYYNhkqU1Y9q0CRfhmvPFg9
	P3QNvGrqXoxCzCRSSk5n5FQ3ad4KEWbcnzQk9kE2m7D9kTyotaQWaj4gUP3SSsCkUp/PLiaCA/Jux
	wkVXPQdn84kkRjnn6m67DlC3u9mZTje9PSQnpOboxSRGuQC1PcSllLxp379euYrAGujhBtjUesx6/
	wcYE4FsH5SGphhi63Qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqaK-0000000Ed5e-44Is;
	Sat, 07 Sep 2024 08:14:20 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqaG-0000000Ed4m-3hDD
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 08:14:18 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X15Tl2vtxz20nZN;
	Sat,  7 Sep 2024 16:14:03 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id D682818001B;
	Sat,  7 Sep 2024 16:14:04 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 7 Sep
 2024 16:14:04 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>, <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH] mtd: ubi: Rmove unused declaration in header file
Date: Sat, 7 Sep 2024 16:00:25 +0800
Message-ID: <20240907080025.44001-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_011417_211650_146114DC 
X-CRM114-Status: UNSURE (   7.57  )
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

The definition of ubi_destroy_ai() has been removed since
commit dac6e2087a41 ("UBI: Add fastmap stuff to attach.c").
Remove the empty declaration in header file.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/mtd/ubi/ubi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 1c9e874e8ede..c792b9bcab9b 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -831,7 +831,6 @@ void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
 				       struct ubi_attach_info *ai);
 int ubi_attach(struct ubi_device *ubi, int force_scan);
-void ubi_destroy_ai(struct ubi_attach_info *ai);
 
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
