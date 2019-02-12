Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DB5C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 00:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BE420842
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 00:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z82NW94G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87BE420842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rockwellcollins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d/RrXnPXRdrfO7Q3LgyAiHXK/c8XCt3iPmKBtSqjPpg=; b=Z82NW94GW18FYB
	sTeBQM1dsuH1ydo3mx6Zz/F+5JIHbIyMCAtyT7iDbq0IKjdk2Sh0I98ARBy4diObsioG6dmAQ6il3
	E+DVOcseVH29Qivpmjapo8ZFUZ6Q2R/lf2aMZ3jmdEdO9A6QBgYr87QIhTzGgeWDRSLvQzdm/V1zv
	hPw24YHNlbBqDyUytYKoEuoo38R40C8YtyZm5DDOfU4cMI0K5iV2+0tkHR/+DJJnAaMrsUlItw9oS
	Y5gQGpg1cjvXQU7R8BtQhAx28SgeB0FhDNGSUdA3l6yEbr/pAs83UtijFFSVV4u7k0Ppab2jtuV/l
	hjRDZUnChF/hOQ2fugrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtLt5-0006on-1L; Tue, 12 Feb 2019 00:25:23 +0000
Received: from da1vs02.rockwellcollins.com ([205.175.227.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtLt1-0006oA-JJ
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 00:25:21 +0000
Received: from ofwda1n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.227.14])
 by da1vs02.rockwellcollins.com with ESMTP; 11 Feb 2019 18:25:17 -0600
X-Received: from righttwix.rockwellcollins.com (righttwix.rockwellcollins.com
 [192.168.141.218])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 9B6296011F;
 Mon, 11 Feb 2019 18:25:16 -0600 (CST)
From: Brandon Maier <brandon.maier@rockwellcollins.com>
To: dwmw2@infradead.org
Subject: [PATCH] jffs2: Fix use of uninitialized erase_completion_lcok
Date: Mon, 11 Feb 2019 18:25:01 -0600
Message-Id: <20190212002501.96725-1-brandon.maier@rockwellcollins.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_162519_724664_DB88A624 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Brandon Maier <brandon.maier@rockwellcollins.com>,
 linux-mtd@lists.infradead.org,
 Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

If jffs2_fill_super() detects a bad option, it will error out. But it
leaves a pointer to the uninitialized jffs2_sb_info in the super block.
It gets passed to jffs2_kill_sb() which attempts to use the spinlock,
generating the following warning:

[root@hostname tmp]# mount -t jffs2 -o 'bogus' /dev/mtdblock12 /mnt
[  354.060743] jffs2: Error: unrecognized mount option 'bogus' or missing value
[  354.067932] INFO: trying to register non-static key.
[  354.072847] the code is fine but needs lockdep annotation.
[  354.078315] turning off the locking correctness validator.
[  354.083804] CPU: 0 PID: 313 Comm: mount Not tainted 4.14.87 #1
[  354.089599] Hardware name: Xilinx Zynq Platform
[  354.094167] [<c0125e80>] (unwind_backtrace) from [<c0122080>] (show_stack+0x20/0x24)
[  354.101867] [<c0122080>] (show_stack) from [<c078f368>] (dump_stack+0xbc/0xe8)
[  354.109076] [<c078f368>] (dump_stack) from [<c0187b68>] (register_lock_class+0x27c/0x624)
[  354.117227] [<c0187b68>] (register_lock_class) from [<c018b334>] (__lock_acquire+0xa4/0x1c60)
[  354.125726] [<c018b334>] (__lock_acquire) from [<c018d92c>] (lock_acquire+0xd0/0x2b0)
[  354.133550] [<c018d92c>] (lock_acquire) from [<c07af704>] (_raw_spin_lock+0x54/0x64)
[  354.141271] [<c07af704>] (_raw_spin_lock) from [<c03d5ee8>] (jffs2_stop_garbage_collect_thread+0x24/0x5c)
[  354.150814] [<c03d5ee8>] (jffs2_stop_garbage_collect_thread) from [<c03d7278>] (jffs2_kill_sb+0x38/0x4c)
[  354.160276] [<c03d7278>] (jffs2_kill_sb) from [<c0287248>] (deactivate_locked_super+0x6c/0x90)
[  354.168878] [<c0287248>] (deactivate_locked_super) from [<c050ffcc>] (mount_mtd_aux+0x11c/0x124)
[  354.177623] [<c050ffcc>] (mount_mtd_aux) from [<c0510034>] (mount_mtd_nr+0x60/0x90)
[  354.185262] [<c0510034>] (mount_mtd_nr) from [<c05101d0>] (mount_mtd+0x16c/0x238)
[  354.192737] [<c05101d0>] (mount_mtd) from [<c03d72b4>] (jffs2_mount+0x28/0x30)
[  354.199946] [<c03d72b4>] (jffs2_mount) from [<c0288bd8>] (mount_fs+0x24/0xb8)
[  354.207073] [<c0288bd8>] (mount_fs) from [<c02aba34>] (vfs_kern_mount+0x64/0x138)
[  354.214528] [<c02aba34>] (vfs_kern_mount) from [<c02afb78>] (do_mount+0x198/0xce0)
[  354.222064] [<c02afb78>] (do_mount) from [<c02b0a5c>] (SyS_mount+0x84/0xac)
[  354.229028] [<c02b0a5c>] (SyS_mount) from [<c011cfc0>] (ret_fast_syscall+0x0/0x28)
mount: mounting /dev/mtdblock12 on /mnt failed: Invalid argument

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 fs/jffs2/super.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index bb6ae387469f..34f9a1c21620 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -286,8 +286,11 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_fs_info = c;
 
 	ret = jffs2_parse_options(c, data);
-	if (ret)
+	if (ret) {
+		sb->s_fs_info = NULL;
+		kfree(c);
 		return -EINVAL;
+	}
 
 	/* Initialize JFFS2 superblock locks, the further initialization will
 	 * be done later */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
