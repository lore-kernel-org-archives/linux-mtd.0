Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52704C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:26:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA6160FED
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAA6160FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUd93Ecdl9+DhyhqCdm9ehPUJ3eE98elGl+xigI7Cx0=; b=ad6UtSbcjujIZH
	BsPRtvVl4TP/D0Y7zFPwqiZEftmQ4jp41NycCGKQYcGxiVIArmFlgETllea+cbFGkFbOpprftJ7/U
	rnyoWCyYtG80A0fZwqD77NZeKo5uEWryikJqcLYihvQYWa6CTHiKjI9CCn/VH1xemAENK1OCdsK6n
	SdtNhSLfulFbwa5U/CrVyD7DeYwdJC2PWzRgjVRPl0Jqq0UOfHrL3IqqbvgNBJMhHammf0bkDFqwb
	ThKQ0gPCuWa0N359FsXt/uqdGMgoogwWdNs3Nvxu8PUSHyFmtjHUF3nM0jhv7On6VwJU5wdEACtLE
	/8bNKjN75nQG9Dkryulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLLYx-004YrQ-BY; Wed, 01 Sep 2021 08:25:39 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLL3C-004QD7-Da
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 07:52:51 +0000
Received: from dggeme768-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gzx8z5RmTz1DFkr;
 Wed,  1 Sep 2021 15:52:03 +0800 (CST)
Received: from DESKTOP-T9ACQLA.china.huawei.com (10.67.103.61) by
 dggeme768-chm.china.huawei.com (10.3.19.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 1 Sep 2021 15:52:45 +0800
From: Zhaolei Dou <douzhaolei@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>, <jamie@nuviainc.com>,
 <christian.brauner@ubuntu.com>, <trix@redhat.com>, <wangqing@vivo.com>,
 <yang.yang29@zte.com.cn>
CC: <douzhaolei@huawei.com>, <linux-mtd@lists.infradead.org>,
 <wangfangpeng1@huawei.com>, <zhongjubin@huawei.com>, <zengweilin@huawei.com>
Subject: [PATCH] jffs2:fix no error report when rp_size larger than mtd_size
 during remounting
Date: Wed, 1 Sep 2021 15:52:10 +0800
Message-ID: <20210901075210.1657-2-douzhaolei@huawei.com>
X-Mailer: git-send-email 2.33.0.windows.1
In-Reply-To: <20210901075210.1657-1-douzhaolei@huawei.com>
References: <20210901075210.1657-1-douzhaolei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.103.61]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme768-chm.china.huawei.com (10.3.19.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_005250_700736_14106B82 
X-CRM114-Status: GOOD (  10.47  )
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

From: douzhaolei <douzhaolei@huawei.com>

When the value of rp_size is greater than mtd->size,
jffs2 can be remounted normally.
It can be easily reproduced with the steps listed below.
1.mount -t jffs2 -o rw,relatime  /dev/mtdblockx /mnt
2.mount -o remount -o rp_size=xxx /mnt

Signed-off-by: douzhaolei <douzhaolei@huawei.com>
---
 fs/jffs2/super.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81ca58c10b72..727693540a2d 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -212,7 +212,7 @@ static int jffs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	return 0;
 }
 
-static inline void jffs2_update_mount_opts(struct fs_context *fc)
+static int jffs2_update_mount_opts(struct fs_context *fc)
 {
 	struct jffs2_sb_info *new_c = fc->s_fs_info;
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(fc->root->d_sb);
@@ -223,18 +223,29 @@ static inline void jffs2_update_mount_opts(struct fs_context *fc)
 		c->mount_opts.compr = new_c->mount_opts.compr;
 	}
 	if (new_c->mount_opts.set_rp_size) {
+		/* During remounting, compare the values of rp_szie and mtd->size. */
+		if (new_c->mount_opts.rp_size > c->mtd->size) {
+			mutex_unlock(&c->alloc_sem);
+			return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
+					c->mtd->size / 1024);
+		}
 		c->mount_opts.set_rp_size = new_c->mount_opts.set_rp_size;
 		c->mount_opts.rp_size = new_c->mount_opts.rp_size;
 	}
 	mutex_unlock(&c->alloc_sem);
+
+	return 0;
 }
 
 static int jffs2_reconfigure(struct fs_context *fc)
 {
 	struct super_block *sb = fc->root->d_sb;
+	int ret;
 
 	sync_filesystem(sb);
-	jffs2_update_mount_opts(fc);
+	ret = jffs2_update_mount_opts(fc);
+	if (ret)
+		return -EINVAL;
 
 	return jffs2_do_remount_fs(sb, fc);
 }
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
