Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690CDC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 06:56:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAF342222A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 06:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+j0atA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAF342222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RLFsPIz2OqSG197NdWuGorKPcU2AsL/YZjiJpqnde2I=; b=m+j0atA1AuIh/cIWnyWwBQIZVg
	mW9JiBDvY0veAkrEVMSyVHBHGaBDmyKmohdgZeScdp8N7JN1CjKNmKYYiu2mphFZqAdLk3peLutaL
	YKynOa0yl6d7aX2TyqM5MpupaReuZR1ElCo0FVcwrqmgYglkGgYIku9kfiQfP3ieZDVBB5bkvC2jm
	MV+hS4sb+7Qmh/spPr1ZstlGVBO/9xkl7Eg6kLd5B2OdoNJQo7kJHqJX/LkM9s8mYO1as6DM5ICwa
	sQ4ufIbzxUtsNxvX/xKZIswNtTXD5XFhd7ypP40QMSpKYc9YnJ+gnQe2xw8W9CTr/P1wTRQfytiSk
	QtsD9tGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSags-0000tb-98; Wed, 14 Oct 2020 06:55:14 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSago-0000qP-K3
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2020 06:55:12 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C64E4B931C5AF29CDE4B;
 Wed, 14 Oct 2020 14:54:51 +0800 (CST)
Received: from DESKTOP-FKFNUOQ.china.huawei.com (10.67.101.50) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 14 Oct 2020 14:54:45 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
Subject: [PATCH 1/2] jffs2: fix ignoring mounting options problem during
 remounting
Date: Wed, 14 Oct 2020 14:54:42 +0800
Message-ID: <20201014065443.18512-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.50]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_025510_997093_C40C40FE 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: lizhe67@huawei.com, wangfangpeng1@huawei.com, zhongjubin@huawei.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, qiuxi1@huawei.com,
 chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: lizhe <lizhe67@huawei.com>

The jffs2 mount options will be ignored when remounting jffs2.
It can be easily reproduced with the steps listed below.
1. mount -t jffs2 -o compr=none /dev/mtdblockx /mnt
2. mount -o remount compr=zlib /mnt

Since ec10a24f10c8, the option parsing happens before fill_super and
then pass fc, which contains the options parsing results, to function
jffs2_reconfigure during remounting. But function jffs2_reconfigure do
not update c->mount_opts.

This patch add a function jffs2_update_mount_opts to fix this problem.

By the way, I notice that tmpfs use the same way to update remounting
options. If it is necessary to unify them?

Signed-off-by: lizhe <lizhe67@huawei.com>
---
 fs/jffs2/super.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 05d7878dfad1..4fd297bdf0f3 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -215,11 +215,28 @@ static int jffs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	return 0;
 }
 
+static inline void jffs2_update_mount_opts(struct fs_context *fc)
+{
+	struct jffs2_sb_info *new_c = fc->s_fs_info;
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(fc->root->d_sb);
+
+	mutex_lock(&c->alloc_sem);
+	if (new_c->mount_opts.override_compr) {
+		c->mount_opts.override_compr = new_c->mount_opts.override_compr;
+		c->mount_opts.compr = new_c->mount_opts.compr;
+	}
+	if (new_c->mount_opts.rp_size)
+		c->mount_opts.rp_size = new_c->mount_opts.rp_size;
+	mutex_unlock(&c->alloc_sem);
+}
+
 static int jffs2_reconfigure(struct fs_context *fc)
 {
 	struct super_block *sb = fc->root->d_sb;
 
 	sync_filesystem(sb);
+	jffs2_update_mount_opts(fc);
+
 	return jffs2_do_remount_fs(sb, fc);
 }
 
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
