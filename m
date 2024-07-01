Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B1AC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPr72GvRO2fNEliDSJmu+omZZrzh+pfhK5T0Qf+pWN8=; b=TBCIqVsOPeHj2H
	rCaRGuxo5ngVONehX4JbytK247HCaZPHgFTUY/HYpYp2YeeVsYCVuHbyt3eK5vFk7JZsNTD3fVjro
	ntFg6D+MyLEjxm/eM6TBhNtXaqry/iR5B7iFSXC0H5k/9R5wkI0AjYQTeM5YRxXub2XxdLwuOOz9Y
	mzcqWRop613C2DObMRxwLsW188T15NUyz15Riyrvl3w2+xe/mBtnziFbxBlPKl5gLoeYZv2Htkku6
	uoTkZrM8SCdC1a7LEDxArQ9/Ip4mbPfPxqDm/O+R7q1xgZ6YPjGHiPBGTYx/Jfqey2w1RnXZABDh0
	Bg78FPYWHChR83iJJJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODZ7-00000002U0o-2ygN;
	Mon, 01 Jul 2024 09:43:17 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODZ4-00000002U0C-3LRr
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 09:43:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 843ADE0009;
	Mon,  1 Jul 2024 09:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719826989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ed3IOlft/9T9yxBUdqc3PoZwEw29DrpPjWIbyKJhKD8=;
	b=NTYPMw4YGZc0IJp6iNpS/5KF1KO9IK9sy96WhScM1rCDYnMmahEQpxwgfHxYfO6OF/ncL+
	jSS6nfeZCofeAR9ep6K4fz0YH06ocrzn7VUsZz6G5ZkI5kaRE5VMKiuu2/Qnl4SufMUvEI
	E5wLZUxECNhAPXHE5fb57XpkzlNByJOLxeJfNP2BpKrxGUdfrtAhEvo2tkVYAVqKAoLhG/
	bqAHUk9kfH+8qEfbAMSrmIcAJyJxQRDGrf1B/dhZts1YpXmxtWewLT4h5L0WG/fZuEEyei
	svXQQ4aODcIb6e+DpMVFM/vvdLgPlSgDeScZDjH3y1gAvty9kEPZSMCKZBf2gw==
Date: Mon, 1 Jul 2024 11:43:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: spinand: Support serial NAND for reading two
 bytes ID
Message-ID: <20240701114307.031005ce@xps-13>
In-Reply-To: <20240628085444.132714-2-linchengming884@gmail.com>
References: <20240628085444.132714-1-linchengming884@gmail.com>
	<20240628085444.132714-2-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_024315_141557_120F79A7 
X-CRM114-Status: GOOD (  12.52  )
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

SGksCgpsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgMjggSnVuIDIwMjQg
MTY6NTQ6NDMgKzA4MDA6Cgo+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhp
Yy5jb20udHc+Cj4gCj4gQWRkaW5nIHRoZSBEZXZpY2UgSUQgMiBvbiBNYWNyb25peCBTZXJpYWwg
Rmxhc2guCj4gCj4gV2hlbiB0aGUgbnVtYmVyIG9mIGZsYXNoZXMgaW5jcmVhc2VzLCB3ZSBuZWVk
IHRvIHV0aWxpemUKPiBEZXZpY2UgSUQgMiB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGRpZmZlcmVu
dCBmbGFzaGVzLgo+IAo+IFRoZXNlIGZsYXNoZXMgaGF2ZSBiZWVuIHZhbGlkYXRlZCBvbiBYaWxp
bnggenlucS1waWNvemVkCj4gYm9hcmQgd2hpY2ggaW5jbHVkZWQgTWFjcm9uaXggU1BJIEhvc3Qu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNv
bS50dz4KPiAtLS0KCi4uLgoKPiAgCVNQSU5BTkRfSU5GTygiTVgzNVVGMUdFNEFEIiwKPiAtCQkg
ICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHg5Niks
Cj4gKwkJICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVks
IDB4OTYsIDB4MDMpLAo+ICAJCSAgICAgTkFORF9NRU1PUkcoMSwgMjA0OCwgMTI4LCA2NCwgMTAy
NCwgMjAsIDEsIDEsIDEpLAo+ICAJCSAgICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwKPiAgCQkgICAg
IFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiBAQCAtMjg5
LDcgKzI4OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1hY3Jvbml4X3Nw
aW5hbmRfdGFibGVbXSA9IHsKPiAgCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFi
X29vYmxheW91dCwKPiAgCQkJCSAgICAgbXgzNWxmMWdlNGFiX2VjY19nZXRfc3RhdHVzKSksCj4g
IAlTUElOQU5EX0lORk8oIk1YMzVVRjFHRTRBQyIsCj4gLQkJICAgICBTUElOQU5EX0lEKFNQSU5B
TkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4OTIpLAo+ICsJCSAgICAgU1BJTkFORF9J
RChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweDkyLCAweDAxKSwKPiAgCQkg
ICAgIE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMTAyNCwgMjAsIDEsIDEsIDEpLAo+ICAJ
CSAgICAgTkFORF9FQ0NSRVEoNCwgNTEyKSwKPiAgCQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJ
QU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiBAQCAtMjk4LDcgKzI5Nyw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1hY3Jvbml4X3NwaW5hbmRfdGFibGVbXSA9IHsKPiAg
CQkgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPiAgCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgz
NWxmeGdlNGFiX29vYmxheW91dCwKPiAgCQkJCSAgICAgbXgzNWxmMWdlNGFiX2VjY19nZXRfc3Rh
dHVzKSksCj4gLQoKVGhpcyBpcyBzdHlsZSwgYW5kIGlmIHlvdSBjYXJlIHNob3VsZCBiZSBpbiBh
bm90aGVyIHBhdGNoLgoKPiAgCVNQSU5BTkRfSU5GTygiTVgzMUxGMkdFNEJDIiwKPiAgCQkgICAg
IFNQSU5BTkRfSUQoU1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHgyZSksCj4g
IAkJICAgICBOQU5EX01FTU9SRygxLCAyMDQ4LCA2NCwgNjQsIDIwNDgsIDQwLCAxLCAxLCAxKSwK
PiBAQCAtMzA5LDcgKzMwNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1h
Y3Jvbml4X3NwaW5hbmRfdGFibGVbXSA9IHsKPiAgCQkgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwK
PiAgCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxheW91dCwKPiAgCQkJ
CSAgICAgbXgzNWxmMWdlNGFiX2VjY19nZXRfc3RhdHVzKSksCj4gLQlTUElOQU5EX0lORk8oIk1Y
M1VGMkdFNEJDIiwKPiArCVNQSU5BTkRfSU5GTygiTVgzMVVGMkdFNEJDIiwKClRoaXMgaXMgYSBm
aXggdGhhdCBzaG91bGQgaGF2ZSB0aGUgcmlnaHQgdGFncyAoc3RhYmxlL2ZpeGVzKSBhbmQgYmUg
aW4KYW5vdGhlciBwYXRjaC4KCkFsc28sIG1heWJlIHlvdSB3YW50IHRoaXMgcGF0Y2ggY29udGVu
dCB0byBiZSBiYWNrcG9ydGVkLiBJZiBpdCdzIHRoZQpjYXNlLCBwbGVhc2UgYWRkIHRoZSBuZWNl
c3NhcnkgdGFncyBoZXJlIGFzIHdlbGwuCgo+ICAJCSAgICAgU1BJTkFORF9JRChTUElOQU5EX1JF
QURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweGFlKSwKPiAgCQkgICAgIE5BTkRfTUVNT1JHKDEs
IDIwNDgsIDY0LCA2NCwgMjA0OCwgNDAsIDEsIDEsIDEpLAo+ICAJCSAgICAgTkFORF9FQ0NSRVEo
OCwgNTEyKSwKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
