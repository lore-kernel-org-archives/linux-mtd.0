Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138C4C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXr8UYHVh+xrLvn49w4q8sWtpt802xCvgJSIbDDVCQw=; b=GDzStDhoiOwHtK
	0koPf5ocA9BjzPWKssUozNNGxUHYeMz9u6NBeE6Qzl5vkXTurz3fs3uNUw21bohsQ6V4XFJC+I/9q
	pdwNRGdIASMiAWHGuCwpYhwT20fDOH5bsOUbekOseTOB0LaitHhpnUUGkdzw5R7Vph4w9yfRDBZIL
	FBWKsW0KT/89haEyu6K1Que41ATAxb9Qa4/Knwzw9O6U8hGOa/YSy9avptxfA5780qC6qJ6Zj0Rm6
	5AU0Goxy37x6zkYkkG5LGWc89iJBK5E8XzoyRajKeppxD7FJMua9OOIiJWx/FO8dI4Dknk/caCp6r
	qEmpBtA0+YVerF88M27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRT4-0000000CO71-01mi;
	Fri, 07 Jun 2024 04:44:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRT0-0000000CO5Q-12aB
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:44:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSjP5d5lzmYRQ;
	Fri,  7 Jun 2024 12:22:49 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 97025180085;
	Fri,  7 Jun 2024 12:27:25 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:08 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 056/110] ubifs-utils: open_ubi: Set errno if the target is not char device
Date: Fri, 7 Jun 2024 12:25:21 +0800
Message-ID: <20240607042615.2069840-57-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_214442_529338_DABBEE99 
X-CRM114-Status: UNSURE (   9.33  )
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
