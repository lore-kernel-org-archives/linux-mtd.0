Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B59C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jun 2022 05:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=faCo8lKzMX9GoWZePWzzMUd34yB5SxjK/OE1xnbsnwE=; b=SnYIrP9k9kOXod
	fiYrKSmOIiVXDDJEdkRoCNg4Wfpu0HLnCwkQefT6HKZyu8glpy0n6+BYZ04PfQKRQUIco6IK5OFx9
	D7nPXisWYxQSJp0Y23CI0Jp5xyYJhTvn0pFGRQ9wGdJQDpnYK5/tIWTzUip5SpWzxzVDXfzNlJA3F
	5AtENO41UEaM5EB26DrhI8i3dp5cXvMFa8C6p8exk/Jblf/3QACayTphSg2xsC3dlxsD63+QmSghP
	ZM65/i8RmS02dpYVfKgKb+1C9g9WuLFNt9P4mbE20EmhJnikUBPXgn/iR5R6/S2EnExgbjBjb9Jl/
	xROTwQ76hpVoK5gyH7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdlK-001XwS-1Q; Thu, 02 Jun 2022 05:52:50 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdlH-001Xtk-3C
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2022 05:52:49 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VF94WQJ_1654149154;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VF94WQJ_1654149154)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 02 Jun 2022 13:52:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] ubifs: Fix some kernel-doc comments
Date: Thu,  2 Jun 2022 13:52:33 +0800
Message-Id: <20220602055233.26161-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_225247_354413_AC266B85 
X-CRM114-Status: UNSURE (   7.04  )
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

Remove warnings found by running scripts/kernel-doc,
which is caused by using 'make W=1'.
fs/ubifs/journal.c:1221: warning: Function parameter or member
'old_inode' not described in 'ubifs_jnl_rename'
fs/ubifs/journal.c:1221: warning: Function parameter or member 'old_nm'
not described in 'ubifs_jnl_rename'
fs/ubifs/journal.c:1221: warning: Function parameter or member
'new_inode' not described in 'ubifs_jnl_rename'
fs/ubifs/journal.c:1221: warning: Function parameter or member 'new_nm'
not described in 'ubifs_jnl_rename'
fs/ubifs/journal.c:1221: warning: Function parameter or member
'whiteout' not described in 'ubifs_jnl_rename'
fs/ubifs/journal.c:1221: warning: Excess function parameter 'old_dentry'
description in 'ubifs_jnl_rename'
fs/ubifs/journal.c:1221: warning: Excess function parameter 'new_dentry'
description in 'ubifs_jnl_rename'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/ubifs/journal.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 75dab0ae3939..16857d4e9aa8 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1201,9 +1201,12 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
  * ubifs_jnl_rename - rename a directory entry.
  * @c: UBIFS file-system description object
  * @old_dir: parent inode of directory entry to rename
- * @old_dentry: directory entry to rename
+ * @old_inode: parent inode to rename
+ * @old_nm: name of old inode to rename
  * @new_dir: parent inode of directory entry to rename
- * @new_dentry: new directory entry (or directory entry to replace)
+ * @new_inode: new inode to rename
+ * @new_nm: name of new inode to rename
+ * @whiteout: whiteout inode
  * @sync: non-zero if the write-buffer has to be synchronized
  *
  * This function implements the re-name operation which may involve writing up
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
