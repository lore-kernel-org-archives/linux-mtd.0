Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE684C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FlOFBwf2j0H39gpJ6JKj2ein1+0f8AcjHAHT7huU+6g=; b=v6DLT7VmIzIIZK3QRdSeu2RYn7
	QQzJIP9IMcA1d29eSTkcpQ9qTZVJptVYQB+Lpoel6N2Qwxm4zwCy2N+9OTlyvU4XOpM3qjepD20HA
	vlm55qU/L93r97NNQhgnXncIp897MPafgKTT8LgJcqxjxrRHC9ub24XVTexy/k1zPB2cN3C0C5oAI
	5iKOdYhMzcXP0tIuHyFEHYp72bHjYRTCR9LqdUFBUBUH4EFinhXOaFhlYbGyyo/huBitr5VSf6wRV
	iIpUdSgm0rhO04egE6yaunxguKaTE811BycqhfmwLTYFZ+ZQfIkuMM8tiI0+InjYHatlotiUPMtfM
	63g95ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDRy-008tgs-EX; Thu, 10 Nov 2022 19:42:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDRu-008tRJ-WC
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 19:42:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F075A63CDC5B;
	Thu, 10 Nov 2022 20:42:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 7_oQ7gzt2uLp; Thu, 10 Nov 2022 20:42:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1B59C6226242;
	Thu, 10 Nov 2022 20:42:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BVEGG__kuGf2; Thu, 10 Nov 2022 20:42:41 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id EE3BE63CDC5B;
	Thu, 10 Nov 2022 20:42:40 +0100 (CET)
Date: Thu, 10 Nov 2022 20:42:40 +0100 (CET)
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
	linux-mtd <linux-mtd@lists.infradead.org>, linux-efi@vger.kernel.org
Message-ID: <2114450579.219028.1668109360889.JavaMail.zimbra@nod.at>
In-Reply-To: <Y2rgg6h22N6PfKNM@makrotopia.org>
References: <Y2rgg6h22N6PfKNM@makrotopia.org>
Subject: Re: [PATCH v4 5/5] mtd: ubi: block: add option to enable scanning
 for partitions
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: add option to enable scanning for partitions
Thread-Index: xBTGe2VDlmMZly/EXlIh1C18tKLhCw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_114255_228074_F5E94E14 
X-CRM114-Status: UNSURE (   4.50  )
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

RGFuaWVsLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBH
b2xsZSIgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPgo+IEFkZCBLY29uZmlnIG9wdGlvbiBDT05G
SUdfTVREX1VCSV9CTE9DS19QQVJUSVRJT05TIGFuZCBlbmFibGUgYmxvY2sKPiBwYXJ0aXRpb24g
cGFyc2VycyBvbiB1YmlibG9jayBkZXZpY2VzIGluIGNhc2UgaXQgaXMgc2VsZWN0ZWQuCgpJIHRo
aW5rIHdlIHNob3VsZCBzdGljayB3aXRoIG9uZSBLY29uZmlnIGF0IG1vc3QuCk5vdCBib3RoIENP
TkZJR19NVERfVUJJX0JMT0NLX1BBUlRJVElPTlMgYW5kIENPTkZJR19NVERfQkxPQ0tfUEFSVElU
SU9OLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
