Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24BDC79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMwZp+XX2TrefMJk3KXH2BPIILhdXUKcuYq8m0NA+FQ=; b=tDOnhiWZKRiJpQ
	Qmcpj+8IFae4bWLv75CM9hc9Me3tABqt3xvbVd5Ic6td9kzH4aVF+Um3OJSRe0DY3FP4ZpJHVNRxR
	LwzLAEBn0zt4xdXQyv4MNLYRmmuJNM9hwO6IiUl9XRC3W0kOUi0xD+rrFkwGDQmqU9uJ6TQqrPBq1
	fb1EvEFiyPhWr6o4NDkFTnxIcCE5OSBFaatZonkNms8EoMryXCLmhOyg0Vh9dujyhbciDEujO73I1
	20x0ggK/duHRmtdiYvUhraY7ngrMKYyt848NfuxF08Rtc68qNDadP7rZ0IcUzkqm3QTToz9WR7UN6
	COPT9SFNPU4in8yEm7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLW-00000002yjz-1lPR;
	Fri, 04 Sep 2026 18:09:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLT-00000002yiN-3xDS
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4BDB64E41521;
	Fri,  4 Sep 2026 18:08:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EEC56057F;
	Fri,  4 Sep 2026 18:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37A6E11C79351;
	Fri,  4 Sep 2026 20:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j4WYsjf4Cy8Z2k9MMlIQzTyq2kSGri14XOQgwZrKrZQ=;
	b=WcUwz29W6GBQfVv1sKpHBxJ3tIIHdMpjyltzwMqM7E8uo+QSIjaKSVTxOqCyKAM6qzpthV
	L8oyzWLYxBvTKwOvUJeshQAw+X4dQP+eMXsqcZCjFIlyIBBCXnlA54p+hfqwpLoMat9jnP
	LGecT8NXpUECswH5BOFFZOLV9Y4b3ilzMfCIeUaQMnZQ26xgla33q0Tw5n8qxtCIttmDdB
	WgragRpleqjk3jUFB3crEdEOf0wOqDY8xCB1+T11/pueVo2kH3lpCc4ItuuIHx5AGiSqMd
	H3Inx0tkWmdzzq6looMXuks+zAUfE1dtAfbBS8Qn3+5ugy8XCzI/lJRnNf3tuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260812103728.39291-1-phucduc.bui@gmail.com>
References: <20260812103728.39291-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Propagate errors from optional
 IRQ lookup
Message-Id: <178854533214.1533016.12286448974222706234.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:08:52 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110900_125052_AF428674 
X-CRM114-Status: UNSURE (   9.48  )
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

T24gV2VkLCAxMiBBdWcgMjAyNiAxNzozNzoyOCArMDcwMCwgcGh1Y2R1Yy5idWlAZ21haWwuY29t
IHdyb3RlOgo+IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKSByZXR1cm5zIGEgcG9zaXRpdmUg
SVJRIG51bWJlciBvbiBzdWNjZXNzIG9yCj4gYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1
cmUuIEZvciBhbiBvcHRpb25hbCBJUlEsIC1FTlhJTyBpbmRpY2F0ZXMKPiB0aGF0IG5vIG9wdGlv
bmFsIElSUSBpcyBhdmFpbGFibGUsIGluIHdoaWNoIGNhc2UgdGhlIGRyaXZlciBmYWxscyBiYWNr
Cj4gdG8gdXNpbmcgdGhlIGN0bHJkeSBJUlEuIE90aGVyIGVycm9ycyBzaG91bGQgYmUgcHJvcGFn
YXRlZCBzbyB0aGF0IHRoZQo+IGNhbGxlciBjYW4gaGFuZGxlIHRoZW0gYXBwcm9wcmlhdGVseS4K
PiAKPiBUcmVhdCAtRU5YSU8gYXMgdGhlIG9ubHkgY2FzZSB3aGVyZSB0aGUgZHJpdmVyIGZhbGxz
IGJhY2sgdG8gdGhlIGN0bHJkeQo+IElSUSwgYW5kIHByb3BhZ2F0ZSBhbGwgb3RoZXIgZXJyb3Jz
IHJldHVybmVkIGJ5Cj4gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpLgo+IAo+IFsuLi5dCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBicmNtbmFu
ZDogUHJvcGFnYXRlIGVycm9ycyBmcm9tIG9wdGlvbmFsIElSUSBsb29rdXAKICAgICAgY29tbWl0
OiBjOWUyMGUyMTNiYjA1MWQwMjcxMTE1NWRlMGRjNDc1OWRlMmZhZGRmCgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
