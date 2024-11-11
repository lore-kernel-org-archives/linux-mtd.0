Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C87CD2E9C7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPDw0sEtjfe+t8Z66gno8Y73CTfDCdtX1OUmcLZ3R+c=; b=Wcq94u8UCcKXdC
	pSXI/VGPpAGL8nIRf8juiAkJlNQY9Vj1Ub9WJAP4JNwrMbFyx5nUTBJtqbkM+mAeYDQc6L/u5hhWB
	1UbN+kEmU/p7XNIgNlpakyMtfKBCXvi3K92oAeAY8Z/UQicvHMIXywW8MOgA7fdQb18DV99izWo61
	e+26XZh0bND4Y07tCFPghW+3k2FQItspJGkCPWukx82nhcWObfozbriIVx+R3u2PS0EsnViY5mzLI
	2Iq0C+A7QJkTaFuo2IEYvgZHHSLmhZbrKOQ+unOqdTc4iT13M6qi6Lrzkpviul7lYJSHL0//bWoXO
	96HTIEyvG5Cz8tM7YlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQx-0000000H0X1-0RM9;
	Mon, 11 Nov 2024 09:10:07 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQg-0000000H0JA-0SEE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:09:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn3XY2SB6z28fSc;
	Mon, 11 Nov 2024 17:05:01 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C5F46180043;
	Mon, 11 Nov 2024 17:09:42 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 070/102] fsck.ubifs: Consolidate log
Date: Mon, 11 Nov 2024 17:07:58 +0800
Message-ID: <20241111090832.2093596-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010950_450165_D59C8DD2 
X-CRM114-Status: GOOD (  12.87  )
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

This is the 4/18 step of fsck. Consolidate log to ensure enough space
in log area. There could be following possible errors:
 1. corrupted scanning data in log area: danger mode with rebuild_fs and
    normal mode with 'yes' answer will turn to rebuild filesystem, other
    modes will exit.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c |  1 +
 ubifs-utils/fsck.ubifs/load_fs.c    | 26 ++++++++++++++++++++++++++
 ubifs-utils/libubifs/log.c          |  1 +
 3 files changed, 28 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 31c2aa6a..83c8a2c5 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -433,6 +433,7 @@ int main(int argc, char *argv[])
 	 * Step 1: Read master & init lpt
 	 * Step 2: Replay journal
 	 * Step 3: Handle orphan nodes
+	 * Step 4: Consolidate log
 	 */
 	err = ubifs_load_filesystem(c);
 	if (err) {
diff --git a/ubifs-utils/fsck.ubifs/load_fs.c b/ubifs-utils/fsck.ubifs/load_fs.c
index f376383c..42b1afaa 100644
--- a/ubifs-utils/fsck.ubifs/load_fs.c
+++ b/ubifs-utils/fsck.ubifs/load_fs.c
@@ -199,6 +199,32 @@ int ubifs_load_filesystem(struct ubifs_info *c)
 		goto out_orphans;
 	}
 
+	if (!c->ro_mount) {
+		int lnum;
+
+		/* Check for enough log space */
+		lnum = c->lhead_lnum + 1;
+		if (lnum >= UBIFS_LOG_LNUM + c->log_lebs)
+			lnum = UBIFS_LOG_LNUM;
+		if (lnum == c->ltail_lnum) {
+			log_out(c, "Consolidate log");
+			err = ubifs_consolidate_log(c);
+			if (err) {
+				unsigned int reason = get_failure_reason_callback(c);
+
+				clear_failure_reason_callback(c);
+				if (reason & FR_DATA_CORRUPTED) {
+					if (fix_problem(c, LOG_CORRUPTED, NULL))
+						FSCK(c)->try_rebuild = true;
+				} else {
+					ubifs_assert(c, reason == 0);
+					exit_code |= FSCK_ERROR;
+				}
+				goto out_orphans;
+			}
+		}
+	}
+
 	c->mounting = 0;
 
 	return 0;
diff --git a/ubifs-utils/libubifs/log.c b/ubifs-utils/libubifs/log.c
index 0d459261..c3dfd98e 100644
--- a/ubifs-utils/libubifs/log.c
+++ b/ubifs-utils/libubifs/log.c
@@ -711,6 +711,7 @@ int ubifs_consolidate_log(struct ubifs_info *c)
 	destroy_done_tree(&done_tree);
 	vfree(buf);
 	if (write_lnum == c->lhead_lnum) {
+		set_failure_reason_callback(c, FR_DATA_CORRUPTED);
 		ubifs_err(c, "log is too full");
 		return -EINVAL;
 	}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
