Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15006C5B56A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlj/Ll19SCbzzsw+O2/8ar4Xp0mGFuIbETxfwblxcRU=; b=aaCAqMd3ILldTw
	GIbBgPWDCkDGY9ZViImMkhcOxvPURfADVP45JJD1bCa/Ait0Jo0XHXGHTScjXjFYf21wC+umHd9ln
	58SXEzT+C8IQTArTu0SZciZ/tcgk+NmyNANgHLWp4T61fdEZM/a1dyCR5gj1IxWPeBZ3650kqh+/3
	LOcoeWmW7v+hdkvZkjpMsaMr9QHBZiQV33P72Dnvbz+56qJ7MvnqN0ywmbI8bWKSJa2IaWgQZiEUU
	0p4cRaF3D3ojS7a7Fspjdk4gmfWpLy/yv3CClWomg5ejQ+pQEDbx8V8RDvAsYlg4TJHyXvT4OgPoJ
	sahBt5MlE9+mgbaeWEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3VS-0000000Fapm-0JQj;
	Wed, 12 Aug 2026 07:36:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3VM-0000000Fap9-2Pg8
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 07:36:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B04711A15AD;
	Wed, 12 Aug 2026 07:36:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73FEE6045E;
	Wed, 12 Aug 2026 07:36:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFAA711C4C8BF;
	Wed, 12 Aug 2026 09:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786520157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=07w+X04eUhkjo+QBysxqoSQSUW0VZbZwPkMRgPiC9PY=;
	b=LVuHnq4m9ztXW6oAD/oX1fHFEGC2BT2qUmFfdwMB7ylNsztaODtO5yezBvQQFmJVr/QtZg
	EVRjpYnuwql+uCSiXLvdoVdlY68G87eUQYWqNUq2/hYfNg381KpmvkktI4Uq+jdDa/F6sF
	ci4/kiy053HpMMjat/4vk8seERAz8ynEEZ3/ffvylzvvw3MkSCXgd00lfs852xDItAsZ4O
	GDDt9MZjM5n0jF0Bf230WsnhLpktIKDYRIM0xuSyspScfpj5ieA4wLPDc7oKw09CYQwDu0
	xPIXpRLj1UNN9te2ez7qhz5/hXlegqACqb5mk+2qxQfrjvlHiz/kVMjxpCGW9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Md Sadre Alam
 <md.alam@oss.qualcomm.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Daisuke
 Mizobuchi <mizo@atmark-techno.com>
Subject: Re: [PATCH RFC v2] mtd: spinand: winbond: add support for W25N04LW
In-Reply-To: <anv-3hSRMVgJAsOt@atmark-techno.com> (Dominique Martinet's
	message of "Wed, 12 Aug 2026 14:04:30 +0900")
References: <20260812-w25n04lw-v2-1-deee97602fc4@atmark-techno.com>
	<anv-3hSRMVgJAsOt@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 12 Aug 2026 09:35:55 +0200
Message-ID: <87tsozn63o.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_003605_000274_F0DC1289 
X-CRM114-Status: UNSURE (   8.24  )
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

T24gMTIvMDgvMjAyNiBhdCAxNDowNDozMCArMDksIERvbWluaXF1ZSBNYXJ0aW5ldCA8ZG9taW5p
cXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29tPiB3cm90ZToKCj4gRG9taW5pcXVlIE1hcnRp
bmV0IHdyb3RlIG9uIFdlZCwgQXVnIDEyLCAyMDI2IGF0IDA0OjE0OjAyQU0gKzAwMDA6Cj4+ICsJ
Ly8gdGhlIFcyNU4wNExXIGNoaXAgYWN0dWFsbHkgaGFzIHR3byBmcmVlIHJhbmdlcyBwZXIgc2Vj
dGlvbjoKPj4gKwkvLyAiVXNlciBEYXRhIEkiIGF0ICgxNiAqIHNlY3Rpb24pICsgNCwgbGVuZ3Ro
IDEyCj4+ICsJLy8gIlVzZXIgRGF0YSBJSSIgYXQgKDE2ICogc2VjdGlvbikgKyAyLCBsZW5ndGgg
Mgo+PiArCS8vIFRoZSBsYXRlciBpcyBub3QgRUNDIHByb3RlY3RlZCBzbyB0aGlzIG9ubHkgcmV0
dXJucyBVc2VyIERhdGEgSQo+Cj4gKHdpbGwgZml4IHRvIHVzZSBibG9jayBjb21tZW50IGxpa2Ug
dGhlIHJlc3Qgb2YgdGhlIGZpbGUgKyBsYXR0ZXIgdHlwbwo+IGFzIHBlciBTYXNoaWtvIGNvbW1l
bnQgaW4gdjMsIGFmdGVyIHdlJ3ZlIHJlYWNoZWQgYW4gYWdyZWVtZW50IG9uIHdoYXQKPiB0byBk
byBoZXJlIC0tIHRoZXJlIHdlcmUgbm8gb3RoZXIgU2FzaGlrbyBjb21tZW50KQoKSSBoYXZlbid0
IGNoZWNrZWQgdGhlIGRpZmYgeWV0LCBidXQgdGhlIGNvbW1pdCBtZXNzYWdlIGNvbnRhaW5zIGEg
U29CCmZyb20gYW50aGVyIHBlcnNvbiB3aGljaCBpcyBsaXN0ZWQgZmlyc3QuIFlvdSBtdXN0IGJl
IEF1dGhvciArIGZpcnN0IFNvQiBvcgp5b3UgY2FuIGdpdmUgc29tZW9uZSBlbHNlIGF1dGhvcnNo
aXAgKyBmaXJzdCBTb0IgYW5kIHRha2UgMm5kIFNvQiAod2hpY2gKbWVhbnMgeW91IGNhcnJpZWQg
dGhlIHBhdGNoIHdpdGhvdXQgY2hhbmdpbmcgaXQpLiBJZiB5b3Ugd2FudCB0byBjcmVkaXQKYW5v
dGhlciBwZXJzb24sIHBsZWFzZSBoYXZlIGEgbG9vayBhdCB0aGUgQ28tZGV2ZWxvcGVkLWJ5IHdv
cmRpbmcuCgpUaGFua3MhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
