Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF2EC6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Mar 2023 01:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l1aNm9XCESzve1BjSMYGnzBOHXVgRl8ZXOHKidWtag=; b=lrE2399wNcq7RI
	FLzT3WIoscRb2KiHcZUYdYhFUr6R/BS+vIyOX9q8RaktaPPZrNZFCT+zodf0GiSMnvSIhWIbvW7Es
	bNR5a2dEDUjKYeGCWeIhApV4cNaTSBsAk+pa+MH8W7EHvwpCC19mx2JLD29HjrhkYLOkgLsa5pwCz
	57mqa3z2B/hjPdD10BYz1nsWiuVaR7ePiuzq74KN2Y1y7TLbf7aKRqmpzGnVFmufwKT4OnZxDhHwa
	jA2X1dIvm1KmV+Q3ymUbousuFOaIgv3Kfj7dTbQq2rFRkZTB8WACn2sMZo+4aMZ2G4O46G6VZ1K/a
	i1Wfvg8DjlO+jzGeg2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLp1-003tfP-1d;
	Sat, 18 Mar 2023 01:57:27 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLoy-003tdS-2S
	for linux-mtd@lists.infradead.org;
	Sat, 18 Mar 2023 01:57:26 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PdkZF38LlznXgR;
	Sat, 18 Mar 2023 09:54:13 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Sat, 18 Mar
 2023 09:57:14 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH -next 4/5] ubi: Reserve sufficient buffer length for the input mask
Date: Sat, 18 Mar 2023 09:56:20 +0800
Message-ID: <20230318015621.1408243-5-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
References: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_185724_989405_B7D62749 
X-CRM114-Status: GOOD (  10.24  )
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

Because the mask received by the emulate_failures interface
is a 32-bit unsigned integer, ensure that there is sufficient
buffer length to receive and display this value.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 0c58cbabe9fc..eafeb10e57bf 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -332,7 +332,7 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 	struct dentry *dent = file->f_path.dentry;
 	struct ubi_device *ubi;
 	struct ubi_debug_info *d;
-	char buf[8];
+	char buf[12];
 	int val;
 
 	ubi = ubi_get_device(ubi_num);
@@ -381,7 +381,7 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 	struct ubi_device *ubi;
 	struct ubi_debug_info *d;
 	size_t buf_size;
-	char buf[8] = {0};
+	char buf[14] = {0};
 	int val;
 
 	ubi = ubi_get_device(ubi_num);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
