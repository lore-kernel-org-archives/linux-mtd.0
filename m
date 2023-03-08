Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA6CC64EC4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBpqkEN0k6qmVZTF0xzOUVerLTpuAEQi6WSSNYEX58U=; b=zLMxjKZHWl82p8
	ojdBAxJ2EJkIQh3jpZab0g2E0fZl3zM8Qw4TlKMjloIAtmSLEvHGtidoVyY8nHGjHWlT6IdTovbj8
	BVzFEyNVhbYVfVXvMqNiTk6ZJMgSgPrcATssLsKyBjqmoByOQ9xv+TTuruLwtqvtziWJybxKRxrZA
	2CaF363xdXV9sp8ai37EZvh2XRswosA0VxtgNhGmIfakUQBYq6vzo8PQut7RpQLkLTHJZFrkyyiaI
	IYDp52PT2Y870Rl5StdzredDIeS18X+nK/J3SPxJeC5eAA2mt56H7balg+06K5BYJ/dWanmNUlAqj
	BKnumtAywrwMDAn8cQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvsG-005jp7-TD; Wed, 08 Mar 2023 15:38:40 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvsD-005jn0-Dv
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 15:38:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EF49CFF803;
	Wed,  8 Mar 2023 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678289912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l913uafvjIzrV9RPL1yW1T4WM9CtbSKoqVRWL5aPqxI=;
	b=eAU38nbFYYg0feoZl95DIuCidRcU0K7q4hPAzRPU9yB74FYg8AVVmqXDmsO2ip722Sng7d
	JpMyQkJ4FbVvE7vAoAEe2AT+uHA21nbsVKTbEg5H5pfE/E4LMPQ4pOqOxSULN5AdWDNc2e
	vqeLl+iHd3toXimETPyxPW7Bm5Y8063/LiluAVOMnqXiuuoSjK8cHnPlgpcUDFNVBfKtB+
	1JsK3K0VoFeCa/oNR1Jhhunp0Mi5N1V7Q4WpmU8sBWqsJzjk9oSVZURKQAKe76ZoDCwTwt
	BYEbgrIMb4qd4qh12Ho8g1DgSZpFB5g+xyoLIXeR3fllK5M/Cp6yZmhC1PQT9Q==
Date: Wed, 8 Mar 2023 16:38:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hector Palacios <hector.palacios@digi.com>
Cc: herve.codina@bootlin.com, linux-mtd@lists.infradead.org,
 sashal@kernel.org
Subject: Re: [PATCH v4] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Message-ID: <20230308163830.55bb3378@xps-13>
In-Reply-To: <20230308142926.334787-1-hector.palacios@digi.com>
References: <20230308142926.334787-1-hector.palacios@digi.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_073837_641969_096741D3 
X-CRM114-Status: GOOD (  22.01  )
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

SGkgSGVjdG9yLAoKaGVjdG9yLnBhbGFjaW9zQGRpZ2kuY29tIHdyb3RlIG9uIFdlZCwgIDggTWFy
IDIwMjMgMTU6Mjk6MjYgKzAxMDA6Cgo+IEFjY29yZGluZyB0byB0aGUgT05GSSBzcGVjaWZpY2F0
aW9uLCBiaXQgMCBvZiAnU0RSIHRpbWluZyBtb2RlIHN1cHBvcnQnCj4gKGJ5dGVzIDEyOS0xMzAp
ICJzaGFsbCBiZSAxIi4gVGhhdCBtZWFucyB0aGUgTkFORCBzdXBwb3J0cyBhdCBsZWFzdAo+IHRp
bWluZyBtb2RlIDAuCj4gCj4gTkFORCBjaGlwIEh5bml4IEgyN1U0RzhGMkdEQS1CSSAoYXQgbGVh
c3QpIGlzIHJlYWRpbmcgYSAwIG9uIHRoaXMgZmllbGQKPiB3aGljaCBtYWtlcyBuYW5kX2Nob29z
ZV9iZXN0X3Nkcl90aW1pbmdzKCkgcmV0dXJuIHdpdGggZXJyb3IgYW5kIHRoZQo+IHByb2JlIGZ1
bmN0aW9uIHRvIGV2ZW50dWFsbHkgZmFpbC4KPiAKPiBHaXZlbiB0aGF0IHNkcl90aW1pbmdfbW9k
ZXMgYml0IDAgbXVzdCBiZSAxIGJ5IHNwZWNpZmljYXRpb24sIGZvcmNlCj4gaXQgaW4gY2FzZSB0
aGUgTkFORCByZXBvcnRzIGl0IGlzIG5vdCBzZXQuIFRoaXMgaXMgYSBzYWZlIGFzc3VtcHRpb24K
PiBiZWNhdXNlIHRoZSBtb2RlIDAgaXMgdGhlIG1pbmltdW0gKHNhZmVyKSBzZXQgb2YgdGltaW5n
cyB0aGF0IHRoZQo+IE5BTkQgY2FuIHdvcmsgd2l0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWN0
b3IgUGFsYWNpb3MgPGhlY3Rvci5wYWxhY2lvc0BkaWdpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDIyMzE2NTEwNC41MjU4NTItMS1oZWN0b3Iu
cGFsYWNpb3NAZGlnaS5jb20KPiAtLS0KPiB2NDoKPiAgIEZpeCBiaXR3aXNlIG9wZXJhdGlvbiBv
biBfX2xlMTYgdHlwZSwgcGVyIHNwYXJzZSB3YXJuaW5nLgoKU29ycnkgSSBoYWQgbm8gdGltZSB0
byBhbnN3ZXIgeW91ciBxdWVzdGlvbiwgc2VlIGJlbG93LgoKPiB2MzoKPiAgIEZvcmNpYmx5IHNl
dCBiaXQgMC4KPiB2MjoKPiAgIE1vdmUgcGF0Y2ggdG8gSHluaXggc3BlY2lmaWMgZml4dXAgaG9v
ay4KPiAgIFVzZSBCSVQoMCkgbWFjcm8uCj4gdjE6Cj4gICBJbXBsZW1lbnQgZ2VuZXJpYyBwYXRj
aCBpbiBuYW5kX2Jhc2UuYy4KPiAKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5p
eC5jIHwgMTMgKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2h5bml4LmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2h5bml4LmMKPiBpbmRleCAwZDRkNGJiZmRlY2UuLmMx
N2NjYTMxNjE0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2h5bml4
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2h5bml4LmMKPiBAQCAtNzI4LDgg
KzcyOCwyMSBAQCBzdGF0aWMgaW50IGh5bml4X25hbmRfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwKQo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgaHluaXhfZml4dXBf
b25maV9wYXJhbV9wYWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gKwkJCQkJc3RydWN0IG5h
bmRfb25maV9wYXJhbXMgKnApCj4gK3sKPiArCS8qCj4gKwkgKiBDZXJ0YWluIGNoaXBzIG1pZ2h0
IHJlcG9ydCBhIDAgb24gc2RyX3RpbWluZ19tb2RlIGZpZWxkCj4gKwkgKiAoYnl0ZXMgMTI5LTEz
MCkuIFRoaXMgaGFzIGJlZW4gc2VlbiBvbiBIMjdVNEc4RjJHREEtQkkuCj4gKwkgKiBBY2NvcmRp
bmcgdG8gT05GSSBzcGVjaWZpY2F0aW9uLCBiaXQgMCBvZiB0aGlzIGZpZWxkICJzaGFsbCBiZSAx
Ii4KPiArCSAqIEZvcmNpYmx5IHNldCB0aGlzIGJpdC4KPiArCSAqLwo+ICsJcC0+c2RyX3RpbWlu
Z19tb2RlcyA9IGNwdV90b19sZTE2KGxlMTZfdG9fY3B1KHAtPnNkcl90aW1pbmdfbW9kZXMpIHwg
QklUKDApKTsKCldoeSBub3QganVzdDoKCglwLT5zZHJfdGltaW5nX21vZGVzIHw9IGNwdV90b19s
ZTE2KEJJVCgwKSk7Cgo/Cgo+ICt9Cj4gKwo+ICBjb25zdCBzdHJ1Y3QgbmFuZF9tYW51ZmFjdHVy
ZXJfb3BzIGh5bml4X25hbmRfbWFudWZfb3BzID0gewo+ICAJLmRldGVjdCA9IGh5bml4X25hbmRf
ZGVjb2RlX2lkLAo+ICAJLmluaXQgPSBoeW5peF9uYW5kX2luaXQsCj4gIAkuY2xlYW51cCA9IGh5
bml4X25hbmRfY2xlYW51cCwKPiArCS5maXh1cF9vbmZpX3BhcmFtX3BhZ2UgPSBoeW5peF9maXh1
cF9vbmZpX3BhcmFtX3BhZ2UsCj4gIH07CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
