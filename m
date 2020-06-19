Return-Path: <SRS0=4+4/=AA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8719C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2020 09:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8376520890
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2020 09:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOKBXZjX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8376520890
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UoxoZPqrkqzo6i+pG7aycEHeUxew+5dQw6bmYaLQh4U=; b=NOKBXZjX/qm/w7
	YVuC1f8JREhS7GE4qwrN+owrdbWk45kBIRHchXJmEqrvqk/VH0gsjtEUn4VjsAJWd1lDuIocCGco1
	+IuN/PGopKZ2a7pYkdRIdeEn4ZhLEBMa0B1fSSoDCxHspWv3SB6Qmnd7Yhuio+mkI4IFk6zhvL/bD
	NbycoNAXjJJp4atGyucLnM/PGMYq2FlUU/t0qC1baS3OP9Ss0yX7W6A0/l4Ib3P3O3p21NkWnfF8f
	TQObZSK1NTF0eDEz9jt8cwsR8PeZmDK9f3jjrVxOf06ZACepU1FI24J5+H2gue6TV/egzyAUIDI3h
	XSEqH3BPcXwk3FLcwlOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmD00-0004bt-8E; Fri, 19 Jun 2020 09:07:48 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmCzD-0003jJ-Sr
 for linux-mtd@lists.infradead.org; Fri, 19 Jun 2020 09:07:02 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DC06B6324870621A196D;
 Fri, 19 Jun 2020 17:06:48 +0800 (CST)
Received: from DESKTOP-FKFNUOQ.china.huawei.com (10.67.101.2) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 19 Jun 2020 17:06:39 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] jffs2: fix UAF problem
Date: Fri, 19 Jun 2020 17:06:35 +0800
Message-ID: <20200619090635.58548-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.2]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_020700_638659_2CCE26B8 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: zhongjubin@huawei.com, lizhe67@huawei.com, qiuxi1@huawei.com,
 wangfangpeng1@huawei.com, chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The log of UAF problem is listed below.
BUG: KASAN: use-after-free in jffs2_rmdir+0xa4/0x1cc [jffs2] at addr c1f165fc
Read of size 4 by task rm/8283
=============================================================================
BUG kmalloc-32 (Tainted: P    B      O   ): kasan: bad access detected
-----------------------------------------------------------------------------

INFO: Allocated in 0xbbbbbbbb age=3054364 cpu=0 pid=0
        0xb0bba6ef
        jffs2_write_dirent+0x11c/0x9c8 [jffs2]
        __slab_alloc.isra.21.constprop.25+0x2c/0x44
        __kmalloc+0x1dc/0x370
        jffs2_write_dirent+0x11c/0x9c8 [jffs2]
        jffs2_do_unlink+0x328/0x5fc [jffs2]
        jffs2_rmdir+0x110/0x1cc [jffs2]
        vfs_rmdir+0x180/0x268
        do_rmdir+0x2cc/0x300
        ret_from_syscall+0x0/0x3c
INFO: Freed in 0x205b age=3054364 cpu=0 pid=0
        0x2e9173
        jffs2_add_fd_to_list+0x138/0x1dc [jffs2]
        jffs2_add_fd_to_list+0x138/0x1dc [jffs2]
        jffs2_garbage_collect_dirent.isra.3+0x21c/0x288 [jffs2]
        jffs2_garbage_collect_live+0x16bc/0x1800 [jffs2]
        jffs2_garbage_collect_pass+0x678/0x11d4 [jffs2]
        jffs2_garbage_collect_thread+0x1e8/0x3b0 [jffs2]
        kthread+0x1a8/0x1b0
        ret_from_kernel_thread+0x5c/0x64
Call Trace:
[c17ddd20] [c02452d4] kasan_report.part.0+0x298/0x72c (unreliable)
[c17ddda0] [d2509680] jffs2_rmdir+0xa4/0x1cc [jffs2]
[c17dddd0] [c026da04] vfs_rmdir+0x180/0x268
[c17dde00] [c026f4e4] do_rmdir+0x2cc/0x300
[c17ddf40] [c001a658] ret_from_syscall+0x0/0x3c

The root cause is that we don't get "jffs2_inode_info.sem" before
we scan list "jffs2_inode_info.dents" in function jffs2_rmdir.
This patch add codes to get "jffs2_inode_info.sem" before we scan
"jffs2_inode_info.dents" to slove the UAF problem.

Signed-off-by: Zhe Li <lizhe67@huawei.com>
---
 fs/jffs2/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index f20cff1..7764937 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -590,10 +590,14 @@ static int jffs2_rmdir (struct inode *dir_i, struct dentry *dentry)
 	int ret;
 	uint32_t now = JFFS2_NOW();
 
+	mutex_lock(&f->sem);
 	for (fd = f->dents ; fd; fd = fd->next) {
-		if (fd->ino)
+		if (fd->ino) {
+			mutex_unlock(&f->sem);
 			return -ENOTEMPTY;
+		}
 	}
+	mutex_unlock(&f->sem);
 
 	ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name,
 			      dentry->d_name.len, f, now);
-- 
2.7.4



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
