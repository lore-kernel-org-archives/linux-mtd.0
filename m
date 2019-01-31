Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6317C282D7
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 02:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7135420870
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 02:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyId13qV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7135420870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wvbC7CCGUHQeoO2cr0OF6FN0pnwzuP9Y8potpGP9Pmk=; b=uyId13qVu2v76/QkYxIIymXp5
	6ooeh6HHqJ14iBx1ylOK6sBPCa38L3RpUdXpG8gu9tEd8KoDI8W1fNX73xYB0SHKgJ4NOaqewBWas
	di6vcxfZuqa4FitKwTQf023I3GDWewMkqY7WkXa3O2eID6lauO7ppdaQ/JygYobW0uRzOGHbU3NK5
	zjlQKGvDSrR1IBPN53KX+QxxdxwOHzqeB1LB/xjyWRgKTcMnXbAkSEAAKONxE8CZLjdg7GRqPEIP1
	Bl4sCchgUPL5pJX0PHDeETuUkQYc5Ira3NpEtP/0ErJqau0bKiGw1iAF48Jurx+rfXbBSnO1guUm4
	acn48g4sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gp2IQ-0003Ix-54; Thu, 31 Jan 2019 02:41:42 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gp2IB-00036b-FH; Thu, 31 Jan 2019 02:41:28 +0000
Received: from [10.28.18.236] (10.28.18.236) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 31 Jan
 2019 10:42:04 +0800
Subject: Re: [PATCH] mtd: rawnand: meson: Fix linking error on 32-bit platforms
To: Nathan Chancellor <natechancellor@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
References: <20190129214657.5877-1-natechancellor@gmail.com>
 <42d2e92e-9f5a-62b2-c0af-b7f3544d79d2@amlogic.com>
 <20190130103220.27b13ab9@xps13> <20190130152706.GA31999@archlinux-ryzen>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <2b8866ac-073d-0077-79a7-67b47d79996f@amlogic.com>
Date: Thu, 31 Jan 2019 10:42:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190130152706.GA31999@archlinux-ryzen>
Content-Language: en-US
X-Originating-IP: [10.28.18.236]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_184127_510772_0FC26FAB 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLCBOYXRoYW4sCgpPbiAyMDE5LzEvMzAgMjM6MjcsIE5hdGhhbiBDaGFuY2VsbG9y
IHdyb3RlOgo+IE9uIFdlZCwgSmFuIDMwLCAyMDE5IGF0IDEwOjMyOjIwQU0gKzAxMDAsIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4+IEhpIExpYW5nLCBOYXRoYW4sCj4+Cj4+IExpYW5nIFlhbmcgPGxp
YW5nLnlhbmdAYW1sb2dpYy5jb20+IHdyb3RlIG9uIFdlZCwgMzAgSmFuIDIwMTkgMTc6MjY6MzkK
Pj4gKzA4MDA6Cj4+Cj4+PiBIaSBOYXRoYW4sCj4+Pgo+Pj4gT24gMjAxOS8xLzMwIDU6NDYsIE5h
dGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+Pj4+IE9uIGFybSBsaXR0bGUgZW5kaWFuIGFsbHllc2Nv
bmZpZzoKPj4+Pgo+Pj4+ICAgICBsZC5sbGQ6IGVycm9yOiB1bmRlZmluZWQgc3ltYm9sOiBfX2Fl
YWJpX3VsZGl2bW9kCj4+Pj4gICAgID4+PiByZWZlcmVuY2VkIGJ5IG1lc29uX25hbmQuYwo+Pj4+
ICAgICA+Pj4gbXRkL25hbmQvcmF3L21lc29uX25hbmQubzoobWVzb25fbmZjX3NldHVwX2RhdGFf
aW50ZXJmYWNlKSBpbiBhcmNoaXZlIGRyaXZlcnMvYnVpbHQtaW4uYQo+Pj4+Cj4+Pj4gVGhlIGRp
dmlkZW5kIHRCRVJTX21heCBpcyB1NjQsIG1lYW5pbmcgd2UgbmVlZCB0byB1c2UgRElWX1JPVU5E
X1VQX1VMTAo+Pj4+ICh3aGljaCB3cmFwcyBkb19kaXYpIHRvIHByZXZlbnQgdGhlIGNvbXBpbGVy
IGZyb20gZW1pdHRpbmcKPj4+PiBfX2FlYmlfdWxkaXZtb2QuCj4+Pj4KPj4+PiBGaXhlczogMmQ1
NzBiMzRiNDFhICgibXRkOiByYXduYW5kOiBtZXNvbjogYWRkIHN1cHBvcnQgZm9yIEFtbG9naWMg
TkFORCBmbGFzaCBjb250cm9sbGVyIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNl
bGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDQgKystLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bWVzb25fbmFuZC5jCj4+Pj4gaW5kZXggZTg1OGQ1OGQ5N2IwLi42ZjEyYTk2MTk1ZDEgMTAwNjQ0
Cj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4gQEAgLTExMTYsOCArMTExNiw4
IEBAIGludCBtZXNvbl9uZmNfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAq
bmFuZCwgaW50IGNzbGluZSwKPj4+PiAgICAJCQkJICAgICAgIGRpdiAqIE5GQ19DTEtfQ1lDTEUp
Owo+Pj4+ICAgIAltZXNvbl9jaGlwLT50YWRsID0gRElWX1JPVU5EX1VQKFBTRUNfVE9fTlNFQyh0
aW1pbmdzLT50QURMX21pbiksCj4+Pj4gICAgCQkJCQlkaXYgKiBORkNfQ0xLX0NZQ0xFKTsKPj4+
PiAtCXRiZXJzX2Nsb2NrcyA9IERJVl9ST1VORF9VUChQU0VDX1RPX05TRUModGltaW5ncy0+dEJF
UlNfbWF4KSwKPj4+PiAtCQkJCSAgICBkaXYgKiBORkNfQ0xLX0NZQ0xFKTsKPj4+PiArCXRiZXJz
X2Nsb2NrcyA9IERJVl9ST1VORF9VUF9VTEwoUFNFQ19UT19OU0VDKHRpbWluZ3MtPnRCRVJTX21h
eCksCj4+Pj4gKwkJCQkJZGl2ICogTkZDX0NMS19DWUNMRSk7Cj4+Pgo+Pj4gTG9va3MgZ29vZCB0
byBtZToKPj4+Cj4+PiBBY2tlZC1ieTogTGlhbmcgWWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNv
bT4KPj4KPj4gVGhpcyBpcyBuYW5kL25leHQgbWF0ZXJpYWwsIHNvIGlmIHlvdSBkb24ndCBtaW5k
IEkgd291bGQgbGlrZSB0byBzcXVhc2gKPj4gdGhpcyBmaXggaW50byB0aGUgb3JpZ2luYWwgY29t
bWl0IGluc2VydGluZyB0aGUgZHJpdmVyLgo+Pgo+Pgo+PiBUaGFua3MsCj4+IE1pcXXDqGwKPiAK
PiBIaSBNaXF1ZWwsCj4gCj4gVGhhdCBpcyB0b3RhbGx5IGZpbmUgYnkgbWUsIHRoYW5rcyBmb3Ig
dGhlIHF1aWNrIHJlc3BvbnNlIQo+IAo+IE5hdGhhbgo+IAppdCBpcyBvayB3aXRoIG1lLgo+IC4K
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
