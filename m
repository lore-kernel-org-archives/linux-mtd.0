Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062ADD12D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YzPNCT4Q76UxbyyLB0APx2ziwLJXq2DGwmPJPBnHJQ=; b=uOX6kHRSCA78bP
	/jWLhxrUvT+vc47/oxI/REldtEAeyHM0pn6i8R0P4vlwrGD7LzdWCay+3I7qwS6vkmSiWPUTrESeK
	tdzqUWXufWUSLMdWZG/ZmKkQ6aHLQSG2R7pEnleio8y/copm1w4J8spm4clywHOOW09RIjQXwJahX
	NGKQS8Fu6ED1hKT09VNr/+6HKGUNPszjFtwkYHH0bXFLxrF/rvHxbT/RPqzhXtAWc0uYt9DAvinOj
	S34f4LsrCkzrY+MwQSameV7kPAGUWHhBgX5MDi7Duw5hh7B61ahiHW9Ah3XuC4O1Xj/rqPtmMx46/
	ux5NZW//4zv8K4etdVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPTz-0000000GkdG-07x2;
	Mon, 11 Nov 2024 08:09:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSq-0000000Gjnw-28bg
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 08:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p1Z++r/5r8aUdFyAmcNrgxAyqCgFksBSaLVIOIOBF+E=; b=JU3mBsAkkjSq2iQf4EwTzD1QLW
	5U3LK1hv0++Op493xkZVQcU0Z3T8bwNxH6HAjQfQ/sIprGkLW+vJj9nyCE+EKGNDi9PDe3GJ5nuN1
	MiBD2nrqWTfdFXL4+TrH1cCV9+Gk+ssrGB8alrKbglG0arr3Alvv93hgyG8maB+1W549Ddv3qgER2
	i8Z5KfMVAaB6AXbA3EgC94N26OjtmvIDR7Vii/ypa2emcRaZv/B8Kz9Oz7YtUAAOoaN+dziFDmC2j
	KH+cXKTdhmym5Dsc3y8WREDGWEI4fC5lWAgTBlCrATSX95XgiXHjp2aEwh9nWwNzDWPaQCgTIvu2F
	obZXOpnA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSk-0000000CnCq-1raZ
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:07:59 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn2DQ5900z10V7J;
	Mon, 11 Nov 2024 16:05:58 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B06841800F2;
	Mon, 11 Nov 2024 16:07:50 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:07:50 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 067/102] fsck.ubifs: Read master node & init lpt
Date: Mon, 11 Nov 2024 16:06:15 +0800
Message-ID: <20241111080621.1394382-36-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_080755_551852_C6083FB7 
X-CRM114-Status: GOOD (  18.30  )
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

This is the 1/18 step of fsck. Read and check master node, init lpt.
There could be following errors:
 1. corrupted scanning data in master area or invalid master node:
    danger mode with rebuild_fs and normal mode with 'yes' answer will
    turn to rebuild filesystem, other modes will exit.
 2. incorrect space statistics in master node: Set %FR_LPT_INCORRECT for
    for lpt status. Ignore the error.
 3. corrupted lpt: Set %FR_LPT_CORRUPTED for lpt status. Ignore the error.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c |  5 ++-
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |  2 +-
 ubifs-utils/fsck.ubifs/load_fs.c    | 78 +++++++++++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/problem.c    |  1 +
 ubifs-utils/libubifs/lpt.c          | 18 +++++++--
 ubifs-utils/libubifs/master.c       |  7 +++-
 6 files changed, 104 insertions(+), 7 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index e6744516..2fd68df5 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -423,7 +423,10 @@ int main(int argc, char *argv[])
 		goto out_destroy_fsck;
 	}
 
-	/* Init: Read superblock */
+	/*
+	 * Init: Read superblock
+	 * Step 1: Read master & init lpt
+	 */
 	err = ubifs_load_filesystem(c);
 	if (err) {
 		if (FSCK(c)->try_rebuild)
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index d25ecc2d..7f826156 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -37,7 +37,7 @@ enum { NORMAL_MODE = 0, SAFE_MODE, DANGER_MODE0,
        DANGER_MODE1, REBUILD_MODE, CHECK_MODE };
 
 /* Types of inconsistent problems */
-enum { SB_CORRUPTED = 0 };
+enum { SB_CORRUPTED = 0, MST_CORRUPTED };
 
 struct scanned_file;
 
diff --git a/ubifs-utils/fsck.ubifs/load_fs.c b/ubifs-utils/fsck.ubifs/load_fs.c
index 4a06b4c2..036e307c 100644
--- a/ubifs-utils/fsck.ubifs/load_fs.c
+++ b/ubifs-utils/fsck.ubifs/load_fs.c
@@ -99,10 +99,81 @@ int ubifs_load_filesystem(struct ubifs_info *c)
 		goto out_mounting;
 	}
 
+	log_out(c, "Read master & init lpt");
+	err = ubifs_read_master(c);
+	if (err) {
+		if (test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED)) {
+			if (fix_problem(c, MST_CORRUPTED))
+				FSCK(c)->try_rebuild = true;
+		} else
+			exit_code |= FSCK_ERROR;
+		goto out_master;
+	}
+
+	init_constants_master(c);
+
+	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
+		ubifs_msg(c, "recovery needed");
+		c->need_recovery = 1;
+	}
+
+	if (c->need_recovery && !c->ro_mount) {
+		err = ubifs_recover_inl_heads(c, c->sbuf);
+		if (err) {
+			exit_code |= FSCK_ERROR;
+			goto out_master;
+		}
+	}
+
+	err = ubifs_lpt_init(c, 1, !c->ro_mount);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto out_master;
+	}
+
+	if (!c->ro_mount && c->space_fixup) {
+		err = ubifs_fixup_free_space(c);
+		if (err) {
+			exit_code |= FSCK_ERROR;
+			goto out_lpt;
+		}
+	}
+
+	if (!c->ro_mount && !c->need_recovery) {
+		/*
+		 * Set the "dirty" flag so that if we reboot uncleanly we
+		 * will notice this immediately on the next mount.
+		 */
+		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
+		err = ubifs_write_master(c);
+		if (err) {
+			exit_code |= FSCK_ERROR;
+			goto out_lpt;
+		}
+	}
+
+	if (!c->ro_mount && c->superblock_need_write) {
+		err = ubifs_write_sb_node(c, c->sup_node);
+		if (err) {
+			exit_code |= FSCK_ERROR;
+			goto out_lpt;
+		}
+		c->superblock_need_write = 0;
+	}
+
 	c->mounting = 0;
 
 	return 0;
 
+out_lpt:
+	ubifs_lpt_free(c, 0);
+out_master:
+	c->max_sqnum = 0;
+	c->highest_inum = 0;
+	c->calc_idx_sz = 0;
+	kfree(c->mst_node);
+	kfree(c->rcvrd_mst_node);
+	free_wbufs(c);
 out_mounting:
 	c->mounting = 0;
 out_free:
@@ -118,8 +189,15 @@ out_free:
 void ubifs_destroy_filesystem(struct ubifs_info *c)
 {
 	free_wbufs(c);
+	ubifs_lpt_free(c, 0);
+
+	c->max_sqnum = 0;
+	c->highest_inum = 0;
+	c->calc_idx_sz = 0;
 
 	kfree(c->cbuf);
+	kfree(c->rcvrd_mst_node);
+	kfree(c->mst_node);
 	kfree(c->ileb_buf);
 	kfree(c->sbuf);
 	kfree(c->bottom_up_buf);
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index acb9e45e..1af66632 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -36,6 +36,7 @@ struct fsck_problem {
 
 static const struct fsck_problem problem_table[] = {
 	{0, "Corrupted superblock"},	// SB_CORRUPTED
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA | PROBLEM_NEED_REBUILD, "Corrupted master node"},	// MST_CORRUPTED
 };
 
 static void print_problem(const struct ubifs_info *c,
diff --git a/ubifs-utils/libubifs/lpt.c b/ubifs-utils/libubifs/lpt.c
index c0df7c7d..b07f1f77 100644
--- a/ubifs-utils/libubifs/lpt.c
+++ b/ubifs-utils/libubifs/lpt.c
@@ -1883,8 +1883,13 @@ static int lpt_init_rd(struct ubifs_info *c)
 	c->dirty_idx.max_cnt = LPT_HEAP_SZ;
 
 	err = read_ltab(c);
-	if (err)
-		return err;
+	if (err) {
+		if (test_and_clear_failure_reason_callback(c, FR_LPT_CORRUPTED) &&
+		    can_ignore_failure_callback(c, FR_LPT_CORRUPTED))
+			err = 0;
+		else
+			return err;
+	}
 
 	err = lpt_check_hash(c);
 	if (err)
@@ -1938,8 +1943,13 @@ static int lpt_init_wr(struct ubifs_info *c)
 		if (!c->lsave)
 			return -ENOMEM;
 		err = read_lsave(c);
-		if (err)
-			return err;
+		if (err) {
+			if (test_and_clear_failure_reason_callback(c, FR_LPT_CORRUPTED) &&
+			    can_ignore_failure_callback(c, FR_LPT_CORRUPTED))
+				err = 0;
+			else
+				return err;
+		}
 	}
 
 	for (i = 0; i < c->lpt_lebs; i++)
diff --git a/ubifs-utils/libubifs/master.c b/ubifs-utils/libubifs/master.c
index 61ff4cec..54d2a789 100644
--- a/ubifs-utils/libubifs/master.c
+++ b/ubifs-utils/libubifs/master.c
@@ -323,7 +323,12 @@ out:
 	set_failure_reason_callback(c, reason);
 	ubifs_err(c, "bad master node at offset %d error %d", c->mst_offs, err);
 	ubifs_dump_node(c, c->mst_node, c->mst_node_alsz);
-	return -EINVAL;
+	err = -EINVAL;
+	if (can_ignore_failure_callback(c, reason)) {
+		clear_failure_reason_callback(c);
+		err = 0;
+	}
+	return err;
 }
 
 /**
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
