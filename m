Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707DBC07480
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JsChnPlT2ICxiFHDJM7JwKmH17GE49bm4Zv1Y+T3IE=; b=MViQVb9BRSvqYv
	5RtZLuX1MF6t26VaV0yTC4Lv23BoIzacMJ2mQphVmJbP6ovbU56+mzWCdbScT5pw54CAmBT6Qb/UK
	SAnxEoZqkYKTsw8DgNIYR+HinMGbSMZZpfG+WQZCpnJtCGDopO96f5Hccvab5YQbvPJYNMnngHEdd
	kVNleVo1fr6BX7cJtIcF6qW/W1OdrAtqFwjboI77HBj7H/TX1k2BBdXBI2QcxxvK+4HXSG+5/SIoy
	e+tfzS5wA4Ibw19PoQYNoejMAiJTQl5sbKkfMQiFERb6LzWrPF6s2K9IoIbaO6faSqH1nEYyoBMuB
	WvsXiBKYm9zZOWdlZurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjEX-001Lvo-1w;
	Fri, 20 Oct 2023 06:43:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjER-001Lr3-0Z
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 06:43:41 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SBZj05FVLz15Ndk;
	Fri, 20 Oct 2023 14:40:36 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 20 Oct
 2023 14:43:21 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH v3 5/5] mtd: Add several functions to the fail_function list
Date: Fri, 20 Oct 2023 14:48:03 +0800
Message-ID: <20231020064803.643399-6-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231020064803.643399-1-wangzhaolong1@huawei.com>
References: <20231020064803.643399-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_234339_535963_22DF2CFF 
X-CRM114-Status: GOOD (  11.81  )
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
echo mtd_read >  /sys/kernel/debug/fail_function/inject

- Specifies the return value of the function to inject the fault
printf %#x -12 > /sys/kernel/debug/fail_function/mtd_read/retval

- Specify other fault injection configuration parameters.
echo -1 > /sys/kernel/debug/fail_function/times
echo 100 > /sys/kernel/debug/fail_function/probability
echo 15 > /sys/kernel/debug/fail_function/space

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/mtdcore.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9bd661be3ae9..12d997278b2d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -30,6 +30,7 @@
 #include <linux/debugfs.h>
 #include <linux/nvmem-provider.h>
 #include <linux/root_dev.h>
+#include <linux/error-injection.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -1411,6 +1412,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
+ALLOW_ERROR_INJECTION(mtd_erase, ERRNO);
 
 /*
  * This stuff for eXecute-In-Place. phys is optional and may be set to NULL.
@@ -1508,6 +1510,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_read);
+ALLOW_ERROR_INJECTION(mtd_read, ERRNO);
 
 int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf)
@@ -1524,6 +1527,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_write);
+ALLOW_ERROR_INJECTION(mtd_write, ERRNO);
 
 /*
  * In blackbox flight recorder like scenarios we want to make successful writes
@@ -2344,6 +2348,7 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtd_block_markbad);
+ALLOW_ERROR_INJECTION(mtd_block_markbad, ERRNO);
 
 /*
  * default_mtd_writev - the default writev method
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
