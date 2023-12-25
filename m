Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA9C47074
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Dec 2023 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SuAGCIPNePElXDBZfPLafaspg8mNiAvyAo9f2tW9n0=; b=HAryIe5soGQxA2
	iDSNhjwuZd5WEaYkM5zFF6lQi0WrgtudgvqeU3q+jIwKLAIgc0ShUggLz99u6vq1sLBHcV7eZY8lx
	BsNOShBDRcjcm3JJBzNMwgfLlxSVZPZbcCx5J7qECOhF72lRMS+ZU/YAwuindK9KudeT1Xz5QEIY6
	5g2x3g++Zji611lp2W6iQFU2apeI9cYPvRzgqyGR2DSRUpXyMs4h7nGhXX9ktDM9H6bO97AqZfi5x
	ZGvOi/mJyrv3UamSZlUcUaZuPQTtjA2qwYbUetLXgOZR4qntjO1fc5Mhn3G1+huIojl/TSZ61XyJM
	PLHehK9OFAN2zDPHOnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHf9d-00AK9V-2f;
	Mon, 25 Dec 2023 07:13:37 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHf9X-00AK4r-1o
	for linux-mtd@lists.infradead.org;
	Mon, 25 Dec 2023 07:13:33 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Sz8J43wwGzZdsC;
	Mon, 25 Dec 2023 15:13:08 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id E06D11800BB;
	Mon, 25 Dec 2023 15:13:17 +0800 (CST)
Received: from huawei.com (10.175.104.67) by dggpemd200001.china.huawei.com
 (7.185.36.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Mon, 25 Dec
 2023 15:13:17 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH v5 5/5] mtd: Add several functions to the fail_function list
Date: Mon, 25 Dec 2023 15:10:55 +0800
Message-ID: <20231225071055.1721000-6-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225071055.1721000-1-wangzhaolong1@huawei.com>
References: <20231225071055.1721000-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_231331_768909_669DF316 
X-CRM114-Status: GOOD (  11.33  )
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

add mtd_read(), mtd_write(), mtd_erase(), mtd_block_markbad() to
fail_function list for testing purpose

- Specify the function to inject the fault
echo mtd_read > /sys/kernel/debug/fail_function/inject

- Specifies the return value of the function to inject the fault
printf %#x -12 > /sys/kernel/debug/fail_function/mtd_read/retval

- Specify other fault injection configuration parameters.
echo -1 > /sys/kernel/debug/fail_function/times
echo 100 > /sys/kernel/debug/fail_function/probability
echo 15 > /sys/kernel/debug/fail_function/space

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtdcore.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index bb0759ca12f1..e451b28840d5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -30,6 +30,7 @@
 #include <linux/debugfs.h>
 #include <linux/nvmem-provider.h>
 #include <linux/root_dev.h>
+#include <linux/error-injection.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -1412,6 +1413,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
+ALLOW_ERROR_INJECTION(mtd_erase, ERRNO);
 
 /*
  * This stuff for eXecute-In-Place. phys is optional and may be set to NULL.
@@ -1511,6 +1513,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_read);
+ALLOW_ERROR_INJECTION(mtd_read, ERRNO);
 
 int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf)
@@ -1527,6 +1530,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_write);
+ALLOW_ERROR_INJECTION(mtd_write, ERRNO);
 
 /*
  * In blackbox flight recorder like scenarios we want to make successful writes
@@ -2347,6 +2351,7 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtd_block_markbad);
+ALLOW_ERROR_INJECTION(mtd_block_markbad, ERRNO);
 
 /*
  * default_mtd_writev - the default writev method
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
