Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC9EC83F17
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3oxvx/0L35KfZjvWwAZFcLCnM/63eCBXl2gHtfso8A=; b=XNH9aDtZmJr0WH
	VSALBigEVPtWSzF8nqdeySA39IFVjwaTWoXcdybVEdmhvdHbw1lcP+aKqZucqvGL+BjHf2KGDtOpG
	AceNVwzR3dcjbLMWX4HP5eTDLHv7kCnUsWGALHP62WiDpPDz0FkpghiRRRZqgTPRbNa4sjqJSmJeB
	5JcTsUsMuONMtu98wzuvKKEcVajHr8JQ0OVW1Tq40sv1A4+DLyYMo8ZkhSFw8RerQKccjx03bit6P
	xDjCQM0Eh6DViutxW06KBrNlzuwd6SBmqLKtPK6K2NDurUxVlEUuqlrGBK0KiRdfIgEHgu/uHTiQf
	c65XLeaE+/zuqAAkwQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVyr-008yl3-0h;
	Mon, 28 Aug 2023 06:44:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy8-008yAs-0v;
	Mon, 28 Aug 2023 06:43:27 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RZ1BJ4fW5zNnFx;
	Mon, 28 Aug 2023 14:39:36 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:12 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <bagasdotme@gmail.com>
Subject: [PATCH v2 02/12] ubi: fastmap: erase_block: Get erase counter from wl_entry rather than flash
Date: Mon, 28 Aug 2023 14:38:35 +0800
Message-ID: <20230828063845.3142561-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_234324_541763_371CEA4D 
X-CRM114-Status: GOOD (  10.05  )
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

Just like sync_erase() does, getting erase counter from wl_entry is
faster than reading from flash.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index f8c230acc55e..05ecdc049343 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1399,36 +1399,27 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
  */
 static int erase_block(struct ubi_device *ubi, struct ubi_wl_entry *e)
 {
-	int ret;
+	int err;
 	struct ubi_ec_hdr *ec_hdr;
-	long long ec;
+	long long ec = e->ec;
 
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ec_hdr)
 		return -ENOMEM;
 
-	ret = ubi_io_read_ec_hdr(ubi, e->pnum, ec_hdr, 0);
-	if (ret < 0)
-		goto out;
-	else if (ret && ret != UBI_IO_BITFLIPS) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	ret = ubi_io_sync_erase(ubi, e->pnum, 0);
-	if (ret < 0)
+	err = ubi_io_sync_erase(ubi, e->pnum, 0);
+	if (err < 0)
 		goto out;
 
-	ec = be64_to_cpu(ec_hdr->ec);
-	ec += ret;
+	ec += err;
 	if (ec > UBI_MAX_ERASECOUNTER) {
-		ret = -EINVAL;
+		err = -EINVAL;
 		goto out;
 	}
 
 	ec_hdr->ec = cpu_to_be64(ec);
-	ret = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
-	if (ret < 0)
+	err = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
+	if (err < 0)
 		goto out;
 
 	e->ec = ec;
@@ -1439,7 +1430,7 @@ static int erase_block(struct ubi_device *ubi, struct ubi_wl_entry *e)
 
 out:
 	kfree(ec_hdr);
-	return ret;
+	return err;
 }
 
 /**
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
