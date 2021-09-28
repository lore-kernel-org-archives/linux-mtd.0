Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF4FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 09:10:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE81860FC2
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 09:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE81860FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yZQ7ZKG1z9PlYlh+K9mqUzY0IfLP5BXoJQu9VXldaY=; b=InLIURoK6fxdNv
	YDrfDGlWxhhgE3IzL8TSdGp6DD0TpS/8I7058aL9U5TRNQR16Gt2XjI1Ie/cQ2e2IBzM30/KghQVG
	NqHG0vS3qDCmHa+ITsldjBgH3LQKcJCrkhx9rVKpQ8o9JdoOaJtP/dwub/oSh2kAN1drRx6YWeFhm
	zQG/+BCfTusA9nup4N8G77EpQgZmHpvr5G/SVXqWtkcdjsc+ZLawbYcnFeRgRoxxIb4xZakAC+3HE
	xNRjh5qlsqQPs5kDg99nXYaMb+073/wKo4rxn64uZVhYXhHUagQOt+3S3SoN9WabXhUSdXOim0jFX
	v57jXsVHkOwgVvkMvcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV97G-006Tf4-8b; Tue, 28 Sep 2021 09:09:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV8pw-006LnZ-Nf
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 08:51:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2D63E2000A;
 Tue, 28 Sep 2021 08:51:34 +0000 (UTC)
Date: Tue, 28 Sep 2021 10:51:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/5] mtd_blkdevs: remove the sector out of range check
 in do_blktrans_request
Message-ID: <20210928105133.606b6eed@xps13>
In-Reply-To: <20210928052211.112801-2-hch@lst.de>
References: <20210928052211.112801-1-hch@lst.de>
 <20210928052211.112801-2-hch@lst.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_015140_951343_BEB372C7 
X-CRM114-Status: GOOD (  10.47  )
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

SGkgQ2hyaXN0b3BoLAoKaGNoQGxzdC5kZSB3cm90ZSBvbiBUdWUsIDI4IFNlcCAyMDIxIDA3OjIy
OjA3ICswMjAwOgoKPiBUaGUgYmxvY2sgbGF5ZXIgYWxyZWFkeSBwZXJmb3JtcyB0aGlzIGNoZWNr
LCBubyBuZWVkIHRvIGR1cGxpY2F0ZSBpdCBpbgo+IHRoZSBkcml2ZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpSZXZpZXdlZC1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
