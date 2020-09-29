Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C027EC47423
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:46:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005F4208B8
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CjO6z28b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005F4208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bo+zC5ctxyJojXy+Od83zF+7TeBmsSBOkbldmK146+A=; b=CjO6z28bxy9tiGKgceJsrwn/8
	D5GhIuP+ii7Aw9IFpDeylS/pKzbrEGZzQGhgQGyDbS1pkrzUM6+6P8I6iruOPs6Y6iMXJWl3UprId
	CkxfV+BDoMqDI5j9cAOMWAMdl5dWi/9lRycVFQbgVZeRc+6NVxm6bAKKX00fqtKdIQM7St4uvRjVl
	38Xeg7dPpxmksgGqEL9F6pMPbmtSuNXENllc274QDDPZU5rMK8Nc9TBjJ+Z7o+VMDNB0IZXlGushH
	9wpAf62BQt2tb5biag5M9/TroN5boz69tb96WRjjjhHVRyvaZFjGfCCCHqI9qE2H7SVEjOzs/Gsza
	YOOJJyn9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNF09-0007ta-K1; Tue, 29 Sep 2020 12:45:01 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNF05-0007nq-9C
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 12:44:58 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 09F14FBF6EE64F5A029C;
 Tue, 29 Sep 2020 20:44:44 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 29 Sep 2020
 20:44:36 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH 3/3] ubifs: mount_ubifs: Release authentication resource in
 error handling path
Date: Tue, 29 Sep 2020 20:45:31 +0800
Message-ID: <20200929124531.941873-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200929124531.941873-1-chengzhihao1@huawei.com>
References: <20200929124531.941873-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_084457_611602_85E98259 
X-CRM114-Status: UNSURE (   9.33  )
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

Release the authentication related resource in some error handling
branches in mount_ubifs().

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <stable@vger.kernel.org>  # 4.20+
Fixes: d8a22773a12c6d7 ("ubifs: Enable authentication support")
---
 fs/ubifs/super.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9796f5df2f7f..732218ef6656 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1331,7 +1331,7 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	err = ubifs_read_superblock(c);
 	if (err)
-		goto out_free;
+		goto out_auth;
 
 	c->probing = 0;
 
@@ -1343,18 +1343,18 @@ static int mount_ubifs(struct ubifs_info *c)
 		ubifs_err(c, "'compressor \"%s\" is not compiled in",
 			  ubifs_compr_name(c, c->default_compr));
 		err = -ENOTSUPP;
-		goto out_free;
+		goto out_auth;
 	}
 
 	err = init_constants_sb(c);
 	if (err)
-		goto out_free;
+		goto out_auth;
 
 	sz = ALIGN(c->max_idx_node_sz, c->min_io_size) * 2;
 	c->cbuf = kmalloc(sz, GFP_NOFS);
 	if (!c->cbuf) {
 		err = -ENOMEM;
-		goto out_free;
+		goto out_auth;
 	}
 
 	err = alloc_wbufs(c);
@@ -1629,6 +1629,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	free_wbufs(c);
 out_cbuf:
 	kfree(c->cbuf);
+out_auth:
+	ubifs_exit_authentication(c);
 out_free:
 	kfree(c->write_reserve_buf);
 	kfree(c->bu.buf);
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
