Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72734C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdoRysec8g0fmokOGCLE3118FMy5lWxJVQeyS7IlrDw=; b=WCwY7MmvJAIyrZ
	Km4kF2zvyq0wterCJmG254Ocikqo+kZx10yGyHX3G+2/H96tNUdjvzXUjwQ7fYYkmDaWPQ9SXWzVS
	UsXaYt7noL4kYxeorUsEBXVnPPAPgvnO0TrLadFmbpyqOVi5+U+M2HB5Ptqw/PBf5tx1JjgWssWCO
	rA5UpMlEXxKGgj+Fbtlq/NEDMtD0vg6iqEpxx03kPgfpfW6OgnOxzTfyzB7Q3r5slKmt54TsiNy7i
	Vo7SaDuPr5mP5ege0LA2Xb4yZmbiecsmtqUgdkFlzqQzxi9zeSdKx961ZM15TGLSvxqM3rlTctqSu
	D4aTpHKMEwLU1hKVDjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Jei-008fVO-P0; Fri, 14 Jan 2022 10:18:00 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Jee-008fR6-Rl
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 10:17:58 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JZy0649Wvzbk0t;
 Fri, 14 Jan 2022 18:17:10 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 14 Jan
 2022 18:17:51 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>, <stable@vger.kernel.org>
Subject: [PATCH -next v3 1/2] jffs2: fix memory leak in jffs2_do_mount_fs
Date: Fri, 14 Jan 2022 18:28:53 +0800
Message-ID: <20220114102854.3399585-2-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220114102854.3399585-1-libaokun1@huawei.com>
References: <20220114102854.3399585-1-libaokun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_021757_076423_B81860A9 
X-CRM114-Status: UNSURE (   7.77  )
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

If jffs2_build_filesystem() in jffs2_do_mount_fs() returns an error,
we can observe the following kmemleak report:

--------------------------------------------
unreferenced object 0xffff88811b25a640 (size 64):
  comm "mount", pid 691, jiffies 4294957728 (age 71.952s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffffa493be24>] kmem_cache_alloc_trace+0x584/0x880
    [<ffffffffa5423a06>] jffs2_sum_init+0x86/0x130
    [<ffffffffa5400e58>] jffs2_do_mount_fs+0x798/0xac0
    [<ffffffffa540acf3>] jffs2_do_fill_super+0x383/0xc30
    [<ffffffffa540c00a>] jffs2_fill_super+0x2ea/0x4c0
    [...]
unreferenced object 0xffff88812c760000 (size 65536):
  comm "mount", pid 691, jiffies 4294957728 (age 71.952s)
  hex dump (first 32 bytes):
    bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
    bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
  backtrace:
    [<ffffffffa493a449>] __kmalloc+0x6b9/0x910
    [<ffffffffa5423a57>] jffs2_sum_init+0xd7/0x130
    [<ffffffffa5400e58>] jffs2_do_mount_fs+0x798/0xac0
    [<ffffffffa540acf3>] jffs2_do_fill_super+0x383/0xc30
    [<ffffffffa540c00a>] jffs2_fill_super+0x2ea/0x4c0
    [...]
--------------------------------------------

This is because the resources allocated in jffs2_sum_init() are not
released. Call jffs2_sum_exit() to release these resources to solve
the problem.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Cc: stable@vger.kernel.org
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 fs/jffs2/build.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index b288c8ae1236..837cd55fd4c5 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -415,13 +415,15 @@ int jffs2_do_mount_fs(struct jffs2_sb_info *c)
 		jffs2_free_ino_caches(c);
 		jffs2_free_raw_node_refs(c);
 		ret = -EIO;
-		goto out_free;
+		goto out_sum_exit;
 	}
 
 	jffs2_calc_trigger_levels(c);
 
 	return 0;
 
+ out_sum_exit:
+	jffs2_sum_exit(c);
  out_free:
 	kvfree(c->blocks);
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
