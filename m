Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70345C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFahmqlMo+LmHigfPt2HRXMyIB7g1+sGLxloPDZ9VWs=; b=oTug02vX2qoSyP
	5Tuc+kyHbvdNjMgpGXJKMn+j6RPU4WFAjTEcBrXJECEqPb80Y3tEzq5nHZgfVCT4XHe1WNVluHgp+
	vf494+aisV2F1Bfqesj3EGyIOhJ/ubsN76WcFTnGmCBn1IPbNBw3N7tMYtcDyQ0hLy2YUo9urPtcR
	8Jzc9+kUdfG3rsxRZYyHNyct/HUq6c4d3ZYf+wOAwB02EzsJtN+G4+6oQT7yQiNpxVVOUW5R4JqFc
	VShYERc11oY7uEdwrth6w6/9rPK9Ssi5Yp8mfOYY1QOCr15/lXuyuRzqxajGMBRleEUSEhwq3g31Y
	1jtufErcgkioDjmJLSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRCcm-0003Hq-DA; Mon, 07 Mar 2022 12:38:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCR2-00HZWD-19
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 12:25:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91ADE6111D;
 Mon,  7 Mar 2022 12:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6BCC340E9;
 Mon,  7 Mar 2022 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646655952;
 bh=Ghs63fYthC1CW9AbnkUpsxT3KRIqjn2YMnqNPVu9Z9A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cfvm4qBjvVqDUD41LgVmaVdXePN17HbVw1cNKxXHi+koU8FzymcIF5bA3seLlGXJ+
 hHp31fad1v5ZmIsUFvjJB80HpsldqY85UEpMkZOeRvJKC9vzKwRXzwBVy0sW3WzLUf
 vL/PkjV+B2MFgfR0LeRa25VErcNN7bu9KharV2rgU+awTgtz8f5SWpvYLF7VYjye8z
 WWUR7ZxCAA2ciBBSoIpNk2w2fPGWqB2XpjCJ+LRoOBmU2/GWafDxQttxcBTNi2xDXc
 XJA4LMNQcAqRGvejYstDkd8Rd9hRKP2FNZ6/TFHBOVJ71yCGyqYM6U8GsyKPwJMq65
 vbWwtFvr5WuVQ==
Message-ID: <c39d64f0-deef-4cae-fab7-555a48e31811@kernel.org>
Date: Mon, 7 Mar 2022 14:25:48 +0200
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
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220307110357.20d50176@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_042556_232891_8BCA1C44 
X-CRM114-Status: GOOD (  33.67  )
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

SGkgTWlxdWVsLAoKT24gMDcvMDMvMjAyMiAxMjowMywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBSb2dlciwKPiAKPiByb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBTYXQsIDUgTWFyIDIwMjIg
MDA6NTA6MTQgKzAyMDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gT24gMDQvMDMvMjAyMiAxNzo1
NCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIEd1ZW50ZXIsIFJvZ2VyLAo+Pj4KPj4+IHJk
dW5sYXBAaW5mcmFkZWFkLm9yZyB3cm90ZSBvbiBTYXQsIDI2IEZlYiAyMDIyIDIyOjU1OjI4IC0w
ODAwOgo+Pj4gICAKPj4+PiBPbiAyLzE5LzIyIDE2OjQ0LCBHdWVudGVyIFJvZWNrIHdyb3RlOiAg
Cj4+Pj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAwUE0gKzAyMDAsIFJvZ2VyIFF1
YWRyb3Mgd3JvdGU6ICAgIAo+Pj4+Pj4gVGhlIHJvb3Qgb2YgdGhlIHByb2JsZW0gaXMgdGhhdCB3
ZSBhcmUgc2VsZWN0aW5nIHN5bWJvbHMgdGhhdCBoYXZlCj4+Pj4+PiBkZXBlbmRlbmNpZXMuIFRo
aXMgY2FuIGNhdXNlIHJhbmRvbSBjb25maWd1cmF0aW9ucyB0aGF0IGNhbiBmYWlsLgo+Pj4+Pj4g
VGhlIGNsZWFuZXN0IHNvbHV0aW9uIGlzIHRvIGF2b2lkIHVzaW5nIHNlbGVjdC4KPj4+Pj4+Cj4+
Pj4+PiBUaGlzIGRyaXZlciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUgT01BUF9HUE1DIGRyaXZl
ciBzbyB3ZSBoYXZlIHRvCj4+Pj4+PiBkZXBlbmQgb24gaXQgaW5zdGVhZC4KPj4+Pj4+Cj4+Pj4+
PiBGaXhlczogNGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5kOiBvbWFwMjogUHJldmVudCBpbnZh
bGlkIGNvbmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUBrZXJuZWwub3JnPiAgICAKPj4+Pj4KPj4+Pj4gVGVzdGVk
LWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+ICAgIAo+Pj4+Cj4+Pj4gVGVz
dGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gIAo+Pj4KPj4+IFNv
cnJ5IGZvciBub3RpY2luZyB0aGF0IGp1c3Qgbm93LCBidXQgdGhlcmUgaXMgc3RpbGwgYSBwcm9i
bGVtIHdpdGgKPj4+IHRoaXMgcGF0Y2g6IHdlIG5vdyBhbHdheXMgY29tcGlsZS1pbiB0aGUgT01B
UF9HUE1DIGRyaXZlciB3aGVuZXZlciB3ZQo+Pj4gbmVlZCB0aGUgTkFORCBjb250cm9sbGVyLCBl
dmVuIHRob3VnaCBpdCBpcyBub3QgbmVlZGVkLiBUaGlzIGdyb3dzIHRoZQo+Pj4ga2VybmVsIGZv
ciBubyByZWFzb24uICAKPj4KPj4gU29ycnksIEkgZGlkIG5vdCB1bmRlcnN0YW5kIHdoYXQgeW91
IG1lYW50Lgo+Pgo+PiBXZSBubyBsb25nZXIgZXhwbGljaXRseSBlbmFibGUgT01BUF9HUE1DIHNp
bmNlIHdlIGRyb3BwZWQgdGhlICJzZWxlY3QiLgo+PiBUaGlzIGZpeGVzIGFsbCBidWlsZCBpc3N1
ZXMgdGhhdCB3ZXJlIHJlcG9ydGVkIHJlY2VudGx5Lgo+Pgo+PiBNVERfTkFORF9PTUFQMiB3aWxs
IG5vdCBiZSBlbmFibGVkIGlmIE9NQVBfR1BNQyBpcyBub3Qgc2luY2Ugd2UgYWRkZWQKPj4gdGhl
ICJkZXBlbmRzIG9uIi4gVGhpcyBmaXhlcyB0aGUgb3JpZ2luYWwgYnVpbGQgaXNzdWUgdGhhdCB3
ZSBzdGFydGVkIHRvCj4+IGZpeCB3aXRoIHNlbGVjdCBpbml0aWFsbHkuCj4gCj4gWWVzLCB0aGlz
IHNpZGUgaXMgZmluZS4KPiAKPiBJbiB0aGUgaW5pdGlhbCBjb21taXQsIHlvdSBwcm9wb3NlZDoK
PiAKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvS2NvbmZpZwo+IEBAIC00Miw3ICs0Miw4IEBAIGNvbmZpZyBNVERfTkFORF9P
TUFQMgo+ICAgICAgICAgdHJpc3RhdGUgIk9NQVAyLCBPTUFQMywgT01BUDQgYW5kIEtleXN0b25l
IE5BTkQgY29udHJvbGxlciIKPiAgICAgICAgIGRlcGVuZHMgb24gQVJDSF9PTUFQMlBMVVMgfHwg
QVJDSF9LRVlTVE9ORSB8fCBBUkNIX0szIHx8IENPTVBJTEVfVEVTVAo+ICAgICAgICAgZGVwZW5k
cyBvbiBIQVNfSU9NRU0KPiArICAgICAgIHNlbGVjdCBPTUFQX0dQTUMgaWYgQVJDSF9LMwo+IAo+
IFdoaWNoIGNyZWF0ZXMgYSBkZXBlbmRlbmN5IG92ZXIgT01BUF9HUE1DIG9ubHkgZm9yIGEgc2lu
Z2xlCj4gYXJjaGl0ZWN0dXJlLiBXaGljaCBtZWFucyB0aGF0IG90aGVyIE9NQVAgcGxhdGZvcm1z
IGRvIG5vdCBuZWNlc3NhcmlseQo+IG5lZWQgT01BUF9HUE1DIGZvciB0aGUgTkFORCBjb250cm9s
bGVyIHRvIHdvcmsuIE5vdywgeW91IHByb3Bvc2U6CgpObyB0aGF0IGlzIG5vdCB0cnVlLiBPdGhl
ciBwbGF0Zm9ybXMgdGhhdCBuZWVkIE1URF9OQU5EX09NQVAyIGFyZQpleHBsaWNpdGx5IHNlbGVj
dGluZyBPTUFQX0dQTUMKaS5lLiBpbiBhcmNoL2FybS9tYWNoLW9tYXAyL0tjb25maWcKCj4gCj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L0tjb25maWcKPiBAQCAtNDIsOCArNDIsNyBAQCBjb25maWcgTVREX05BTkRfT01BUDIK
PiAgCXRyaXN0YXRlICJPTUFQMiwgT01BUDMsIE9NQVA0IGFuZCBLZXlzdG9uZSBOQU5EIGNvbnRy
b2xsZXIiCj4gIAlkZXBlbmRzIG9uIEFSQ0hfT01BUDJQTFVTIHx8IEFSQ0hfS0VZU1RPTkUgfHwg
QVJDSF9LMyB8fCBDT01QSUxFX1RFU1QKPiAgCWRlcGVuZHMgb24gSEFTX0lPTUVNCj4gCWRlcGVu
ZHMgb24gT01BUF9HUE1DCj4gCj4gVGhpcyBtZWFucyBhbnkgb2YgdGhlIG90aGVyIE9NQVAgYXJj
aGl0ZWN0dXJlcyB3aWxsIGNvbXBpbGUgdGhlIEdQTUMKPiBkcml2ZXIgZXZlbiB0aG91Z2ggdGhl
eSBtaWdodCBub3QgbmVlZCBpdCwgd2hpY2ggd291bGQgdW5uZWNlc3NhcmlseQo+IGluY3JlYXNl
IHRoZSBrZXJuZWwgc2l6ZS4KPiAKPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKTVREX05BTkRf
T01BUDIgTkFORCBjb250cm9sbGVyIGlzIGEgc3VibW9kdWxlIG9mIHRoZSBPTUFQIEdQTUMgSVAu
IFNvIGl0CmNhbm5vdCB3b3JrIHdpdGhvdXQgT01BUF9HUE1DIGRyaXZlci4KCkhvcGUgdGhpcyBj
bGFyaWZpZXMgdGhlIGRvdWJ0cy4KCj4gCj4+PiBJbiBmYWN0LCBSb2dlciBvbmNlIHNhaWQ6Cj4+
Pgo+Pj4gCSJXZSB3aWxsIGZpZ3VyZSBvdXQgaG93IHRvIGVuYWJsZSBPTUFQX0dQTUMgZm9yIEsz
IGFyY2hpdGVjdHVyZQo+Pj4gCXNvbWUgb3RoZXIgd2F5LiIKPj4+Cj4+PiBJdCB0dXJucyBvdXQg
dGhpcyBpcyBub3Qgd2hhdCB3YXMgZmluYWxseSBwcm9wb3NlZC4gQ291bGQgd2UgdHJ5IHlldAo+
Pj4gYW5vdGhlciBzb2x1dGlvbj8gIAo+Pgo+PiBUaGlzIGlzc3VlIGlzIHN0aWxsIHByZXNlbnQg
aS5lLiB3ZSBjYW5ub3QgZW5hYmxlIE1URF9OQU5EX09NQVAyIGRyaXZlciBvbgo+PiBLMyBwbGF0
Zm9ybSBzaW5jZSBPTUFQX0dQTUMgY29uZmlnIGlzIGhpZGRlbiBhbmQgbm90IHNlbGVjdC1hYmxl
Cj4+IGJ5IHVzZXIgb3IgZGVmY29uZmlnIGZpbGUuCj4+Cj4+IEJ1dCBpdCBpcyBub3QgeWV0IGEg
ZGVhbCBicmVha2VyIHNpbmNlIE5BTkQgb24gSzMgaXMgbm90IHlldCBlbmFibGVkIHVwc3RyZWFt
Lgo+Pgo+PiBGb3IgdGhpcyBJIHRoaW5rIE9NQVBfR1BNQyBoYXMgdG8gYmUgYSB2aXNpYmxlIGNv
bmZpZyBlbnRyeSBhbmQgc2VsZWN0LWFibGUKPj4gZnJvbSBhIGRlZmNvbmZpZyBmaWxlIGFzIEkg
aGFkIGRvbmUgaW5pdGlhbGx5IFsxXS4KPj4KPj4gTm93IHdlIGhhdmUgYSBsb3Qgb2YgZXhwbGFu
YXRpb24gdG8gd3JpdGUgYXMgdG8gd2h5IHdlIG5lZWQgdG8gZG8gaXQgOykKPiAKPiBXZSBjZXJ0
YWlubHkgZG8gOikKPiAKPj4gWzFdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIx
MTEyMzEwMjYwNy4xMzAwMi0zLXJvZ2VycUBrZXJuZWwub3JnLwo+Pgo+IAo+IFRoYW5rcywKPiBN
aXF1w6hsCgpjaGVlcnMsCi1yb2dlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
