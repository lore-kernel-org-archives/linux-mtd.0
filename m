Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A43C6FD1F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2024 12:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8pNdkJnyiHtR/aS9Xx2GHAdrliuhKHMb/no+au0QLA=; b=tE+6l/DEoYbRCr
	bkUXXa/qJYrMlDlxYQBIoVfUytrrl343OJKgXgXtFLKaokbiOdLvJ4+JN/Ux0ksuwBNMCuy+5Ie4p
	H149jkl9+bj6oN2qMXtrzDKEYcfnkKl+s37fbpAJFCE118rDPjX/7/n7ye3hdt1zRTQoA8QslLNqP
	hFxgrD1eGB4oaGCzOP1CAxY7FQlKsYJMKxoUknkKUGSXpbAua6GcxtVJqKNRKmySkb09mcWKvGjJu
	iCuH57B+pSYPTgz4rlgs8jwAMyKEmq1AxgXz3Qetfj6uk57YDteMESxqJRomYKvJycqZX3TN/qVY6
	tNq+QhJbAKRsC/pCG6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBA0-00000000Iej-44Z5;
	Fri, 29 Mar 2024 12:16:40 +0000
Received: from red-soft.ru ([188.246.186.2] helo=gw.red-soft.ru)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqB9w-00000000Idd-3sOR
	for linux-mtd@lists.infradead.org;
	Fri, 29 Mar 2024 12:16:38 +0000
Received: from localhost.biz (unknown [10.81.100.48])
	by gw.red-soft.ru (Postfix) with ESMTPA id 541543E1AB8;
	Fri, 29 Mar 2024 15:16:32 +0300 (MSK)
From: Artem Chernyshev <artem.chernyshev@red-soft.ru>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Artem Chernyshev <artem.chernyshev@red-soft.ru>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] fs/jffs2: Fix NULL deref in jffs2_scan_dirty_space
Date: Fri, 29 Mar 2024 15:16:29 +0300
Message-Id: <20240329121629.316171-1-artem.chernyshev@red-soft.ru>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 184491 [Mar 29 2024]
X-KLMS-AntiSpam-Version: 6.1.0.4
X-KLMS-AntiSpam-Envelope-From: artem.chernyshev@red-soft.ru
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;red-soft.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;localhost.biz:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2024/03/29 10:56:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2024/03/29 08:22:00 #24505801
X-KLMS-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_051637_160408_256446F5 
X-CRM114-Status: GOOD (  13.82  )
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

As was mentioned in 2ebf09c2, it is possible to get oops,
when marking space dirty in scan, but no previous node exists

It still can be in jffs2_link_node_ref() via deref jeb->last_node.
Since all jffs2_scan_dirty_space() callers check value of a
function, we can return error code safely.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Artem Chernyshev <artem.chernyshev@red-soft.ru>
---
 fs/jffs2/nodelist.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index b86c78d178c6..6bebf1d64000 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -669,8 +669,11 @@ int jffs2_scan_dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 			size, jeb->free_size, jeb->wasted_size);
 		BUG();
 	}
+	if (!jeb->last_node) {
+		return -EINVAL;
+	}
 	/* REF_EMPTY_NODE is !obsolete, so that works OK */
-	if (jeb->last_node && ref_obsolete(jeb->last_node)) {
+	if (ref_obsolete(jeb->last_node) {
 #ifdef TEST_TOTLEN
 		jeb->last_node->__totlen += size;
 #endif
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
