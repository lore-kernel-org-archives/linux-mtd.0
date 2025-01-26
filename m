Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E01C02192
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6DQL7KDpIpYUCpw9YDVZs9eA3AGT6/TyXUEcmwoZ+k=; b=DyS7qdlQTMm55L
	H/kjoZQpGKZlaBHtW1VoMQhTVEeCCl+qKkdWnEp9vXpG2no4ohI1r4mKMouVSK2iaQ0x9p/wWLtNq
	fGoeCdsVZ0ZkmmznjlsXToRzum9PtdhYDazIuG48CK8YAL6ND2BOw+tlgqEfSvYTT7x3giEAC5G3L
	8y+0rsbSqW4Nqrl9HUNeIqq0CRuxVwkg/Xj98f7d1oqlKfFQGu8eUuIAs3oBHCMKIj+mZyw4v6Q56
	Lfwlmpf74ZfleTV2ofShqOwu1KY17U0BTRRFVlwVD+tuG/ehwaPHYLZ9y4uIQlraeB2aLunMmTCRQ
	g2ZcZPHXdnWuMiZiOSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQs-0000000HAME-0ICT;
	Sun, 26 Jan 2025 06:47:46 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQo-0000000HAIx-23a1
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yghpw2tXXz1l095;
	Sun, 26 Jan 2025 14:44:08 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4DDFC180042;
	Sun, 26 Jan 2025 14:47:32 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 6/7] ubifs-utils: common: Add descritpions for linux kernel resource files
Date: Sun, 26 Jan 2025 14:42:02 +0800
Message-ID: <20250126064203.3348494-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224742_739165_6E6175AB 
X-CRM114-Status: UNSURE (   8.19  )
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

Add descritpions for kernel resource files.
Remove crc32 related descritpions, there is no crc32 related files
imported from the linux kernel.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/common/README | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/ubifs-utils/common/README b/ubifs-utils/common/README
index a93ebd0..8fe716e 100644
--- a/ubifs-utils/common/README
+++ b/ubifs-utils/common/README
@@ -1,14 +1,13 @@
 Common Library
 
-* crc16.h and crc16.c were copied from the linux kernel.
-* crc32.h and crc32.c were copied from mtd-utils and amended.
+* crc16.h and crc16.c were copied from the linux kernel(https://elixir.bootlin.com/linux/v5.10.232/source/lib/crc16.c).
 * defs.h is a bunch of definitions to smooth things over.
 * hashtable/* was downloaded from http://www.cl.cam.ac.uk/~cwc22/hashtable/
 * atomic.h was downloaded from https://the-linux-channel.the-toffee-project.org/index.php?page=6-tutorials-linux-user-space-atomic-operations
-* bitops.h and bitops.c were copied from the linux kernel.
-* compiler_attributes.h was copied from the linux kernel.
-* linux_types.h was copied from the linux kernel.
-* linux_err.h was copied from the linux kernel.
-* hexdump.c was copied from the linux kernel.
-* kmem.h and kmem.c were partial copied from xfsprogs-dev (https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/)
-* sort.h and sort.c were copied from the linux kernel.
+* bitops.h and bitops.c were copied from the linux kernel(https://elixir.bootlin.com/linux/v5.10.232/source/lib/find_bit.c).
+* compiler_attributes.h was copied from the linux kernel(https://elixir.bootlin.com/linux/v5.10.232/source/include/linux/compiler_attributes.h).
+* linux_types.h was copied from the linux kernel(https://elixir.bootlin.com/linux/v5.10.232/source/include/linux/types.h overflow.h fscrypt.h).
+* linux_err.h was copied from the linux kernel(https://elixir.bootlin.com/linux/v5.10.232/source/include/linux/err.h).
+* hexdump.c was copied from the linux kernel(https://elixir.bootlin.com/linux/v5.10.232/source/lib/hexdump.c).
+* kmem.h and kmem.c were partial copied from xfsprogs-dev(https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/).
+* sort.h and sort.c were copied from the linux kernel(https://elixir.bootlin.com/linux/v5.10.232/source/lib/sort.c).
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
