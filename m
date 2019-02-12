Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9B3C282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 15:36:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF94E217FA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 15:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pGvrEbKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF94E217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpdJHf6HiTuc8295ArF6slyD2QtLz3CLJql6KK6xegQ=; b=pGvrEbKDFmAbbY
	CsBgwk6bm/SbUprtQWUxNVq2sFPwMuk9feIUObJUU8kJ+NfIX9GmL75VEOGhCq3RMKUta2ob31Hf5
	9HxUp068/eQ8zm3IbFDH7a85OVnYqPsS1h9DLsN0eEpsB1fXwN8W7rH+GcS5yE/vOqHCqZQf2VFaV
	I/xlp8+zzr/pYABWpGCbqC+66evX125mb1R2ZDmIlckWQoaMQJhIND+jGbZFteNWvhVpn4tG6U6Jx
	Y0ROt5MvjqIultPLV6cvx0elY6wib1+92TAeai4Og7maOqX/LPYkNiThv7VFFr60R3Pl+UFr0U+ID
	0wUq+oBCDJFVae4/n42w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gta6S-0003OM-Jb; Tue, 12 Feb 2019 15:36:08 +0000
Received: from gateway36.websitewelcome.com ([192.185.184.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gta6O-0003Nu-QY
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 15:36:06 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id C0C7040403B07
 for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2019 08:50:11 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id ta6NgFvF92qH7ta6Ngo5xJ; Tue, 12 Feb 2019 09:36:03 -0600
X-Authority-Reason: nr=8
Received: from [189.250.119.20] (port=41222 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1gta5l-000YRv-4h; Tue, 12 Feb 2019 09:36:02 -0600
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Mark expected switch fall-throughs
To: Tokunori Ikegami <ikegami.t@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Brian Norris' <computersforpeace@gmail.com>,
 'Boris Brezillon' <bbrezillon@kernel.org>,
 'Marek Vasut' <marek.vasut@gmail.com>, 'Richard Weinberger' <richard@nod.at>
References: <20190208180615.GA24601@embeddedor>
 <000001d4c051$9f66deb0$de349c10$@gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <23667886-4ba3-fa1d-3441-0300a8695bcb@embeddedor.com>
Date: Tue, 12 Feb 2019 09:35:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <000001d4c051$9f66deb0$de349c10$@gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.119.20
X-Source-L: No
X-Exim-ID: 1gta5l-000YRv-4h
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.119.20]:41222
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 21
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_073604_978725_902F5C08 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyLzkvMTkgMjoyOSBBTSwgVG9rdW5vcmkgSWtlZ2FtaSB3cm90ZToKPiBSZXZpZXdlZC1i
eTogVG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaS50QGdtYWlsLmNvbT4KPiAKClRoYW5rcywgVG9r
dW5vcmkuCgotLQpHdXN0YXZvCgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9t
OiBsaW51eC1tdGQgW21haWx0bzpsaW51eC1tdGQtYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3Jn
XSBPbiBCZWhhbGYKPj4gT2YgR3VzdGF2byBBLiBSLiBTaWx2YQo+PiBTZW50OiBTYXR1cmRheSwg
RmVicnVhcnkgOSwgMjAxOSAzOjA2IEFNCj4+IFRvOiBEYXZpZCBXb29kaG91c2U7IEJyaWFuIE5v
cnJpczsgQm9yaXMgQnJlemlsbG9uOyBNYXJlayBWYXN1dDsgUmljaGFyZAo+PiBXZWluYmVyZ2Vy
Cj4+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgR3VzdGF2bwo+PiBBLiBSLiBTaWx2YQo+PiBTdWJqZWN0OiBbUEFUQ0hdIG10
ZDogY2ZpX2NtZHNldF8wMDAyOiBNYXJrIGV4cGVjdGVkIHN3aXRjaCBmYWxsLXRocm91Z2hzCj4+
Cj4+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1h
cmsgc3dpdGNoCj4+IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdo
Lgo+Pgo+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4+Cj4+IGRy
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jOiBJbiBmdW5jdGlvbiDigJhnZXRfY2hp
cOKAmToKPj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmM6ODcwOjY6IHdhcm5p
bmc6IHRoaXMgc3RhdGVtZW50IG1heQo+PiBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRo
cm91Z2g9XQo+PiAgICBpZiAobW9kZSA9PSBGTF9SRUFEWSAmJiBjaGlwLT5vbGRzdGF0ZSA9PSBG
TF9SRUFEWSkKPj4gICAgICAgXgo+PiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIu
Yzo4NzM6Mjogbm90ZTogaGVyZQo+PiAgIGRlZmF1bHQ6Cj4+ICAgXn5+fn5+fgo+PiBkcml2ZXJz
L210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYzogSW4gZnVuY3Rpb24g4oCYY2ZpX2FtZHN0ZF9z
eW5j4oCZOgo+PiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYzoyNzQ1OjE2OiB3
YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkKPj4gZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZh
bGx0aHJvdWdoPV0KPj4gICAgIGNoaXAtPnN0YXRlID0gRkxfU1lOQ0lORzsKPj4gICAgIH5+fn5+
fn5+fn5+fl5+fn5+fn5+fn5+fgo+PiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIu
YzoyNzUwOjM6IG5vdGU6IGhlcmUKPj4gICAgY2FzZSBGTF9TWU5DSU5HOgo+PiAgICBefn5+Cj4+
Cj4+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4+
Cj4+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5n
Cj4+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8g
QS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9t
dGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAyICsrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21k
c2V0XzAwMDIuYwo+PiBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+IGlu
ZGV4IDcyNDI4YjZiZmM0Ny4uMGIwYTE4NzRkM2JmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+PiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlf
Y21kc2V0XzAwMDIuYwo+PiBAQCAtODY5LDYgKzg2OSw3IEBAIHN0YXRpYyBpbnQgZ2V0X2NoaXAo
c3RydWN0IG1hcF9pbmZvICptYXAsIHN0cnVjdCBmbGNoaXAKPj4gKmNoaXAsIHVuc2lnbmVkIGxv
bmcgYWRyCj4+ICAJCS8qIE9ubHkgaWYgdGhlcmUncyBubyBvcGVyYXRpb24gc3VzcGVuZGVkLi4u
ICovCj4+ICAJCWlmIChtb2RlID09IEZMX1JFQURZICYmIGNoaXAtPm9sZHN0YXRlID09IEZMX1JF
QURZKQo+PiAgCQkJcmV0dXJuIDA7Cj4+ICsJCS8qIGZhbGwgdGhyb3VnaCAqLwo+Pgo+PiAgCWRl
ZmF1bHQ6Cj4+ICAJc2xlZXA6Cj4+IEBAIC0yNzQ3LDYgKzI3NDgsNyBAQCBzdGF0aWMgdm9pZCBj
ZmlfYW1kc3RkX3N5bmMgKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+PiAgCQkJICogYXMgdGhlIHdo
b2xlIHBvaW50IGlzIHRoYXQgbm9ib2R5IGNhbiBkbyBhbnl0aGluZwo+PiAgCQkJICogd2l0aCB0
aGUgY2hpcCBub3cgYW55d2F5Lgo+PiAgCQkJICovCj4+ICsJCQkvKiBmYWxsIHRocm91Z2ggKi8K
Pj4gIAkJY2FzZSBGTF9TWU5DSU5HOgo+PiAgCQkJbXV0ZXhfdW5sb2NrKCZjaGlwLT5tdXRleCk7
Cj4+ICAJCQlicmVhazsKPj4gLS0KPj4gMi4yMC4xCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
