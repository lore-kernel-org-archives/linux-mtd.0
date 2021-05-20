Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932F1C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:37:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315AE61163
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 315AE61163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0SNLYR98RugL266GB3So14ViGpRsF9ht0Vw+3YHzhQ=; b=LJBp8tJPaJ1c0JGWZ2D9+FOZTK
	EAWWKeKFMG69WvfwkwEmXMluhAGvJAX40/AWT1PGd0hFdeFX3Db98BxurWjq7FrwhN7CcrCrzy5+A
	xrzZ4Gyppghui/Q4Tz0DiAaoMUznqOuVuCSJouyDl++AqjKnQUEFuNiU5/i6Aw363J7jxsOL4QKrE
	vynMPY7bVLkVtOWP6PWQs1LsSRlPFz3jJoiJDB8m0dOd8B3ajQxUK4wdO8vRFtEpEoKd3jHZek3l1
	Kw7LrMgO8hE2qP7WfdO20jItZZGIi7vRnpGOENms4ksmv6/Q0kVdY3dmm02P4G2lzFdRcqxPEC97B
	BRhTEdXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljkix-001j54-Ao; Thu, 20 May 2021 15:36:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljkiv-001j4Z-0F
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 15:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=yY4aLeH1WbY26qIe6MLGvW5dKx3WOJVDB9rY5kwm1nU=; b=wMcKFAiq06ztzRzBkQ2J5d2WQ6
 A8tCR8Rr1oP6zgZMMNbfKEgc+qiFHb3ulESszmlLve4gRNoK1tSvg10BWUdUCF7+1gvp/yTqIDcnC
 1ftkJ0l+nN6nx1v+iu0uASEfoo2YJMH5hb327DmuJ5XOLeSUY1wdroGZ04K2vROUD6/cqmrxP5AFn
 W2JOqLfGVBTN3f8IFehtWAjs1CvkgO1DJ/ujqfmua/Sdwfay+xZcHmBPg0jyUTsvy4m7Lx5GtvuSK
 tQrzy/gnbqtT6jYD2weid39PKz5Yg36WEL0GNkolk5QgtUHG3HhQLAjbV/BIZrneVFCsiH1UIkuVO
 hR8Wn80g==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljkin-00GTMy-Vr
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 15:36:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CD25460011;
 Thu, 20 May 2021 15:36:20 +0000 (UTC)
Date: Thu, 20 May 2021 17:36:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 R <vigneshr@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: partitions: redboot: fix style issues
Message-ID: <20210520173619.26870bc8@xps13>
In-Reply-To: <CACRpkda6ou1SJZzBwHXN_kWofnFw8w7XAkr7VcFO2NrqbQug_Q@mail.gmail.com>
References: <20210520114851.1274609-1-clabbe@baylibre.com>
 <20210520114851.1274609-2-clabbe@baylibre.com>
 <CACRpkda6ou1SJZzBwHXN_kWofnFw8w7XAkr7VcFO2NrqbQug_Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_083626_184927_30EF06E8 
X-CRM114-Status: UNSURE (   9.91  )
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

SGVsbG8sCgpMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlIG9u
IFRodSwgMjAgTWF5IDIwMjEKMTc6MjQ6MjYgKzAyMDA6Cgo+IE9uIFRodSwgTWF5IDIwLCAyMDIx
IGF0IDE6NDkgUE0gQ29yZW50aW4gTGFiYmUgPGNsYWJiZUBiYXlsaWJyZS5jb20+IHdyb3RlOgo+
IAo+ID4gVGhpcyBwYXRjaCBmaXhlcyBlYXN5IGNoZWNrcGF0Y2ggaXNzdWVzLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IENvcmVudGluIExhYmJlIDxjbGFiYmVAYmF5bGlicmUuY29tPiAgCj4gKC4u
LikKPiA+IC0gICAgdWludDMyX3QgICAgIGZsYXNoX2Jhc2U7ICAgIC8vIEFkZHJlc3Mgd2l0aGlu
IEZMQVNIIG9mIGltYWdlICAKPiAoLi4uKQo+ID4gKyAgICAgICB1MzIgICAgICAgZmxhc2hfYmFz
ZTsgICAgLy8gQWRkcmVzcyB3aXRoaW4gRkxBU0ggb2YgaW1hZ2UgIAo+IAo+IERvZXMgY2hlY2tw
YXRjaCBjb21wbGFpbiBhYm91dCB0aGlzPyBBdCBvbmUgcG9pbnQgdGhlIE1URCBtYWludGFpbmVy
Cj4gZGlzbGlrZWQgdGhlIHUzMi91MTYvdTggdHlwZXMgYW5kIGV4cGxpY2l0bHkgd2FudGVkIHRv
IHVzZSB0aGUgQwo+IHN0YW5kYXJkIGxpYnJhcnkgdHlwZXMsIGFuZCBpdCdzIHRoZSBraW5kIG9m
IGVjY2VudHJpYyBtYWludGFpbmVyCj4gZGV2aWF0aW9ucyB3ZSBhY2NvbW1vZGF0ZSBmb3IuCgpJ
IHN1cHBvc2UgdGhpcyBoYXBwZW5lZCBxdWl0ZSBzb21lIHRpbWUgYWdvPyA6KQoKSSd2ZSBuZXZl
ciBoZWFyZCBSaWNoYXJkIG5vciBCb3JpcyBjb21wbGFpbmluZyBhYm91dCBpdCwgbm9yIHdpbGwg
SS4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
