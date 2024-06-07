Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF2FC27C6E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkD22Z1cZHK+DaaptqGchtaQlFlq+sQRQmyiQKwjVe0=; b=mJtsefYxwAKkSR
	P6BA7c6RDgT5UYPFnBTtXmYn3hDaQ5HoOpGs1PwLfh0T+u/FLeDgQaJLLvqW/HRh7adMLGdX7GBdI
	tSA5YUqF3krgHLfoVghRDwY6Gr3W/fYzXVu6J0Md0UIhJqPtg/BmMvQxnEC376kTsc6aJv6AfNmnw
	IXTCKzGv7LbawrmHDgD2hzQKpbboBBlxw2+OIk8VWk+bOj3AGvm/Q46jWZybv280heLvxBuKHTERZ
	TAs2COfPUVCg1ZRD7eQYTCgjm+GxI5L0H0xc3Qi/X/hfiraObm7V87suRx7kvcHpkJnPdqsVOcN/7
	7MEhmh5W1AcJmyOC1wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSEi-0000000CW4N-2okx;
	Fri, 07 Jun 2024 05:34:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRD7-0000000CHML-2HFi
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=GHYUCPQ+bf3Negw5+dEpvov9XwI4Otmj5eHF3D27Fnw=; b=pdf9ZkKLO4pukCML25zcdu+AhO
	oH6cWxRaDBj4twgD05YwJYDV7ubZCpmRft2QhA7KzTyqgjvIgdk1OR4k3eP5SNdgfjRbmmoSyUt+2
	sWhiF0CHqJMsqJ/SSaEZJNCnh20/utFmCWU9qIt1UbMWppWqaFnXA40OZLLY+f3C+EF4581TWVZZp
	wjN9iXIRov76WfihlEArtJUO9wluxWEhrQFZH1TBbyNRIZH1cOdADyvzBYsAu7C4jZW6QhGrlaMlt
	mevSw97rGRO4EXcbbP2S0hwoxDwxfYdTe71FFc9wjTFmGvtRwEBgbkIBoiBVoCPVd6+akDpsuI9aj
	W4vh2Tdw==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRD3-00000004U9w-2poB
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSkP4MKNzwRq8;
	Fri,  7 Jun 2024 12:23:41 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 81D11180AA6;
	Fri,  7 Jun 2024 12:27:40 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:22 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 076/110] fsck.ubifs: Read master node & init lpt
Date: Fri, 7 Jun 2024 12:25:41 +0800
Message-ID: <20240607042615.2069840-77-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052814_359565_D71EB433 
X-CRM114-Status: GOOD (  14.50  )
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
index 683d7c27..34641c89 100644
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
index 1d97aed3..cbe432c4 100644
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
