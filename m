Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D81C54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HxI36AdoXA/IDeWdCpQ2bOQs28T9UJTBDtHCsH9rbCs=; b=3lBBiQWiUWbpGJ
	bIEYrqIKLYlL25p6Vwt1lII1UvpVnjMf3S8Ru4MII5bUt9WW3nWsuegk/GbIh8d49FTgZc8hmg85B
	cR7Gn/LDdDG1Jz+eNTGMrRoKnWigpdWMPfWiR1KE4doRxXel8DsOxWADSm4HXuNaaL+yK63zYzlXQ
	UFcuphHrsWGPe4S1RU/Yjr915HeldysXgFgsie4Yrf3VerzjxSYSrU3k1AFJiR5bYFV/v9xnZjH0D
	yoQD15KH0rMScD6pert1EkCHoohuPKW6eXdjwsjBl5a2cT7Jsqj5YHW3KW7045ZNL/XQBfvgQHX+r
	eZMPaFDkLnAULMy8E7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDjb-000qbF-2H; Fri, 13 Jan 2023 06:40:15 +0000
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDjZ-000qaq-Fq; Fri, 13 Jan 2023 06:40:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: use correct names in function kernel-doc comments
Date: Thu, 12 Jan 2023 22:40:12 -0800
Message-Id: <20230113064012.25071-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
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

Fix kernel-doc warnings by using the correct function names in
their kernel-doc notation:

drivers/mtd/ubi/eba.c:72: warning: expecting prototype for next_sqnum(). Prototype was for ubi_next_sqnum() instead
drivers/mtd/ubi/wl.c:176: warning: expecting prototype for wl_tree_destroy(). Prototype was for wl_entry_destroy() instead
drivers/mtd/ubi/misc.c:24: warning: expecting prototype for calc_data_len(). Prototype was for ubi_calc_data_len() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/ubi/eba.c  |    2 +-
 drivers/mtd/ubi/misc.c |    2 +-
 drivers/mtd/ubi/wl.c   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff -- a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -61,7 +61,7 @@ struct ubi_eba_table {
 };
 
 /**
- * next_sqnum - get next sequence number.
+ * ubi_next_sqnum - get next sequence number.
  * @ubi: UBI device description object
  *
  * This function returns next sequence number to use, which is just the current
diff -- a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -10,7 +10,7 @@
 #include "ubi.h"
 
 /**
- * calc_data_len - calculate how much real data is stored in a buffer.
+ * ubi_calc_data_len - calculate how much real data is stored in a buffer.
  * @ubi: UBI device description object
  * @buf: a buffer with the contents of the physical eraseblock
  * @length: the buffer length
diff -- a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -165,7 +165,7 @@ static void wl_tree_add(struct ubi_wl_en
 }
 
 /**
- * wl_tree_destroy - destroy a wear-leveling entry.
+ * wl_entry_destroy - destroy a wear-leveling entry.
  * @ubi: UBI device description object
  * @e: the wear-leveling entry to add
  *

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
