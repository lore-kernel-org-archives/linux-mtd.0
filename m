Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074EAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 22:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7f6HzPNfru6gnb5wt+LkREsuwxtvb1yI0mR2Rcx1qY=; b=AqCdrV43mUD8BX
	Bm1oL4p0kVRkP7jhVeeTHmwlya5L5+ODQEwlAGADrKY2O0X7Z1eALRzHB4rPq6n503oOhBrdQr9/7
	Dp1M/IKGxFyeI0g60e80kFo+mZw2oPO0S56v7vP/4XP+s3lZvp5wAIRN91CRLTn0Uivwvh1EhBv+u
	Yh7PMgLGdmFlOIP1aTjd6d33HYSd+SPAIWRsLbFTmMHoomRdtT0rIwUf4PJRv0NdNxDeT9AXKzJLu
	HOoYfEM0hdwgt369C7yZo6qHWl6mX3Hd54sPWFc5tsp+liF/cU1OWhiO4q57x5qyIKITRK7x6Ez/f
	MmNXujkZZwcUkscitw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQGkm-00CFJE-71; Fri, 04 Mar 2022 22:50:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQGki-00CFHv-Ac
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 22:50:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9ABA5CE2E58;
 Fri,  4 Mar 2022 22:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1585FC340E9;
 Fri,  4 Mar 2022 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646434218;
 bh=f4c73Qb2h5VbumIRsVZDFSfPv+BHp7PeoO32syj+yas=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ihFYXDmH/fe7OCq5j3R0AHd2fnHrkL+SA7ygnr7lwfZlwKFKdrYgrR1dG+y8zZnUq
 k7h9hVLORJjw3XUWvdakviSZFEnl0Ejk/LlZ+QnjXXPL9WoxNBd2cGkWsN4WHmrImr
 bco3H6Z2kPUpYFPR+vR4XE7/gmZNg4WwQtDitR9wlScbuXHTi9YhPyY0MqAVvNgl32
 L0n/YDAdl1O3M5JBDCRbdTejzmO/hp+6d65Z+bXU0xMWka4mEAdv4imNOenA3JA0kc
 b82wt3/IsZwbOHb8tKxpje1IbPGzuU3KliJRU5rDiI4s3qUC/nTxbgntjvQZubHqrn
 z8Knvh6Lhjt3Q==
Message-ID: <6c09de15-1ab2-5ca8-7003-69ff3f7c4dc5@kernel.org>
Date: Sat, 5 Mar 2022 00:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>, krzysztof.kozlowski@canonical.com,
 vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
 <20220304165451.0129012e@xps13>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220304165451.0129012e@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_145024_727529_37BCB97A 
X-CRM114-Status: GOOD (  28.12  )
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

SGkgTWlxdWVsLAoKT24gMDQvMDMvMjAyMiAxNzo1NCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBHdWVudGVyLCBSb2dlciwKPiAKPiByZHVubGFwQGluZnJhZGVhZC5vcmcgd3JvdGUgb24gU2F0
LCAyNiBGZWIgMjAyMiAyMjo1NToyOCAtMDgwMDoKPiAKPj4gT24gMi8xOS8yMiAxNjo0NCwgR3Vl
bnRlciBSb2VjayB3cm90ZToKPj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAwUE0g
KzAyMDAsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6ICAKPj4+PiBUaGUgcm9vdCBvZiB0aGUgcHJvYmxl
bSBpcyB0aGF0IHdlIGFyZSBzZWxlY3Rpbmcgc3ltYm9scyB0aGF0IGhhdmUKPj4+PiBkZXBlbmRl
bmNpZXMuIFRoaXMgY2FuIGNhdXNlIHJhbmRvbSBjb25maWd1cmF0aW9ucyB0aGF0IGNhbiBmYWls
Lgo+Pj4+IFRoZSBjbGVhbmVzdCBzb2x1dGlvbiBpcyB0byBhdm9pZCB1c2luZyBzZWxlY3QuCj4+
Pj4KPj4+PiBUaGlzIGRyaXZlciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUgT01BUF9HUE1DIGRy
aXZlciBzbyB3ZSBoYXZlIHRvCj4+Pj4gZGVwZW5kIG9uIGl0IGluc3RlYWQuCj4+Pj4KPj4+PiBG
aXhlczogNGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5kOiBvbWFwMjogUHJldmVudCBpbnZhbGlk
IGNvbmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBRdWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4gIAo+Pj4KPj4+IFRlc3RlZC1ieTogR3VlbnRl
ciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiAgCj4+Cj4+IFRlc3RlZC1ieTogUmFuZHkgRHVu
bGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gCj4gU29ycnkgZm9yIG5vdGljaW5nIHRoYXQg
anVzdCBub3csIGJ1dCB0aGVyZSBpcyBzdGlsbCBhIHByb2JsZW0gd2l0aAo+IHRoaXMgcGF0Y2g6
IHdlIG5vdyBhbHdheXMgY29tcGlsZS1pbiB0aGUgT01BUF9HUE1DIGRyaXZlciB3aGVuZXZlciB3
ZQo+IG5lZWQgdGhlIE5BTkQgY29udHJvbGxlciwgZXZlbiB0aG91Z2ggaXQgaXMgbm90IG5lZWRl
ZC4gVGhpcyBncm93cyB0aGUKPiBrZXJuZWwgZm9yIG5vIHJlYXNvbi4KClNvcnJ5LCBJIGRpZCBu
b3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFudC4KCldlIG5vIGxvbmdlciBleHBsaWNpdGx5IGVu
YWJsZSBPTUFQX0dQTUMgc2luY2Ugd2UgZHJvcHBlZCB0aGUgInNlbGVjdCIuClRoaXMgZml4ZXMg
YWxsIGJ1aWxkIGlzc3VlcyB0aGF0IHdlcmUgcmVwb3J0ZWQgcmVjZW50bHkuCgpNVERfTkFORF9P
TUFQMiB3aWxsIG5vdCBiZSBlbmFibGVkIGlmIE9NQVBfR1BNQyBpcyBub3Qgc2luY2Ugd2UgYWRk
ZWQKdGhlICJkZXBlbmRzIG9uIi4gVGhpcyBmaXhlcyB0aGUgb3JpZ2luYWwgYnVpbGQgaXNzdWUg
dGhhdCB3ZSBzdGFydGVkIHRvCmZpeCB3aXRoIHNlbGVjdCBpbml0aWFsbHkuCgo+IAo+IEluIGZh
Y3QsIFJvZ2VyIG9uY2Ugc2FpZDoKPiAKPiAJIldlIHdpbGwgZmlndXJlIG91dCBob3cgdG8gZW5h
YmxlIE9NQVBfR1BNQyBmb3IgSzMgYXJjaGl0ZWN0dXJlCj4gCXNvbWUgb3RoZXIgd2F5LiIKPiAK
PiBJdCB0dXJucyBvdXQgdGhpcyBpcyBub3Qgd2hhdCB3YXMgZmluYWxseSBwcm9wb3NlZC4gQ291
bGQgd2UgdHJ5IHlldAo+IGFub3RoZXIgc29sdXRpb24/CgpUaGlzIGlzc3VlIGlzIHN0aWxsIHBy
ZXNlbnQgaS5lLiB3ZSBjYW5ub3QgZW5hYmxlIE1URF9OQU5EX09NQVAyIGRyaXZlciBvbgpLMyBw
bGF0Zm9ybSBzaW5jZSBPTUFQX0dQTUMgY29uZmlnIGlzIGhpZGRlbiBhbmQgbm90IHNlbGVjdC1h
YmxlCmJ5IHVzZXIgb3IgZGVmY29uZmlnIGZpbGUuCgpCdXQgaXQgaXMgbm90IHlldCBhIGRlYWwg
YnJlYWtlciBzaW5jZSBOQU5EIG9uIEszIGlzIG5vdCB5ZXQgZW5hYmxlZCB1cHN0cmVhbS4KCkZv
ciB0aGlzIEkgdGhpbmsgT01BUF9HUE1DIGhhcyB0byBiZSBhIHZpc2libGUgY29uZmlnIGVudHJ5
IGFuZCBzZWxlY3QtYWJsZQpmcm9tIGEgZGVmY29uZmlnIGZpbGUgYXMgSSBoYWQgZG9uZSBpbml0
aWFsbHkgWzFdLgoKTm93IHdlIGhhdmUgYSBsb3Qgb2YgZXhwbGFuYXRpb24gdG8gd3JpdGUgYXMg
dG8gd2h5IHdlIG5lZWQgdG8gZG8gaXQgOykKClsxXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyMTExMjMxMDI2MDcuMTMwMDItMy1yb2dlcnFAa2VybmVsLm9yZy8KCj4gCj4+Cj4+
IFRoYW5rcy4KPj4KPj4+ICAgCj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcgfCAzICstLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2Nv
bmZpZyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPj4+PiBpbmRleCAzNmU2OTc0NTZl
YzQuLjliMDc4ZTc4ZjNmYSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9L
Y29uZmlnCj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+Pj4+IEBAIC00
Miw4ICs0Miw3IEBAIGNvbmZpZyBNVERfTkFORF9PTUFQMgo+Pj4+ICAJdHJpc3RhdGUgIk9NQVAy
LCBPTUFQMywgT01BUDQgYW5kIEtleXN0b25lIE5BTkQgY29udHJvbGxlciIKPj4+PiAgCWRlcGVu
ZHMgb24gQVJDSF9PTUFQMlBMVVMgfHwgQVJDSF9LRVlTVE9ORSB8fCBBUkNIX0szIHx8IENPTVBJ
TEVfVEVTVAo+Pj4+ICAJZGVwZW5kcyBvbiBIQVNfSU9NRU0KPj4+PiAtCXNlbGVjdCBNRU1PUlkK
Pj4+PiAtCXNlbGVjdCBPTUFQX0dQTUMKPj4+PiArCWRlcGVuZHMgb24gT01BUF9HUE1DCj4+Pj4g
IAloZWxwCj4+Pj4gIAkgIFN1cHBvcnQgZm9yIE5BTkQgZmxhc2ggb24gVGV4YXMgSW5zdHJ1bWVu
dHMgT01BUDIsIE9NQVAzLCBPTUFQNAo+Pj4+ICAJICBhbmQgS2V5c3RvbmUgcGxhdGZvcm1zLgo+
Pj4+IC0tIAo+Pj4+IDIuMTcuMQo+Pj4+ICAKPj4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCmNo
ZWVycywKLXJvZ2VyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
