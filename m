Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544ACC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:16:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BFD020775
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPvm7NZy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zzg8Gjlx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BFD020775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GD6JvHHn35KAp2+5kc2l+RhBYWXYuXKDGmoPDTA5xFk=; b=CPvm7NZy2PSnA2n7SDbG+YphR
	V8d+kmDe1fQDkWPKxUI233izkOTk6PKPZDVTw9IIUgv3ekbfZ94zQ0WEfPLHGn8ITGossbcD3qX5u
	ucqM2WBWnq92psJ7tvwluMQqAxmt9WUWL37y/n80Gcij26bL4FyjPgPa5RYCfdCJ4FahFcAxK11a2
	OfintDadS/SfLXH4RbxYBdKPW2m4SQCHO43Sik3JibjlWYbGuLPc7xsIkXDpgu5k25g5vLnBWYr7Z
	iSSo09qaJpS9EpV/FjhkdSmxAJM776urTO0KkQxJIwFvZVbDVZsM2D/tm3+qNr5km5gkMjOwWA0iw
	9JdPNxv1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonGT-0008NS-Nm; Fri, 26 Jun 2020 12:15:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomo9-0002pk-Vz
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 11:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=VVq7gytGcYFrxXH7JsKWjkUh0cI5u9F968o2SX2toH4=; b=Zzg8GjlxTUKf5T1rxqeVAtYvoB
 U0Jcul/QIpCDy8oXls2lF2rkXpVd68VjH1nb9q7gUAMwBMxqCUPxko/U96EmsgTplhe4ScJYvTMly
 8jr+HJ06KSfIpjo3+kspTgU5ZCiuwB/F1uH9380o6Snkxfii4KdHAFTw9k0VT/tcdSakFCYahzaHx
 T1JocQfstTfyR6U0MOWxDR9TZ1a63H5SETVojzOA4xuqtm1SROCKW/U2fCzLWpAkSzhuGCYcf8i7M
 7D78G/fxN+ryPoDhe6wM9aaBsl4yWdu3SvcsRlix5w7hVTG3KiMIVMXQt3zJXwxZOo6aYBKgdSnoE
 zcgBh3fA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomXe-0007o9-QM
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 11:29:19 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1jomXc-0001hj-KL; Fri, 26 Jun 2020 13:29:08 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: richard@nod.at
Subject: [PATCH v2 1/4] ubifs: move #include "debug.h" above auth.c
Date: Fri, 26 Jun 2020 13:29:04 +0200
Message-Id: <20200626112907.13201-2-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626112907.13201-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_122912_071015_C296D341 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bigeasy@linutronix.de, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 s.hauer@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

prepare to use ubifs_assert() in some inline functions from
the auth.c block.

move #include "debug.h" above the auth.c block.

Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
---
 fs/ubifs/ubifs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bff682309fbe..95ed45022e51 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1505,6 +1505,8 @@ extern const struct inode_operations ubifs_dir_inode_operations;
 extern const struct inode_operations ubifs_symlink_inode_operations;
 extern struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
+#include "debug.h"
+
 /* auth.c */
 static inline int ubifs_authenticated(const struct ubifs_info *c)
 {
@@ -2063,7 +2065,6 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf, int in_len,
 int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
 		     void *out, int *out_len, int compr_type);
 
-#include "debug.h"
 #include "misc.h"
 #include "key.h"
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
