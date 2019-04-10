Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD17C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994302082A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Co0R8uzT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 994302082A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ur1M1vUZnuoa7zYJIqyKFDvGhBgHIJeSBjGFgF5A6M=; b=Co0R8uzTIAWGbB
	umJRFUligcAi7/m7Er4HEkqJvbDmlkuEvdN4rH4fp3w6uvGuAbHgY1YAAWkCHS4YwF/42FDqqfx75
	KOgFETVMRtuPx7XqoVO8naVQ9fKVVtgNnE9GiUTRsNM0d8MkVobBFugCPHuz9TxzAXagoi/QZrYWn
	tq8il+a1tLu10s1Y+BQ8RfcqVfO3hWHrOZBSDpQltmQJr8I/AcC0c5Ygg5HToaShW2LbfNS08AAQB
	rUrZe+vCEkL7JYwxZ/LfnqMxsh/BKDmouypXCbTxD3dTOzWkoKE6gdgOvJEQEV8gLo/RU6f896Ekz
	c+UUK0igdFm8xwUSBjJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEKaj-0000Cm-Ex; Wed, 10 Apr 2019 21:17:09 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.179])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEKag-0000CP-EL
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 21:17:07 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id D01DA12B6E
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 16:16:52 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id EKaShrTrE2qH7EKaShEVbW; Wed, 10 Apr 2019 16:16:52 -0500
X-Authority-Reason: nr=8
Received: from [189.250.139.70] (port=43138 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hEKaS-002BOl-Bd; Wed, 10 Apr 2019 16:16:52 -0500
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <20190208180202.GA16603@embeddedor>
 <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <71df15e7-af2e-0326-78fe-0271a1e240fe@embeddedor.com>
Date: Wed, 10 Apr 2019 16:16:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.139.70
X-Source-L: No
X-Exim-ID: 1hEKaS-002BOl-Bd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.139.70]:43138
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 32
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_141706_578879_3A4FF89A 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKSWYgbm8gb25lIGNhcmVzIEknbGwgYWRkIHRoaXMgdG8gbXkgdHJlZSBmb3IgNS4y
LgoKVGhhbmtzCi0tCkd1c3Rhdm8KCk9uIDMvMjAvMTkgMzoyMCBQTSwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBIaSBhbGwsCj4gCj4gRnJpZW5kbHkgcGluZzoKPiAKPiBXaG8gY2FuIHRh
a2UgdGhpcz8KPiAKPiBUaGFua3MKPiAtLQo+IEd1c3Rhdm8KPiAKPiBPbiAyLzgvMTkgMTI6MDIg
UE0sIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJs
aW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4+IGNhc2VzIHdoZXJlIHdl
IGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+Pgo+PiBUaGlzIHBhdGNoIGZpeGVzIHRo
ZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4+Cj4+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6
IEluIGZ1bmN0aW9uIOKAmGNmaV9idWlsZF9jbWTigJk6Cj4+IGRyaXZlcnMvbXRkL2NoaXBzL2Nm
aV91dGlsLmM6MTEwOjEwOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdo
IFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPj4gICAgb25lY21kIHw9IChvbmVjbWQgPDwgKGNo
aXBfbW9kZSAqIDMyKSk7Cj4+ICAgIH5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6MTEyOjI6IG5vdGU6IGhlcmUKPj4g
ICBjYXNlIDQ6Cj4+ICAgXn5+fgo+PiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjExMzox
MDogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1m
YWxsdGhyb3VnaD1dCj4+ICAgIG9uZWNtZCB8PSAob25lY21kIDw8IChjaGlwX21vZGUgKiAxNikp
Owo+PiAgICB+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiBkcml2ZXJz
L210ZC9jaGlwcy9jZmlfdXRpbC5jOjExNDoyOiBub3RlOiBoZXJlCj4+ICAgY2FzZSAyOgo+PiAg
IF5+fn4KPj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYzogSW4gZnVuY3Rpb24g4oCYY2Zp
X21lcmdlX3N0YXR1c+KAmToKPj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYzoxNjM6Nzog
d2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD1dCj4+ICAgIHJlcyB8PSAob25lc3RhdCA+PiAoY2hpcF9tb2RlICogMzIpKTsKPj4g
ICAgfn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IGRyaXZlcnMvbXRkL2No
aXBzL2NmaV91dGlsLmM6MTY1OjI6IG5vdGU6IGhlcmUKPj4gICBjYXNlIDQ6Cj4+ICAgXn5+fgo+
PiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjE2Njo3OiB3YXJuaW5nOiB0aGlzIHN0YXRl
bWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPj4gICAgcmVz
IHw9IChvbmVzdGF0ID4+IChjaGlwX21vZGUgKiAxNikpOwo+PiAgICB+fn5+Xn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYzoxNjc6
Mjogbm90ZTogaGVyZQo+PiAgIGNhc2UgMjoKPj4gICBefn5+Cj4+Cj4+IFdhcm5pbmcgbGV2ZWwg
MyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4+Cj4+IFRoaXMgcGF0Y2ggaXMg
cGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5nCj4+IC1XaW1wbGljaXQtZmFs
bHRocm91Z2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rh
dm9AZW1iZWRkZWRvci5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwu
YyB8IDYgKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jIGIvZHJpdmVycy9tdGQvY2hp
cHMvY2ZpX3V0aWwuYwo+PiBpbmRleCA2ZjE2NTUyY2Q1OWYuLmUzYjI2NmVlMDZhZiAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYwo+PiArKysgYi9kcml2ZXJzL210
ZC9jaGlwcy9jZmlfdXRpbC5jCj4+IEBAIC0xMDksMTAgKzEwOSwxMyBAQCBtYXBfd29yZCBjZmlf
YnVpbGRfY21kKHVfbG9uZyBjbWQsIHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgY2ZpX3By
aXZhdGUgKmNmaQo+PiAgCWNhc2UgODoKPj4gIAkJb25lY21kIHw9IChvbmVjbWQgPDwgKGNoaXBf
bW9kZSAqIDMyKSk7Cj4+ICAjZW5kaWYKPj4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4+ICAJY2Fz
ZSA0Ogo+PiAgCQlvbmVjbWQgfD0gKG9uZWNtZCA8PCAoY2hpcF9tb2RlICogMTYpKTsKPj4gKwkJ
LyogZmFsbCB0aHJvdWdoICovCj4+ICAJY2FzZSAyOgo+PiAgCQlvbmVjbWQgfD0gKG9uZWNtZCA8
PCAoY2hpcF9tb2RlICogOCkpOwo+PiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPj4gIAljYXNlIDE6
Cj4+ICAJCTsKPj4gIAl9Cj4+IEBAIC0xNjIsMTAgKzE2NSwxMyBAQCB1bnNpZ25lZCBsb25nIGNm
aV9tZXJnZV9zdGF0dXMobWFwX3dvcmQgdmFsLCBzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKPj4gIAlj
YXNlIDg6Cj4+ICAJCXJlcyB8PSAob25lc3RhdCA+PiAoY2hpcF9tb2RlICogMzIpKTsKPj4gICNl
bmRpZgo+PiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPj4gIAljYXNlIDQ6Cj4+ICAJCXJlcyB8PSAo
b25lc3RhdCA+PiAoY2hpcF9tb2RlICogMTYpKTsKPj4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4+
ICAJY2FzZSAyOgo+PiAgCQlyZXMgfD0gKG9uZXN0YXQgPj4gKGNoaXBfbW9kZSAqIDgpKTsKPj4g
KwkJLyogZmFsbCB0aHJvdWdoICovCj4+ICAJY2FzZSAxOgo+PiAgCQk7Cj4+ICAJfQo+PgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
