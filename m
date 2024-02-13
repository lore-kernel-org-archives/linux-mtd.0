Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9753C4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=moML9SSCrUVwz5HgM6bizAxn2lxwHfAqnzpA88OZoR8=; b=uisO9520sg/hd9
	BpvvORo+dQMNPjHypqPqyhNB1/hvBcutR5VtvezB0FGo9ElheD6UD5yj0f0yvY8sCpaM9WJNFaBzd
	9rY1jIOnxnNxFIPuoD1qZoiNQMOCdeuN1DRllUpwuxTKpzQXTrduZ1Rq4Hz4zUoXXT0qQfgvYx0kV
	/sg0nPt/9RRLWMJ4oNa37gppFwhvkrx1GQM2EGyMH7lnYzAQ+ragkPhcY5avV1PpW7VGzt5pw09FH
	flfrXLRISrA3Vdf63I6LzgIDF4T/gmLzojMYrLl242e1dBELui+6Wa+3oPNQeqQ+14hdHuzXRhaEP
	6Wl71L69wjMt3PviYquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpUf-00000008hkB-0Lsd;
	Tue, 13 Feb 2024 09:54:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpUb-00000008hiL-1WIM
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 09:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACC99CE1AB0;
	Tue, 13 Feb 2024 09:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8707AC433C7;
	Tue, 13 Feb 2024 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707818059;
	bh=tyrKSJ+fpXIRAZe8ycgeQ8Vq9Yq+VZQ5WTyjhUVTRPA=;
	h=From:To:Cc:Subject:Date:From;
	b=m2/QZK6nA2S8/E5kGUsVsTSn9C71ihbSd/3BFmOQyQAui7Jb8Sa1MhdrvJnzxLweS
	 irAvGeDMdoCeXu6FjLCaB964QMcwrfLD+Yj5ev+8e3khQ6qMGYyofGPbxAhwJeCXmf
	 yfmIF0qWgYGDCVuOA5liTwZO1YFrHcJODG93j+26y/pt4R8jizxu5oQlqttzahfJtX
	 M6Ln4G2r+tP7S/Dnq5iuSLpx2W6iFtEt2K8PTJsB/8R4v//i2ntTXlnsGbVNwZTz60
	 goTtSlhokITvTnTMm+bzHzbVn4xKC5/isBKi5DeqYYsU4iS5W6MyyxaOwkvGP6YbuO
	 v/LkRqSB8YDFw==
From: Arnd Bergmann <arnd@kernel.org>
To: Richard Weinberger <richard@nod.at>,
	Nathan Chancellor <nathan@kernel.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/2] ubifs: fix sort function prototype
Date: Tue, 13 Feb 2024 10:54:07 +0100
Message-Id: <20240213095412.453787-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_015421_608566_6FCE708E 
X-CRM114-Status: GOOD (  12.03  )
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

The global sort() function expects a callback pointer to a function with two
void* arguments, but ubifs has a function with specific object types, which
causes a warning in clang-16 and higher:

fs/ubifs/lprops.c:1272:9: error: cast from 'int (*)(struct ubifs_info *, const struct ubifs_lprops *, int, struct ubifs_lp_stats *)' to 'ubifs_lpt_scan_callback' (aka 'int (*)(struct ubifs_info *, const struct ubifs_lprops *, int, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
 1272 |                                     (ubifs_lpt_scan_callback)scan_check_cb,
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change the prototype to the regular one and cast the object pointers
locally instead.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/find.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 873e6e1c92b5..1cb79b167a4f 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -726,11 +726,10 @@ int ubifs_find_free_leb_for_idx(struct ubifs_info *c)
 	return err;
 }
 
-static int cmp_dirty_idx(const struct ubifs_lprops **a,
-			 const struct ubifs_lprops **b)
+static int cmp_dirty_idx(const void *a, const void *b)
 {
-	const struct ubifs_lprops *lpa = *a;
-	const struct ubifs_lprops *lpb = *b;
+	const struct ubifs_lprops *lpa = *(const struct ubifs_lprops **)a;
+	const struct ubifs_lprops *lpb = *(const struct ubifs_lprops **)b;
 
 	return lpa->dirty + lpa->free - lpb->dirty - lpb->free;
 }
@@ -754,7 +753,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
 	       sizeof(void *) * c->dirty_idx.cnt);
 	/* Sort it so that the dirtiest is now at the end */
 	sort(c->dirty_idx.arr, c->dirty_idx.cnt, sizeof(void *),
-	     (int (*)(const void *, const void *))cmp_dirty_idx, NULL);
+	     cmp_dirty_idx, NULL);
 	dbg_find("found %d dirty index LEBs", c->dirty_idx.cnt);
 	if (c->dirty_idx.cnt)
 		dbg_find("dirtiest index LEB is %d with dirty %d and free %d",
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
