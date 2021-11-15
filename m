Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AFCC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 01:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD4D60F0F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 01:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DD4D60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpazA8493kwpHkX87nLt/6PDZTL0ZAhEPkrc0N1Za+Y=; b=jMryRgm/+r8PQ8
	Jiyp0dreCUcWiSR29Tk9u1geAIxlCHFwbkgBocz1GBKmfZz5i7W/EWe0alBn0aqVmbXcb3bNdS38Z
	gYElT28jYcTjIjHdBkDaX1NH5zWYyEYrLkYDRsfhbwig8cHlx+hZlCcHSxQ18kRsR6VbPj03w5Z5x
	MEppVWg7P0JiCdjDk7pYMJZKlDGcpp2iz5zcdU1nuOTy8oKVj4DeWoLMrAlVZGXCVkXz6MvReP8BA
	wdooC3/rGEvFXg4xTH/YLga6NYo90YM3iC4mJj/SN77381xTGgD3p8msEG7tSjs1+jNJvWqx3F/bI
	2rh4nYRhil1HS1npMEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmQf6-00ECeV-Qn; Mon, 15 Nov 2021 01:19:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmQeh-00ECbW-0E
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 01:19:33 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hsrv10lWJz9129;
 Mon, 15 Nov 2021 09:19:09 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 15 Nov 2021 09:19:23 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 15 Nov
 2021 09:19:23 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>, Hulk Robot
 <hulkci@huawei.com>
Subject: [PATCH -next 2/3] ubifs: fix double return leb in
 ubifs_garbage_collect
Date: Mon, 15 Nov 2021 09:31:43 +0800
Message-ID: <20211115013144.2479319-3-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115013144.2479319-1-libaokun1@huawei.com>
References: <20211115013144.2479319-1-libaokun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_171931_229906_918F2870 
X-CRM114-Status: UNSURE (   7.68  )
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

If ubifs_garbage_collect_leb() returns -EAGAIN and enters the "out"
branch, ubifs_return_leb will execute twice on the same lnum. This
can cause data loss in concurrency situations.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 fs/ubifs/gc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 05e1eeae8457..1f74a127fe3a 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -758,6 +758,8 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 				err = ubifs_return_leb(c, lp.lnum);
 				if (err)
 					ret = err;
+				/*  Maybe double return LEB if goto out */
+				lp.lnum = -1;
 				break;
 			}
 			goto out;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
