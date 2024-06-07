Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0525C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgzTHr7K6UAR9kgPQHeq0ddgAWmkKB9sGXLvEr5wGI0=; b=pHl2b4zY7mEWA2
	b8g/zdmgvPXoMYioBtps3IIXs8TfK9zV6xp1Japd7Y2sHRWen79OK7zkK6llUJSedwO30q9Kg5Wpb
	/zHBP4hSR8fWV2b9OnsweCimZ54NPFlePe1apVCzEBlW9V8J1QZKyabB9+DJhoJmrDHe2TN9UEARO
	XdXpR6C1PlM7GdC991AwFa2aIUaxWTIcQC23qrPq8pXEwckJmG5uyhCKUQ90YtWHQljt1Rn5kvVzn
	9tywakVIl3QDfqSDPVhlcOI1AXb12Dw21jqukhdiAG+oVW4ca1JimHtQpsWQ8eJ0XHb6PEs/arW2Y
	b4Sz42gziE6BbvpC80VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSRh-0000000CYcJ-0sE8;
	Fri, 07 Jun 2024 05:47:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRES-0000000CIP7-3WRy
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Jo49ZInzSYHzx/Pu9fGMng8eBULuEsmZoqscIOvRWpg=; b=eNEpmj8lPO5atSfqFmhaw/W5g7
	jdpLjHtiDvEJtG8E5Q65d1NbZdpbNPEw19RE8Kel3CukKmqIV+IlUlbUEqKCULBDjk6OYkEvRtuMO
	hibV8qX6Fu6Fp3qIbeTBJQZDWFWr2xJWY9ZRff8QBOMqwfyFSXAgCeWr+QWVt2FWxQcdfFmIf+6P+
	zpRJ/Y5LjpPkPLU8j8+MGyGiYZsbPJDJYEaQbesAfnvM330F8j7gHm0BYS0Q7D5+q/HvFwnerbbZo
	e+TS5D7LgymtATQ3/VBmrRiCXUSWn9pve1hpiCIOaiLR/Qcjz16mo5D+EoJ1kRteTqudX6nziOSyP
	ooFwgV0Q==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFREP-00000004UL8-0gov
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:29:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSm11spzzwS3r;
	Fri,  7 Jun 2024 12:25:05 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 30CDD140336;
	Fri,  7 Jun 2024 12:28:49 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:38 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 097/110] fsck.ubifs: Do final committing
Date: Fri, 7 Jun 2024 12:26:02 +0800
Message-ID: <20240607042615.2069840-98-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052937_838340_E6E410EC 
X-CRM114-Status: GOOD (  12.24  )
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
index 831a13db..b1b56194 100644
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
