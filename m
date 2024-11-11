Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0643ED2E9C7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXr8UYHVh+xrLvn49w4q8sWtpt802xCvgJSIbDDVCQw=; b=Q2e+4f4s4bCBFE
	EWXze7EdaFBbl/JxcvuEMqYXly3W/iib4xuwfrKL0C+n8mII2yCQAgw522aXYq7jUdvS7/AubxV1V
	/tygks1JSQFdTGaCeRJt14XarxiH2bx8DnvLc44uouv4zFOBDpiVuZVmKFQW8cTRvulF1zUqha9ST
	TBnyQZ2OMsBnmGst3eRpJtZxtWObSofQrSOdUXjpWFMsrjIMgi+tbzphP4EhPaaYBksNjUAMw4qgh
	AQu7kxAMS/WGyDd1vI5uNvVjL9Cbl1N1a+t8XMDlouqUAGqp3xHNYDOtROPBlvK0l1MC8cJESaN0k
	NnuclwepXGTWIoWc5ABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGM-0000000Gvgn-3zuG;
	Mon, 11 Nov 2024 08:59:10 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQG9-0000000GvUj-3aYV
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:58:59 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn3J566sWz28fPr;
	Mon, 11 Nov 2024 16:54:13 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E5051A016C;
	Mon, 11 Nov 2024 16:58:55 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:58:54 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 047/102] ubifs-utils: open_ubi: Set errno if the target is not char device
Date: Mon, 11 Nov 2024 16:57:18 +0800
Message-ID: <20241111085741.2066378-8-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111085741.2066378-1-chengzhihao1@huawei.com>
References: <20241111085741.2066378-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_005858_212614_ACE7B53B 
X-CRM114-Status: UNSURE (   9.65  )
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
