Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665BFC43217
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 02:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Dr8dxG+06+jM+MBXylQw31WBCqrs9WfzU0WQ3pSZuk=; b=XAsZlNqEqrRX7a
	vvSvn/XSbtOQs5oJHIvxs+9YdKV+Lu0itPB/coVEKSZZaAP9Jhs1M6OCKGQbrSDEDzwkGrObJbEuh
	jZWHy4Vj0/k1G6Xi1cx/QZyGEggG9SRAyr2ykPTcIqEBPGWxJyb98amUocaEfzmodCOQtb7AEUuzV
	IUc5hCnDNoBStjBSmO41IBcHFRkp1vaEtEm3rFCr/pU8ALMUfOSkHyFBzS4v3+1ztm1DW06kXK8ad
	jtL1WHn/lFFPymjZ+tPSvnemP/CibHGUpwXdOKFdf3nE08U4IyiPpD4Guds4tEeaIJdtT3pQaelOi
	RMb2WgaADMeQ96SKxz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhhL-004Pxj-Sn; Fri, 21 Oct 2022 02:23:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhgQ-004PJa-Ow
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 02:22:53 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtpCN18FmzHvCF;
	Fri, 21 Oct 2022 10:22:40 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:44 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:43 +0800
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
Subject: [PATCH 08/11] erofs: fix possible memory leak in erofs_init_sysfs()
Date: Fri, 21 Oct 2022 10:20:59 +0800
Message-ID: <20221021022102.2231464-9-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021022102.2231464-1-yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_192251_042244_6D3D10D6 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

unreferenced object 0xffff888101d228c0 (size 8):
  comm "modprobe", pid 276, jiffies 4294722700 (age 13.151s)
  hex dump (first 8 bytes):
    65 72 6f 66 73 00 ff ff                          erofs...
  backtrace:
    [<00000000e2a9a4a6>] __kmalloc_node_track_caller+0x44/0x1b0
    [<00000000b8ce02de>] kstrdup+0x3a/0x70
    [<000000004a0e01d2>] kstrdup_const+0x63/0x80
    [<00000000051b6cda>] kvasprintf_const+0x149/0x180
    [<000000004dc51dad>] kobject_set_name_vargs+0x56/0x150
    [<00000000b30f0bad>] kobject_set_name+0xab/0xe0

Fixes: 168e9a76200c ("erofs: add sysfs interface")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 fs/erofs/sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
index 783bb7b21b51..653b35001bc5 100644
--- a/fs/erofs/sysfs.c
+++ b/fs/erofs/sysfs.c
@@ -254,8 +254,10 @@ int __init erofs_init_sysfs(void)
 	kobject_set_name(&erofs_root.kobj, "erofs");
 	erofs_root.kobj.parent = fs_kobj;
 	ret = kset_register(&erofs_root);
-	if (ret)
+	if (ret) {
+		kset_put(&erofs_root);
 		goto root_err;
+	}
 
 	ret = kobject_init_and_add(&erofs_feat, &erofs_feat_ktype,
 				   NULL, "features");
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
