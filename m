Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740E8CDB474
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5GqZyMw+wcONqbiNEUuPuZtfk7+IT6IQMqyDnYqOl8=; b=ffQJ7PYDJhxUyT
	Urchn66ed9XcxqNCxr4LlCc1ytXO0wn6dE3xof/EvhCwKKnfjTLThpWP5pqHa2l+j/SfJIFOaljcM
	WxY54cC0WDhjHUe7Nw7/ZHtocYZPFk1ACNJSSHZljA7tURwpYbADUflHvJsJyrpRYz+50U6IWsPzA
	aHDeEFP5ca61n9LriBGBS5pHRYvY9t0+e8eGhOIrwuaZIkfqoqqGZT6mlWZn5IfXcA3Wv91X0mFV2
	mT1obzNfjeUp3700j+6A1ia6VXFXrtWrUvob0XgY66RAxbPWQnC9UOKhJVMdTgwS8UBTsl5XIBzXl
	tukO7Ea1gp83A4aaw21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjEY-001LwF-2S;
	Fri, 20 Oct 2023 06:43:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjER-001Lr1-30
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 06:43:43 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SBZgX0VrtzNp74;
	Fri, 20 Oct 2023 14:39:20 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 20 Oct
 2023 14:43:19 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH v3 2/5] ubi: Split io_failures into write_failure and erase_failure
Date: Fri, 20 Oct 2023 14:48:00 +0800
Message-ID: <20231020064803.643399-3-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231020064803.643399-1-wangzhaolong1@huawei.com>
References: <20231020064803.643399-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_234340_435283_32127AA0 
X-CRM114-Status: UNSURE (   9.02  )
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

The emulate_io_failures debugfs entry controls both write
failure and erase failure. This patch split io_failures
to write_failure and erase_failure.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/debug.c | 13 +++++++++----
 drivers/mtd/ubi/debug.h | 14 ++++++++------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 81682bd72eb9..3ce5265e3a16 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -14,7 +14,8 @@
 
 #ifdef CONFIG_MTD_UBI_FAULT_INJECTION
 static DECLARE_FAULT_ATTR(fault_bitflips_attr);
-static DECLARE_FAULT_ATTR(fault_io_failures_attr);
+static DECLARE_FAULT_ATTR(fault_write_failure_attr);
+static DECLARE_FAULT_ATTR(fault_erase_failure_attr);
 static DECLARE_FAULT_ATTR(fault_power_cut_attr);
 
 #define FAIL_ACTION(name, fault_attr)			\
@@ -24,7 +25,8 @@ bool should_fail_##name(void)				\
 }
 
 FAIL_ACTION(bitflips,		fault_bitflips_attr)
-FAIL_ACTION(io_failures,	fault_io_failures_attr)
+FAIL_ACTION(write_failure,	fault_write_failure_attr)
+FAIL_ACTION(erase_failure,	fault_erase_failure_attr)
 FAIL_ACTION(power_cut,		fault_power_cut_attr)
 #endif
 
@@ -245,8 +247,11 @@ static void dfs_create_fault_entry(struct dentry *parent)
 	fault_create_debugfs_attr("emulate_bitflips", dir,
 				  &fault_bitflips_attr);
 
-	fault_create_debugfs_attr("emulate_io_failures", dir,
-				  &fault_io_failures_attr);
+	fault_create_debugfs_attr("emulate_write_failure", dir,
+				  &fault_write_failure_attr);
+
+	fault_create_debugfs_attr("emulate_erase_failure", dir,
+				  &fault_erase_failure_attr);
 
 	fault_create_debugfs_attr("emulate_power_cut", dir,
 				  &fault_power_cut_attr);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index fa7e12fa43f9..7386c40474de 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -92,10 +92,12 @@ static inline int ubi_dbg_erase_failure(const struct ubi_device *ubi)
 /* Emulate bit-flips */
 #define MASK_BITFLIPS				(1 << 2)
 /* Emulates -EIO during write/erase */
-#define MASK_IO_FAILURE				(1 << 3)
+#define MASK_WRITE_FAILURE			(1 << 3)
+#define MASK_ERASE_FAILURE			(1 << 4)
 
 extern bool should_fail_bitflips(void);
-extern bool should_fail_io_failures(void);
+extern bool should_fail_write_failure(void);
+extern bool should_fail_erase_failure(void);
 extern bool should_fail_power_cut(void);
 
 static inline bool ubi_dbg_fail_bitflip(const struct ubi_device *ubi)
@@ -107,15 +109,15 @@ static inline bool ubi_dbg_fail_bitflip(const struct ubi_device *ubi)
 
 static inline bool ubi_dbg_fail_write(const struct ubi_device *ubi)
 {
-	if (ubi->dbg.emulate_failures & MASK_IO_FAILURE)
-		return should_fail_io_failures();
+	if (ubi->dbg.emulate_failures & MASK_WRITE_FAILURE)
+		return should_fail_write_failure();
 	return false;
 }
 
 static inline bool ubi_dbg_fail_erase(const struct ubi_device *ubi)
 {
-	if (ubi->dbg.emulate_failures & MASK_IO_FAILURE)
-		return should_fail_io_failures();
+	if (ubi->dbg.emulate_failures & MASK_ERASE_FAILURE)
+		return should_fail_erase_failure();
 	return false;
 }
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
