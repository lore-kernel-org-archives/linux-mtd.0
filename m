Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1309C432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 08:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B67060FF2
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 08:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B67060FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u2/HILb49xjgWS5YNBWV1xra7HwnSB6IKqoCjwdciiY=; b=T8RRIlm6KvjVDY
	uE2wkNmhX7FbuA8bAogcMzCBDWTO/C58tMGUHnzIZ6AzPww65Yz2jLM8XBT1/1LMHOuGjUbdoCOQM
	rWzarPKjGy2r3UxKGzDr8CwKIhPQV9sb3F6MwjuQCWjonGYFoesWG7EbXDyG/dt9I41Vs3QuIJ+xE
	Ef1NcWYpv0kJXoX+Zx0CuYTHnHb9kTucYAx8FusTC1Y3ZAmo6bYhPrNjSkgHsyYx9jcGai/V0LPXM
	09aNRCNT092V7Tyae+KGqcZpHVmOdlRN/ZvB2ayy+u6QmSvqrR5rBINYLi9oST8PQttfFGp3UTxpq
	wgo6ibOARvmsUR1CKM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKcuf-00GmyE-AM; Mon, 30 Aug 2021 08:45:05 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKcuc-00Gmwh-BO
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 08:45:04 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GykLP5rC9zbkb9;
 Mon, 30 Aug 2021 16:41:01 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 30 Aug 2021 16:44:55 +0800
Received: from huawei.com (10.67.174.117) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 30 Aug
 2021 16:44:55 +0800
From: "GONG, Ruiqi" <gongruiqi1@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Yi Yang
 <yiyang13@huawei.com>, Wang Weiyang <wangweiyang2@huawei.com>, Xiu Jianfeng
 <xiujianfeng@huawei.com>
Subject: [PATCH] mtd: Remove obsolete macros only used by the old
 nand_ecclayout struct
Date: Mon, 30 Aug 2021 16:33:56 +0800
Message-ID: <20210830083356.31702-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.117]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_014502_610680_2F6F67CD 
X-CRM114-Status: UNSURE (   7.62  )
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

All uses of MTD_MAX_{OOBFREE,ECCPOS}_ENTRIES_LARGE have been removed as
commit ef5eeea6e911 ("mtd: nand: brcm: switch to mtd_ooblayout_ops") and
commit aab616e31d1c ("mtd: kill the nand_ecclayout struct") replaced
struct nand_ecclayout by the new mtd_ooblayout_ops interface. Remove
these two macros therefore.

Reported-by: Yi Yang <yiyang13@huawei.com>
Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>
---
 include/linux/mtd/mtd.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 88227044fc86..f5e7dfc2e4e9 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -72,8 +72,6 @@ struct mtd_oob_ops {
 	uint8_t		*oobbuf;
 };
 
-#define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
-#define MTD_MAX_ECCPOS_ENTRIES_LARGE	640
 /**
  * struct mtd_oob_region - oob region definition
  * @offset: region offset
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
