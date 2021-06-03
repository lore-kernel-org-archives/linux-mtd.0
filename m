Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000D8C47082
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:34:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B016136E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1B016136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BI4qoA+8QDgnfmPCTiFKEuV7Y1TXHOsS6LYVxULqBS4=; b=d4wWT3Y1vWwe7g
	/Rwuo1bfG72HFnDImdkQkwBeGTfIhafnfJWc0tZ+ZHthEuiVkl5C+m4aVTF6y09HTui7tHc38nWcO
	hxe+nnZsHoBN99SiD4eXEQv/pL0D5wK71vG4DL9wnoZ6NZE/gOBiCt2WML+ckC3USUoNvZ0bm5ovK
	WjTmXUe41eVVGW3toprXyKe8/JGW0Wd0LQZvHbCrcL/w1ELILcsPb3UfeUT5iYMvrBk8iMfFx97bW
	/vf4vHEkXLvMEFKMfxeDPz+nNy8tUUGezj3WKy/xpZN1AMGMasBJaNDO273+roD6UVEb7/Avn9t5P
	13aX145DTpw113B60Bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomXn-008eTY-AE; Thu, 03 Jun 2021 12:33:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomXk-008eRd-2p
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 12:33:49 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FwlZ30GTzzWlcd;
 Thu,  3 Jun 2021 20:28:59 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:33:43 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:33:42 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] mtd: rawnand: r852: use DEVICE_ATTR_RO() helper macro
Date: Thu, 3 Jun 2021 20:33:39 +0800
Message-ID: <20210603123339.12089-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_053348_393458_E65F1E58 
X-CRM114-Status: UNSURE (   9.91  )
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

Use DEVICE_ATTR_RO() helper macro instead of plain DEVICE_ATTR(), which
makes the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mtd/nand/raw/r852.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index ebe859ca49cbfa1..ed0cf732d20e40a 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -583,8 +583,8 @@ static void r852_update_card_detect(struct r852_device *dev)
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
 }
 
-static ssize_t r852_media_type_show(struct device *sys_dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t media_type_show(struct device *sys_dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = container_of(sys_dev, struct mtd_info, dev);
 	struct r852_device *dev = r852_get_dev(mtd);
@@ -593,8 +593,7 @@ static ssize_t r852_media_type_show(struct device *sys_dev,
 	strcpy(buf, data);
 	return strlen(data);
 }
-
-static DEVICE_ATTR(media_type, S_IRUGO, r852_media_type_show, NULL);
+static DEVICE_ATTR_RO(media_type);
 
 
 /* Detect properties of card in slot */
-- 
2.26.0.106.g9fadedd



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
