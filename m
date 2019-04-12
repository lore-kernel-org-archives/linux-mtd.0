Return-Path: <SRS0=Ifuc=SO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE345C10F0E
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 07:28:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ECA32077C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 07:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ST8e/KXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ECA32077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+o4tOVoeCvhjcDdcVN35yGKt5m4fqa0JRdw1BIq/KFI=; b=ST8e/KXDouP4iz
	AqyecZLXiJp2+CtHwxfADtWwEcLzniUybD2YQdiRxSp4zqvGlVExyVJqAffXJP+/E2reAU29FSuG0
	lN1AEUVIT+V5Zq9+/KpM6kQl7XsOsVQnHcxiCElJg66M/Glj5lO24ak0pDFO4hBJbhiUkwgAvJ4wy
	pmr73679HY7CahFxfYehB/kJNP7Lb6bYfo9pT9crMrVEVu4QJIj/36E/s13KQPgMYvzLg5aAGT+P3
	phBBKrwVkNnyW9UZAaPnSxybabasX62jUG3DcNDnwR/LdQ7ZVFmb6Z7GXIVQYPiw9oifmp8Vuc7U4
	jWL7faXC/5y0fHIX9AeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEqbQ-0002T8-OA; Fri, 12 Apr 2019 07:28:00 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEqbN-0002SL-Vu
 for linux-mtd@lists.infradead.org; Fri, 12 Apr 2019 07:27:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 0CF4B1806353E;
 Fri, 12 Apr 2019 09:27:48 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Update jffs2 entry
Date: Fri, 12 Apr 2019 09:27:31 +0200
Message-Id: <20190412072731.23772-1-richard@nod.at>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_002758_171856_5BC64F7F 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Richard Weinberger <richard@nod.at>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update the entry to represent the current state of jffs2.
I'll carry fixes via the UBIFS tree, David has the last word
on anything.
New features are not planned.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2359e12e4c41..089ab56eaecd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8317,9 +8317,11 @@ F:	drivers/net/ethernet/jme.*
 
 JOURNALLING FLASH FILE SYSTEM V2 (JFFS2)
 M:	David Woodhouse <dwmw2@infradead.org>
+M:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/doc/jffs2.html
-S:	Maintained
+T:	git git://git.infradead.org/ubifs-2.6.git
+S:	Odd Fixes
 F:	fs/jffs2/
 F:	include/uapi/linux/jffs2.h
 
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
