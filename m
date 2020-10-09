Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE7FC43457
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C37222EB
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nVjgqAkI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iTjT9cVA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C37222EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2EV6CkgpGylvnkYZhOaVelArN/hEVwq0cwbTB4JcoHs=; b=nVjgqAkII+QZKP8dgopiDfikK
	qDfezgbamzzdVBKPPaACgtJAMPItrIQwn2BhqUgYzf8nmHZ90ZmicYU7xLr/QEq3ixTJy+GQv4r5o
	m55/y8L0R/t9zi4m3+ZB/eO16Tyq83ZKjPNOpKbrztWY1aCecKN9QHkpbX0Qs+WW3xlpxtzb/cXDB
	V66T9poNMJpLXFb3ApYs5BD2hjQI58uUNxXRIPtRPhYJK70OadDcHrABHwB1s/uUtpuJJnN++Y9Th
	p0zwzvxP1xDf1kf5l4AF0LNYRMqwfvOAGpQhNwTi9FWopl4h345mAOHKuS94BWm9CeINk8jVeENXM
	zzactcy8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtQl-0003WE-Hn; Fri, 09 Oct 2020 14:31:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQK-0003LG-C8; Fri, 09 Oct 2020 14:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Wff0t85oZfmMq4nKnDr8r5OGugvLiUKKANRhHeeeqKg=; b=iTjT9cVAzxL+HFNND4c7bTUm0A
 cQ7Q4cFEOiMwm5k+E3zByW3wLYo8zhN1erCYDFphc6nSzwQFSCSY9aglC6iI982T0s/d0f/InI8Xc
 BkhHIhCxeR7X9pLeAJZjiST+9Rv9Ed07YRJR5hbvVbvJxPLXiBTCi/0LoJ1lDLESkSvegZM04Vi6J
 vxEvMWz/FS9p7kQDYoZygU55D4p2locN/Kpyv89PI0Qy+EzoBXlbKi/sgLQUJzUqXMZ31/BHuA1rQ
 tZEH+hHAfbpg/8SiWVjUEEBfd/E3hxwSBkmGn+O3Vkm31KMJv6lBqQiLNLp5drW2utVo1jYw6zZAs
 e6KzRXJA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQJ-0005ul-7N; Fri, 09 Oct 2020 14:31:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 04/16] afs: Tell the VFS that readpage was synchronous
Date: Fri,  9 Oct 2020 15:30:52 +0100
Message-Id: <20201009143104.22673-5-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The afs readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/afs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 371d1488cc54..4aa2ad3bea6a 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -367,7 +367,8 @@ int afs_page_filler(void *data, struct page *page)
 			BUG_ON(PageFsCache(page));
 		}
 #endif
-		unlock_page(page);
+		_leave(" = AOP_UPDATED_PAGE");
+		return AOP_UPDATED_PAGE;
 	}
 
 	_leave(" = 0");
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
