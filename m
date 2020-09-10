Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA15C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1842A2145D
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 14:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v6Xswxgy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gWXdSveh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1842A2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mQvm9PQKPh9YTAQPR5sK4Vqk5fditc6CCmIMjBV524s=; b=v6Xswxgya/lDfrkacyMs0wuKS
	EOrUDcDLp5oLr7+KKbp9McrL984IuyzPLhUdOKBDY4CPuVK5hkYJwrk1/WW0mvl8MOzx6zw1bW/A8
	TLOmjQM1fUURFOzyBROIBip3Wc0uBmpzv2qnua2tT1NihRL5arVXljQNzaBvokBL/cwW38UekfqRI
	xjAc6spaalKYILPQc3OCTMW58wc/2V8/tlj2b/O3dmkZNL7IggDj8G3bv8Z6VuODprvTKwiTABvj8
	/G17DGMssn1yzKlCFmAh3gtXJSkxuDHaKL1p4EVncjIHldBDWCLQWcd9j5rZV8TBJ7uDWEmUFT+3G
	sQV6EhMWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGNsv-0003JJ-U8; Thu, 10 Sep 2020 14:49:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsY-00037j-O0
 for linux-mtd@merlin.infradead.org; Thu, 10 Sep 2020 14:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Src/OqkjxQSdZ62Mh67bzsrUw3RijigPMK2ar4X7t2Y=; b=gWXdSvehOkowhVdpfH7VZCocig
 yCLRi9ERfOF5FIu+vkFBTfgi/Ds264r21uA1sYnnKRHsbndIIzWlUwXOIc/d8xLROAG94FPRv9U/l
 YdVHVVIZBRvmivfYFh2OvsuHWAr/CvB+AYT+L4hrsBozPgF0AywPU/qNWYgRO+fkYne9yR8LQKyCT
 p+OEsoCxOCl8CkYKajH+aXBU5tpDhlTvTSgfLixGvTKRUIArPswCyijGZpGPCOx2VPs6BW+dOmeV3
 jvB9tBZEnbfTmR8tXDOf9OBOPPhG2cIyBweSYO8w7sKGMPb24r1j2auUllYxH/o4jBG8JpoEFkcHa
 2eQjefKQ==;
Received: from [2001:4bb8:184:af1:3ecc:ac5b:136f:434a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGNsX-0006xO-0l; Thu, 10 Sep 2020 14:48:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/12] mm: use SWP_SYNCHRONOUS_IO more intelligently
Date: Thu, 10 Sep 2020 16:48:29 +0200
Message-Id: <20200910144833.742260-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910144833.742260-1-hch@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
is not set, as the device won't support it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/page_io.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index e485a6e8a6cddb..b199b87e0aa92b 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -403,15 +403,17 @@ int swap_readpage(struct page *page, bool synchronous)
 		goto out;
 	}
 
-	ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
-	if (!ret) {
-		if (trylock_page(page)) {
-			swap_slot_free_notify(page);
-			unlock_page(page);
-		}
+	if (sis->flags & SWP_SYNCHRONOUS_IO) {
+		ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
+		if (!ret) {
+			if (trylock_page(page)) {
+				swap_slot_free_notify(page);
+				unlock_page(page);
+			}
 
-		count_vm_event(PSWPIN);
-		goto out;
+			count_vm_event(PSWPIN);
+			goto out;
+		}
 	}
 
 	ret = 0;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
