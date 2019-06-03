Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E014AC04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 16:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74BD127410
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 16:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TnfB4z18";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="gQFdb6/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74BD127410
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZwFVY8HdYmyPLZuKukk2dQ0h0bllractlCgHtSkKt+8=; b=Tnf
	B4z181jW48QC2yc9fRzH0XIMkClRswtF+xo8DpIl5D5qEG981BrUztVMZGsvkhwBjBw/d9IrSkkIE
	4SL2QMl8KOd+DzGHcfWBovzinTZpja6U4M3dNa7P9ooLlsURV4JW9wGZRFJZev7YCICVrfVHYZ1Gc
	PV93GexFYqXQOyqj6JUQ6ONbYjlHKgus2ISzPQB8hZJRIK2XZHJtHLQ6mDgUc8UP+rGm4TYOwY+/P
	Jb7Aq0EnH/2TynZ6icbSPjJrK8RxXvcfln6bW7Nha2muPRaEY3hbjA5tCGmyVl1arWrQlc9Euaj84
	QRlEofZ8LejzXP2fa0w2yRhgboacFjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXqAe-0005en-Gb; Mon, 03 Jun 2019 16:50:52 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXqAb-0005eO-QD
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 16:50:51 +0000
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net
 [126.125.154.139]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x53GoTBY008328;
 Tue, 4 Jun 2019 01:50:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x53GoTBY008328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559580630;
 bh=Uf6Bqw9USDMuxj3PzqazDovjCc2/XohbsDH/Cgwz43Y=;
 h=From:To:Cc:Subject:Date:From;
 b=gQFdb6/Vt3HdMh6R5JJW4MWNJEjRvuP4wPeGxL1iEJMfhT0bHqVTadtRZgzNiVrwv
 rZIWW1rhoDVsNqdEqizQga9AgRGhc4o7HTDt2xEYydpm9F0gyBQThB97tHLZxOi2ul
 aPDY+l2djP0mhEeLmeuTvraYWEIOPP3Gh77WOsZkJ5UXGDn6YsJTDrvweaSlpDYDdI
 3ciE+96nXaQ0OhLUJm3SEbLyZFsQ3xvSzXb9/36pxwWZEGiMSm1B65ReZLFy4cpQY9
 ZXeUo+PbTBUtIyA6Kx5Frb+GQA5I4w05ToFYh+OuN1RvMg0TDIUirEKcBEN14lnVzR
 A2QSe/jaiimWg==
X-Nifty-SrcIP: [126.125.154.139]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] jffs2: do not use C++ style comments in uapi header
Date: Tue,  4 Jun 2019 01:50:27 +0900
Message-Id: <20190603165027.11831-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_095050_163790_4EAF7108 
X-CRM114-Status: UNSURE (   8.61  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linux kernel tolerates C++ style comments these days. Actually, the
SPDX License Identifier for .c files uses C++ comment style.

On the other hand, uapi headers are strict, where the C++ comment
style is banned.

Looks like these lines are temporarily commented out, so I did not
use the block comment style.

Having said that, they have been commented out since the pre-git era.
(so, at least 14 years). 'Maybe later' may not happen. Alternative fix
might be to delete these lines entirely.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/uapi/linux/jffs2.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/jffs2.h b/include/uapi/linux/jffs2.h
index a18b719f49d4..5dee6d930d5b 100644
--- a/include/uapi/linux/jffs2.h
+++ b/include/uapi/linux/jffs2.h
@@ -77,10 +77,10 @@
 
 #define JFFS2_ACL_VERSION		0x0001
 
-// Maybe later...
-//#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
-//#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
-
+/* Maybe later...
+#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
+#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
+*/
 
 #define JFFS2_INO_FLAG_PREREAD	  1	/* Do read_inode() for this one at
 					   mount time, don't wait for it to
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
