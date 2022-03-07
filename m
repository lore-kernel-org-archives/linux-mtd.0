Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A25C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PL+UjUmbwPQEodMj3Pkp6YuCfvZZvyuvuCZblRY9X4=; b=TizO4zW2p8D02U
	KTsYpTQWAVpMXkonoN7NxXS8I1rbG/Q2GYV2tfvUgQkaQ0BT3IXEB2twEAAbIhYREPSIKgV2iyHsE
	O+aUVEP9Di+v9HhQdo8DfO/fZXDQbuCBY26Jegkan7f/ff5Re4VhqhRY1MdRBPPja2Z2VfxKKC66R
	E1KrqrwqKWLW6hOIYx0qrvr5LNVU3vorZD87hpjSaL3Yv45rzv7hzSclLJ1z9GS8va6Wl+HSpvXE0
	ExBxBa/OxFXYyHg0rdL29zbwQJZYt2OEmtSThoW9XKSOwHYQ6vhzecr0iZqKEXREGJu7lOiVqFQlk
	bs4gdacf70Ywhs0fdA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRADo-00GwS8-Pw; Mon, 07 Mar 2022 10:04:08 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRADl-00GwQ1-7d
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 10:04:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55757C0013;
 Mon,  7 Mar 2022 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646647439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4uHhj1CCnWZRfuCOfp7/fI/39ufjP0eZTALccVmhWQ=;
 b=MztK9YvLBUH4+wVXdxK6nOXMPfVOI20sAv/B6KNgGuEOTfdLW9NgvtQM8s7PQWRlTvzd0s
 9msa//FvEya7xsl4NTWSr8mCJBXIbHjgXT7aStZHE9YkwDvdyLy8XVv9uyyU23o0Gf0+9l
 jzU6l6IClC8p6RZVHmHjIokpclErEf7hGHPkGv3SmEfIVAPCJxWl8nBFTFJAJda7KwVpX/
 y3xydcno1zLCl4rURCaEEvmM/gd0T495TJRRiRltSsf2AEahBeBqYVm7vG+XDNyxSctMwq
 RHBl2KE1ilMCzugA0wGKUF1v/rzplhGC1CzeQf0XCcuHUudzKE+E/qxyiWX0iw==
Date: Mon, 7 Mar 2022 11:03:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck
 <linux@roeck-us.net>, krzysztof.kozlowski@canonical.com, vigneshr@ti.com,
 nm@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Message-ID: <20220307110357.20d50176@xps13>
In-Reply-To: <6c09de15-1ab2-5ca8-7003-69ff3f7c4dc5@kernel.org>
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
 <20220304165451.0129012e@xps13>
 <6c09de15-1ab2-5ca8-7003-69ff3f7c4dc5@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_020405_603494_59461269 
X-CRM114-Status: GOOD (  32.08  )
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

SGkgUm9nZXIsCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBTYXQsIDUgTWFyIDIwMjIgMDA6
NTA6MTQgKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAwNC8wMy8yMDIyIDE3OjU0LCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgR3VlbnRlciwgUm9nZXIsCj4gPiAKPiA+IHJkdW5sYXBA
aW5mcmFkZWFkLm9yZyB3cm90ZSBvbiBTYXQsIDI2IEZlYiAyMDIyIDIyOjU1OjI4IC0wODAwOgo+
ID4gICAKPiA+PiBPbiAyLzE5LzIyIDE2OjQ0LCBHdWVudGVyIFJvZWNrIHdyb3RlOiAgCj4gPj4+
IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAwUE0gKzAyMDAsIFJvZ2VyIFF1YWRyb3Mg
d3JvdGU6ICAgIAo+ID4+Pj4gVGhlIHJvb3Qgb2YgdGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBhcmUg
c2VsZWN0aW5nIHN5bWJvbHMgdGhhdCBoYXZlCj4gPj4+PiBkZXBlbmRlbmNpZXMuIFRoaXMgY2Fu
IGNhdXNlIHJhbmRvbSBjb25maWd1cmF0aW9ucyB0aGF0IGNhbiBmYWlsLgo+ID4+Pj4gVGhlIGNs
ZWFuZXN0IHNvbHV0aW9uIGlzIHRvIGF2b2lkIHVzaW5nIHNlbGVjdC4KPiA+Pj4+Cj4gPj4+PiBU
aGlzIGRyaXZlciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUgT01BUF9HUE1DIGRyaXZlciBzbyB3
ZSBoYXZlIHRvCj4gPj4+PiBkZXBlbmQgb24gaXQgaW5zdGVhZC4KPiA+Pj4+Cj4gPj4+PiBGaXhl
czogNGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5kOiBvbWFwMjogUHJldmVudCBpbnZhbGlkIGNv
bmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikKPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFF1YWRyb3MgPHJvZ2VycUBrZXJuZWwub3JnPiAgICAKPiA+Pj4KPiA+Pj4gVGVzdGVkLWJ5OiBH
dWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+ICAgIAo+ID4+Cj4gPj4gVGVzdGVkLWJ5
OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gIAo+ID4gCj4gPiBTb3JyeSBm
b3Igbm90aWNpbmcgdGhhdCBqdXN0IG5vdywgYnV0IHRoZXJlIGlzIHN0aWxsIGEgcHJvYmxlbSB3
aXRoCj4gPiB0aGlzIHBhdGNoOiB3ZSBub3cgYWx3YXlzIGNvbXBpbGUtaW4gdGhlIE9NQVBfR1BN
QyBkcml2ZXIgd2hlbmV2ZXIgd2UKPiA+IG5lZWQgdGhlIE5BTkQgY29udHJvbGxlciwgZXZlbiB0
aG91Z2ggaXQgaXMgbm90IG5lZWRlZC4gVGhpcyBncm93cyB0aGUKPiA+IGtlcm5lbCBmb3Igbm8g
cmVhc29uLiAgCj4gCj4gU29ycnksIEkgZGlkIG5vdCB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW50
Lgo+IAo+IFdlIG5vIGxvbmdlciBleHBsaWNpdGx5IGVuYWJsZSBPTUFQX0dQTUMgc2luY2Ugd2Ug
ZHJvcHBlZCB0aGUgInNlbGVjdCIuCj4gVGhpcyBmaXhlcyBhbGwgYnVpbGQgaXNzdWVzIHRoYXQg
d2VyZSByZXBvcnRlZCByZWNlbnRseS4KPiAKPiBNVERfTkFORF9PTUFQMiB3aWxsIG5vdCBiZSBl
bmFibGVkIGlmIE9NQVBfR1BNQyBpcyBub3Qgc2luY2Ugd2UgYWRkZWQKPiB0aGUgImRlcGVuZHMg
b24iLiBUaGlzIGZpeGVzIHRoZSBvcmlnaW5hbCBidWlsZCBpc3N1ZSB0aGF0IHdlIHN0YXJ0ZWQg
dG8KPiBmaXggd2l0aCBzZWxlY3QgaW5pdGlhbGx5LgoKWWVzLCB0aGlzIHNpZGUgaXMgZmluZS4K
CkluIHRoZSBpbml0aWFsIGNvbW1pdCwgeW91IHByb3Bvc2VkOgoKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvS2NvbmZpZworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCkBAIC00
Miw3ICs0Miw4IEBAIGNvbmZpZyBNVERfTkFORF9PTUFQMgogICAgICAgIHRyaXN0YXRlICJPTUFQ
MiwgT01BUDMsIE9NQVA0IGFuZCBLZXlzdG9uZSBOQU5EIGNvbnRyb2xsZXIiCiAgICAgICAgZGVw
ZW5kcyBvbiBBUkNIX09NQVAyUExVUyB8fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwgQ09N
UElMRV9URVNUCiAgICAgICAgZGVwZW5kcyBvbiBIQVNfSU9NRU0KKyAgICAgICBzZWxlY3QgT01B
UF9HUE1DIGlmIEFSQ0hfSzMKCldoaWNoIGNyZWF0ZXMgYSBkZXBlbmRlbmN5IG92ZXIgT01BUF9H
UE1DIG9ubHkgZm9yIGEgc2luZ2xlCmFyY2hpdGVjdHVyZS4gV2hpY2ggbWVhbnMgdGhhdCBvdGhl
ciBPTUFQIHBsYXRmb3JtcyBkbyBub3QgbmVjZXNzYXJpbHkKbmVlZCBPTUFQX0dQTUMgZm9yIHRo
ZSBOQU5EIGNvbnRyb2xsZXIgdG8gd29yay4gTm93LCB5b3UgcHJvcG9zZToKCi0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L0tjb25maWcKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZp
ZwpAQCAtNDIsOCArNDIsNyBAQCBjb25maWcgTVREX05BTkRfT01BUDIKIAl0cmlzdGF0ZSAiT01B
UDIsIE9NQVAzLCBPTUFQNCBhbmQgS2V5c3RvbmUgTkFORCBjb250cm9sbGVyIgogCWRlcGVuZHMg
b24gQVJDSF9PTUFQMlBMVVMgfHwgQVJDSF9LRVlTVE9ORSB8fCBBUkNIX0szIHx8IENPTVBJTEVf
VEVTVAogCWRlcGVuZHMgb24gSEFTX0lPTUVNCglkZXBlbmRzIG9uIE9NQVBfR1BNQwoKVGhpcyBt
ZWFucyBhbnkgb2YgdGhlIG90aGVyIE9NQVAgYXJjaGl0ZWN0dXJlcyB3aWxsIGNvbXBpbGUgdGhl
IEdQTUMKZHJpdmVyIGV2ZW4gdGhvdWdoIHRoZXkgbWlnaHQgbm90IG5lZWQgaXQsIHdoaWNoIHdv
dWxkIHVubmVjZXNzYXJpbHkKaW5jcmVhc2UgdGhlIGtlcm5lbCBzaXplLgoKQW0gSSBtaXNzaW5n
IHNvbWV0aGluZz8KCj4gPiBJbiBmYWN0LCBSb2dlciBvbmNlIHNhaWQ6Cj4gPiAKPiA+IAkiV2Ug
d2lsbCBmaWd1cmUgb3V0IGhvdyB0byBlbmFibGUgT01BUF9HUE1DIGZvciBLMyBhcmNoaXRlY3R1
cmUKPiA+IAlzb21lIG90aGVyIHdheS4iCj4gPiAKPiA+IEl0IHR1cm5zIG91dCB0aGlzIGlzIG5v
dCB3aGF0IHdhcyBmaW5hbGx5IHByb3Bvc2VkLiBDb3VsZCB3ZSB0cnkgeWV0Cj4gPiBhbm90aGVy
IHNvbHV0aW9uPyAgCj4gCj4gVGhpcyBpc3N1ZSBpcyBzdGlsbCBwcmVzZW50IGkuZS4gd2UgY2Fu
bm90IGVuYWJsZSBNVERfTkFORF9PTUFQMiBkcml2ZXIgb24KPiBLMyBwbGF0Zm9ybSBzaW5jZSBP
TUFQX0dQTUMgY29uZmlnIGlzIGhpZGRlbiBhbmQgbm90IHNlbGVjdC1hYmxlCj4gYnkgdXNlciBv
ciBkZWZjb25maWcgZmlsZS4KPiAKPiBCdXQgaXQgaXMgbm90IHlldCBhIGRlYWwgYnJlYWtlciBz
aW5jZSBOQU5EIG9uIEszIGlzIG5vdCB5ZXQgZW5hYmxlZCB1cHN0cmVhbS4KPiAKPiBGb3IgdGhp
cyBJIHRoaW5rIE9NQVBfR1BNQyBoYXMgdG8gYmUgYSB2aXNpYmxlIGNvbmZpZyBlbnRyeSBhbmQg
c2VsZWN0LWFibGUKPiBmcm9tIGEgZGVmY29uZmlnIGZpbGUgYXMgSSBoYWQgZG9uZSBpbml0aWFs
bHkgWzFdLgo+IAo+IE5vdyB3ZSBoYXZlIGEgbG90IG9mIGV4cGxhbmF0aW9uIHRvIHdyaXRlIGFz
IHRvIHdoeSB3ZSBuZWVkIHRvIGRvIGl0IDspCgpXZSBjZXJ0YWlubHkgZG8gOikKCj4gWzFdIC0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMTEyMzEwMjYwNy4xMzAwMi0zLXJvZ2Vy
cUBrZXJuZWwub3JnLwo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
