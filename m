Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B465C54F55
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7vR/5xZyfNB1sJGb9hQWaxj3bL9H0SB6Ln7rTqDT+0=; b=tqxMwcP6BB5NyP
	EURjzYf9MAlbu5Ov6w8dS6T5+ntSFvLcSVT7GeyhCa+Lkn+rkeZnTdj9bVBr4rat0/F7yzKIfmwTO
	kyzw0i7olnxArKDqiwWO8zjrLPFVgy06XgqmNRVwXwdCCkm4Tl0IfXsEJe4Jig3ITx/dhhdVtmF79
	nijzRCrARm+q5ZQTGK/6lEpg8efUtEafIPTtvBZNtNCZPgYeElHhq6xAgkuuVfBvm7rBnlfz4F5pU
	hWKbnlrM4icU4QHF6MAtpq6TpsGcizeHOCU8mVh03uyIVleoPmnPxlvyV03uah6yDLSx8v1EI0GBC
	nAerrJ2kwmyVbaALPR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xW-00000008gFj-2sfr;
	Wed, 29 Jul 2026 17:20:46 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xV-00000008gDs-0Aq5;
	Wed, 29 Jul 2026 17:20:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] ubifs: debug.h: fix kernel-doc struct prototypes
Date: Wed, 29 Jul 2026 10:20:42 -0700
Message-ID: <20260729172044.1793865-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729172044.1793865-1-rdunlap@infradead.org>
References: <20260729172044.1793865-1-rdunlap@infradead.org>
MIME-Version: 1.0
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

Use the "struct" keyword to describe structs in kernel-doc format.
This avoids kernel-doc warnings:

Warning: fs/ubifs/debug.h:75 cannot understand function prototype: 'struct ubifs_debug_info'
Warning: fs/ubifs/debug.h:130 cannot understand function prototype: 'struct ubifs_global_debug_info'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org

 fs/ubifs/debug.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260729.orig/fs/ubifs/debug.h
+++ linux-next-20260729/fs/ubifs/debug.h
@@ -26,7 +26,7 @@ typedef int (*dbg_znode_callback)(struct
 #define UBIFS_DFS_DIR_LEN  (3 + 1 + 2 + 3 + 1)
 
 /**
- * ubifs_debug_info - per-FS debugging information.
+ * struct ubifs_debug_info - per-FS debugging information.
  * @old_zroot: old index root - used by 'dbg_check_old_index()'
  * @old_zroot_level: old index root level - used by 'dbg_check_old_index()'
  * @old_zroot_sqnum: old index root sqnum - used by 'dbg_check_old_index()'
@@ -119,7 +119,7 @@ struct ubifs_debug_info {
 };
 
 /**
- * ubifs_global_debug_info - global (not per-FS) UBIFS debugging information.
+ * struct ubifs_global_debug_info - global (not per-FS) UBIFS debugging information.
  *
  * @chk_gen: if general extra checks are enabled
  * @chk_index: if index xtra checks are enabled

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
