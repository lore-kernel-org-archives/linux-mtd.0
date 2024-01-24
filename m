Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561E9C48277
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lgs2eKd+rHCN3OgQzp0pnVDzL5io+EYkCdRC+LofMrU=; b=ydjaziZFjdfZpY
	C8bIYsPs/BPZ4hpX2A0kez8VMfSieehA18JCdrn6Aup11rEIm9d3D8kT/gccPGbzhs/tyheP8MH66
	8wCx1CcDA2vtRMWKAS59zh2CXWHKUv97mg9Q/124Fap7o4rIGJ8JcRa03F/SYr4pvZ0onLRu5iWwD
	WDmJvniNj/Ks0OkNvhjK3os2B/5ZeVn/VWlbeD+at3ZBPB3W+tPKfvBbFgTeNsmEo3KlP59ppNdd8
	Xl3D5Y0xSriczMXpu9r6MZUT4CdIZxmUif84RgGGRKK/jKluBo1yYFVHez3FzA5dcQwhSs6RrazKv
	V0CuElTk79G5monND2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR5-004ZrZ-07;
	Wed, 24 Jan 2024 17:53:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShQz-004ZnM-2u
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4BLcXtunv8K55EIbLY6Cz+Ba9KEcTs01x6W2txMgvd4=; b=GpzadNX7vKAg0W1zJQWMGP7nCA
	hAnJIOYgyBkTKcMI2XJly6GLL1gfJal3ppuBSXC2I7G3rXSvMwhZdSysVwJkg8b7XeGLtvJIhO51R
	bBD4ZFNAwtKm6d4N5PdxWgFxE2et9YXSw0a8leQbv8KBQ/KmTnFRZvfrhkKmkX5zsnONCs5sGsskR
	9lEb1/MZRDfTZ77H0QdkNIlaOJ7dHF4rPrMWfyg1anktS/AxY7xYAkgNQi0szLNBCvNB14vJicKou
	vvS0PPM/+9thoNkE+N5R+w0tfm6TPL0lmi2dMod1Fbp9fFszvXVjcAtpWKF0bPDBffMu2eZOu8j2q
	yTYeDm0g==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQu-00000007LVL-3I7V;
	Wed, 24 Jan 2024 17:53:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v2 01/15] ubifs: Set page uptodate in the correct place
Date: Wed, 24 Jan 2024 17:52:44 +0000
Message-ID: <20240124175302.1750912-2-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124175302.1750912-1-willy@infradead.org>
References: <20240124175302.1750912-1-willy@infradead.org>
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

Page cache reads are lockless, so setting the freshly allocated page
uptodate before we've overwritten it with the data it's supposed to have
in it will allow a simultaneous reader to see old data.  Move the call
to SetPageUptodate into ubifs_write_end(), which is after we copied the
new data into the page.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5029eb3390a5..d0694b83dd02 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -261,9 +261,6 @@ static int write_begin_slow(struct address_space *mapping,
 				return err;
 			}
 		}
-
-		SetPageUptodate(page);
-		ClearPageError(page);
 	}
 
 	if (PagePrivate(page))
@@ -463,9 +460,6 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 				return err;
 			}
 		}
-
-		SetPageUptodate(page);
-		ClearPageError(page);
 	}
 
 	err = allocate_budget(c, page, ui, appending);
@@ -475,10 +469,8 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 		 * If we skipped reading the page because we were going to
 		 * write all of it, then it is not up to date.
 		 */
-		if (skipped_read) {
+		if (skipped_read)
 			ClearPageChecked(page);
-			ClearPageUptodate(page);
-		}
 		/*
 		 * Budgeting failed which means it would have to force
 		 * write-back but didn't, because we set the @fast flag in the
@@ -569,6 +561,9 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 		goto out;
 	}
 
+	if (len == PAGE_SIZE)
+		SetPageUptodate(page);
+
 	if (!PagePrivate(page)) {
 		attach_page_private(page, (void *)1);
 		atomic_long_inc(&c->dirty_pg_cnt);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
