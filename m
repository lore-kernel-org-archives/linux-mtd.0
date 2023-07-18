Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C840EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MCkD29k11AeeQGs/TU1/rRiMXV5nApYEPSqsKIWW/s=; b=IFxyRlqHS6+HMn
	UrtdTpqL6HSQaViJsKlnCAJAZKhC79y3fEy9blUG9qxsnkGcstJQJ4cgiTlpYUUF4xCwjgCBg/ubK
	nA5nPsgpMc8Sh48Fr6JoKSCRubgesbi74jWT7MAoRmCeyN1Lrc3++BaHo3LYhvLrXok3tfipWlh4J
	sBwCOBCSzcMVip1ZViStKM6DiIKf40JLTKTyahduZrDn+c5nCq9PxkYQknkjH8up2GBjuYouMUpV0
	x+blkVHmv3m1L/I+SkYApOgdYXyqE216GIpZJidD2fqK/D+2h7HcryCGNPfSiGsJYseq/8N4EkUnp
	U3KQchXL3SV/X8AEbvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11I-005vVi-27;
	Wed, 19 Jul 2023 06:50:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11G-005vU9-2o
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GehVwH3Xwy/U1Jg57Nh78uC1UHEcZbVFEAIbHMC5x6g=; b=DNW8WJMhP7/RrA4hccx3XsvZ1M
	LV9SRZITQgvgIzmMEwz17AkSCJZHKHSKmMGdp1IoDXa2/A7HfZPnYbZhbp2GbsY+1lmFXvcYHEh4Q
	eb8sPtwg8aSsMWL9BMHWtgMfnX0TDIM+PgPALVjWQbfaZfi/3Qpbm+JtdX7OmOlRt4Cwcheqpmt/F
	ftA0BCPcuTGVa4lzsYsvNCHXUdgMDCcjVpHlzyLo3GevsKjy7jCqvmqE4MK3W7S8hH56K9uTZ0zXO
	0UGURB91o96MhRTYx0o7WX8Otvjc48JgiO5rRcgs/LP3nOdAAh5eSfKY5NDr1vhs889oZJTpUhDgg
	kaVDAP6w==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgTs-00BK3Z-0l
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 08:54:54 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R4t5k6shWzrRhY;
	Tue, 18 Jul 2023 16:53:30 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 16:54:13 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH V2 4/5] ubi: Reserve sufficient buffer length for the input mask
Date: Tue, 18 Jul 2023 16:51:18 +0800
Message-ID: <20230718085119.3885747-5-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
References: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_095452_704826_D40DDC31 
X-CRM114-Status: GOOD (  10.48  )
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
V2:
  - A 16-byte buffer is reserved, as implemented by other interfaces.

 drivers/mtd/ubi/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 016a861c5029..1c3f1a2436e5 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -332,7 +332,7 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 	struct dentry *dent = file->f_path.dentry;
 	struct ubi_device *ubi;
 	struct ubi_debug_info *d;
-	char buf[8];
+	char buf[16];
 	int val;
 
 	ubi = ubi_get_device(ubi_num);
@@ -400,7 +400,7 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 	struct ubi_device *ubi;
 	struct ubi_debug_info *d;
 	size_t buf_size;
-	char buf[8] = {0};
+	char buf[16] = {0};
 	int val;
 
 	ubi = ubi_get_device(ubi_num);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
