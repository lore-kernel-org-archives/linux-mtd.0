Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6EBC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 01:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C58860F0F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 01:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C58860F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJLRCCWy01U5Ch/kKeluOQbSttNWvW8sfpB2Qz0amew=; b=nZGQCXUWAUsInu
	MnbjegP816RliTAPaizFut1Vxnx9ZNhFUs6UOv2wLdUGXH3btjY29Yn7RRVxQXj+nSzHQTTKfVo+G
	Im9qEctshJNmfS4JSbgZJ5Bz+ohs1wSq+JL+uYOuR2XJwghiihuvH7jqrzsWFwMvCnFfaaJWGO3tl
	7mRvpiN7aUlIOOVnIkXJ0R9KfvoTZwAxKAZe/UG5k673oLew1Y8MxRyKpl1AP7iPK5QMvHmbsau/y
	gND4bkLi5dX/xhSjTID4Ky1CS4rfnK51vB3JybvtOTdAfKWVdpASbl+CStSkYg6tohQPv4QE4h2G/
	0xgSwRk77ejS3yL29ikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmQeu-00ECcy-NP; Mon, 15 Nov 2021 01:19:44 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmQeg-00ECbX-UA
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 01:19:32 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hsrrh40bpz1DJLW;
 Mon, 15 Nov 2021 09:17:08 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 15 Nov 2021 09:19:25 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 15 Nov
 2021 09:19:25 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH -next 3/3] ubifs: read-only if LEB may always be taken in
 ubifs_garbage_collect
Date: Mon, 15 Nov 2021 09:31:44 +0800
Message-ID: <20211115013144.2479319-4-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115013144.2479319-1-libaokun1@huawei.com>
References: <20211115013144.2479319-1-libaokun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_171931_178658_4C00CD43 
X-CRM114-Status: GOOD (  10.12  )
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

If ubifs_garbage_collect_leb() returns -EAGAIN and ubifs_return_leb
returns error, a LEB will always has a "taken" flag. In this case,
set the ubifs to read-only to prevent a worse situation.

Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 fs/ubifs/gc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 1f74a127fe3a..3134d070fcc0 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -756,8 +756,17 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 				 * caller instead of the original '-EAGAIN'.
 				 */
 				err = ubifs_return_leb(c, lp.lnum);
-				if (err)
+				if (err) {
 					ret = err;
+					/*
+					 * An LEB may always be "taken",
+					 * so setting ubifs to read-only,
+					 * and then executing sync wbuf will
+					 * return -EROFS and enter the "out"
+					 * error branch.
+					 */
+					ubifs_ro_mode(c, ret);
+				}
 				/*  Maybe double return LEB if goto out */
 				lp.lnum = -1;
 				break;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
