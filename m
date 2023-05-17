Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77FCC77B7F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 May 2023 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/cu+xW5XaUl2CpFInXCMqmrxnXQmpCnqVMxcmY4HBHU=; b=SpLFMuNeTJazHq
	59XLDQYSoU+YVwmPeNmfJoOFU3I/lPM7Ra5n+YeyWvydt5iEAsjIpIyoIVL5CwFtE06Tmlw77t/Ty
	2wEoVsMXhf8o15Qen1h4toR8zdLHwz+b7dGmJ/mVMf8FXOe2Fz+9F2toNq88Uu97hOjjb8tEwcRs3
	ORkTl4eKE2aQx0FPhXSnDcI2+nZbxQTI9tNx3Tk6JnJUXMm/fEmJha/p4HEg1SYj1puagiin6Ikqs
	zK5jxCDmtklODOr/eZpFyaDiM5KF78/QsNGR+icJcVLQ98eVa3ZmfkHjEhKoYfBpW7glM249dpNlt
	c/Mx5zUkrgFh+ueiJrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHBm-009ykT-0L;
	Wed, 17 May 2023 13:27:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHBj-009yjf-2f
	for linux-mtd@lists.infradead.org;
	Wed, 17 May 2023 13:27:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EC3B6435E;
	Wed, 17 May 2023 13:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6634CC433D2;
	Wed, 17 May 2023 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684330050;
	bh=1/afHD7U/S45cs/oYFrBR7Ii02gyuBPABL/vb45N5Nc=;
	h=From:To:Cc:Subject:Date:From;
	b=YeD9h5PsYXEONk3b7UItwnBK0xRVjnRrxIrltPyI7vtnsKrmmgv7xv0BwrATVGzYI
	 /nIIFirpVk5u47Pdc/ZDo9ckTlADlFeSdr/TT1gvD38iieRuoeTG6FjlzmZGY/h/NB
	 7jYsk3FkKVT8F99OQZlKCA43N/JobGn6qz2A26iWEu3lI1cbe6yQcri8lWPjc4Zu+n
	 CyZqZkEbZc+EDwavO91mBvBkiOjayAQ4FhdAmt0G/gbHLDLt2maAsdUlZ20lLdydV1
	 9cXnBg5+Yinu9DI1VqfdsA0PeCQmT7ki8eOg50zgNfwfQzNQ9haKrPt6SXRxIzL6Jo
	 Ng4tcWAyCuAdg==
From: Arnd Bergmann <arnd@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: mark __jffs2_dbg_superblock_counts() static
Date: Wed, 17 May 2023 15:27:14 +0200
Message-Id: <20230517132725.938292-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_062731_911213_412586A2 
X-CRM114-Status: GOOD (  13.20  )
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

From: Arnd Bergmann <arnd@arndb.de>

This function is only called locally and does not need to be
global. Since there is no external prototype, gcc warns about
the non-static definition:

fs/jffs2/debug.c:160:6: error: no previous prototype for '__jffs2_dbg_superblock_counts' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/jffs2/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 9d26b1b9fc01..0925caab23c4 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -157,7 +157,7 @@ __jffs2_dbg_prewrite_paranoia_check(struct jffs2_sb_info *c,
 	kfree(buf);
 }
 
-void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
+static void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 {
 	struct jffs2_eraseblock *jeb;
 	uint32_t free = 0, dirty = 0, used = 0, wasted = 0,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
