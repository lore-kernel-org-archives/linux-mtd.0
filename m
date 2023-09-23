Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE61CE7A88
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Sep 2023 01:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zF/klcpKqco3i+/GUcb3on2NZyzN4Lgo33KtKKNPFkk=; b=lsJ7SWai0TxTqp
	PpXPcz48XBxIo3ujrnPmMWVOoUS++SVHr3oI2tsduf+OOdQ0F66xxjeVEEPWf+QuGRYNGVVWNVWvP
	k526SqwLNIUAFRUbhuF6gLmabVy92JZhWueY1UoEoXbhUbYM3VWbWD+tdaiGzLQXHhVgV+cWWdoeh
	VyzKztl0v+tGV7T2B07CAfeUPMD9tjlyhYsqy8NtPsHILchd4l3GxvaSW+IlX8j/ARjlA32M68Do8
	STHyjJDKcH0KDWw4SAIlX/ZUyA+IeADz30fGv8S0myNb0RC4scW8H7ErhhGAaDlSKI13nLdhuIwnL
	2+YK+S+WpoWLP7Ymiuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjr3V-00A4Tg-36;
	Sat, 23 Sep 2023 01:03:33 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjr3R-00A4Sc-2y
	for linux-mtd@lists.infradead.org;
	Sat, 23 Sep 2023 01:03:32 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RsrRl5NFLz15NRV;
	Sat, 23 Sep 2023 09:01:07 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 23 Sep
 2023 09:03:16 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [RFC] mtd: Fix error code loss in mtdchar_read() function.
Date: Sat, 23 Sep 2023 08:58:56 +0800
Message-ID: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_180330_123631_8428A745 
X-CRM114-Status: UNSURE (   9.51  )
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

In the first while loop, if the mtd_read() function returns -EBADMSG
and 'retlen' returns 0, the loop break and the function returns value
'total_retlen' is 0, not the error code.

This problem causes the user-space program to encounter EOF when it has
not finished reading the mtd partion, and this also violates the read
system call standard in POSIX.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217939
Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/mtdchar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8dc4f5c493fc..ba60dc6bef98 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -211,7 +211,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 	}
 
 	kfree(kbuf);
-	return total_retlen;
+	return total_retlen ? total_retlen : ret;
 } /* mtdchar_read */
 
 static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t count,
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
