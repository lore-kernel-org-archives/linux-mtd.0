Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E114C47409
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 13:20:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8FFB20842
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 13:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evODaq8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8FFB20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzDxElIMAmd4vrUos6pUEn9NyhfQ5Vs4o+hvOJhzy0M=; b=evODaq8+gj5Ci9
	5hFZXSQE02bkhUnia4FIhLzwaxW+v9In8u89M3PhRLs8XLgrV5ILOB/R/jHm2FMxNUVOJAheV6zA8
	DNP4jSTLJcyazEie3O+EWzdmfyKXcn5fDfOvSqO0z6UdRbqRq74qcxvbmv+FIpulUbAJP/75fL2TW
	fYkYKFEAg4aZ0lCLkgg6n+a6sauGGD7NJpWIrSH6n+g6PBYSgutwgdDVI1YQd2WInkTQjPQp4YKIX
	RlZEMEA7LWNUF1zLMIBMRPiBO607whsNagrkQMMHKQMLgjc4UAL1CaLBsnL1zxAsOY3KS2HbdH5Yh
	q5ihgUZLscuJzhTRIodA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j18yg-0000fd-L6; Mon, 10 Feb 2020 13:19:54 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j18yc-0000dT-T4
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 13:19:52 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6E4F2CB45EBCE9134845;
 Mon, 10 Feb 2020 21:19:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 10 Feb 2020
 21:19:18 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH v2 2/2] UBI: fastmap: only produce the initial anchor PEB when
 fastmap is used
Date: Mon, 10 Feb 2020 21:26:35 +0800
Message-ID: <20200210132635.50072-2-houtao1@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200210132635.50072-1-houtao1@huawei.com>
References: <20200210132635.50072-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_051951_108803_F839FB4D 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: houtao1@huawei.com, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Don't produce the initial anchor PEB when ubi device is read-only
or fastmap is disabled, else the resulting PEB will be unusable
to any volume.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/mtd/ubi/wl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index af2fe77eb66f..87ff4e51cb8c 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1879,7 +1879,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		goto out_free;
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	ubi_ensure_anchor_pebs(ubi);
+	if (!ubi->ro_mode && !ubi->fm_disabled)
+		ubi_ensure_anchor_pebs(ubi);
 #endif
 	return 0;
 
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
