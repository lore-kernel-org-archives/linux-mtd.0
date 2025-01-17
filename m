Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB65C02185
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2025 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goJOfdTOJOXBxkefdTYqpCdYl2tsDxjwRUmTJnU8vDg=; b=xPSEUPAo6LW5hv
	v85wCSy1DRfrSgMwtQabs4cmRgD+DI6hwGKxF012Cjv6lLfKCJvT7ZFBw8SME0vBDmZ/9EoDU8Fzm
	VBq+NzxKdIVmTSaKmXOdOT8pNmUJL4ejUrKlWsJI+A4FcCD2ps4PyGQt0f1PzEx65sYVjHEMhFD3A
	XlqyU9NrdOdUqjvToGgmeZ4r10tJZnbM8yhpnX7wqx9OxJYXjyQgFF61kSDdFxEw37uMK9hc/tcek
	CbdEr3wRuxcdTlkfNaGcN5YnJHlYXxp1HwlW8vRLzjAWQ51IAHOIGmOBTG+GmY7K+f29KTxPTDOM7
	xbBWTx1O+yN7kisbuEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYr2t-000000013uu-0pfZ;
	Fri, 17 Jan 2025 18:26:15 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYr2q-000000013uB-18Sf
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jan 2025 18:26:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A52CF60002;
	Fri, 17 Jan 2025 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737138369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XLrilTvSeVgL95ft30Ux+KpvfhUSLP8ehfo9grmap8c=;
	b=R2/9Zf07APhYrnskerwpgKcLM/ipA17GWDknh9yipWHE1xUOzaEY1IXGFZYUtOi2jiaohs
	IVyFLCN5BWgmKaJqBa+QDbixd5wtXixZ7mrKgNCYA62HzxhakepQube4+/uOJIYU6ycwqh
	0ZmBXgvzhZ6/5ruo1nBox3Wm8NrZgQDZCn/NI53TuZWwRsxp6/khs/tN2/3U/n+ETREZ15
	BPuvu+fmQ5SpbExipkZ+c4WPsQsLi/zKGaJO7LWGCyndzE4a615ANBRvAN85HYbrqDom04
	2KqsI+Ny3s+ZdVz2SM3wuwf0U/dRcMwDwyePeScIJFotRyCKXLBmSH1gU1M0qw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-media@vger.kernel.org
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
	(Keguang Zhang's message of "Fri, 17 Jan 2025 19:58:39 +0800")
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
	<20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
	<87v7ufnc0w.fsf@bootlin.com>
	<CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 17 Jan 2025 19:26:08 +0100
Message-ID: <87plkli9fj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_102612_707136_A459FA68 
X-CRM114-Status: GOOD (  21.18  )
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

T24gMTcvMDEvMjAyNSBhdCAxOTo1ODozOSArMDgsIEtlZ3VhbmcgWmhhbmcgPGtlZ3Vhbmcuemhh
bmdAZ21haWwuY29tPiB3cm90ZToKCj4gSGVsbG8gTWlxdWVsLAo+Cj4gT24gVGh1LCBKYW4gMTYs
IDIwMjUgYXQgMjo1NOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+Pgo+PiBIZWxsbyBLZWd1YW5nLAo+Pgo+PiBPbiAxNy8xMi8yMDI0IGF0IDE4
OjE2OjUwICswOCwgS2VndWFuZyBaaGFuZyB2aWEgQjQgUmVsYXkgPGRldm51bGwra2VndWFuZy56
aGFuZy5nbWFpbC5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+ID4gK3N0YXRpYyBpbnQgbHMx
eF9uYW5kX29wX2NtZF9tYXBwaW5nKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHN0cnVjdCBsczF4
X25hbmRfb3AgKm9wLCB1OCBvcGNvZGUpCj4+ID4gK3sKPj4gPiArICAgICBzdHJ1Y3QgbHMxeF9u
YW5kX2hvc3QgKmhvc3QgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4+ID4gKyAg
ICAgaW50IHJldCA9IDA7Cj4+Cj4+IFRoaXMgcmV0dXJuIGNvZGUgaXMgdW51c2VkLgo+Pgo+PiA+
ICsKPj4gPiArICAgICBvcC0+cm93X3N0YXJ0ID0gY2hpcC0+cGFnZV9zaGlmdCArIDE7Cj4+ID4g
Kwo+PiA+ICsgICAgIC8qIFRoZSBjb250cm9sbGVyIGFic3RyYWN0cyB0aGUgZm9sbG93aW5nIE5B
TkQgb3BlcmF0aW9ucy4gKi8KPj4gPiArICAgICBzd2l0Y2ggKG9wY29kZSkgewo+PiA+ICsgICAg
IGNhc2UgTkFORF9DTURfU1RBVFVTOgo+PiA+ICsgICAgICAgICAgICAgb3AtPmNtZF9yZWcgPSBM
UzFYX05BTkRfQ01EX1NUQVRVUzsKPj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+PiA+ICsgICAg
IGNhc2UgTkFORF9DTURfUkVTRVQ6Cj4+ID4gKyAgICAgICAgICAgICBvcC0+Y21kX3JlZyA9IExT
MVhfTkFORF9DTURfUkVTRVQ7Cj4+ID4gKyAgICAgICAgICAgICBicmVhazsKPj4gPiArICAgICBj
YXNlIE5BTkRfQ01EX1JFQURJRDoKPj4gPiArICAgICAgICAgICAgIG9wLT5pc19yZWFkaWQgPSB0
cnVlOwo+PiA+ICsgICAgICAgICAgICAgb3AtPmNtZF9yZWcgPSBMUzFYX05BTkRfQ01EX1JFQURJ
RDsKPj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+PiA+ICsgICAgIGNhc2UgTkFORF9DTURfRVJB
U0UxOgo+PiA+ICsgICAgICAgICAgICAgb3AtPmlzX2VyYXNlID0gdHJ1ZTsKPj4gPiArICAgICAg
ICAgICAgIG9wLT5hZGRyc19vZmZzZXQgPSAyOwo+PiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4+
ID4gKyAgICAgY2FzZSBOQU5EX0NNRF9FUkFTRTI6Cj4+ID4gKyAgICAgICAgICAgICBpZiAoIW9w
LT5pc19lcmFzZSkKPj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+PiA+ICsgICAgICAgICAgICAgLyogRHVyaW5nIGVyYXNpbmcsIHJvd19zdGFydCBkaWZmZXJz
IGZyb20gdGhlIGRlZmF1bHQgdmFsdWUuICovCj4+Cj4+IC4uLgo+Pgo+PiA+ICtzdGF0aWMgdm9p
ZCBsczF4X25hbmRfdHJpZ2dlcl9vcChzdHJ1Y3QgbHMxeF9uYW5kX2hvc3QgKmhvc3QsIHN0cnVj
dCBsczF4X25hbmRfb3AgKm9wKQo+PiA+ICt7Cj4+ID4gKyAgICAgc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCA9ICZob3N0LT5jaGlwOwo+PiA+ICsgICAgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFu
ZF90b19tdGQoY2hpcCk7Cj4+ID4gKyAgICAgaW50IGNvbDAgPSBvcC0+YWRkcnNbMF07Cj4+ID4g
KyAgICAgc2hvcnQgY29sOwo+PiA+ICsKPj4gPiArICAgICAvKiByZXN0b3JlIHJvdyBhZGRyZXNz
IGZvciBjb2x1bW4gY2hhbmdlICovCj4+ID4gKyAgICAgaWYgKG9wLT5pc19jaGFuZ2VfY29sdW1u
KSB7Cj4+ID4gKyAgICAgICAgICAgICBvcC0+YWRkcjJfcmVnID0gcmVhZGwoaG9zdC0+cmVnX2Jh
c2UgKyBMUzFYX05BTkRfQUREUjIpOwo+PiA+ICsgICAgICAgICAgICAgb3AtPmFkZHIxX3JlZyA9
IHJlYWRsKGhvc3QtPnJlZ19iYXNlICsgTFMxWF9OQU5EX0FERFIxKTsKPj4gPiArICAgICAgICAg
ICAgIG9wLT5hZGRyMV9yZWcgJj0gfihtdGQtPndyaXRlc2l6ZSAtIDEpOwo+PiA+ICsgICAgIH0K
Pj4KPj4gVGhpcyBsb29rcyB2ZXJ5IHN1c3BpY2lvdXMuIFlvdSBzaG91bGQgbm90IGhhdmUgdG8g
ZG8gdGhhdCBhbmQgdG8gYmUKPj4gaG9uZXN0LCBJIGRvbid0IHVuZGVydGFuZCB3aGF0IHRoaXMg
bWVhbnMuCj4+Cj4gVGhlIExvb25nc29uLTEgTkFORCBjb250cm9sbGVyIHJlcXVpcmVzIGEgZnVs
bCBhZGRyZXNzIChjb2x1bW4gYWRkcmVzcwo+ICsgcm93IGFkZHJlc3MpLgo+IEhvd2V2ZXIsIG5h
bmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkgZnVuY3Rpb24gb25seSBwcm92aWRlcyB0aGUKPiBj
b2x1bW4gYWRkcmVzcy4gVGhlcmVmb3JlLCB0aGUgcm93IGFkZHJlc3MgbXVzdCBiZSByZXN0b3Jl
ZC4KPiBUaGUgYWJvdmUgbG9naWMgcmV0cmlldmVzIHRoZSByb3cgYWRkcmVzcyBmcm9tIHRoZSBh
ZGRyMV9yZWcgaW4gb3JkZXIKPiB0byByZXN0b3JlIHRoZSByb3cgYWRkcmVzcy4KCklmIGl0IG5l
ZWRzIHRoZSBmdWxsIG9mZnNldCwgaXQncyBwcm9iYWJseSBub3QgYSBjaGFuZ2UgY29sdW1uCmNv
bW1hbmQuCgpXaGF0IHlvdSBkbyBoZXJlIGlzIHZlcnkgcmlza3kgYW5kIGNsZWFybHkgbm90IGZ1
dHVyZSBwcm9vZiwgSSdkIHByZWZlcgp0byBhdm9pZCBpdC4gSWYgYW55dGhpbmcgaGFwcGVucyBp
biB0aGUgY29yZSBiZXR3ZWVuIHRoZSByZWFkMCBhbmQgdGhlCmNvbHVtbiBjaGFuZ2UsIHlvdXIg
bG9naWMgYnJlYWtzLCBhbmQgdGhlcmUgYXJlIGNoYW5jZXMgdGhhdCB0aGlzIHdpbGwKaGFwcGVu
IGF0IHNvbWUgcG9pbnQuCgpBcmUgeW91IHN1cmUgeW91IGltcGxlbWVudGVkIGl0IGNvcnJlY3Rs
eT8gV2hhdCBpZiB5b3UgcHJvdmlkZSAwIGFzIHBhZ2UKb2Zmc2V0PyBJZiB0aGVyZSBpcyBubyBj
aGFuZ2UgY29sdW1uIHBvc3NpYmxlLCBtYXliZSB0aGUgYmVzdCB0aGluZyBpcwp0byBub3Qgc3Vw
cG9ydCBpdC4KCi4uLgoKPj4gPiArc3RhdGljIGludCBsczF4X25hbmRfY29udHJvbGxlcl9pbml0
KHN0cnVjdCBsczF4X25hbmRfaG9zdCAqaG9zdCkKPj4gPiArewo+PiA+ICsgICAgIHN0cnVjdCBk
ZXZpY2UgKmRldiA9IGhvc3QtPmRldjsKPj4gPiArICAgICBzdHJ1Y3QgZG1hX2NoYW4gKmNoYW47
Cj4+ID4gKyAgICAgc3RydWN0IGRtYV9zbGF2ZV9jb25maWcgY2ZnID0ge307Cj4+ID4gKyAgICAg
aW50IHJldDsKPj4gPiArCj4+ID4gKyAgICAgaG9zdC0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5p
dF9tbWlvKGRldiwgaG9zdC0+cmVnX2Jhc2UsICZsczF4X25hbmRfcmVnbWFwX2NvbmZpZyk7Cj4+
ID4gKyAgICAgaWYgKElTX0VSUihob3N0LT5yZWdtYXApKQo+PiA+ICsgICAgICAgICAgICAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGhvc3QtPnJlZ21hcCksICJmYWlsZWQgdG8g
aW5pdCByZWdtYXBcbiIpOwo+PiA+ICsKPj4gPiArICAgICBjaGFuID0gZG1hX3JlcXVlc3RfY2hh
bihkZXYsICJyeHR4Iik7Cj4+ID4gKyAgICAgaWYgKElTX0VSUihjaGFuKSkKPj4gPiArICAgICAg
ICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihjaGFuKSwgImZhaWxlZCB0
byByZXF1ZXN0IERNQSBjaGFubmVsXG4iKTsKPj4gPiArICAgICBob3N0LT5kbWFfY2hhbiA9IGNo
YW47Cj4+ID4gKwo+PiA+ICsgICAgIGNmZy5zcmNfYWRkciA9IGhvc3QtPmRtYV9iYXNlOwo+PiA+
ICsgICAgIGNmZy5zcmNfYWRkcl93aWR0aCA9IERNQV9TTEFWRV9CVVNXSURUSF80X0JZVEVTOwo+
PiA+ICsgICAgIGNmZy5kc3RfYWRkciA9IGhvc3QtPmRtYV9iYXNlOwo+Pgo+PiBEb24ndCB5b3Ug
bmVlZCBhIGRtYV9hZGRyX3QgaGVyZSBpbnN0ZWFkPyBZb3Ugc2hhbGwgcmVtYXAgdGhlIHJlc291
cmNlLgo+Pgo+IFNvcnJ5LCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQuCj4gJ2RtYV9iYXNlJyBp
cyBhbHJlYWR5IG9mIHR5cGUgZG1hX2FkZHJfdC4KCkkgZGlkbid0IGlkZW50aWZ5IHdoZXJlIHRo
ZSBkbWFfYmFzZSB3YXMgcmVtYXBwZWQsIGJ1dCBpZiB0aGF0J3MgYWxyZWFkeQpkb25lIHRoZW4g
d2UncmUgZ29vZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
