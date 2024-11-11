Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B923D12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPDw0sEtjfe+t8Z66gno8Y73CTfDCdtX1OUmcLZ3R+c=; b=1GpiMkhLZe8aDc
	Y35jvmQAkOL43n12PKfKHHmpmi4XhwFCo2l7UeeOCYq4HrTZ5cMVC79pfkA+BVfWGKofGjAOsEW1J
	3aUj3hg/pEe0aP7LwP9vHEUaUPqV4mPFtjX1CWSz8QDFw7dabysRNjJ0OD4MI0ZatpIkhHBnzAo1N
	by2VexXPV5UCPOGanDq1mH0qapsYBqV824xfFsEOVA2uuDQ8w2FeN2wGTdlZ5/rvbPkidaObEGiK3
	rYIIasJaJG8AqcwHWGQH0ST0/k5YId0xymZY3p+a55aN0gkXOmRk5JfpsSxNlbuYgCslDY1rBXxyI
	nJuOkIdd8LxL8rZUdxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOXD-0000000GbbI-10LX;
	Mon, 11 Nov 2024 07:08:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVC-0000000GZzb-09BY
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xUCmy/FOdEfnEPFrw9AqEgziGWbIzmPBPxnMTiDK9qc=; b=fMaFghT1fNYcFo10Gt01e/Pz95
	iDVM1uJmrTb1/qp9o4w/zoe80VfAVH24TEQVd7ygKBKyYrM0Xlp1roJiDBPbhfWCifKkrfXY9GG5P
	a1SWav2ZHl88lRfdB878gnCrAk4HDmTititDGcD1FbmgUuAX2/r0xVdQYn0jp9gvpL5vrR3Uf1V1d
	yTcNn3Jq8vFdZyWNyHHYu17By/dBk5ns0ybum7CwGWe9S6/kPLlILLuaqsqPYcK+ksBQwZ0QVQIER
	rh6kuO4GQqdpT6IRvlu7SM3lQDHtQGGKmh+o3m8ODJs0kqOcNfuoUdDcyqgUc1ZUwKfdLLyI5OYiH
	abCpcfkA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUz-0000000CmOj-3FIw
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn0qx6h3zz10Qvv;
	Mon, 11 Nov 2024 15:03:09 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8126E1400D8;
	Mon, 11 Nov 2024 15:05:36 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 070/102] fsck.ubifs: Consolidate log
Date: Mon, 11 Nov 2024 15:03:13 +0800
Message-ID: <20241111070346.1314122-71-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070613_769758_6B46DBDA 
X-CRM114-Status: GOOD (  13.19  )
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
