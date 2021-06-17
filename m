Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3029C2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 08:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F183613D5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 08:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F183613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SZuKhm93Y/PYR4KzBXBfzzIb+sjXRN5yhhwktA4CB7Y=; b=wfYDlaJEALNOLU
	iMWOyGQLNABow2KI81lvFuIab/No+QkMhBLmOISZCmFGiq98l69O62IfjCWCjp/4g559YYfAkcvCz
	CvxNDcoTpbBUw4vVxJcFf3Mwx08c3gLUY00n2ssDT/v59Xd84rDh89kV1HFSfJiHmSR5/61mTHuJx
	cgtWuL1JNM4VLgCg6pzyvhAuCpJFh/4o4VDhr2TrRphEiESZ5cidfn9Z95uUk/fPk+goeMno7RvxM
	I6aFsUxAfCMhhEJIpfOZUbw5+MJK9NEddWNVOhIsRCTvcJkbivcrjcY913ZHqZitgZUmpldeVqQU6
	/zRIZkzQk7cjOOFaCaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltnro-009ZUx-CB; Thu, 17 Jun 2021 08:59:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltnrk-009ZTP-DH
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 08:59:14 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5G7f3qFfzXfMq;
 Thu, 17 Jun 2021 16:54:06 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 16:59:09 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 16:59:08 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] jffs2: remove unnecessary oom message
Date: Thu, 17 Jun 2021 16:59:05 +0800
Message-ID: <20210617085905.1385-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_015912_668139_7EE71624 
X-CRM114-Status: GOOD (  11.00  )
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

Fixes scripts/checkpatch.pl warning:
WARNING: Possible unnecessary 'out of memory' message

Remove it can help us save a bit of memory.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 fs/jffs2/compr.c | 16 +++++-----------
 fs/jffs2/dir.c   |  1 -
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 4849a4c9a0e2..700a2de39b08 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -80,10 +80,8 @@ static int jffs2_selected_compress(u8 compr, unsigned char *data_in,
 	char *output_buf;
 
 	output_buf = kmalloc(*cdatalen, GFP_KERNEL);
-	if (!output_buf) {
-		pr_warn("No memory for compressor allocation. Compression failed.\n");
+	if (!output_buf)
 		return ret;
-	}
 	orig_slen = *datalen;
 	orig_dlen = *cdatalen;
 	spin_lock(&jffs2_compressor_list_lock);
@@ -189,15 +187,11 @@ uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 				spin_unlock(&jffs2_compressor_list_lock);
 				tmp_buf = kmalloc(orig_slen, GFP_KERNEL);
 				spin_lock(&jffs2_compressor_list_lock);
-				if (!tmp_buf) {
-					pr_warn("No memory for compressor allocation. (%d bytes)\n",
-						orig_slen);
+				if (!tmp_buf)
 					continue;
-				}
-				else {
-					this->compr_buf = tmp_buf;
-					this->compr_buf_size = orig_slen;
-				}
+
+				this->compr_buf = tmp_buf;
+				this->compr_buf_size = orig_slen;
 			}
 			this->usecount++;
 			spin_unlock(&jffs2_compressor_list_lock);
diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index c0aabbcbfd58..a2f643dd1923 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -353,7 +353,6 @@ static int jffs2_symlink (struct user_namespace *mnt_userns, struct inode *dir_i
 	/* We use f->target field to store the target path. */
 	f->target = kmemdup(target, targetlen + 1, GFP_KERNEL);
 	if (!f->target) {
-		pr_warn("Can't allocate %d bytes of memory\n", targetlen + 1);
 		mutex_unlock(&f->sem);
 		jffs2_complete_reservation(c);
 		ret = -ENOMEM;
-- 
2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
