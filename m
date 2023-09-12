Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E607ACA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2i6Yr9opmzRjwgRvuzWCN1ZwGcOmtn9yuxAvgYf7vIQ=; b=jijYr+riKXzRXz
	/yRn3scXQjWr2usPlYj6VpwCtOdOQuBTrg/6NLbJzky1qSYHFZ7t9p6g7YIKF/V0Psuk0ooVQU/Z0
	b+ZiqizfgQVFER8E+4UJUEtNVr60HaSlD75kKDE+Qyf4XOnkXS8jjUuTkd6iwOejquqRkIm8JMe7z
	bmIJF3cn7roIgLyw1QKOSBi6D0K+XQufgyBuSK1XvdLoRykQSIADImqqQT9yopnkVFqVPWQcWyRUC
	PlSseBBm8dveINhfomUgIzKE2AFNzMmZG6USq/hEABfFXx+2gECf4C4ytNKa0pIIHEvXr+bKaKKX8
	+7dldkQP98agkAZNWbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0bZ-002xTR-2i;
	Tue, 12 Sep 2023 10:26:49 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0bW-002xSS-2s
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 10:26:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C19660007;
	Tue, 12 Sep 2023 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694514403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/O8MVT56+zUGcQzRzvIk5l2qYL/0RI/d40KXm58VTfc=;
	b=YV8nZp2bkWgjApjHU/fxeam8UdOwPYtwPQrOHDC/CjeTqVk80qjBb2xjc+vZ9ZTxZHo2PP
	WEB5g8JZo7LAl81+K5cKMhRLArv5hTzIhVsW/qQDmqNLK1Qvm3WTJyqjZgQfPMw/9ngVQh
	MJj2EXbIGnEoZzrQ6d83OMQXpYB/C3YmjOKtrBtKFTEHg6X93KlZoV3L1qW15PhAp7kuW5
	eQNYSdEzM/oHXuZlKf2gTYvP9eNF8CDYsPZi1DsUSnCGMe9NC3xS+S2x6COewIhm7tf1iW
	iX9pya5BNojLoteQuPfZyF6YS9dsfbboT5xUmtIFERNKkgYyB3+qRnQbw91Weg==
Date: Tue, 12 Sep 2023 12:26:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
 <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>,
 <quic_pkondeti@quicinc.com>
Subject: Re: [PATCH v3] mtd: rawnand: qcom: unmap dma address during probe
 failure
Message-ID: <20230912122640.1ed25673@xps-13>
In-Reply-To: <20230912101814.7748-1-quic_bibekkum@quicinc.com>
References: <20230912101814.7748-1-quic_bibekkum@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_032647_092970_5332E781 
X-CRM114-Status: GOOD (  16.61  )
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

SGkgQmliZWssCgpxdWljX2JpYmVra3VtQHF1aWNpbmMuY29tIHdyb3RlIG9uIFR1ZSwgMTIgU2Vw
IDIwMjMgMTU6NDg6MTQgKzA1MzA6CgpUaXRsZTogcy9kdXJpbmcvdXBvbi8/Cgo+IEZpeCBhZGRy
ZXNzIGFyZ3VtZW50IG9mIG5hbmQgY29udHJvbGxlciBjdXJyZW50bHkgYmVpbmcKPiBwYXNzZWQg
dG8gZG1hX3VubWFwX3Jlc291cmNlKCkgaW4gcHJvYmUgZXJyb3IgcGF0aC4KCldoYXQgYWJvdXQ6
CgoJVW5tYXAgdGhlIHJpZ2h0IHJlc291cmNlIHVwb24gcHJvYmUgZmFpbHVyZTogd2UgY3VycmVu
dGx5Cglwcm92aWRlIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBETUEgcmVnaW9uIHJhdGhl
ciB0aGFuIHRoZQoJb3V0cHV0IG9mIGRtYV9tYXBfcmVzb3VyY2UoKSB3aGljaCBpcyBvYnZpb3Vz
bHkgd3JvbmcuCgo+IFRoaXMgYWRkcmVzcyBhcmd1bWVudCBzaG91bGQgYmUgdGhlIGRtYSBhZGRy
ZXNzIHJldHVybmVkIGJ5Cj4gZG1hX21hcF9yZXNvdXJjZSgpIGluc3RlYWQgb2YgdGhlIHBoeXNp
Y2FsIGFkZHJlc3Mgb2YgbmFuZCBjb250cm9sbGVyLgo+Cj4gCj4gRml4ZXM6IDczMzBmYzUwNWFm
NCAoIm10ZDogcmF3bmFuZDogcWNvbTogc3RvcCB1c2luZyBwaHlzX3RvX2RtYSgpIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWJlayBLdW1hciBQYXRybyA8cXVpY19iaWJla2t1bUBxdWljaW5jLmNvbT4K
PiAtLS0KPiB2MzogSW5jb3Jwb3JhdGVkIGNvbW1lbnRzIGZyb20gTWlxdWVsCj4gICAgIC0gTW9k
aWZpZWQgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCB0aXRsZSBhcyBwZXIgc3VnZ2VzdGlvbnMuCj4g
Cj4gdjI6IEluY29ycG9yYXRlZCBjb21tZW50cyBmcm9tIFBhdmFuL01hbmkuCj4gICAgIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkxMTEzMzAyNi4yOTg2OC0xLXF1aWNfYmliZWtr
dW1AcXVpY2luYy5jb20vCj4gCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIz
MDkwNzA5Mjg1NC4xMTQwOC0xLXF1aWNfYmliZWtrdW1AcXVpY2luYy5jb20vCj4gCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
Ywo+IGluZGV4IDY0NDk5YzFiMzYwMy4uYjA3OTYwNWM4NGQzIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3Fjb21fbmFuZGMuYwo+IEBAIC0zNDQ0LDcgKzM0NDQsNyBAQCBzdGF0aWMgaW50IHFjb21fbmFu
ZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgZXJyX2Fvbl9jbGs6Cj4g
IAljbGtfZGlzYWJsZV91bnByZXBhcmUobmFuZGMtPmNvcmVfY2xrKTsKPiAgZXJyX2NvcmVfY2xr
Ogo+IC0JZG1hX3VubWFwX3Jlc291cmNlKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShy
ZXMpLAo+ICsJZG1hX3VubWFwX3Jlc291cmNlKGRldiwgbmFuZGMtPmJhc2VfZG1hLCByZXNvdXJj
ZV9zaXplKHJlcyksCj4gIAkJCSAgIERNQV9CSURJUkVDVElPTkFMLCAwKTsKPiAgCXJldHVybiBy
ZXQ7Cj4gIH0KPiAtLQo+IDIuMTcuMQo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
