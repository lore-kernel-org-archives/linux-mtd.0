Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D12C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l0LOiJrk30dUOMRkwe9rxbls8uFAb75cKk+Z69aTLow=; b=gQiI7AfNZU7nwd4XR+9l7rRpcn
	aCXlkMcYR6xJlOjAR8bZn6vA9OD1M0Y3uDNpH2O1hlsarXzqdAR2on9THFuD9tVSBF/A7sVePzGm7
	mB//YeWPxvMHk9jUeL3y1Og0QC9To/foKIOhB3wKlaImI4tBLzX6J2aaCmKzKy6jXyPZRLsctsSoJ
	5/d7yE3vS3Jo5jI5vOl/Pr9UYJ6rwkk7Fi2ud9aqXsEIZOrkdMaWYcaSeUf8aFoooDvRUASqpvXiK
	enuMP0ekrH7UyOSjGotdYIVAKwFycCeZC3ZVQXuA+JOZDxuHeopx6siCC5ph/VG0MlWmkC9PoVORV
	QaERp/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDTv-008v0r-OX; Thu, 10 Nov 2022 19:44:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDTr-008uwb-Lo
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 19:44:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5757261B8B4D;
	Thu, 10 Nov 2022 20:44:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id nGPtvOKwhp3V; Thu, 10 Nov 2022 20:44:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0B4A66226249;
	Thu, 10 Nov 2022 20:44:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yQrYoj6s4SOb; Thu, 10 Nov 2022 20:44:53 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id DC57B61B8B4D;
	Thu, 10 Nov 2022 20:44:53 +0100 (CET)
Date: Thu, 10 Nov 2022 20:44:53 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>, 
	linux-block <linux-block@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-efi <linux-efi@vger.kernel.org>
Message-ID: <1691046252.219046.1668109493753.JavaMail.zimbra@nod.at>
In-Reply-To: <Y2rgbfpYfpbLKHaf@makrotopia.org>
References: <Y2rgbfpYfpbLKHaf@makrotopia.org>
Subject: Re: [PATCH v4 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd_blkdevs: add option to enable scanning for partitions
Thread-Index: qesM6z2xTDVbTIYuNhENmoux2tHhiA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_114455_926379_1FDF4FF6 
X-CRM114-Status: UNSURE (   4.63  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiArCj4gKwkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19NVERf
QkxPQ0tfUEFSVElUSU9OUykgfHwgbXRkX3R5cGVfaXNfbmFuZChuZXctPm10ZCkpCj4gKwkJCWdk
LT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwoKSSBrbm93IHRoYXQgTkFORCBzaG91bGQgbm90
IGdldCB1c2VkIHdpdGggbXRkYmxvY2sgYmVjYXVzZSBsYWNrIG9mIHdlYXJsZXZlbGluZyBhbmQK
aW4gZ2VuZXJhbCB0b28gbWFueSB3cml0ZXMuIEJ1dCB3aGF0IGV4YWN0bHkgaXMgdGhlIHJhdGlv
bmFsZSB0byBkZW55IHBhcnQgc2Nhbm5pbmcgZm9yIE5BTkQ/CgpUaGFua3MsCi8vcmljaGFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
