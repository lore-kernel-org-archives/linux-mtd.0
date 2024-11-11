Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3929BD5E39E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXKQ7tXedUIJz4FesonVGk43hHqS6x/0Tpx2anL0Sak=; b=jmQqt+h8P7P4Xa
	31iVbYuliGJ/cFkKcMvT1mjuYIIsTILvJtU2B+KVdcU88lIoNbE7NHeF/CA2UIDB5mfc202OlSFa7
	h0qaeyn0oM9lTwLB4+VRKSyUo7OtonhCRgEA6SiM56PjnRVBmH2BD8AG9ecCXmal0QQ0Keiw/Z9g5
	nsjfNsZUKP+c1EsYTrU6HHCmlPQA1mLkATihL/6U1tR9c6H4Wrj5M8yJhYWSG9MMd4Cl4HnUtbYl8
	YIaeLx6z6BT9dRfDJlwuNhYcsvlXlPiYYO6arPFYYMRRfa4VnJFUjNm6VYUBgjLh0fCKi37NMMV9j
	qNHWjHRwcH/y9OwjMNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaV-0000000GmR6-28UQ;
	Mon, 11 Nov 2024 08:15:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUP-0000000GZGq-3M7K
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pvSJTIrXLcv9GS+7i044ZWLyGsoUgprFoIxQz91x5o4=; b=hQ+sxAdFnCCogkbEwkXlJIryiX
	I16Kj3DtmpdOXybJLf1cararfpAVTIjsHheliwI5pzZiNkUfmc3YQNuGmvLFwjNT6PiMUu52ogEEk
	kkTi2cQCRbVcKB/OIMDv+pb8KpHyXFH0xrgTuOec6aOe0FrNb7XJlgf2eS9+fdKXFpwlphRLPLwPO
	kkzdUwS0HowyuLZjMhCUyR8wU7V9xoWsFqU6soxSh2h0Ngdin0q0X9F277zAgfYjG7KAk1CcxRzt/
	f/JuWPkwWBiJgPb4pH0ZlH/kQDUtWL5f8m7Hn4YJzvVc4fvZ4LAVWJd/sCRHABA+fjWwMEehZWxVs
	EFLJS4lQ==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUK-0000000CmCp-3cr7
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rG1FXHz1jy0t;
	Mon, 11 Nov 2024 15:03:26 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D49E1A016C;
	Mon, 11 Nov 2024 15:05:13 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:12 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 024/102] ubifs-utils: Add descriptions for new lib files in common/README
Date: Mon, 11 Nov 2024 15:02:27 +0800
Message-ID: <20241111070346.1314122-25-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070529_605549_E1231890 
X-CRM114-Status: UNSURE (   8.22  )
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
