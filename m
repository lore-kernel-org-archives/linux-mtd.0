Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C284AC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:21:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8719A2184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eZPMABDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8719A2184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkIVWaIjZj37fVNC9I+7TiqfkbrQDw3VVYQgD3E0+1Q=; b=eZPMABDZvzvezF
	58SiLRkKOND6qzOcAkAS6h+4RK5KtAhKDns0nvJEcN92uc6AkN1sGBjCyKXEnjDqtXFoymENCtP5Z
	DuZQf5Jbe0E66ASgmPZpOEeQiS6r480vd4kmcGa2ocx/8sG1pyRy9qR5qiH0fc2lECCPdpyQi5q6o
	5EHUNxfaEfV2039pI/FoEwconxbj2/R/kAzd8d7FnoTHBdVMSd95XSAj7DeEIYgYiOH6B+o0D0D8Z
	3dV9NfT+RQwuoPClkaVaYLADtGvu2f3NaxXnwEwE6qZC03fP1zZGyDqMY6XvvJeiyczjaOdR8ooJf
	zfG7vjRkQ9z18hEBaTVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6hiS-0002x5-Ba; Wed, 20 Mar 2019 20:21:36 +0000
Received: from gateway32.websitewelcome.com ([192.185.145.107])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6hiP-0002wg-N3
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 20:21:34 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 95E4314A01
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 15:21:32 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 6hiOhDw6a2qH76hiOhexIP; Wed, 20 Mar 2019 15:21:32 -0500
X-Authority-Reason: nr=8
Received: from [189.250.104.39] (port=34546 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1h6hhl-003rHS-8G; Wed, 20 Mar 2019 15:21:31 -0500
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <20190208180202.GA16603@embeddedor>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
Date: Wed, 20 Mar 2019 15:20:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190208180202.GA16603@embeddedor>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.104.39
X-Source-L: No
X-Exim-ID: 1h6hhl-003rHS-8G
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.104.39]:34546
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 45
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_132133_836402_B5736D39 
X-CRM114-Status: GOOD (  16.09  )
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

SGkgYWxsLAoKRnJpZW5kbHkgcGluZzoKCldobyBjYW4gdGFrZSB0aGlzPwoKVGhhbmtzCi0tCkd1
c3Rhdm8KCk9uIDIvOC8xOSAxMjowMiBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBJ
biBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3
aXRjaAo+IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+
IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKPiAKPiBkcml2ZXJzL210
ZC9jaGlwcy9jZmlfdXRpbC5jOiBJbiBmdW5jdGlvbiDigJhjZmlfYnVpbGRfY21k4oCZOgo+IGRy
aXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6MTEwOjEwOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVu
dCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICBvbmVjbWQg
fD0gKG9uZWNtZCA8PCAoY2hpcF9tb2RlICogMzIpKTsKPiAgICB+fn5+fn5+Xn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6MTEyOjI6
IG5vdGU6IGhlcmUKPiAgIGNhc2UgNDoKPiAgIF5+fn4KPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlf
dXRpbC5jOjExMzoxMDogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBb
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgb25lY21kIHw9IChvbmVjbWQgPDwgKGNoaXBf
bW9kZSAqIDE2KSk7Cj4gICAgfn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjExNDoyOiBub3RlOiBoZXJlCj4gICBjYXNl
IDI6Cj4gICBefn5+Cj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYzogSW4gZnVuY3Rpb24g
4oCYY2ZpX21lcmdlX3N0YXR1c+KAmToKPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjE2
Mzo3OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0
LWZhbGx0aHJvdWdoPV0KPiAgICByZXMgfD0gKG9uZXN0YXQgPj4gKGNoaXBfbW9kZSAqIDMyKSk7
Cj4gICAgfn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9tdGQv
Y2hpcHMvY2ZpX3V0aWwuYzoxNjU6Mjogbm90ZTogaGVyZQo+ICAgY2FzZSA0Ogo+ICAgXn5+fgo+
IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6MTY2Ojc6IHdhcm5pbmc6IHRoaXMgc3RhdGVt
ZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIHJlcyB8
PSAob25lc3RhdCA+PiAoY2hpcF9tb2RlICogMTYpKTsKPiAgICB+fn5+Xn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjE2NzoyOiBu
b3RlOiBoZXJlCj4gICBjYXNlIDI6Cj4gICBefn5+Cj4gCj4gV2FybmluZyBsZXZlbCAzIHdhcyB1
c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPiAKPiBUaGlzIHBhdGNoIGlzIHBhcnQgb2Yg
dGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGluZwo+IC1XaW1wbGljaXQtZmFsbHRocm91Z2gu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRl
ZG9yLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYyB8IDYgKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMK
PiBpbmRleCA2ZjE2NTUyY2Q1OWYuLmUzYjI2NmVlMDZhZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9jaGlwcy9jZmlfdXRpbC5jCj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwu
Ywo+IEBAIC0xMDksMTAgKzEwOSwxMyBAQCBtYXBfd29yZCBjZmlfYnVpbGRfY21kKHVfbG9uZyBj
bWQsIHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaQo+ICAJY2Fz
ZSA4Ogo+ICAJCW9uZWNtZCB8PSAob25lY21kIDw8IChjaGlwX21vZGUgKiAzMikpOwo+ICAjZW5k
aWYKPiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPiAgCWNhc2UgNDoKPiAgCQlvbmVjbWQgfD0gKG9u
ZWNtZCA8PCAoY2hpcF9tb2RlICogMTYpKTsKPiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPiAgCWNh
c2UgMjoKPiAgCQlvbmVjbWQgfD0gKG9uZWNtZCA8PCAoY2hpcF9tb2RlICogOCkpOwo+ICsJCS8q
IGZhbGwgdGhyb3VnaCAqLwo+ICAJY2FzZSAxOgo+ICAJCTsKPiAgCX0KPiBAQCAtMTYyLDEwICsx
NjUsMTMgQEAgdW5zaWduZWQgbG9uZyBjZmlfbWVyZ2Vfc3RhdHVzKG1hcF93b3JkIHZhbCwgc3Ry
dWN0IG1hcF9pbmZvICptYXAsCj4gIAljYXNlIDg6Cj4gIAkJcmVzIHw9IChvbmVzdGF0ID4+IChj
aGlwX21vZGUgKiAzMikpOwo+ICAjZW5kaWYKPiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPiAgCWNh
c2UgNDoKPiAgCQlyZXMgfD0gKG9uZXN0YXQgPj4gKGNoaXBfbW9kZSAqIDE2KSk7Cj4gKwkJLyog
ZmFsbCB0aHJvdWdoICovCj4gIAljYXNlIDI6Cj4gIAkJcmVzIHw9IChvbmVzdGF0ID4+IChjaGlw
X21vZGUgKiA4KSk7Cj4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4gIAljYXNlIDE6Cj4gIAkJOwo+
ICAJfQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
