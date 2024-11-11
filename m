Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CA5D2E9C2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXKQ7tXedUIJz4FesonVGk43hHqS6x/0Tpx2anL0Sak=; b=nK9VMPn6y050ZQ
	oBARREB4wp6ase2lQWiRJq3renCeyPtpAzkVstMO0JWSHPWfHZbZXV3hzfW7HZHRcDULTQCtTkF+n
	Ad4DxAGWFs8vPEJb9X0dvczXFVmQ/XQwAFS3ipYW4mZsKHOOEeLVgDjeRPnR1jT1QflWG8hKHI+54
	HEiumH2b1On7tVpM2MOGzuerlf7/wNdI4d7y8Dy1FsuNFfbD2ruXMwGuz/DPezxnpAmx09QBLfOo8
	w72Oz5Q2J72pGa9jBk5iBQ6W+U1UIpBK6PU1N32yrazERVIIMqh8xQtIeUvY/DUon4VcldDHFBrCr
	8gNPimpeRLfBLWWl7+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ7b-0000000GsiF-2pl1;
	Mon, 11 Nov 2024 08:50:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwS-0000000Gpjc-1i7r
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn2vs5fH2zpZRH;
	Mon, 11 Nov 2024 16:36:41 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E4C301800A5;
	Mon, 11 Nov 2024 16:38:34 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 024/102] ubifs-utils: Add descriptions for new lib files in common/README
Date: Mon, 11 Nov 2024 16:36:55 +0800
Message-ID: <20241111083711.1916125-25-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003836_784864_EE43AD9E 
X-CRM114-Status: UNSURE (   8.46  )
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
