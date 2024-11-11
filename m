Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45117D12D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaiQVSvZqPAkvXkqZtdVfhpaQdxSGkSCVpXZc0bLhfE=; b=f7f6t8wA5zgUvb
	+tFR+b8cCaFc9p05Kk/8QjmybkdP9gjJrFLJqDQaJbf3v6m3y/hstXlGlKUk1f8qEPARsneXxEy7W
	JiVW5suA8zq8okhmHAW2WGtkTcKKKrnvrHPDxF7ku+pHSENe34pQXmUyAwQqlZg0AtWAv8acvLtcD
	qXia/r2XSzs+eOqJxAHkxRx3HP06mj+cvx68bo6tfKRedNeyNTPGs71QhWxvXd5e8FJIGL5D7Eqx4
	nAjTiuI7touq9V6wArD+1HDHTmRMgoEVh5zldVffsrzxdXbRCrHWgoFcqMZ43cb/EW06wTrDxTN0S
	OfeVxPZUTZa+gCpZthpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOWW-0000000Gb3V-0M1i;
	Mon, 11 Nov 2024 07:07:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV4-0000000GZsY-26Xl
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uxp2JkVDZzlTPLHDUJpPs7ZzoDtMHyPVTVrpJ724spA=; b=YSAM5Oe1wjs8+0lyBzDMFdEmLV
	GAodmR6Co6XeUWC6I8f2jKrZCuk3G5hkWneGa3pYtRFdXBc4Om7FFT2Iwxp85urBdf09XXJx1GFti
	7tvYaNxtVWY7zjZbqDufDddyXRVgOseB2MKR5Q2AqQbv4WTsxbgMPqX2M1kFb5wc8lvM9KfF2wBq+
	KIf4lzwlGak41Hg/VbmjabGELOdD60cj1ZnKPTklwr5R7MfAIOVbLp7CTxqk2YxYmOHjqnzc8VIS2
	NCbUrhDzXQeiWXo7Qkuti207V/+Q+6bJImWvxqSNIh2jbKoq7x7YJhWICXuzAR8bxxTpVow8EJm/Q
	eGhADnuA==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUh-0000000CmK7-1vdz
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rm41mbzpZLm;
	Mon, 11 Nov 2024 15:03:52 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A89021400DC;
	Mon, 11 Nov 2024 15:05:45 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:44 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 088/102] fsck.ubifs: Do final committing
Date: Mon, 11 Nov 2024 15:03:31 +0800
Message-ID: <20241111070346.1314122-89-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070552_912036_DE1D336D 
X-CRM114-Status: GOOD (  14.57  )
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

This is the 18/18 step of fsck. Do final committing, commit problem
fixing modifications(which are generated since step 14) to disk, and
clear %UBIFS_MST_DIRTY flag for master node.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c | 46 ++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 423a753f..6ca0b579 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -432,28 +432,25 @@ void handle_error(const struct ubifs_info *c, int reason_set)
 		exit_code |= FSCK_ERROR;
 }
 
-static int commit_fix_modifications(struct ubifs_info *c)
+static int commit_fix_modifications(struct ubifs_info *c, bool final_commit)
 {
 	int err;
 
-	if (exit_code & FSCK_NONDESTRUCT) {
+	if (final_commit) {
+		log_out(c, "Final committing");
+		c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_DIRTY);
+		c->mst_node->gc_lnum = cpu_to_le32(c->gc_lnum);
+		/* Force UBIFS to do commit by setting @c->mounting. */
+		c->mounting = 1;
+	} else if (exit_code & FSCK_NONDESTRUCT) {
 		log_out(c, "Commit problem fixing modifications");
-
-		/*
-		 * Force UBIFS to do commit by setting @c->mounting if changes
-		 * happen on disk. Committing is required once before allocating
-		 * new space(subsequent steps may need), because building lpt
-		 * could mark LEB(which holds stale data nodes) as unused, if
-		 * the LEB is overwritten by new data, old data won't be found
-		 * in next fsck run(assume that first fsck run is interrupted by
-		 * the powercut), which could affect the correctness of LEB
-		 * properties after replaying journal in the second fsck run.
-		 */
+		/* Force UBIFS to do commit by setting @c->mounting. */
 		c->mounting = 1;
 	}
+
 	err = ubifs_run_commit(c);
 
-	if (exit_code & FSCK_NONDESTRUCT)
+	if (c->mounting)
 		c->mounting = 0;
 
 	return err;
@@ -511,7 +508,16 @@ static int do_fsck(void)
 		goto free_disconnected_files_2;
 	}
 
-	err = commit_fix_modifications(c);
+	/*
+	 * Committing is required once before allocating new space(subsequent
+	 * steps may need), because building lpt could mark LEB(which holds
+	 * stale data nodes) as unused, if the LEB is overwritten by new data,
+	 * old data won't be found in the next fsck run(assume that first fsck
+	 * run is interrupted by the powercut), which could affect the
+	 * correctness of LEB properties after replaying journal in the second
+	 * fsck run.
+	 */
+	err = commit_fix_modifications(c, false);
 	if (err) {
 		exit_code |= FSCK_ERROR;
 		goto free_disconnected_files_2;
@@ -532,7 +538,7 @@ static int do_fsck(void)
 	}
 
 	if (list_empty(&FSCK(c)->disconnected_files))
-		return err;
+		goto final_commit;
 
 	log_out(c, "Check and create lost+found");
 	err = check_and_create_lost_found(c);
@@ -548,6 +554,13 @@ static int do_fsck(void)
 		goto free_disconnected_files_2;
 	}
 
+final_commit:
+	err = commit_fix_modifications(c, true);
+	if (err)
+		exit_code |= FSCK_ERROR;
+
+	return err;
+
 free_disconnected_files_2:
 	destroy_file_list(c, &FSCK(c)->disconnected_files);
 	return err;
@@ -604,6 +617,7 @@ int main(int argc, char *argv[])
 	 * Step 15: Check and create root dir
 	 * Step 16: Check and create lost+found
 	 * Step 17: Handle disconnected files
+	 * Step 18: Do final committing
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
