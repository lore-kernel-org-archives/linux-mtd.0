Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F78AC74A5B
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Mar 2023 01:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLU+sZfXI9BVW12XbJ0Ff/KSl0dvAw3ETjFBrPGqcQc=; b=CWeqd1qJ5N/naR
	VzDoNiurn5uqdFnNQXFozxj7vjawAZuGaSVCoXIZ6BpPHc3bqiip9c4Uz7F090KwCHHVvpH/7y0UB
	W4KcYVVuYu0fH/6tN1yUcGYUTX9lbpEGqaxbHNxmxiPUHUQVmEin0ijTzPSNApJWGAirJTLno+RhN
	yE1idu4qSEslf7GwO94dp8uaf/QQOolRd7G0LySiIeGb7iJfu6/NXB0zLwo98kJ96l4M0fsCvlsrD
	60XD9EiazoajqJofFOzNR/iS8pj2p3e2z6pCwjcw8Zi2ISB+/RWQdmwT6LFXhmSoULrd8MMmeruDX
	Vf4vuRf9CjCnQ4jQuiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLp5-003thY-0n;
	Sat, 18 Mar 2023 01:57:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLoz-003tdW-0H
	for linux-mtd@lists.infradead.org;
	Sat, 18 Mar 2023 01:57:28 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Pdkb83BqNzHwjF;
	Sat, 18 Mar 2023 09:55:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Sat, 18 Mar
 2023 09:57:13 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH -next 2/5] ubi: Split io_failures into write_failure and erase_failure
Date: Sat, 18 Mar 2023 09:56:18 +0800
Message-ID: <20230318015621.1408243-3-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
References: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_185725_477220_78C93F45 
X-CRM114-Status: UNSURE (   9.79  )
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
---
 drivers/mtd/ubi/debug.c | 14 +++++++++-----
 drivers/mtd/ubi/debug.h | 18 ++++++++++--------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 2550522e2cd5..9c92bd59b639 100644
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
 
@@ -246,8 +248,11 @@ static void dfs_create_fault_entry(struct dentry *parent)
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
@@ -277,7 +282,6 @@ int ubi_debugfs_init(void)
 #ifdef CONFIG_MTD_UBI_FAULT_INJECTION
 	dfs_create_fault_entry(dfs_rootdir);
 #endif
-
 	return 0;
 }
 
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index bf843433a901..2486fcab4205 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -15,10 +15,11 @@
 /* Emulate bit-flips */
 #define MASK_BITFLIPS		(1 << 0)
 /* Emulates -EIO during write/erase */
-#define MASK_IO_FAILURE		(1 << 1)
+#define MASK_WRITE_FAILURE	(1 << 1)
+#define MASK_ERASE_FAILURE	(1 << 2)
 /* Emulate a power cut when writing EC/VID header */
-#define MASK_POWER_CUT_EC	(1 << 2)
-#define MASK_POWER_CUT_VID	(1 << 3)
+#define MASK_POWER_CUT_EC	(1 << 3)
+#define MASK_POWER_CUT_VID	(1 << 4)
 
 void ubi_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 void ubi_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr);
@@ -79,7 +80,8 @@ static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
 #ifdef CONFIG_MTD_UBI_FAULT_INJECTION
 
 extern bool should_fail_bitflips(void);
-extern bool should_fail_io_failures(void);
+extern bool should_fail_write_failure(void);
+extern bool should_fail_erase_failure(void);
 extern bool should_fail_power_cut(void);
 
 /**
@@ -104,8 +106,8 @@ static inline bool ubi_dbg_is_bitflip(const struct ubi_device *ubi)
  */
 static inline bool ubi_dbg_is_write_failure(const struct ubi_device *ubi)
 {
-	if (ubi->dbg.emulate_failures & MASK_IO_FAILURE)
-		return should_fail_io_failures();
+	if (ubi->dbg.emulate_failures & MASK_WRITE_FAILURE)
+		return should_fail_write_failure();
 	return false;
 }
 
@@ -118,8 +120,8 @@ static inline bool ubi_dbg_is_write_failure(const struct ubi_device *ubi)
  */
 static inline bool ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
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
