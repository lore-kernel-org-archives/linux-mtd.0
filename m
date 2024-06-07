Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98173C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iStEc1vt5uiuoc5VXv5bfIftBMcMisjQzKXC5bBp5Qk=; b=x/BNGutC9ASSo9
	c3glF9VsPXI0BUvAjSYl3iyhEKHY+lZQDTanQbPMzF+X3UfZ9c+cm38xsiJpKCo6/36x8dMcW89A/
	Hmnsoq135e0kB735v46e/k4LR6+E4dasr9hXoYCDhPf/f3H8E1hEydycF5NoKkwvGpx45pMxN9JOA
	79PuJWCVFr5vJMe/y1CRFaS9e7bdWrAtF79lzZVW114DGbrRQr17i4/+RfHl3GZy1zEzQsxx/KlO6
	BvZiLWBtiFkojnqrcj6otWKzUQJ3AvlHo7Vr8S3oOVEEFjOnr1RQG+TCuKBddHRsm7AirGDd1H3d4
	MHXnSVHRA326gGLhSQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDZ-0000000CHjL-2dCW;
	Fri, 07 Jun 2024 04:28:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRC4-0000000CGS4-18qZ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSjq54v1z1S9pR;
	Fri,  7 Jun 2024 12:23:11 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 72A3818007E;
	Fri,  7 Jun 2024 12:27:10 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:51 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 033/110] ubifs-utils: Add descriptions for new lib files in common/README
Date: Fri, 7 Jun 2024 12:24:58 +0800
Message-ID: <20240607042615.2069840-34-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212712_899456_8FC2F9AB 
X-CRM114-Status: UNSURE (   7.97  )
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

There are serveral new libs(eg. atomic, kmem, bitops. etc.) have
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
