Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F4C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jun 2022 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mbJuz9TdnfOJgFusRZfA75zRZKR/JkK+vRH/ckiCTqE=; b=15ewGUBP1mwTHB
	aa3U0/rLSOur0ICXIVdypBNI/OF0qw5TAHnpa/cPO/DGiLAPD1ROk2/EkdRBenxMrnFfdzH7WWcVY
	JIugV5zYSXRfR4TzmDQrh6lTnFBoBHHDzIzi6SPyVOibx/W9urSoKlVU6aWDDekuhCUnZ6utjpm1l
	lNFrMKYGH39//hgfaxkNV2FPVLrKhuHpGSPASzIms9kh82ccYFFi4hb6KRJKYvpVSaS4PSQkqbIer
	7TByUNeHMr/k9LCvMNObfAVp/PursG63GWjUOlnqADt++U+5/h+Ly5ImBWxU8n5aBpCaLUzOU8C8o
	NIx4780Y9CVfvrv1xl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwekY-001unD-4C; Thu, 02 Jun 2022 06:56:06 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwekV-001uju-7K
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2022 06:56:04 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VF9Mp6A_1654152957;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VF9Mp6A_1654152957)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 02 Jun 2022 14:55:58 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next v2] ubifs: Fix some kernel-doc comments
Date: Thu,  2 Jun 2022 14:55:56 +0800
Message-Id: <20220602065556.104006-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_235603_452886_B0D08920 
X-CRM114-Status: UNSURE (   7.55  )
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
 fs/ubifs/journal.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 75dab0ae3939..61f72a557655 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1201,9 +1201,13 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
  * ubifs_jnl_rename - rename a directory entry.
  * @c: UBIFS file-system description object
  * @old_dir: parent inode of directory entry to rename
- * @old_dentry: directory entry to rename
+ * @old_inode: directory entry's inode to rename
+ * @old_nm: name of the old directory entry to rename
  * @new_dir: parent inode of directory entry to rename
- * @new_dentry: new directory entry (or directory entry to replace)
+ * @new_inode: new directory entry's inode (or directory entry's inode to
+ *		replace)
+ * @new_nm: new name of the new directory entry
+ * @whiteout: whiteout inode
  * @sync: non-zero if the write-buffer has to be synchronized
  *
  * This function implements the re-name operation which may involve writing up
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
