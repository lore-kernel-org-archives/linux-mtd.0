Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790E0C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 03:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzKj42/H9UJT/pPlCY9nvLoCy5uvkIjruvlaJJaeS2w=; b=Vn9KkGib8x+Phf
	9bCkTZtKzgHXJPmLOv6e9SiZYa0Hwknwd/V+rCaN1eRrD3LnUiZC4KiKmVbYF2p/3yD387ENqFjET
	8hvjuLI7lszTl9A5zuRFnmFICLyW5WK2Mbihm1b+sA5VuWAHD6IJyxtOUnq9D6t9ZeE22SNLnP7VL
	tpdpLLBu7NAejiYVEdy2Tsu9B/6zSs+cTdHXf/N+Pd4yhnuIdFrT6lQpII//UT8gEi3YloSdY7Fzd
	zuIgMp9pv+dv8OxocY0bhvLUQZbF8+WDJvZ5IJGhCM4KNGbfyQq8TXj9Lco+0TiltCsCjGldjhp3v
	F3RBcC4PQBORXzELmigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olMRh-00A2a3-Ca; Thu, 20 Oct 2022 03:42:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olMRe-00A2Ya-4e
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2022 03:42:12 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtD1F1wr9zCqm4;
	Thu, 20 Oct 2022 11:41:53 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 11:41:44 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 11:41:44 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH] ubifs: Fix memory leak in ubifs_sysfs_init()
Date: Thu, 20 Oct 2022 12:30:31 +0800
Message-ID: <20221020043031.3461278-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_204210_370714_DEEC137F 
X-CRM114-Status: UNSURE (   6.98  )
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

When insmod ubifs.ko, a kmemleak reported as below:

 unreferenced object 0xffff88817fb1a780 (size 8):
   comm "insmod", pid 25265, jiffies 4295239702 (age 100.130s)
   hex dump (first 8 bytes):
     75 62 69 66 73 00 ff ff                          ubifs...
   backtrace:
     [<ffffffff81b3fc4c>] slab_post_alloc_hook+0x9c/0x3c0
     [<ffffffff81b44bf3>] __kmalloc_track_caller+0x183/0x410
     [<ffffffff8198d3da>] kstrdup+0x3a/0x80
     [<ffffffff8198d486>] kstrdup_const+0x66/0x80
     [<ffffffff83989325>] kvasprintf_const+0x155/0x190
     [<ffffffff83bf55bb>] kobject_set_name_vargs+0x5b/0x150
     [<ffffffff83bf576b>] kobject_set_name+0xbb/0xf0
     [<ffffffff8100204c>] do_one_initcall+0x14c/0x5a0
     [<ffffffff8157e380>] do_init_module+0x1f0/0x660
     [<ffffffff815857be>] load_module+0x6d7e/0x7590
     [<ffffffff8158644f>] __do_sys_finit_module+0x19f/0x230
     [<ffffffff815866b3>] __x64_sys_finit_module+0x73/0xb0
     [<ffffffff88c98e85>] do_syscall_64+0x35/0x80
     [<ffffffff88e00087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

When kset_register() failed, we should call kset_put to cleanup it.

Fixes: 2e3cbf425804 ("ubifs: Export filesystem error counters")
Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 fs/ubifs/sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index 06ad8fa1fcfb..54270ad36321 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -144,6 +144,8 @@ int __init ubifs_sysfs_init(void)
 	kobject_set_name(&ubifs_kset.kobj, "ubifs");
 	ubifs_kset.kobj.parent = fs_kobj;
 	ret = kset_register(&ubifs_kset);
+	if (ret)
+		kset_put(&ubifs_kset);
 
 	return ret;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
