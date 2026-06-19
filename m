Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655CCCD98F6
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2026 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iiNNvz1qWW6KKJ+PJ+d4aaKIqqWqU9MrNHuvjKN+Kz8=; b=GimjckEW83/Upp
	re3FxZdgV8OqxpGnNmITvy7wkhr8OnUu+Uula6aXsYM/zve3Q6ASI8WDPM2xpYIzuIh6ewvnZsTuL
	p4uMPWM/61RnsahjWhyJ005vZkFydWVB32XH7ynzD8Te8e4d1PpgwyZQmQws2VKfsw+kB7ASSMsT/
	Y3O/K0yJIVFq63NXeT9uNcdf3vzgtu7u6n70a9WW4mOAd/24X03qomAKX06rOSbrF+8WLYQ+i8ULz
	nGCvYJU8I2+XaTjt9KI9+ucplRo8/i/GZKNME+I4fTIia6tAOsqIYfI6KeVkWgmyrH4rQx6LqOUzw
	xcvt71XNeF2CxquXr0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWP8-00000002HWY-34sE;
	Fri, 19 Jun 2026 10:24:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWP6-00000002HWP-2xy7
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jun 2026 10:24:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B606F601E2;
	Fri, 19 Jun 2026 10:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A200C2BCB4;
	Fri, 19 Jun 2026 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781864691;
	bh=Z9q1+yHHeYjUw8kl6fQrhSLD59rUQcGAz/c3wT5B5bM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tDEQis0znCPbUmjrWM1aG3sK7OFM3TmEBAVf9mLu4Sw/xIOfPM35epwqCK2MHx0v0
	 /U4dCRJ5nFz03k/kGwYpnzf0mTUfHallryeYTKELwJ3yrITYj7FHrMu1QXmo9xrlGW
	 9WdWU6x84an/YGzlPSAFPa7kMCnk64tIY7tV8VAkvR8CjY1CwNhlYFLGkwpdWFgWZk
	 Noxy6flqQfyKd61tKQ+2gGcuZKG9nA+ytGvvoDGoWgtubDhC9YkgwhtP7Zl0TWQg4e
	 Y3fw1ZIPldL2JYjTFFE8QlqhuNoG00R0TRv8FXFJpIqyxeIoek8K40DCX5h3XNhzt7
	 aY0dwKwepB8Mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FF1CD4F26;
	Fri, 19 Jun 2026 10:24:51 +0000 (UTC)
From: Chuwei Yu via B4 Relay <devnull+max_yu2022.163.com@kernel.org>
Date: Fri, 19 Jun 2026 18:24:23 +0800
Subject: [PATCH] jffs2:fix a oops arises from a conflict between inocache
 evict and gc
MIME-Version: 1.0
Message-Id: <20260619-jffs2-kernel-oops-fix-v1-1-660268541b1b@163.com>
X-B4-Tracking: v=1; b=H4sIANYYNWoC/yXMUQ6CMBCE4auQfXaTtiGAXsX4IGUKi6YlXTQmh
 LtT9fGbZP6NFFmgdKk2yniLSooF9lSRn+5xBMtQTM64xjT2zHMI6viBHPHklBblIB82tW3ROd/
 bGlS+S0aZf93r7W999TP8+o3Rvh/toF+MeQAAAA==
X-Change-ID: 20260619-jffs2-kernel-oops-fix-0417e82cb14e
To: David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuwei Yu <yuchuwei@tp-link.com.hk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781864689; l=3390;
 i=max_yu2022@163.com; s=20260617; h=from:subject:message-id;
 bh=ZFODi3N8e2XsMXVkMEc3e9vOzCxZarLxWNIbK21n2p8=;
 b=lqHbxrg3yKDWuRVblgZkKJ+Fdx0hXnqicmPDwWk2Wt/qxHnF8bDn/Com76v3/JLao98HcdGWk
 uTQrNIiLoxfB8roOAA0BvYHfmlBxwU5DpVfC0il70OdyOnHJq/TmccQ
X-Developer-Key: i=max_yu2022@163.com; a=ed25519;
 pk=o5nctjiEWWNk2YWC+lqznx73YyfF0W9rjQS+9VwtGqg=
X-Endpoint-Received: by B4 Relay for max_yu2022@163.com/20260617 with
 auth_id=832
X-Original-From: Chuwei Yu <max_yu2022@163.com>
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
Reply-To: max_yu2022@163.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Chuwei Yu <yuchuwei@tp-link.com.hk>

[CAUSES]
1 In the garbage collect thread function jffs2_garbage_collect_pass,
it checks the state of all inocaches each loop. If the state is
INO_STATE_GC/INO_STATE_CHECKING/INO_STATE_CLEARING, it will call BUG()
which will cause a kernel oops.

2 If a application executes "echo N > /proc/sys/vm/drop_caches"(N=2/3),
or,  the size of free memory is very low so the kernel wants to clear
the cached memory, both cases will result in Function jffs2_evict_inode
 being called.
Function jffs2_evict_inode calls Function jffs2_do_clear_inode which
sets the state of one inocache to INO_STATE_CLEARING first and does
something and then sets the state of the inocache to
INO_STATE_CHECKEDABSENT.

3 If jffs2_do_clear_inode yields the CPU(Function jffs2_kill_fragtree
 calls cond_resched) after setting the state of one inocache to
INO_STATE_CLEARING, and gc thread happens to get scheduled for execution
at that moment, it will discover the state of one inocache is invalid
and call BUG() to cause a kernel oops.

4 The root cause is that the locks within Function jffs2_evict_inode and
Function jffs2_garbage_collect_pass are not mutually exclusive.

[SOLUTION]
1 Function jffs2_garbage_collect_pass locks c->alloc_sem first by
executing "mutex_lock_interruptible(&c->alloc_sem)" and then lock
c->inocache_lock by executing "spin_lock(&c->inocache_lock)".

2 Function jffs2_do_clear_inode which is called by Function
jffs2_evict_inode executes "mutex_lock(&f->sem)" to lock f->sem first,
then calls Function jffs2_set_inocache_state. In Function
jffs2_set_inocache_state, it locks c->inocache_lock by executing
"spin_lock(&c->inocache_lock)", sets the state of one inocache to
INO_STATE_CLEARING and release the lock c->inocache_lock.
At this moment, because the lock f->sem can not prevent Function
jffs2_garbage_collect_pass from checking the state of all inocaches,
if Function jffs2_garbage_collect_pass gets the CPU to run, the
problem happens.

3 So, we need lock c->alloc_sem before the code line
"jffs2_do_clear_inode(c, f);" in Function jffs2_evict_inode and
unlock c->alloc_sem after the code line "jffs2_do_clear_inode(c, f);"
to make sure that only after jffs2_do_clear_inode is completed can the
jffs2_garbage_collect_pass function checks the state of all inocaches.

[EFFECTIVE]
jffs2 filesystem

[TEST]
1 Compiling with default config works normally.
2 Compiling with allyesconfig works normally.
3 Compiling with allnoconfig works normally.
4 Compiling with O=builddir works normally.
5 Repeat to run drop_caches for 5000 times and jffs2 works normally.

Signed-off-by: Chuwei Yu <yuchuwei@tp-link.com.hk>
---
 fs/jffs2/fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 6ada8369a762..9cf1c480a159 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -247,7 +247,9 @@ void jffs2_evict_inode (struct inode *inode)
 		  __func__, inode->i_ino, inode->i_mode);
 	truncate_inode_pages_final(&inode->i_data);
 	clear_inode(inode);
+	mutex_lock(&c->alloc_sem);
 	jffs2_do_clear_inode(c, f);
+	mutex_unlock(&c->alloc_sem);
 }
 
 struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)

---
base-commit: 9ecfb2f7287a967b418ba69f10d45ead0d360593
change-id: 20260619-jffs2-kernel-oops-fix-0417e82cb14e

Best regards,
--  
Chuwei Yu <max_yu2022@163.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
