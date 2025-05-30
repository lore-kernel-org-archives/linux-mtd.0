Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE62C5AD49
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7sj3ZGkcL8vVW19PJWiPkfuPqOL7S21HnYRW2RDA0Q=; b=o2zkroZd+898ZR
	zS5B2ljSmq3S7BJrKGDhW707wW9+I1Vp02L7GqqNN978Ntfi/4t2uYsQmE51TxFJCRASojUVIj++/
	TU86vEwL/xRMpRKKFQe2cmQYpmtjoRpsqD7cjZwZwWGDyMW+WbM5fJHTeWLI02VUDDWzE+MXUvq3p
	NdMryyyAVwZdMu2rztznMoYrtABKWdqSY23avpFVevOkZXO0Jx1p3Dod+s2AwmLOP0HG/dASJYWqz
	FoRQ8dwafXJe9w9U1dIOpvW/BLhigbLXeTYYpDXY49Wyzk0C0pwcR9mO2/xCuxYWQBwVWOz1t9UlX
	VCM6hkuvjC3qn5eT4wYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4WQ-00000001W7B-0RdQ;
	Fri, 30 May 2025 18:32:02 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4WL-00000001W4r-2nWJ
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 18:32:00 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.16])
	by mail.ispras.ru (Postfix) with ESMTPSA id 1D8B940755EB;
	Fri, 30 May 2025 18:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1D8B940755EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1748629912;
	bh=yf3N76z1AZ6dIBtW7rVAoKXhww6/Z7dw6mR+g/CZJXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2Xa3M++ikZHaMDp6rKgXYOCySkUY8jrjt5AUS/L1g3TwNnMsW9ndUV8ELIJQwc1G
	 HhFGIjRnnx2z6Of1Im4cPL2zisr/UdjfbVQMzPEQdNvMQXco4WdMG8Z0YwVec2rsSn
	 +JUYBhlu1ixQDhqZ9VFMYWeEmVRDRtMEPKt6VUFg=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Richard Weinberger <richard@nod.at>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Wang Yong <wang.yong12@zte.com.cn>,
	Lu Zhongjun <lu.zhongjun@zte.com.cn>,
	Yang Tao <yang.tao172@zte.com.cn>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH resend 1/2] jffs2: initialize filesystem-private inode info in ->alloc_inode callback
Date: Fri, 30 May 2025 21:31:38 +0300
Message-ID: <20250530183141.222155-2-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530183141.222155-1-pchelkin@ispras.ru>
References: <20250530183141.222155-1-pchelkin@ispras.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_113157_868396_7B2AC237 
X-CRM114-Status: GOOD (  16.76  )
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

The symlink body (->target) should be freed at the same time as the inode
itself per commit 4fdcfab5b553 ("jffs2: fix use-after-free on symlink
traversal"). It is a filesystem-specific field but there exist several
error paths during generic inode allocation when ->free_inode(), namely
jffs2_free_inode(), is called with still uninitialized private info.

The calltrace looks like:
 alloc_inode
  inode_init_always // fails
   i_callback
    free_inode
    jffs2_free_inode // touches uninit ->target field

Commit af9a8730ddb6 ("jffs2: Fix potential illegal address access in
jffs2_free_inode") approached the observed problem but fixed it only
partially. Our local Syzkaller instance is still hitting these kinds of
failures.

The thing is that jffs2_i_init_once(), where the initialization of
f->target has been moved, is called once per slab allocation so it won't
be called for the object structure possibly retrieved later from the slab
cache for reuse.

The practice followed by many other filesystems is to initialize
filesystem-private inode contents in the corresponding ->alloc_inode()
callbacks. This also allows to drop initialization from jffs2_iget() and
jffs2_new_inode() as ->alloc_inode() is called in those places.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 4fdcfab5b553 ("jffs2: fix use-after-free on symlink traversal")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/jffs2/fs.c    | 2 --
 fs/jffs2/super.c | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index d175cccb7c55..85c4b273918f 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -271,7 +271,6 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	f = JFFS2_INODE_INFO(inode);
 	c = JFFS2_SB_INFO(inode->i_sb);
 
-	jffs2_init_inode_info(f);
 	mutex_lock(&f->sem);
 
 	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
@@ -439,7 +438,6 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
 		return ERR_PTR(-ENOMEM);
 
 	f = JFFS2_INODE_INFO(inode);
-	jffs2_init_inode_info(f);
 	mutex_lock(&f->sem);
 
 	memset(ri, 0, sizeof(*ri));
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 4545f885c41e..b56ff63357f3 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -42,6 +42,8 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
 	f = alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
 	if (!f)
 		return NULL;
+
+	jffs2_init_inode_info(f);
 	return &f->vfs_inode;
 }
 
@@ -58,7 +60,6 @@ static void jffs2_i_init_once(void *foo)
 	struct jffs2_inode_info *f = foo;
 
 	mutex_init(&f->sem);
-	f->target = NULL;
 	inode_init_once(&f->vfs_inode);
 }
 
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
