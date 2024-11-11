Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1305D12D7F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXr8UYHVh+xrLvn49w4q8sWtpt802xCvgJSIbDDVCQw=; b=LKINT2A51pPUO2
	qzTH2tFjicv7ASRs8HDqW5vvwKyd8xjSVwhX+431Vh4qln7ZIxTXYc7dg27CIjortysaQVe7cqAVA
	nbzQ4TahuX3b333jX2qbt1Dumpor5hiwareMxWCvBu8rQqAfMdThL0hAO+aVkHTKCS5FisssEjo2T
	oK/0VpTtDH+1r5QkBklBGC4tuNrk58n8RnNEbRm/uPRCJxx41QquR6CxELz7pygmDGcp7NdZMqviR
	5Tt9NVWwiKU9hcfFN4F0hqeZpUZI+mhNhruakH3fRP6S+6EVQ9Lhp47WDRbV3AGz7MsBqmBKGQJHp
	rhw3P7Nam674y27dISSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOX8-0000000GbXI-0HtH;
	Mon, 11 Nov 2024 07:08:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVB-0000000GZzO-3Lox
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Cu4xjtL6YUzsxES4Jzwvo4fHX1mEIs/30poyJ5pCt5k=; b=tc3QH6Pcn+Nnr6AE3Vc+gg4XdV
	Cg777zDDwbD7A6f4paK1q7ncFgoEFZmV4S0fZ1lNX+hxsDXRUkURxwkcbaITIZR0BT+FaGIrGi+zy
	yZMfUoLG57pJ0OMrvZxWqseURt6uC83TslUjd4No5R3CxRQ2DinQMP76wzu/GXlFnJgSn1s105twZ
	flbP4zAP9hCKBpGAbmaHknzKESMPmH17WwJzX5txQ6KSTixTdaIgZ3kTS0lQL8Zy/9vmWk9oipS6G
	c45MzFQU05PdHPBGOAc+UXcERMlj0oSz7TBYdRnafZvufR8u0T2VEqPY6UOa1/fwLvfr531w3vLaV
	u8EZakMA==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV5-0000000CR44-1B6Z
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xn0qk4Nmwz1TB5b;
	Mon, 11 Nov 2024 15:02:58 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DCD521400DC;
	Mon, 11 Nov 2024 15:05:24 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:24 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 047/102] ubifs-utils: open_ubi: Set errno if the target is not char device
Date: Mon, 11 Nov 2024 15:02:50 +0800
Message-ID: <20241111070346.1314122-48-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070615_913143_8408B4D0 
X-CRM114-Status: UNSURE (   8.44  )
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

Set errno if the target is not char device. It will be useful for
fsck to print error message if open_ubi failed.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/super.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/libubifs/super.c b/ubifs-utils/libubifs/super.c
index 1cbbfcac..9fa366f3 100644
--- a/ubifs-utils/libubifs/super.c
+++ b/ubifs-utils/libubifs/super.c
@@ -43,9 +43,14 @@ int open_ubi(struct ubifs_info *c, const char *node)
 {
 	struct stat st;
 
-	if (stat(node, &st) || !S_ISCHR(st.st_mode))
+	if (stat(node, &st))
 		return -1;
 
+	if (!S_ISCHR(st.st_mode)) {
+		errno = ENODEV;
+		return -1;
+	}
+
 	c->libubi = libubi_open();
 	if (!c->libubi)
 		return -1;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
