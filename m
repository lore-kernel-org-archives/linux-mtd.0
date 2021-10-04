Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662D3C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 16:23:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D82206124D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 16:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D82206124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=3e8.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goLYfMy0WkOH1k8omNW6Mrh9+wCmsR9R8Cd4J8gQgbg=; b=G5oHlIwnZ4J313
	pdaFDKrUBvVzAcLw98QcpIkKi40EVTps+9Vyizqig3Y2E7OoXbbLPcDRlt3x5yPVMeUr6Xw9Xn0wO
	7wAwRuF8ROulL/lkIPbsCJFmvJvm9jLpw9hKHj+uH0E92aCZo4UN9ed3OpWeA0voYEeYh/iaM5++j
	l9BhFqR7n9+OSWbqHyNeFr33iLBclnxmPRzjAr9vWFG1hL8fQPrEDkwA8pqsET2TTxxHrY/fk6WXv
	GBWmJxmZS9xtA5TZBcLKpMUzcKv9Hwq+uTu2p+pdHRvKePHy4cw2LBtRwePWebQ5li/6QGk4vKtqi
	l7shEdb86/hADUGti6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXQjC-0074TY-NL; Mon, 04 Oct 2021 16:22:10 +0000
Received: from srv4.3e8.eu ([2001:67c:12a0:200::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXQj7-0074OG-Fo
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 16:22:09 +0000
Received: from [IPV6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734]
 (p200300c6cf1205a09abc95836f0ac734.dip0.t-ipconnect.de
 [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734])
 (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits))
 (No client certificate requested)
 by srv4.3e8.eu (Postfix) with ESMTPSA id 0F4D86002D;
 Mon,  4 Oct 2021 18:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3e8.eu;
 s=mail20170724; t=1633364499;
 bh=7S7LOgvK7iNZhzXkgYBc06MPzFkxnPh65XnsimcMjl8=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=aXHcuvdEIRuf4TsPVWaNEMRS0kJc/j4KGyWK3z8MFgaSGSWHYwEMWeDuD5aBbGNuK
 rmIZNsh1lkQ8QzVK+6RnQqLg/Kw3eOlUZoIPoc9wgbiOizbORLTQfc+UUAkJzwn1WF
 YWACHrZ7yzCwnwWiHojgTEs8BjX4bkyxTg8pv3odmTQk5BNdDcUrZK+PnC1Jj/qy/Y
 BEvF/rq/WLkiyewC70nHzdNtYAvTeVNkjRodFKAI1EP5etwmUhp6/45F54dL8tt6ya
 yG3AmT1DhaOr/vw/QiqtCAJOPX0hzYeOl1Mli5J0Shab+s+AsQkDf9NT9dAdzdkVon
 wMNCUQ7/NBYeA==
Message-ID: <62e191eb-6e85-0c7f-7447-dc2106bb0a4d@3e8.eu>
Date: Mon, 4 Oct 2021 18:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kestrel seventyfour <kestrelseventyfour@gmail.com>
References: <20210928222258.199726-1-miquel.raynal@bootlin.com>
 <20210928222258.199726-10-miquel.raynal@bootlin.com>
 <20211004174048.608b07ef@xps13>
From: Jan Hoffmann <jan@3e8.eu>
Subject: Re: [PATCH 9/9] mtd: rawnand: xway: Keep the driver compatible with
 on-die ECC engines
In-Reply-To: <20211004174048.608b07ef@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_092205_905082_7EEFB6E1 
X-CRM114-Status: GOOD (  29.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCj4gSGkgSmFuLAo+IAo+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3Jv
dGUgb24gV2VkLCAyOSBTZXAgMjAyMSAwMDoyMjo0OCArMDIwMDoKPiAKPj4gRm9sbG93aW5nIHRo
ZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIGdlbmVyaWMgRUNDIGVuZ2luZSBpbmZyYXN0cnVjdHVyZSwg
aXQKPj4gd2FzIG5lY2Vzc2FyeSB0byByZW9yZ2FuaXplIHRoZSBjb2RlIGFuZCBtb3ZlIHRoZSBF
Q0MgY29uZmlndXJhdGlvbiBpbgo+PiB0aGUgLT5hdHRhY2hfY2hpcCgpIGhvb2suIEZhaWxpbmcg
dG8gZG8gdGhhdCBwcm9wZXJseSBsZWFkIHRvIGEgZmlyc3QKPj4gc2VyaWVzIG9mIGZpeGVzIHN1
cHBvc2VkIHRvIHN0YWJpbGl6ZSB0aGUgc2l0dWF0aW9uLiBVbmZvcnR1bmF0ZWx5LCB0aGlzCj4+
IG9ubHkgZml4ZWQgdGhlIHVzZSBvZiBzb2Z0d2FyZSBFQ0MgZW5naW5lcywgcHJldmVudGluZyBh
bnkgb3RoZXIga2luZCBvZgo+PiBlbmdpbmUgdG8gYmUgdXNlZCwgaW5jbHVkaW5nIG9uLWRpZSBv
bmVzLgo+Pgo+PiBJdCBpcyBub3cgdGltZSB0byAoZmluYWxseSkgZml4IHRoZSBzaXR1YXRpb24g
YnkgZW5zdXJpbmcgdGhhdCB3ZSBzdGlsbAo+PiBwcm92aWRlIGEgZGVmYXVsdCAoZWcuIHNvZnR3
YXJlIEVDQykgYnV0IHdpbGwgc3RpbGwgc3VwcG9ydCBkaWZmZXJlbnQKPj4gRUNDIGVuZ2luZXMg
c3VjaCBhcyBvbi1kaWUgRUNDIGVuZ2luZXMgaWYgcHJvcGVybHkgZGVzY3JpYmVkIGluIHRoZQo+
PiBkZXZpY2UgdHJlZS4KPj4KPj4gVGhlcmUgYXJlIG5vIGNoYW5nZXMgbmVlZGVkIG9uIHRoZSBj
b3JlIHNpZGUgaW4gb3JkZXIgdG8gZG8gdGhpcywgYnV0IHdlCj4+IGp1c3QgbmVlZCB0byBsZXZl
cmFnZSB0aGUgbG9naWMgdGhlcmUgd2hpY2ggYWxsb3dzOgo+PiAxLSBhIHN1YnN5c3RlbSBkZWZh
dWx0IChzZXQgdG8gSG9zdCBlbmdpbmVzIGluIHRoZSByYXcgTkFORCB3b3JsZCkKPj4gMi0gYSBk
cml2ZXIgc3BlY2lmaWMgZGVmYXVsdCAoaGVyZSBzZXQgdG8gc29mdHdhcmUgRUNDIGVuZ2luZXMp
Cj4+IDMtIGFueSB0eXBlIG9mIGVuZ2luZSByZXF1ZXN0ZWQgYnkgdGhlIHVzZXIgKGllLiBkZXNj
cmliZWQgaW4gdGhlIERUKQo+Pgo+PiBBcyB0aGUgcmF3IE5BTkQgc3Vic3lzdGVtIGhhcyBub3Qg
eWV0IGJlZW4gZnVsbHkgY29udmVydGVkIHRvIHRoZSBFQ0MKPj4gZW5naW5lIGluZnJhc3RydWN0
dXJlLCBpbiBvcmRlciB0byBwcm92aWRlIGEgZGVmYXVsdCBFQ0MgZW5naW5lIGZvciB0aGlzCj4+
IGRyaXZlciB3ZSBuZWVkIHRvIHNldCBjaGlwLT5lY2MuZW5naW5lX3R5cGUgKmJlZm9yZSogY2Fs
bGluZwo+PiBuYW5kX3NjYW4oKS4gRHVyaW5nIHRoZSBpbml0aWFsaXphdGlvbiBzdGVwLCB0aGUg
Y29yZSB3aWxsIGNvbnNpZGVyIHRoaXMKPj4gZW50cnkgYXMgdGhlIGRlZmF1bHQgZW5naW5lIGZv
ciB0aGlzIGRyaXZlci4gVGhpcyB2YWx1ZSBtYXkgb2YgY291cnNlCj4+IGJlIG92ZXJsb2FkZWQg
YnkgdGhlIHVzZXIgaWYgdGhlIHVzdWFsIERUIHByb3BlcnRpZXMgYXJlIHByb3ZpZGVkLgo+Pgo+
PiBGaXhlczogZDUyNTkxNGI1YmQ4ICgibXRkOiByYXduYW5kOiB4d2F5OiBNb3ZlIHRoZSBFQ0Mg
aW5pdGlhbGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpIikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcKPj4gQ2M6IEphbiBIb2ZmbWFubiA8amFuQDNlOC5ldT4KPiAKPiBJIHRoaW5rIHlv
dSBhbHJlYWR5IHRlc3RlZCB0aGlzIGNoYW5nZSBhbmQgdmFsaWRhdGVkIGl0LCB3b3VsZCB5b3Ug
bWluZAo+IHByb3ZpZGluZyB5b3VyIFRlc3RlZC1ieT8KClllcywgSSB0ZXN0ZWQgdGhpcyBvbiBh
IGRldmljZSB1c2luZyBzb2Z0d2FyZSBFQ0MgKEZyaXR6Ym94IDc0MTIgd2l0aApUb3NoaWJhIE5B
TkQgY2hpcCkgYW5kIG9uIGEgZGV2aWNlIHVzaW5nIG9uLWRpZSBFQ0MgKEZyaXR6Ym94IDczNjIg
U0wKd2l0aCBNaWNyb24gTkFORCBjaGlwKS4KClRlc3RlZC1ieTogSmFuIEhvZmZtYW5uIDxqYW5A
M2U4LmV1PgoKPj4gQ2M6IEtlc3RyZWwgc2V2ZW50eWZvdXIgPGtlc3RyZWxzZXZlbnR5Zm91ckBn
bWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5j
IHwgMTIgKysrKysrKysrLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3
YXlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMKPj4gaW5kZXggMjY3
NTE5NzZlNTAyLi4yMzZmZDhjNWE5NTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3h3YXlfbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5j
Cj4+IEBAIC0xNDgsOSArMTQ4LDggQEAgc3RhdGljIHZvaWQgeHdheV93cml0ZV9idWYoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdV9jaGFyICpidWYsIGludCBsZW4pCj4+ICAgCj4+ICAg
c3RhdGljIGludCB4d2F5X2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4+ICAg
ewo+PiAtCWNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7
Cj4+IC0KPj4gLQlpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQo+
PiArCWlmIChjaGlwLT5lY2MuZW5naW5lX3R5cGUgPT0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09G
VCAmJgo+PiArCSAgICBjaGlwLT5lY2MuYWxnbyA9PSBOQU5EX0VDQ19BTEdPX1VOS05PV04pCj4+
ICAgCQljaGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKPj4gICAKPj4gICAJ
cmV0dXJuIDA7Cj4+IEBAIC0yMTksNiArMjE4LDEzIEBAIHN0YXRpYyBpbnQgeHdheV9uYW5kX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgCQkgICAgfCBOQU5EX0NPTl9T
RV9QIHwgTkFORF9DT05fV1BfUCB8IE5BTkRfQ09OX1BSRV9QCj4+ICAgCQkgICAgfCBjc19mbGFn
LCBFQlVfTkFORF9DT04pOwo+PiAgIAo+PiArCS8qCj4+ICsJICogVGhpcyBkcml2ZXIgYXNzdW1l
cyB0aGF0IHRoZSBkZWZhdWx0IEVDQyBlbmdpbmUgc2hvdWxkIGJlIFRZUEVfU09GVC4KPj4gKwkg
KiBTZXQgLT5lbmdpbmVfdHlwZSBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIE5BTkQgZGV2aWNlcyBp
biBvcmRlciB0bwo+PiArCSAqIHByb3ZpZGUgYSBkcml2ZXIgc3BlY2lmaWMgZGVmYXVsdCB2YWx1
ZS4KPj4gKwkgKi8KPj4gKwlkYXRhLT5jaGlwLmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VO
R0lORV9UWVBFX1NPRlQ7Cj4+ICsKPj4gICAJLyogU2NhbiB0byBmaW5kIGV4aXN0ZW5jZSBvZiB0
aGUgZGV2aWNlICovCj4+ICAgCWVyciA9IG5hbmRfc2NhbigmZGF0YS0+Y2hpcCwgMSk7Cj4+ICAg
CWlmIChlcnIpCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKClRoYW5rcywKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
