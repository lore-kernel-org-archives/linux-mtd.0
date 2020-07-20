Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC36C433F8
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 07:54:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F080922C7B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 07:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvoRv1Kt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YMIjYvYx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F080922C7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m3cMgbdiE6x5F8J7J7wXeko44LYwXIr6Ten8oIXGF5w=; b=dvoRv1Ktf+1Oh4EmOfaEjLcOk
	9vfzdiYLkcI4ZHhx/RxROXyJvY5clFUcqJV3jhqFQxp3sttfoLy0RcbFmMQixcKUMgwuNZx4J4Ofc
	UiRirCjU6vjHaHYiFH59+mQCmM5LSEI9BIMPUIgCBrnTZ5j23FmK19IxDI6XtIP8uGw7JEI5p6XPh
	/gDsjRUEuLkd/VFXvC5zwsl8+c+2QvzkyRANOEpexOTECIHTJG6g+r3k7iZqipw/upu1tXxVphIlG
	kPLZXrF9+IbEhgG9DaDs1eitv6AYvVrq58FUDDtqnufgMnziC9iUWJjsHN4VoRls2Q+jMhuaywBcR
	QIMPMm0MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxQc6-0006kz-Mh; Mon, 20 Jul 2020 07:53:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxQat-00061k-AP
 for linux-mtd@merlin.infradead.org; Mon, 20 Jul 2020 07:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+j5IsWDLKMxe2xsBmliuIyKvW71zFHxDs8w/dpzkLoA=; b=YMIjYvYxlX9QZcNO6KqQW1dhNf
 J+WCe3kNYALq/tyXvMtxhnNvLo11HJ0rvNd8qMenEqttHbXYq48Cq1062tWX/tm/nO0Gh/w0/gvsq
 qgDm5vxaCHJzQ3DVjM43Uu1fvbpJ/S7kl/ffc7MF+R8IZLFO4+2Hz1+LYWmKNgRYxfUyfnH/n7S30
 ENFDTVkcLsqZR8EyVoirLH8UpYTQ66LL6kAqiVT9nde3kkJWogGgSPg+pLbiUueXns72XIVkd8JQu
 sfYRJF6UwTPx+avFx1/ZBgf+/vckozGHVTxHE6vem5rwpVhvegVdfF1NZSiPg1RXFFvsSO7t1pFUr
 SW4NnsMg==;
Received: from [2001:4bb8:105:4a81:5185:88fc:94bb:f8bf] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxQao-000439-0V; Mon, 20 Jul 2020 07:52:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/14] mm: use SWP_SYNCHRONOUS_IO more intelligently
Date: Mon, 20 Jul 2020 09:51:45 +0200
Message-Id: <20200720075148.172156-12-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720075148.172156-1-hch@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
is not set, as the device won't support it.  Also there is no point in
trying a bio submission if bdev_read_page failed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/page_io.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index ccda7679008851..63b44b8221af0f 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -403,8 +403,11 @@ int swap_readpage(struct page *page, bool synchronous)
 		goto out;
 	}
 
-	ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
-	if (!ret) {
+	if (sis->flags & SWP_SYNCHRONOUS_IO) {
+		ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
+		if (ret)
+			goto out;
+
 		if (trylock_page(page)) {
 			swap_slot_free_notify(page);
 			unlock_page(page);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
