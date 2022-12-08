Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CD8C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s8v/VhyK+SjhQaY7oVHgwjLC9xXm6Uyb9onf8ZXAAxw=; b=06ho9JN7ioZWqA
	OQbZbKKRy0yC662iP6lbt29LTNhuCwXL5QJXVgjgsZkC/AtRFqlwgeB1fTf0R48h/3xx19GiXNzh3
	SMiIyjTl9t0xLMyBWsiyaavWC1YAH6jLRqpVTmvgYt+8uL+IdCPEagL1tuppAPf63AMb8Hqvdlcxe
	M+W9Zruw+/6JAKzuRT0VZ/H2kfVQWX3Wir7OFm/L3rJ7IGOGRHPfonm7bMMlPa9syrHEaewRq3Prm
	aKDeasKiW1pG664IZOS7EmwmDegVYsKKdhLPsCmdLCXk+SVLzqj0RYcQ4UDgGjpAWMfmrm6U54ZKV
	X8XJj+d0Sj+HELPmH6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3FBW-00FS6I-Ew; Thu, 08 Dec 2022 11:35:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3FBT-00FS0S-ES
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 11:35:24 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NSX6s4XfZzJpC1;
	Thu,  8 Dec 2022 19:31:49 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 8 Dec
 2022 19:35:21 +0800
From: Yuan Can <yuancan@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<rafal@milecki.pl>, <error27@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <yuancan@huawei.com>
Subject: [PATCH v2] mtd: parsers: Fix potential memory leak in mtd_parser_tplink_safeloader_parse()
Date: Thu, 8 Dec 2022 11:32:53 +0000
Message-ID: <20221208113253.77120-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_033523_716190_0EB18529 
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

The parts needs to be freed with all its elements, otherwise it will be
leaked.

Fixes: 00a3588084be ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/mtd/parsers/tplink_safeloader.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
index f601e7bd8627..1c689dafca2a 100644
--- a/drivers/mtd/parsers/tplink_safeloader.c
+++ b/drivers/mtd/parsers/tplink_safeloader.c
@@ -91,7 +91,7 @@ static int mtd_parser_tplink_safeloader_parse(struct mtd_info *mtd,
 	buf = mtd_parser_tplink_safeloader_read_table(mtd);
 	if (!buf) {
 		err = -ENOENT;
-		goto err_out;
+		goto err_free_parts;
 	}
 
 	for (idx = 0, offset = TPLINK_SAFELOADER_DATA_OFFSET;
@@ -118,6 +118,8 @@ static int mtd_parser_tplink_safeloader_parse(struct mtd_info *mtd,
 err_free:
 	for (idx -= 1; idx >= 0; idx--)
 		kfree(parts[idx].name);
+err_free_parts:
+	kfree(parts);
 err_out:
 	return err;
 };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
