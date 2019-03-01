Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8BAC43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:48:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F238520818
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gdNcfu+y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QfosMyAG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F238520818
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osQPsUxKR0jZa+MNpf8rTzKKunXGmEFJRBr+NXhR5DA=; b=gdNcfu+y3SVKeO
	LsIPx/xLOws64DPOjyXtNJk6uuot+d/6j2E7XBnCSOFsKy1+FzWhq1UPKybqLG+TSTs2We2qYA8v/
	e+wiabohL1FMfv8zUoYp0f8jNJY2Ck3Y9HHXxKj3L18SpCkLWm6ZLmrTvgq1KiXjmRZhYrgPcD5B8
	9XaI41pmMNRvZpVcgM0uU7Rb+BzHv0oh9DkX/B4p3bm3FCvDgqWa2rnOLWG/hkDoXkTqHJPltzACq
	2tsAYldX5dFgaPtEwSHWJRlaJapw0Tc6EBuvUl3yA5OcsoLXLGyx56Chdxc1bvmRuDe5bBDgcYqWp
	WfkJJWuSKd0g798CkvGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlKr-00009Y-8D; Fri, 01 Mar 2019 16:48:33 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlKo-0008Ru-4n
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 16:48:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x21Gm2dA087945;
 Fri, 1 Mar 2019 10:48:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1551458882;
 bh=+Yz0uiTf07O3FtCAB7jVc9+niTq+LKff5BwRnHvkvdw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QfosMyAG9oj0+25rtvwPdPXW+EH277e79rHnQuRwkTiX/8dNRhlyYex4x/molZpyg
 xEQS2ZQZOlA0lnLmHgQInsi/wO+nuSQ0ShNruZLZx3sQf7XTS9jKuA9hmLkA3pz7QQ
 gqhAlDKHYSj7wAn9ypABuUJuSeQCyEGcQoaJkJpM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x21Gm2S7052275
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Mar 2019 10:48:02 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Fri, 1
 Mar 2019 10:48:01 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Fri, 1 Mar 2019 10:48:01 -0600
Received: from [172.22.218.108] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x21Glt8a007743;
 Fri, 1 Mar 2019 10:47:56 -0600
Subject: Re: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
To: Tokunori Ikegami <ikegami_to@yahoo.co.jp>, "'Boris Brezillon'"
 <boris.brezillon@collabora.com>, "'liujian (CE)'" <liujian56@huawei.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
 <20190228164228.734ede80@collabora.com>
 <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <4b3bc01a-3632-5dde-f683-94744ee7179d@ti.com>
Date: Fri, 1 Mar 2019 22:17:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_084830_275547_88E243B6 
X-CRM114-Status: GOOD (  19.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Tokunori Ikegami' <ikegami.t@gmail.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Wy4uLl0KPj4+Pj4gSW4gZnVuY3Rpb24gZG9fd3JpdGVfYnVmZmVyKCksIGluIHRoZSBmb3IgbG9v
cCwgdGhlcmUgaXMgYSBjYXNlCj4+Pj4+IGNoaXBfcmVhZHkoKSByZXR1cm5zIDEgd2hpbGUgY2hp
cF9nb29kKCkgcmV0dXJucyAwLCBzbyBpdCBuZXZlciBicmVhawo+Pj4+PiB0aGUgbG9vcC4KPj4+
Pj4gVG8gZml4IHRoaXMsIGNoaXBfZ29vZCgpIGlzIGVub3VnaCBhbmQgaXQgc2hvdWxkIHRpbWVv
dXQgaWYgaXQgc3RheQo+Pj4+PiBiYWQgZm9yIGEgd2hpbGUuCj4+Pj4+Cj4+Pj4+IEZpeGVzOiBk
ZmVhZTEwNzM1ODMoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVyIHRv
Cj4+Pj4+IGNoZWNrIGNvcnJlY3QgdmFsdWUiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZaSBIdWFp
amllIDx5aWh1YWlqaWVAaHVhd2VpLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTGl1IEppYW4g
PGxpdWppYW41NkBodWF3ZWkuY29tPgo+Pj4+PiBSZXZpZXdlZC1ieTogVG9rdW5vcmkgSWtlZ2Ft
aSA8aWtlZ2FtaV90b0B5YWhvby5jby5qcD4KPj4+Pj4gLS0tCj4+Pj4+IHYyLT52MzoKPj4+Pj4g
Rm9sbG93IFZpZ25lc2gncyBhZHZpY2U6Cj4+Pj4+IGFkZCBvbmUgbW9yZSBjaGVjayBmb3IgY2hl
Y2tfZ29vZCgpIGV2ZW4gd2hlbiB0aW1lX2FmdGVyKCkgcmV0dXJucwo+PiB0cnVlLgo+Pj4+Pgo+
Pj4+PiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAyICstCj4+Pj4+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4KPj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+Pj4+IGIv
ZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPj4+Pj4gaW5kZXggNzI0MjhiNi4u
M2RhMjM3NiAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8w
MDAyLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPj4+
Pj4gQEAgLTE4NzYsNyArMTg3Niw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0gZG9fd3JpdGVfYnVm
ZmVyKHN0cnVjdAo+Pj4+PiBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+Pj4+
PiAgCQkJY29udGludWU7Cj4+Pj4+ICAJCX0KPj4+Pj4KPj4+Pj4gLQkJaWYgKHRpbWVfYWZ0ZXIo
amlmZmllcywgdGltZW8pICYmICFjaGlwX3JlYWR5KG1hcCwgYWRyKSkKPj4+Pj4gKwkJaWYgKHRp
bWVfYWZ0ZXIoamlmZmllcywgdGltZW8pICYmICFjaGlwX2dvb2QobWFwLCBhZHIsCj4+Pj4+IGRh
dHVtKSkKPj4+Pgo+Pj4+ICAgSnVzdCBhbm90aGVyIGlkZWEgdG8gdW5kZXJzdGFuZCBlYXNpbHku
Cj4+Pj4KPj4+PiAgICAgdW5zaWduZWQgbG9uZyBub3cgPSBqaWZmaWVzOwo+Pj4+Cj4+Pj4gICAg
IGlmIChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+Pj4+ICAgICAgICAgeGlwX2VuYWJs
ZShtYXAsIGNoaXAsIGFkcik7Cj4+Pj4gICAgICAgICBnb3RvIG9wX2RvbmU7Cj4+Pj4gICAgIH0K
Pj4+Pgo+Pj4+ICAgICBpZiAodGltZV9hZnRlcihub3csIHRpbWVvKSB7Cj4+Pj4gICAgICAgICBi
cmVhazsKPj4+PiAgICAgfQo+Pj4+Cj4+Pgo+Pj4gVGhhbmsgeW91fi4gSXQgaXMgbW9yZSBlYXNp
ZXIgdG8gdW5kZXJzdGFuZO+8gQo+Pj4gSWYgdGhlcmUgYXJlIG5vIG90aGVyIGNvbW1lbnRzLCBJ
IHdpbGwgc2VuZCBuZXcgcGF0Y2ggYWdhaW4gKToKPj4KPj4gRXhjZXB0IHRoaXMgdmVyc2lvbiBu
byBsb25nZXIgZG9lcyB3aGF0IFZpZ25lc2ggc3VnZ2VzdGVkLiBTZWUgaG93IHlvdQo+PiBubyBs
b25nZXIgdGVzdCBpZiBjaGlwX2dvb2QoKSBpcyB0cnVlIGlmIHRpbWVfYWZ0ZXIoKSByZXR1cm5z
IHRydWUuIFNvLAo+PiBpbWFnaW5lIHRoZSB0aHJlYWQgZW50ZXJpbmcgdGhpcyBmdW5jdGlvbiBp
cyBwcmVlbXB0ZWQganVzdCBhZnRlciB0aGUKPj4gZmlyc3QgY2hpcF9nb29kKCkgdGVzdCwgYW5k
IHJlc3VtZWQgYSBmZXcgbXMgbGF0ZXIuIHRpbWVfYWZ0ZXIoKSB3aWxsCj4+IHJldHVybiB0cnVl
LCBidXQgY2hpcF9nb29kKCkgbWlnaHQgYWxzbyByZXR1cm4gdHJ1ZSwgYW5kIHlvdSBpZ25vcmUg
aXQuCj4gCj4gSSB0aGluayB0aGF0IHRoZSBmb2xsb3dpbmcgMyB2ZXJzaW9ucyB3aWxsIGJlIHdv
cmtlZCBmb3IgdGltZV9hZnRlcigpIGFzIGEgc2FtZSByZXN1bHQgYW5kIGZvbGxvdyB0aGUgVmln
bmVzaC1zYW4gc3VnZ2VzdGlvbi4KPiAKCkFzIEJvcmlzIGV4cGxhaW5lZCBhYm92ZSB2ZXJzaW9u
IDMgZG9lcyBub3QgcmVhbGx5IGZvbGxvdyBteQpzdWdnZXN0aW9uLi4uIFBsZWFzZSBzZWUgYmVs
b3cKCj4gMS4gT3JpZ2luYWwgVmlnbmVzaC1zYW4gc3VnZ2VzdGlvbgo+IAo+IAlpZiAoY2hpcF9n
b29kKG1hcCwgYWRyLCBkYXR1bSkpIHsKPiAJCXhpcF9lbmFibGUobWFwLCBjaGlwLCBhZHIpOwo+
IAkJZ290byBvcF9kb25lOwo+IAl9Cj4gCj4gCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVv
KSkgewo+IAkJLyogVGVzdCBjaGlwX2dvb2QoKSBpZiBUUlVFIGluY29ycmVjdGx5IGFnYWluIHNv
IHdyaXRlIGZhaWx1cmUgYnkgdGltZV9hZnRlcigpIGNhbiBiZSBhdm9pZGVkLiAqLwo+IAkJaWYg
KGNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKSB7Cj4gCQkJeGlwX2VuYWJsZShtYXAsIGNoaXAs
IGFkcik7Cj4gCQkJZ290byBvcF9kb25lOwo+IAkJfQo+IAkJYnJlYWs7Cj4gCX0KPiAKCgpSaWdo
dCwgaGVyZSB3ZSBjaGVjayBjaGlwX2dvb2QoKSBvbmNlIF9ldmVuIHdoZW4gdGltZV9hZnRlcigp
IGlzIHRydWVfCnRvIGF2b2lkIF9zcHVyaW91c18gdGltZW91dAoKPiAyLiBMaXVqaWFuLXNhbiB2
MyBwYXRjaAo+IAo+IAkvKiBUZXN0IGNoaXBfZ29vZCgpIGlmIEZBTFNFIGNvcnJlY3RseSBzbyB3
cml0ZSBmYWlsdXJlIGJ5IHRpbWVfYWZ0ZXIoKSBjYW4gYmUgYXZvaWRlZC4gKi8KPiAJaWYgKHRp
bWVfYWZ0ZXIoamlmZmllcywgdGltZW8pICYmICFjaGlwX2dvb2QobWFwLCBhZHIpKQo+IAkJYnJl
YWs7Cj4gCj4gCWlmIChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+IAkJeGlwX2VuYWJs
ZShtYXAsIGNoaXAsIGFkcik7Cj4gCQlnb3RvIG9wX2RvbmU7Cj4gCX0KPiAKClRoaXMgaXMgYSBi
ZXR0ZXIgdmVyc2lvbiBvZiAxCgo+IDMuIE15IGlkZWEKPiAKPiAJLyogU2F2ZSBjdXJyZW50IGpp
ZmZpZXMgdmFsdWUgYmVmb3JlIGNoaXBfZ29vZCgpIHRvIGF2b2lkIHdyaXRlIGZhaWx1cmUgYnkg
dGltZV9hZnRlcigpIHdpdGhvdXQgdGVzdGluZyBjaGlwX2dvb2QoKSBhZ2Fpbi4gKi8KPiAJdW5z
aWduZWQgbG9uZyBub3cgPSBqaWZmaWVzOwo+IAo+IAlpZiAoY2hpcF9nb29kKG1hcCwgYWRyLCBk
YXR1bSkpIHsKPiAJCXhpcF9lbmFibGUobWFwLCBjaGlwLCBhZHIpOwo+IAkJZ290byBvcF9kb25l
Owo+IAl9Cj4gCgpXaGF0IGlmIHRocmVhZCBnZXRzIHByZS1lbXB0ZWQgYXQgdGhpcyBwb2ludCBh
bmQgaXMgcmUtc2NoZWR1bGVkIGV4YWN0bHkKYWZ0ZXIgdGltZW8gamlmZmllcyBoYXZlIGVsYXBz
ZWQ/IEJlbG93IGNoZWNrIHdvdWxkIGJlIHRydWUgYW5kIGV4aXQgbG9vcAoKPiAJaWYgKHRpbWVf
YWZ0ZXIobm93LCB0aW1lbykpCj4gCQlicmVhazsKPiAKClNvLCBjb2RlIGRvZXMgbm90IGNoZWNr
IGZvciBjaGVjayBjaGlwX2dvb2QoKSBhZnRlciB0aW1lb291dCBoYXMKZWxhcHNlZC4gQnV0IGNo
aXBfZ29vZCgpIG1pZ2h0IGJlIHRydWUgYXQgdGhpcyBwb2ludC4gVGhlcmVmb3JlIGxlYWRpbmcK
dG8gc3B1cmlvdXMgdGltZW91dC4gIFNvIHRoaXMgdmVyc2lvbiBpcyBzdGlsbCBub3QgcmlnaHQu
Cgo+ICAgICAgICAgICBOb3RlOiBTb21lIGJyYWNrZXRzIGhhdmUgYmVlbiBmaXhlZCBmcm9tIHRo
ZSBwcmV2aW91cyBtYWlsLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
