Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F3BD2E9C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXKQ7tXedUIJz4FesonVGk43hHqS6x/0Tpx2anL0Sak=; b=hlrnba6B89sG56
	9bAtyKci02qv5Efi+ZR3+9N+lccaiIZOwXyNo2xqg/ldHPsXwQByniqODSPChdOSha61qVFE7rnYz
	G6bt2DWsb6KjVjSZT5q4l2C9PvwsubFqYBnxTu8belP6EoF3AlD0k42ICtC/TBby+fO6rjFfw0Cnd
	MePzA8CLffdz9J9Gqp5Ks5XxIMm7HHBpIak9HazqT61Rz4mv4Vt4xnozyUJ9uIHe8/ATJmHMMhoqk
	so8J6di8Ro9hL4a4zUqBmT1p3upVLs9kLlzyR7fXwJiG1/PwoteGGQqWhSTAmPGnN/KQ+PIX3wxQ/
	pHFoRd18FJHvpH1Jt/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQWP-0000000H3J8-2MXc;
	Mon, 11 Nov 2024 09:15:45 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSa-0000000GjYD-0yay
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:07:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn2DM3zYLz2DgcN;
	Mon, 11 Nov 2024 16:05:55 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D3146140391;
	Mon, 11 Nov 2024 16:07:42 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:07:38 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 024/102] ubifs-utils: Add descriptions for new lib files in common/README
Date: Mon, 11 Nov 2024 16:05:53 +0800
Message-ID: <20241111080621.1394382-14-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_000744_470946_E9F6CF38 
X-CRM114-Status: UNSURE (   8.27  )
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

There are several new libs(eg. atomic, kmem, bitops. etc.) have
been imported into ubifs-utils, add descriptions for these libs
in README.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/common/README | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ubifs-utils/common/README b/ubifs-utils/common/README
index 8c10fd4b..32d04e3a 100644
--- a/ubifs-utils/common/README
+++ b/ubifs-utils/common/README
@@ -7,3 +7,11 @@ Common Library
 * defs.h is a bunch of definitions to smooth things over.
 * lpt.c is a selection of functions copied from fs/ubifs/lpt.c from the linux kernel, and amended.
 * hashtable/* was downloaded from http://www.cl.cam.ac.uk/~cwc22/hashtable/
+* atomic.h was downloaded from https://the-linux-channel.the-toffee-project.org/index.php?page=6-tutorials-linux-user-space-atomic-operations
+* bitops.h and bitops.c were copied from the linux kernel.
+* compiler_attributes.h was copied from the linux kernel.
+* linux_types.h was copied from the linux kernel.
+* linux_err.h was copied from the linux kernel.
+* hexdump.c was copied from the linux kernel.
+* kmem.h and kmem.c were partial copied from xfsprogs-dev (https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/)
+* sort.h and sort.c were copied from the linux kernel.
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
