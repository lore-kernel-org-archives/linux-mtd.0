Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBB9C4706E
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 02:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1kGTHlCaX0CJ+m3HuFIBg82K72l7QwJ0N3Gs5kC94Q=; b=LxVHFAyYeEoIZI
	JVNsP6YrFZeci+auW3O01ns2WYR9H9wQ1flr7Og9/IopzwWEi7docwFgCcHd1ywRmgYA5RicVXMnn
	OB8+6/BfWOOo5S23UC7N0K7votcXekAj3MMwPXGk9C9mTOpajBm/tuvbH8RnzmUcLWQn80FWZU+HL
	VzdiVi6wdiTaPP5N/GauyflcgklMhjrOwMumekOY88wGvT7nn+4QH8zZUTjQQUu2aZQPmZd4FMxAJ
	Y0MPJRLC9wT5E2s3j/f5JjDe31NmyizbGHITf1G0fIOx9KCHrffYVyxU+u/tiAUTZF4QNSLkV0ALB
	L8bJPiJTw7ZP0guhDRjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVeT-004hV1-28;
	Fri, 22 Dec 2023 02:52:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVeP-004hT6-2z
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 02:52:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SxBfZ5QJSzZdgh;
	Fri, 22 Dec 2023 10:52:22 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id A96F51402E2;
	Fri, 22 Dec 2023 10:52:30 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Dec
 2023 10:52:29 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <terrelln@fb.com>, <ebiggers@google.com>,
	<ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] ubifs: dbg_check_idx_size: Fix kmemleak if loading znode failed
Date: Fri, 22 Dec 2023 10:50:24 +0800
Message-ID: <20231222025025.2940450-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222025025.2940450-1-chengzhihao1@huawei.com>
References: <20231222025025.2940450-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_185238_157864_8C8BC05E 
X-CRM114-Status: UNSURE (   9.74  )
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

If function dbg_check_idx_size() failed by loading znode in mounting
process, there are two problems:
  1. Allocated znodes won't be freed, which causes kmemleak in kernel:
     ubifs_mount
      dbg_check_idx_size
       dbg_walk_index
        c->zroot.znode = ubifs_load_znode
	child = ubifs_load_znode // failed
	// Loaded znodes won't be freed in error handling path.
  2. Global variable ubifs_clean_zn_cnt is not decreased, because
     ubifs_tnc_close() is not invoked in error handling path, which
     triggers a warning in ubifs_exit():
      WARNING: CPU: 1 PID: 1576 at fs/ubifs/super.c:2486 ubifs_exit
      Modules linked in: zstd ubifs(-) ubi nandsim
      CPU: 1 PID: 1576 Comm: rmmod Not tainted 6.7.0-rc6
      Call Trace:
	ubifs_exit+0xca/0xc70 [ubifs]
	__do_sys_delete_module+0x29a/0x4a0
	do_syscall_64+0x6f/0x140

Fix it by invoking destroy_journal() if dbg_check_idx_size() failed.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 09e270d6ed02..eabb0f44ea3e 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1449,7 +1449,7 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	err = dbg_check_idx_size(c, c->bi.old_idx_sz);
 	if (err)
-		goto out_lpt;
+		goto out_journal;
 
 	err = ubifs_replay_journal(c);
 	if (err)
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
