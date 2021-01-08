Return-Path: <SRS0=9pOF=GL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811D5C433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 09:24:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24B5C233EA
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 09:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24B5C233EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b7te6WgH8mYm9Ldq1hynIOTTcTkd0tUMRSpaitRix6c=; b=HDv66AeER8ZJV99hBQQvFq3iXU
	Q363YZMBj7GhyaUfPCLcX86/VXH+YMeXi/a3osWlvuaMnQ61AbQTRiyLRqeaSz3KKSBNeV+Q84PIm
	8aAdd0WEoBv9d8wSfGw/luUnA70h8+FuhB9TkY7EZmeYX3jy9LoveHDp9Plb1/G0K0wKEs0sz3NvI
	ILsLL06gW5/AjZJ9WMn2S0/iRTUkW5NYPgGKTfnSdAjJM0PB0BiUkbLoSpMxOarvA3LmuXSluRsRd
	sfnIKMV2DqKZ+Jqw0JvT4wrBbpvHeprwiye2yOviwkiDnghYWI4Z1gmFnds6DyJl2yZk73/pD1zPE
	01FtgX0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxnyZ-0002El-Qf; Fri, 08 Jan 2021 09:22:31 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxnyX-0002Cx-GJ
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2021 09:22:30 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DByKK0X3Hzj4Lk;
 Fri,  8 Jan 2021 17:21:41 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 17:22:17 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 -next] mtd: convert comma to semicolon
Date: Fri, 8 Jan 2021 17:23:00 +0800
Message-ID: <20210108092300.18909-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_042229_807897_8B7FF2F2 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/mtd/maps/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
index 377ef0fc4e3e..ca00d211e73e 100644
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -90,8 +90,8 @@ intel_iq80310_init(struct pci_dev *dev, struct map_pci_info *map)
 	u32 win_base;
 
 	map->map.bankwidth = 1;
-	map->map.read = mtd_pci_read8,
-	map->map.write = mtd_pci_write8,
+	map->map.read = mtd_pci_read8;
+	map->map.write = mtd_pci_write8;
 
 	map->map.size     = 0x00800000;
 	map->base         = ioremap(pci_resource_start(dev, 0),
@@ -185,8 +185,8 @@ intel_dc21285_init(struct pci_dev *dev, struct map_pci_info *map)
 		return -ENXIO;
 
 	map->map.bankwidth = 4;
-	map->map.read = mtd_pci_read32,
-	map->map.write = mtd_pci_write32,
+	map->map.read = mtd_pci_read32;
+	map->map.write = mtd_pci_write32;
 	map->map.size     = len;
 	map->base         = ioremap(base, len);
 
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
