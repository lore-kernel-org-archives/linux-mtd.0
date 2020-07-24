Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB03BC433F4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 07:35:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0349206F0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 07:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqSq995d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H9chBPz8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0349206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xFS9t0XHQt5oxujQcwAq3kXcagovfyYI4XrTCIp4v4=; b=iqSq995d1lXoHDnnwXqbljwye
	/ECSajxck/qWiyCEj0yoAaPj9xH2gVi8LUbjvbwVnXwxfouN1ROITIjhrURQxAiKcpp0rmP8RmqNZ
	gd1g+pSzVd8scabkxazO6/LrFXbMQzQ0WjApOq62B+WicJjfw4e4FCjFTngGQ0HXvmQIN1bAdChVO
	RYi6xJpFeddCSoez/Cd7LzK2GDWJ2hkjFWKzToInm2QFxnjrv182vIwRF1zhI1/uTBbPQ/LGERMCJ
	twB2fWG/wNx3yCG1pZJUqD8C8dKMpj3Cwuljf4V2+HX9J2CQvlNrPW2VxMMWJOY7K4maKZTU+p0NT
	/BOatbakA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysDr-0006rJ-UT; Fri, 24 Jul 2020 07:34:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysD8-0006UM-KA
 for linux-mtd@merlin.infradead.org; Fri, 24 Jul 2020 07:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=r6GVNDpJ00GIAfQlV8fGdOFlOngs4z7GOfztVZ4Wopg=; b=H9chBPz8VW3nrS8D/DH/sVlU/F
 qTE3kQJSkvGa29xlm3sAbuZDi82AskW2+7fjPxCRR3QbJ5YsVUt0Kj+m8PmTj83HPitCjtfgBFagh
 inT+4I3iJoCyCsHSTaIY4hPuGyKoQeZH4Fsyw/aa5PL9uBdYUAkMYnBp1k4e49Ul7v1pqEWn0UxsY
 XfablgUGRHFB9tB8aOnvgmsHzlderU2IxPDewd6CL5W8+uAmGEFj9vyCWe9GiPc0TNVvHCRXS+iuy
 Q2LFPaHq7JyKjuiOcqQ6wzIBvrK2CfwQ8vwUbz+CDh8leY7Wq2+X79x5o+SCC6EhkmwDHXTZLDR9y
 agi2Ht8Q==;
Received: from [2001:4bb8:18c:2acc:8dfe:be3c:592c:efc5] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysD6-0006Dz-GF; Fri, 24 Jul 2020 07:33:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/14] mm: use SWP_SYNCHRONOUS_IO more intelligently
Date: Fri, 24 Jul 2020 09:33:10 +0200
Message-Id: <20200724073313.138789-12-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724073313.138789-1-hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
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
index ccda7679008851..7eef3c84766abc 100644
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
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
