Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340E0C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:46:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A12362076A
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbIPfU/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A12362076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHoCfrnNOi7+NzN4SBL2BTspqf0iYUkIGQHGNrZVlc0=; b=YbIPfU/VsPsRNlnjgyxnlLesf2
	FYjyLErDEUb4AcyB8/Q+2H70tSe/PajLyRMugA2ao3ea1IuSZCawLM1aEoBnqyCLWOWjpJJkjWMIe
	DFnLWCpoR2+3L/OQCT23pEDrzz1pCV9amz56c0UY8F7OfWtNyzu0kKWfoA60RkWxq3+/5CMP/6m5p
	LExAakxaTcooeDXa7o482LlJbUUEFsQPafepRoMQB9aAa4hZJwhoHgkdHoU5jkIVuqyZJy3DDuwEj
	hPzVGz3nfHbn9t1YtYHfAfwtIiyENPsjcvlMoRQN4DxB3aDfCIaBFRyNMQETRLOP8MGf63yhVwIfk
	r60C9VqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNF06-0007ru-L7; Tue, 29 Sep 2020 12:44:58 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNF03-0007o0-Ea
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 12:44:56 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0E4F96135E49E978FB7F;
 Tue, 29 Sep 2020 20:44:44 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 29 Sep 2020
 20:44:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH 1/3] ubifs: Fix a memleak after dumping authentication mount
 options
Date: Tue, 29 Sep 2020 20:45:29 +0800
Message-ID: <20200929124531.941873-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_084455_760435_A4FA386F 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix a memory leak after dumping authentication mount options in error
handling branch.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <stable@vger.kernel.org>  # 4.20+
Fixes: d8a22773a12c6d7 ("ubifs: Enable authentication support")
---
 fs/ubifs/super.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a2420c900275..6f85cd618766 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1141,6 +1141,18 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 	return 0;
 }
 
+/*
+ * ubifs_release_options - release mount parameters which have been dumped.
+ * @c: UBIFS file-system description object
+ */
+static void ubifs_release_options(struct ubifs_info *c)
+{
+	kfree(c->auth_key_name);
+	c->auth_key_name = NULL;
+	kfree(c->auth_hash_name);
+	c->auth_hash_name = NULL;
+}
+
 /**
  * destroy_journal - destroy journal data structures.
  * @c: UBIFS file-system description object
@@ -1650,8 +1662,7 @@ static void ubifs_umount(struct ubifs_info *c)
 	ubifs_lpt_free(c, 0);
 	ubifs_exit_authentication(c);
 
-	kfree(c->auth_key_name);
-	kfree(c->auth_hash_name);
+	ubifs_release_options(c);
 	kfree(c->cbuf);
 	kfree(c->rcvrd_mst_node);
 	kfree(c->mst_node);
@@ -2219,6 +2230,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 out_unlock:
 	mutex_unlock(&c->umount_mutex);
 out_close:
+	ubifs_release_options(c);
 	ubi_close_volume(c->ubi);
 out:
 	return err;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
