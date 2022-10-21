Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9A0C43217
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 02:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idRhIyy9S+bUeOtroXnaSPouJfGYn+qtwZnPN93satw=; b=nduIOyFNNzY2ef
	a7FWH8HiVHGNe2lESWBkno7eANFfhJMiASDygXe/dCdqIS7bVEgtHj5FEseP4gFp3udo7hQnbAYbB
	5L05fAZ/x45WB3PyS7vHPEjASlPYuSW9Yvx9miEbuIYflQQ1oYK6FSqUqjwbC22htvKqThYf57Xiz
	ezgMaOA//X+k2gEszTM2lLbr4TuvX/YvaZGuAPF98eHn8EXzaJGXc/D/wM0wFdoLuneBnDlvzlxkq
	PaxRcNtntGVz+U+2L06xYNLzObifDGgOWCKtGpaA+An8NfCibyqm45hrtK1u079vMIZJAnOz0uTLV
	HyHQqdqRGqCgIY4XFTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgU-004PM8-6W; Fri, 21 Oct 2022 02:22:54 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgK-004PFU-UB
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 02:22:47 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mtp7b16HRzpVdt;
	Fri, 21 Oct 2022 10:19:23 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:43 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:42 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
	<linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
	<ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
	<amd-gfx@lists.freedesktop.org>
CC: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <somlo@cmu.edu>,
	<mst@redhat.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
	<hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>, <mark@fasheh.com>,
	<jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
	<akpm@linux-foundation.org>, <alexander.deucher@amd.com>,
	<luben.tuikov@amd.com>, <richard@nod.at>, <liushixin2@huawei.com>
Subject: [PATCH 07/11] f2fs: fix possible memory leak in f2fs_init_sysfs()
Date: Fri, 21 Oct 2022 10:20:58 +0800
Message-ID: <20221021022102.2231464-8-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021022102.2231464-1-yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_192245_159273_B06F8F46 
X-CRM114-Status: GOOD (  10.23  )
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

Inject fault while loading module, kset_register() may fail,
if it fails, but the refcount of kobject is not decreased to
0, the name allocated in kobject_set_name() is leaked. Fix
this by calling kset_put(), so that name can be freed in
callback function kobject_cleanup().

unreferenced object 0xffff888101b7cc80 (size 8):
  comm "modprobe", pid 252, jiffies 4294691378 (age 31.760s)
  hex dump (first 8 bytes):
    66 32 66 73 00 88 ff ff                          f2fs....
  backtrace:
    [<000000001db5b408>] __kmalloc_node_track_caller+0x44/0x1b0
    [<000000002783a073>] kstrdup+0x3a/0x70
    [<00000000ead2b281>] kstrdup_const+0x63/0x80
    [<000000003e5cf8f7>] kvasprintf_const+0x149/0x180
    [<00000000c4d949ff>] kobject_set_name_vargs+0x56/0x150
    [<0000000044611660>] kobject_set_name+0xab/0xe0

Fixes: bf9e697ecd42 ("f2fs: expose features to sysfs entry")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..2ef7a48967be 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1250,8 +1250,10 @@ int __init f2fs_init_sysfs(void)
 	kobject_set_name(&f2fs_kset.kobj, "f2fs");
 	f2fs_kset.kobj.parent = fs_kobj;
 	ret = kset_register(&f2fs_kset);
-	if (ret)
+	if (ret) {
+		kset_put(&f2fs_kset);
 		return ret;
+	}
 
 	ret = kobject_init_and_add(&f2fs_feat, &f2fs_feat_ktype,
 				   NULL, "features");
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
