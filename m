Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5139FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 21:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Puq1MXH34bTUdUPZCapnay/01OffWSRR5SHnNrOgbo=; b=KyJhqaZ+g5zRSa
	ih1crsje9Q5B3TiHSh6u2ptB2iey6WpfVwAEr6TIkqI94jHjv+Ms096CUTBPxmbY4tQhjEEY1GbIX
	exDsLM9bSUM9up+3tYwCcaGqKD/p3hS4/rFGW8eoyntJuXdpZfrGReZs1lDm/bi1XauWi4nCqfjpC
	UJ8sFboFt7f63u35Ceft6QZ3dLE3x9Qscc6jUezHNgNu2u+haWsdEummNtyp+Z+HruVGBLoXJxnL4
	l05J2by4eQVzp87cQpT28q5yVWFFrh+fKgqslG1k3edrF+HUZwNp/JUqkFGai/FzQZxr89+XJO6OK
	q5z8C69CH5aihinQP8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRKYG-001bdC-0O; Mon, 07 Mar 2022 21:05:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRKYD-001bcP-3a
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 21:05:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3CB361568;
 Mon,  7 Mar 2022 21:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA64C340FD;
 Mon,  7 Mar 2022 21:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646687152;
 bh=NY/LXiBfva6sib1pzjqDb5fkBqhAkuW9f39ryTvq1cc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=raHaa2HxqeRZEC1I4Bd9hL9I1bROc7qqiUnxGzBRTGIr+JiO1C/qm6rnMaNtD0QkF
 etqbmRBq7XG5sHb90ag1osCD8dXx6c+ZVIT/EuHba8HYFnhLEtDSCiRMwHl84sTfyp
 Kq7F2U1/YMLzPDh/MlcuhCfuBivVe6ExvvIfACxoWk3RtiT8lYF/jOFk1K1+H+t4un
 0roJdvY3j6+xRo/3LdTFgEjsj1Xt7+0iPK++h8r/2OrBaeQJpGmibeOE2ETk7mFyop
 ZjKsRO2wt+2lx7puqECQcVPIm3SdieW4lZxVInrNa7HmcV+hkGcU4EpIjbF8U2EKFL
 dxfXio8Dwj1xg==
Message-ID: <c91edeac-817c-d30d-ae45-f216670b9e69@kernel.org>
Date: Mon, 7 Mar 2022 23:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck <linux@roeck-us.net>, 
 krzysztof.kozlowski@canonical.com, vigneshr@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
 <20220304165451.0129012e@xps13>
 <6c09de15-1ab2-5ca8-7003-69ff3f7c4dc5@kernel.org>
 <20220307110357.20d50176@xps13>
 <c39d64f0-deef-4cae-fab7-555a48e31811@kernel.org>
 <20220307151249.7e5b7210@xps13>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220307151249.7e5b7210@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_130553_240262_11D09E1A 
X-CRM114-Status: GOOD (  28.17  )
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

SGkgTWlxdWVsLAoKT24gMDcvMDMvMjAyMiAxNjoxMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBSb2dlciwKPiAKPiByb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDcgTWFyIDIwMjIg
MTQ6MjU6NDggKzAyMDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gT24gMDcvMDMvMjAyMiAxMjow
MywgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIFJvZ2VyLAo+Pj4KPj4+IHJvZ2VycUBrZXJu
ZWwub3JnIHdyb3RlIG9uIFNhdCwgNSBNYXIgMjAyMiAwMDo1MDoxNCArMDIwMDoKPj4+ICAgCj4+
Pj4gSGkgTWlxdWVsLAo+Pj4+Cj4+Pj4gT24gMDQvMDMvMjAyMiAxNzo1NCwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+Pj4+PiBIaSBHdWVudGVyLCBSb2dlciwKPj4+Pj4KPj4+Pj4gcmR1bmxhcEBp
bmZyYWRlYWQub3JnIHdyb3RlIG9uIFNhdCwgMjYgRmViIDIwMjIgMjI6NTU6MjggLTA4MDA6Cj4+
Pj4+ICAgICAKPj4+Pj4+IE9uIDIvMTkvMjIgMTY6NDQsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6ICAg
IAo+Pj4+Pj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAwUE0gKzAyMDAsIFJvZ2Vy
IFF1YWRyb3Mgd3JvdGU6ICAgICAgCj4+Pj4+Pj4+IFRoZSByb290IG9mIHRoZSBwcm9ibGVtIGlz
IHRoYXQgd2UgYXJlIHNlbGVjdGluZyBzeW1ib2xzIHRoYXQgaGF2ZQo+Pj4+Pj4+PiBkZXBlbmRl
bmNpZXMuIFRoaXMgY2FuIGNhdXNlIHJhbmRvbSBjb25maWd1cmF0aW9ucyB0aGF0IGNhbiBmYWls
Lgo+Pj4+Pj4+PiBUaGUgY2xlYW5lc3Qgc29sdXRpb24gaXMgdG8gYXZvaWQgdXNpbmcgc2VsZWN0
Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGlzIGRyaXZlciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUg
T01BUF9HUE1DIGRyaXZlciBzbyB3ZSBoYXZlIHRvCj4+Pj4+Pj4+IGRlcGVuZCBvbiBpdCBpbnN0
ZWFkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBGaXhlczogNGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5k
OiBvbWFwMjogUHJldmVudCBpbnZhbGlkIGNvbmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikK
Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5vcmc+
ICAgICAgCj4+Pj4+Pj4KPj4+Pj4+PiBUZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4gICAgICAKPj4+Pj4+Cj4+Pj4+PiBUZXN0ZWQtYnk6IFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPiAgICAKPj4+Pj4KPj4+Pj4gU29ycnkgZm9yIG5vdGljaW5n
IHRoYXQganVzdCBub3csIGJ1dCB0aGVyZSBpcyBzdGlsbCBhIHByb2JsZW0gd2l0aAo+Pj4+PiB0
aGlzIHBhdGNoOiB3ZSBub3cgYWx3YXlzIGNvbXBpbGUtaW4gdGhlIE9NQVBfR1BNQyBkcml2ZXIg
d2hlbmV2ZXIgd2UKPj4+Pj4gbmVlZCB0aGUgTkFORCBjb250cm9sbGVyLCBldmVuIHRob3VnaCBp
dCBpcyBub3QgbmVlZGVkLiBUaGlzIGdyb3dzIHRoZQo+Pj4+PiBrZXJuZWwgZm9yIG5vIHJlYXNv
bi4gICAgCj4+Pj4KPj4+PiBTb3JyeSwgSSBkaWQgbm90IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVh
bnQuCj4+Pj4KPj4+PiBXZSBubyBsb25nZXIgZXhwbGljaXRseSBlbmFibGUgT01BUF9HUE1DIHNp
bmNlIHdlIGRyb3BwZWQgdGhlICJzZWxlY3QiLgo+Pj4+IFRoaXMgZml4ZXMgYWxsIGJ1aWxkIGlz
c3VlcyB0aGF0IHdlcmUgcmVwb3J0ZWQgcmVjZW50bHkuCj4+Pj4KPj4+PiBNVERfTkFORF9PTUFQ
MiB3aWxsIG5vdCBiZSBlbmFibGVkIGlmIE9NQVBfR1BNQyBpcyBub3Qgc2luY2Ugd2UgYWRkZWQK
Pj4+PiB0aGUgImRlcGVuZHMgb24iLiBUaGlzIGZpeGVzIHRoZSBvcmlnaW5hbCBidWlsZCBpc3N1
ZSB0aGF0IHdlIHN0YXJ0ZWQgdG8KPj4+PiBmaXggd2l0aCBzZWxlY3QgaW5pdGlhbGx5LiAgCj4+
Pgo+Pj4gWWVzLCB0aGlzIHNpZGUgaXMgZmluZS4KPj4+Cj4+PiBJbiB0aGUgaW5pdGlhbCBjb21t
aXQsIHlvdSBwcm9wb3NlZDoKPj4+Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29u
ZmlnCj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4+PiBAQCAtNDIsNyAr
NDIsOCBAQCBjb25maWcgTVREX05BTkRfT01BUDIKPj4+ICAgICAgICAgdHJpc3RhdGUgIk9NQVAy
LCBPTUFQMywgT01BUDQgYW5kIEtleXN0b25lIE5BTkQgY29udHJvbGxlciIKPj4+ICAgICAgICAg
ZGVwZW5kcyBvbiBBUkNIX09NQVAyUExVUyB8fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwg
Q09NUElMRV9URVNUCj4+PiAgICAgICAgIGRlcGVuZHMgb24gSEFTX0lPTUVNCj4+PiArICAgICAg
IHNlbGVjdCBPTUFQX0dQTUMgaWYgQVJDSF9LMwo+Pj4KPj4+IFdoaWNoIGNyZWF0ZXMgYSBkZXBl
bmRlbmN5IG92ZXIgT01BUF9HUE1DIG9ubHkgZm9yIGEgc2luZ2xlCj4+PiBhcmNoaXRlY3R1cmUu
IFdoaWNoIG1lYW5zIHRoYXQgb3RoZXIgT01BUCBwbGF0Zm9ybXMgZG8gbm90IG5lY2Vzc2FyaWx5
Cj4+PiBuZWVkIE9NQVBfR1BNQyBmb3IgdGhlIE5BTkQgY29udHJvbGxlciB0byB3b3JrLiBOb3cs
IHlvdSBwcm9wb3NlOiAgCj4+Cj4+IE5vIHRoYXQgaXMgbm90IHRydWUuIE90aGVyIHBsYXRmb3Jt
cyB0aGF0IG5lZWQgTVREX05BTkRfT01BUDIgYXJlCj4+IGV4cGxpY2l0bHkgc2VsZWN0aW5nIE9N
QVBfR1BNQwo+PiBpLmUuIGluIGFyY2gvYXJtL21hY2gtb21hcDIvS2NvbmZpZwo+IAo+IE9rYXks
IGluIHRoaXMgY2FzZSB0aGUgZml4IGlzIGZpbmUgYnV0IHdlIHdpbGwgbmVlZCB0byBjbGVhbiB0
aGlzIHVwIGluCj4gYSBzZWNvbmQgdGltZS4KCldoYXQgY2xlYW4gdXAgYXJlIHlvdSBpbXBseWlu
ZyBoZXJlPyBUaG9zZSBsZWdhY3kgcGxhdGZvcm0gbWlnaHQgbmVlZApPTUFQX0dQTUMgZm9yIGJv
b3Rpbmcgc28gdGhleSBzZWxlY3QgaXQuIFRoZXJlIGlzIG5vdGhpbmcgbXVjaCB3ZSBjYW4gZG8g
dGhlcmUuCgpXaGF0IGlzIGxlZnQgdG8gZG8gbm93IGlzIG1ha2UgdXNlci9kZWZjb25maWcgZmls
ZXMgdG8gZW5hYmxlIE9NQVBfR1BNQyBkcml2ZXIKc28gb3RoZXIgcGxhdGZvcm1zIHRoYXQgZG9u
J3QgbmVlZCBPTUFQX0dQTUMgZm9yIGJhc2ljIG9wZXJhdGlvbiBjYW4gc3RpbGwKZW5hYmxlIHRo
ZW0gbGF0ZXIgdmlhIGRlZmNvbmZpZyBvciBtYW51YWxseSBieSB1c2VyLgoKPiAKPj4+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L0tjb25maWcKPj4+IEBAIC00Miw4ICs0Miw3IEBAIGNvbmZpZyBNVERfTkFORF9PTUFQMgo+
Pj4gIAl0cmlzdGF0ZSAiT01BUDIsIE9NQVAzLCBPTUFQNCBhbmQgS2V5c3RvbmUgTkFORCBjb250
cm9sbGVyIgo+Pj4gIAlkZXBlbmRzIG9uIEFSQ0hfT01BUDJQTFVTIHx8IEFSQ0hfS0VZU1RPTkUg
fHwgQVJDSF9LMyB8fCBDT01QSUxFX1RFU1QKPj4+ICAJZGVwZW5kcyBvbiBIQVNfSU9NRU0KPj4+
IAlkZXBlbmRzIG9uIE9NQVBfR1BNQwo+Pj4KPj4+IFRoaXMgbWVhbnMgYW55IG9mIHRoZSBvdGhl
ciBPTUFQIGFyY2hpdGVjdHVyZXMgd2lsbCBjb21waWxlIHRoZSBHUE1DCj4+PiBkcml2ZXIgZXZl
biB0aG91Z2ggdGhleSBtaWdodCBub3QgbmVlZCBpdCwgd2hpY2ggd291bGQgdW5uZWNlc3Nhcmls
eQo+Pj4gaW5jcmVhc2UgdGhlIGtlcm5lbCBzaXplLgo+Pj4KPj4+IEFtIEkgbWlzc2luZyBzb21l
dGhpbmc/ICAKPj4KPj4gTVREX05BTkRfT01BUDIgTkFORCBjb250cm9sbGVyIGlzIGEgc3VibW9k
dWxlIG9mIHRoZSBPTUFQIEdQTUMgSVAuIFNvIGl0Cj4+IGNhbm5vdCB3b3JrIHdpdGhvdXQgT01B
UF9HUE1DIGRyaXZlci4KPiAKPiBJIGRpZG4ndCByZW1lbWJlciBleGFjdGx5IGJ1dCBpbiB0aGF0
IGNhc2UgaXQncyBva2F5LCBJIHdhcyBqdXN0Cj4gc3VycHJpc2VkIGJ5IHRoZSAic2VsZWN0IEdQ
TUMgaWYgQVJDSF9LMyIgYnV0IGluZGVlZCB3aXRoIHRoaXMKPiBleHBsYW5hdGlvbiBpdCBtYWtl
cyBtb3JlIHNlbnNlLgo+IAo+PiBIb3BlIHRoaXMgY2xhcmlmaWVzIHRoZSBkb3VidHMuCj4gCj4g
WWVzLCB0aGFua3MuIEkgd2lsbCBzZW5kIHRoZSBmaXggdG8gTGludXMgdGhlbi4KPiAKPiBDaGVl
cnMsCj4gTWlxdcOobAoKY2hlZXJzLAotcm9nZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
