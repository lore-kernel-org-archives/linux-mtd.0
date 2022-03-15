Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C26C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PG6PRET0UKp4AbuRi1Tg8SSvCevGE5MeZXJdSYZpPOQ=; b=Ll9HCudk8XI3vD
	nXKN1rC8Hk0kQObqYGYFtxoswZZYeSircgSGhpdxZ+txNlBUbSRznN8ZwyIbmy/W9wcROMSz/jTPa
	ObXsl3FK8JMunDLxJ0x+b3NjA6xIL2mTsWvn2L7xhkzQv4QNvpThgamyHg5qAcZNbWwBqA3M6AuV6
	p6l/hhGfJEz7RLkBCNS38atZzt431us0ImYRzCQEELk9BSxwyAlKHANCb6Auo3rM/AEU1XDQ7bRmE
	abTh3729MzZGeCyW0hpUEQWyjjnIup7qRsy4pqhpLDlPKdRYFwCWSKQmO9+toIBmDcZobZftpCgo+
	BxWxNGvccDz4tzuZtiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUCGp-00AMBn-2e; Tue, 15 Mar 2022 18:51:47 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUCGl-00AMA9-Mx
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 18:51:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5CEB100003;
 Tue, 15 Mar 2022 18:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647370300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtIJ/RT9AyMm2r6Q6e8jZJ4WZp0suD6YNlNWzDzCarw=;
 b=WJ756feOVINa7LY3fsskeGvcAHj1xeB3HxgbrRLBh0R6GMXuiQbB38iwaPzVdkp6r6xnvX
 cO8UxVpSBdHIIgImZEkGFsUC3O1H9VqmacH3+n1lNhtgz6/0jn/A3SmRr/MQNm2rI0X63G
 U4Jeo9xn5c3/W9jj2aYisLpL7kVCJ/Hg4nVMl5o/fCbebU9X3bH1RhZGPVRRIn8Q5bqpgn
 tN60yHSnY5jAioMbMCyzQUjnMX1rS/vKhD9/XHnNs0zp2hme5RPGVwLLVCa4wmyHIm0opc
 astTmS/msm0ezUVFEpywNgnnJL20/jFX5ji3bbGr3nQyFQlk1/JUndzNfZ0mHw==
Date: Tue, 15 Mar 2022 19:51:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Message-ID: <20220315195137.6e371f8f@xps13>
In-Reply-To: <20220315165607.390070-4-ikegami.t@gmail.com>
References: <20220315165607.390070-1-ikegami.t@gmail.com>
 <20220315165607.390070-4-ikegami.t@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_115144_056070_1D47D84A 
X-CRM114-Status: GOOD (  24.50  )
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

SGkgVG9rdW5vcmksCgppa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTYgTWFyIDIw
MjIgMDE6NTY6MDcgKzA5MDA6Cgo+IEFzIHBvaW50ZWQgb3V0IGJ5IHRoaXMgYnVnIHJlcG9ydCBb
MV0sIHRoZSBidWZmZXJlZCB3cml0ZSBpcyBub3cgYnJva2VuIG9uCgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAsIGJ1ZmZlcmVkIHdyaXRlcyBhcmUgbm93IGJyb2tlbgoK
PiBTMjlHTDA2NE4uIFRoZSByZWFzb24gaXMgdGhhdCBjaGFuZ2VkIHRoZSBidWZmZXJlZCB3cml0
ZSB0byB1c2UgY2hpcF9nb29kCj4gaW5zdGVhZCBvZiBjaGlwX3JlYWR5LgoKIlRoaXMgaXNzdWUg
Y29tZXMgZnJvbSBhIHJld29yayB3aGljaCBzd2l0Y2hlZCBmcm9tIHVzaW5nIGNoaXBfZ29vZCgp
CnRvIGNoaXBfcmVhZHkoKSwgYmVjYXVzZSA8ZXhwbGFpbiB0aGUgZGlmZmVyZW5jZSBoZXJlPi4i
CgpbcGxlYXNlIG5vdGUgSSBhbSBqdXN0IHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIHJv
b3QgY2F1c2UgaXMsCnBsZWFzZSByZXBocmFzZSBpZiBJJ20gd3JvbmddLgoKPiBPbmUgd2F5IHRv
IHNvbHZlIHRoZSBpc3N1ZSBpcyB0byByZXZlcnQgdGhlIGNoYW5nZQo+IHBhcnRpYWxseSB0byB1
c2UgY2hpcF9yZWFkeSBmb3IgUzI5R0wwNjROIHNpbmNlIHRoZSB3YXkgb2YgbGVhc3Qgc3VycHJp
c2UuCgpzL3NpbmNlIHRoZSB3YXkgb2YgbGVhc3Qgc3VycHJpc2UvLwoKCj4gCj4gWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvYjY4N2MyNTktNjQxMy0yNmM5LWQ0YzktYjNhZmE2OWVhMTI0
QHBlbmd1dHJvbml4LmRlLwo+IAo+IEZpeGVzOiBkZmVhZTEwNzM1ODMoIm10ZDogY2ZpX2NtZHNl
dF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVyIHRvIGNoZWNrIGNvcnJlY3QgdmFsdWUiKQo+IFNp
Z25lZC1vZmYtYnk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWkudEBnbWFpbC5jb20+Cj4gVGVz
dGVkLWJ5OiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPgo+IENjOiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IENjOiBSaWNoYXJkIFdlaW5i
ZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNo
ckB0aS5jb20+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCgpJIHRoaW5rIHlv
dSBjYW4gZ2V0IHJpZCBvZiBhbGwgdGhlIGFib3ZlIENjOiB0YWdzIGFuZCBqdXN0IGNvcHkgYWxs
IDMKb2YgdXMgKyB0aGUgbWFpbGluZyBsaXN0IHdoZW4gc2VuZGluZyB5b3VyIHY0LgoKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IC0tLQoKUGxlYXNlIGFsc28gaW5jbHVkZSBhIEZpeGVz
L3N0YWJsZSB0YWcgaW4gdGhlIHBhdGNoIGJlZm9yZSAoMi8zKSB0byBleHBsYWluCnRoYXQgYm90
aCBwYXRjaGVzIGFyZSByZXF1aXJlZCBpbiBvcmRlciB0byBmaXggdGhlIGlzc3VlIGFuZCB0aGUg
Y3VycmVudCBwYXRjaCBhbG9uZSB3b24ndCBhcHBseS4KCllvdSBzaG91bGQgbWVudGlvbiB0aGF0
IHdpdGggYSBuaWNlIGNvbW1lbnQgYmVsb3cgdGhlIHRocmVlIGRhc2hlcyAoIi0tLSIpIGluIHBh
dGNoIDIvMyBhcyB3ZWxsLgoKPiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMg
fCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVy
cy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiBpbmRleCA4ZjNmMDMwOWRjMDMuLmZhMTFk
YjA2NmM5OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gQEAgLTg2Nywx
MCArODY3LDIwIEBAIHN0YXRpYyBpbnQgX194aXByYW0gY2hpcF9nb29kKHN0cnVjdCBtYXBfaW5m
byAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+ICAJcmV0dXJuIGNoaXBfY2hlY2sobWFwLCBj
aGlwLCBhZGRyLCAmZXhwZWN0ZWQpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgYm9vbCBfX3hpcHJhbSBj
ZmlfdXNlX2NoaXBfcmVhZHlfZm9yX3dyaXRlKHN0cnVjdCBtYXBfaW5mbyAqbWFwKQo+ICt7Cj4g
KwlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSA9IG1hcC0+ZmxkcnZfcHJpdjsKPiArCj4gKwlyZXR1
cm4gY2ZpLT5tZnIgPT0gQ0ZJX01GUl9BTUQgJiYgY2ZpLT5pZCA9PSBTMjlHTDA2NE5fTU4xMjsK
PiArfQo+ICsKPiAgc3RhdGljIGludCBfX3hpcHJhbSBjaGlwX2dvb2RfZm9yX3dyaXRlKHN0cnVj
dCBtYXBfaW5mbyAqbWFwLAo+ICAJCQkJCXN0cnVjdCBmbGNoaXAgKmNoaXAsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiAgCQkJCQltYXBfd29yZCBleHBlY3RlZCkKPiAgewo+ICsJaWYgKGNmaV91c2Vf
Y2hpcF9yZWFkeV9mb3Jfd3JpdGUobWFwKSkKPiArCQlyZXR1cm4gY2hpcF9yZWFkeShtYXAsIGNo
aXAsIGFkZHIpOwo+ICsKPiAgCXJldHVybiBjaGlwX2dvb2QobWFwLCBjaGlwLCBhZGRyLCBleHBl
Y3RlZCk7Cj4gIH0KPiAgCgpUaGlzIGlzIG11Y2ggbW9yZSB1bmRlcnN0YW5kYWJsZS4KClZpZ25l
c2gsIHBlcmhhcHMgaXQgd291bGQgYmUgYmV0dGVyIHRvIHByb3ZpZGUgYSB3YXkgZm9yIG1hbnVm
YWN0dXJlcnMKdG8gb3ZlcmxvYWQgY2VydGFpbiBjYWxsYmFja3MgaW5zdGVhZCBvZiBhcHBseWlu
ZyBxdWlya3MgbGlrZSB0aGlzIGluCnRoZSBjb2RlLiBCdXQgdGhhdCB3aWxsIGNvbWUgaW4gYSBz
ZWNvbmQgdGltZSBvZiBjb3Vyc2UuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
