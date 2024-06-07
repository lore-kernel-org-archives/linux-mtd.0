Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BB0C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UR/LJn73PLxFEABBHrb8JJvrY9m9aGSXzdikc/fDZDc=; b=c4OjAAIyRnZCfQ
	JJlGTSXLghkOuHUZsf/oWMB6A1/mZPdiI6782IP0OrshGfdEjvss8KPSHM4K+FzQs3S/gI7lAtEAd
	rGGlr/CP6aDFUtDZJKvWdM2h+xjWSTFDREQOIPDBDU4tIp/d0vM6JLkVJpp/31gTEpKhEziU1vdQr
	puGwGoZN9ULGfnzdi8pv9iEqSgrPrbrbQfoM8bD8TG7Eru3r/37b68ZQAsKX5Em6oy1TUZfOcUCkK
	pUsSdXTI/0fDMXLscigdmz0zUejdB426Vrk6umEwWOVnjJzed5ZHVaBQtKpcXa/bbWFPNHBWW+Sdc
	/uWi8PYMFBJAurdQKMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSEZ-0000000CVuw-0J4C;
	Fri, 07 Jun 2024 05:33:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCk-0000000CH3g-3gwN
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSkQ6H1vzsTT0;
	Fri,  7 Jun 2024 12:23:42 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 86AA5180085;
	Fri,  7 Jun 2024 12:27:41 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 091/110] fsck.ubifs: Commit problem fixing modifications to disk
Date: Fri, 7 Jun 2024 12:25:56 +0800
Message-ID: <20240607042615.2069840-92-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212755_268345_DC21E96C 
X-CRM114-Status: GOOD (  13.09  )
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

This is the 13/18 step of fsck. Commit problem fixing modifications
(which are generated from the previous steps) to disk.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 436831cb..66b9c578 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -432,6 +432,33 @@ void handle_error(const struct ubifs_info *c, int reason_set)
 		exit_code |= FSCK_ERROR;
 }
 
+static int commit_fix_modifications(struct ubifs_info *c)
+{
+	int err;
+
+	if (exit_code & FSCK_NONDESTRUCT) {
+		log_out(c, "Commit problem fixing modifications");
+
+		/*
+		 * Force UBIFS to do commit by setting @c->mounting if changes
+		 * happen on disk. Committing is required once before allocating
+		 * new space(subsequent steps may need), because building lpt
+		 * could mark LEB(which holds stale data nodes) as unused, if
+		 * the LEB is overwritten by new data, old data won't be found
+		 * in next fsck run(assume that first fsck run is interrupted by
+		 * the powercut), which could affect the correctness of LEB
+		 * properties after replaying journal in the second fsck run.
+		 */
+		c->mounting = 1;
+	}
+	err = ubifs_run_commit(c);
+
+	if (exit_code & FSCK_NONDESTRUCT)
+		c->mounting = 0;
+
+	return err;
+}
+
 /*
  * do_fsck - Check & repair the filesystem.
  */
@@ -479,9 +506,16 @@ static int do_fsck(void)
 	err = check_and_correct_space(c);
 	kfree(FSCK(c)->used_lebs);
 	destroy_file_tree(c, &FSCK(c)->scanned_files);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto free_disconnected_files_2;
+	}
+
+	err = commit_fix_modifications(c);
 	if (err)
 		exit_code |= FSCK_ERROR;
 
+free_disconnected_files_2:
 	destroy_file_list(c, &FSCK(c)->disconnected_files);
 	return err;
 
@@ -532,6 +566,7 @@ int main(int argc, char *argv[])
 	 * Step 10: Check and correct files
 	 * Step 11: Check whether the TNC is empty
 	 * Step 12: Check and correct the space statistics
+	 * Step 13: Commit problem fixing modifications
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
