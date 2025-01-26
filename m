Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EC9C0218F
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKm81c3rh33Qa66gkEFuk+dUFV3HZS8r9dttu/KaOJg=; b=FsHIzN5EaDjt7m
	no71TVdPCfbXaIdyz721RdaONpHLWF+3wN5DzHlYqekifcCx1ukt1UmqT2DScYEYuCd/CzD2sZnRh
	1OxFIUCUdPjlfL5idFz7hpBkpH86tVItEAidLFcB6Z9JDBE3WgYJ5mBqMd7Xpnb8WcIWD2Wntzh2F
	eIbFj9sJVDJRuhHaON25Kaase9kMzTvLGo4b59wpgftoeKN6MXjegHwxMwHHE7V+dgxXWqUZYPhoT
	cAOtJYzH9qYgXMukRonvnYNgyNXjPqt0vPZDrtAIJvlgcBaavwhhm+qSZVSwqmh+0MgNGU+Lx/ZFH
	1sJ6tOYLdRETgxwjPhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQr-0000000HAM3-2KNv;
	Sun, 26 Jan 2025 06:47:45 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQo-0000000HAJ0-0Enc
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Yghpt4HKHz1V5Y8;
	Sun, 26 Jan 2025 14:44:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 42DE01A016C;
	Sun, 26 Jan 2025 14:47:31 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:30 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 4/7] jffsX-utils: jffs2reader: Fix potential null pointer dereference compiling warning for 'path'
Date: Sun, 26 Jan 2025 14:42:00 +0800
Message-ID: <20250126064203.3348494-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224742_259372_ABA2BFCA 
X-CRM114-Status: UNSURE (   9.71  )
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

The compiler compains following message:
 jffsX-utils/jffs2reader.c:697:6: warning: potential null pointer
 dereference
It won't bring any problems because the 'path' is guaranteed to be a
non-NULL variable. Fix the warning by adding a NULL pointer check.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 jffsX-utils/jffs2reader.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/jffsX-utils/jffs2reader.c b/jffsX-utils/jffs2reader.c
index 87a2167..548fc8d 100644
--- a/jffsX-utils/jffs2reader.c
+++ b/jffsX-utils/jffs2reader.c
@@ -694,6 +694,9 @@ static struct jffs2_raw_dirent *resolvepath0(char *o, size_t size, uint32_t ino,
 
 	pp = path = xstrdup(p);
 
+	if (path == NULL)
+		return NULL;
+
 	if (*path == '/') {
 		path++;
 		ino = 1;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
