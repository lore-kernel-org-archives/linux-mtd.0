Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A94EC47073
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sJZQA2awPxJyipHRloFN0IM/wk67rOixU7zDwQuNLg=; b=yqRqOUF36JVL5a
	YC8Ja5ClMVQ+5s13WD8VHHmfSzPWtG3dib+muPMNwGV43aIgiPnazok25GkbLdhQoRDIB0t+BLUde
	f1lspN0gW/WBmhWRU9mFlDhzq3hn3/teTDy+eXb2SP+QNRoHX2cSsWX8BV2FjVgET9i8FpO5egTQ/
	iac4YaOAxKXRo/qazXXDzrTBlYjpb1aaoPkwsauEyRulumStv9tEL4kZX2gtjqpQToqT0U/QwOCFz
	uaE2ewcN2Xr4DNrBxpivh0pL757xn3SLku58jL3CrcERUmiwEEvEEWDKLggrSmEvf5RSZLSJ5lko1
	8cfeEfWgFLisu21cWmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcA6-007cMX-1L;
	Tue, 02 Jan 2024 10:38:18 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcA2-007cJd-2o
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 10:38:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA2D21BF207;
	Tue,  2 Jan 2024 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704191889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dD/7vrp7PobLXT38gn14ZFy05WSFmJZV0dJfDmvXWWw=;
	b=MkugAq/n3uM4OqEQwTq+Sdy2Wq4rqMTOHhKGGp05cyzvbwP+BIGAaG1BkXK6/vcArPorrx
	FoGa92KcNRVU2jiAmr5qQhCxO57rNuu4rC1WAl7gWYGFYgFIjQ4qKTRZUSePnfDOaJzWeq
	9/s94EXdNPWOHtgjLV9nmnkwUPdGZoPY7ZLFCxxxgEf0w/bSKyqLRODjx9N162eVa1LNeO
	M8M+NXzadTH3aQkBaYijCWjjUYSl8aLeoYXAXuJIHNmJ3DO7pZgL6JtHCtVvehb5dr033b
	zE6JUPzC7PNAwY+F1SYJ1CPabqqlLLrUmxV9qX07QLFqVeZePzLVl/f6BN3fYA==
Date: Tue, 2 Jan 2024 11:38:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Elad Nachman <enachman@marvell.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <vadym.kochan@plvision.eu>,
 <aviramd@marvell.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: fix layouts
Message-ID: <20240102113806.3fa88503@xps-13>
In-Reply-To: <20231231174950.3272727-1-enachman@marvell.com>
References: <20231231174950.3272727-1-enachman@marvell.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_023815_245981_1950AFA1 
X-CRM114-Status: GOOD (  18.89  )
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

SGkgRWxhZCwKCmVuYWNobWFuQG1hcnZlbGwuY29tIHdyb3RlIG9uIFN1biwgMzEgRGVjIDIwMjMg
MTk6NDk6NTAgKzAyMDA6Cgo+IEZyb206IEVsYWQgTmFjaG1hbiA8ZW5hY2htYW5AbWFydmVsbC5j
b20+Cj4gCgpQbGVhc2UgZml4IHlvdXIgbWFpbGVyIGJlY2F1c2UgdGhpcyBwYXJhZ3JhcGggaXMg
d2F5IHRvbyBzbWFsbCAoPDUwCmNoYXJzISkuCgo+IENoZWNrIGluIG5hbmRfYmFzZS5jLCBuYW5k
X3NjYW5fdGFpbCgpIDoKPiBpZiAoZWNjLT5zdGVwcyAqIGVjYy0+c2l6ZSAhPSBtdGQtPndyaXRl
c2l6ZSkKPiBGYWlscyBmb3Igc29tZSBOQU5EIGNoaXBzLgo+IFJlbW92ZSBlbnRyaWVzIHdoaWNo
IGNhbm5vdCBjcmVhdGUgaW50ZWdyYWwKPiBtdWx0aXBsaWNhdGlvbnMsIGFuZCBhZGp1c3QgdGhl
IG51bWJlciBvZiBjaHVua3MKPiBmb3IgZW50cmllcyB3aGljaCBmYWlscyB0aGUgYWJvdmUgY2Fs
Y3VsYXRpb24gdG8KPiBjYWxjdWxhdGUgY29ycmVjdGx5ICh0aGlzIHdhcyBwcmV2aW91c2x5IGRv
bmUKPiBhdXRvbWF0aWNhbGx5IGJlZm9yZSB0aGUgY2hlY2spLgoKSSdtIG9rYXkgd2l0aCB0aGF0
LgoKPiBBbHNvIGZpeCBzcGFjaW5nIG9mIHRoZSBzYWlkIHRhYmxlLgoKTm8sIHBsZWFzZSBkb24n
dCBkbyB0aGlzIGluIHRoZSBzYW1lIGNvbW1pdCwgaXQgYmVjb21lcyB0b3RhbGx5CnVucmVhZGFi
bGUuCgpQbGVhc2Uga2VlcCB0aGUgc3BhY2luZyBhcyBpdCBpcywgb3IgaWYgeW91IHdhbnQgdG8g
Y2hhbmdlIHRoZSBzcGFjaW5nLAprZWVwIGFkZGl0aW9uYWwgc3BhY2VzIHNvIHRoYXQgaXQgaXMg
ZWFzaWx5IHJlYWRhYmxlIGJ5IGtlZXBpbmcgY2xlYXIKY29sdW1ucy4KCj4gCj4gRml4ZXM6IDY4
YzE4ZGFlNjg4OCAoIm10ZDogcmF3bmFuZDogbWFydmVsbDogYWRkIG1pc3NpbmcgbGF5b3V0cyIp
CgpQbGVhc2UgYWRkOgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCj4gU2lnbmVkLW9mZi1i
eTogRWxhZCBOYWNobWFuIDxlbmFjaG1hbkBtYXJ2ZWxsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgfCAyNyArKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gaW5kZXggYTQ2Njk4NzQ0ODUwLi4y
MWY0NDY5YjVjZGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9u
YW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+IEBAIC0y
ODUsMjEgKzI4NSwxOCBAQCBzdHJ1Y3QgbWFydmVsbF9od19lY2NfbGF5b3V0IHsKPiAgCj4gIC8q
IExheW91dHMgZXhwbGFpbmVkIGluIEFOLTM3OV9NYXJ2ZWxsX1NvQ19ORkNfRUNDICovCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbWFydmVsbF9od19lY2NfbGF5b3V0IG1hcnZlbGxfbmZjX2xheW91
dHNbXSA9IHsKPiAtCU1BUlZFTExfTEFZT1VUKCAgNTEyLCAgIDUxMiwgIDEsICAxLCAgMSwgIDUx
MiwgIDgsICA4LCAgMCwgIDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCAyMDQ4LCAgIDUxMiwg
IDEsICAxLCAgMSwgMjA0OCwgNDAsIDI0LCAgMCwgIDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VU
KCAyMDQ4LCAgIDUxMiwgIDQsICAxLCAgMSwgMjA0OCwgMzIsIDMwLCAgMCwgIDAsICAwKSwKPiAt
CU1BUlZFTExfTEFZT1VUKCAyMDQ4LCAgIDUxMiwgIDgsICAyLCAgMSwgMTAyNCwgIDAsIDMwLDEw
MjQsMzIsIDMwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCAyMDQ4LCAgIDUxMiwgIDgsICAyLCAgMSwg
MTAyNCwgIDAsIDMwLDEwMjQsNjQsIDMwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCAyMDQ4LCAgIDUx
MiwgIDEyLCAzLCAgMiwgNzA0LCAgIDAsIDMwLDY0MCwgIDAsIDMwKSwKPiAtCU1BUlZFTExfTEFZ
T1VUKCAyMDQ4LCAgIDUxMiwgIDE2LCA1LCAgNCwgNTEyLCAgIDAsIDMwLCAgMCwgMzIsIDMwKSwK
PiAtCU1BUlZFTExfTEFZT1VUKCA0MDk2LCAgIDUxMiwgIDQsICAyLCAgMiwgMjA0OCwgMzIsIDMw
LCAgMCwgIDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCA0MDk2LCAgIDUxMiwgIDgsICA1LCAg
NCwgMTAyNCwgIDAsIDMwLCAgMCwgNjQsIDMwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCA0MDk2LCAg
IDUxMiwgIDEyLCA2LCAgNSwgNzA0LCAgIDAsIDMwLDU3NiwgMzIsIDMwKSwKPiAtCU1BUlZFTExf
TEFZT1VUKCA0MDk2LCAgIDUxMiwgIDE2LCA5LCAgOCwgNTEyLCAgIDAsIDMwLCAgMCwgMzIsIDMw
KSwKPiAtCU1BUlZFTExfTEFZT1VUKCA4MTkyLCAgIDUxMiwgIDQsICA0LCAgNCwgMjA0OCwgIDAs
IDMwLCAgMCwgIDAsICAwKSwKPiAtCU1BUlZFTExfTEFZT1VUKCA4MTkyLCAgIDUxMiwgIDgsICA5
LCAgOCwgMTAyNCwgIDAsIDMwLCAgMCwgMTYwLCAzMCksCj4gLQlNQVJWRUxMX0xBWU9VVCggODE5
MiwgICA1MTIsICAxMiwgMTIsIDExLCA3MDQsICAwLCAzMCw0NDgsICA2NCwgMzApLAo+IC0JTUFS
VkVMTF9MQVlPVVQoIDgxOTIsICAgNTEyLCAgMTYsIDE3LCAxNiwgNTEyLCAgMCwgMzAsICAwLCAg
MzIsIDMwKSwKPiArCU1BUlZFTExfTEFZT1VUKDUxMiwgICA1MTIsICAxLCAgMSwgIDEsICA1MTIs
ICA4LCAgOCwgIDAsICAwLCAgMCksCj4gKwlNQVJWRUxMX0xBWU9VVCgyMDQ4LCAgIDUxMiwgIDEs
ICAxLCAgMSwgMjA0OCwgNDAsIDI0LCAgMCwgIDAsICAwKSwKPiArCU1BUlZFTExfTEFZT1VUKDIw
NDgsICAgNTEyLCAgNCwgIDEsICAxLCAyMDQ4LCAzMiwgMzAsICAwLCAgMCwgIDApLAo+ICsJTUFS
VkVMTF9MQVlPVVQoMjA0OCwgICA1MTIsICA4LCAgMiwgIDEsIDEwMjQsICAwLCAzMCwgMTAyNCwg
MzIsIDMwKSwKPiArCU1BUlZFTExfTEFZT1VUKDIwNDgsICAgNTEyLCAgOCwgIDIsICAxLCAxMDI0
LCAgMCwgMzAsIDEwMjQsIDY0LCAzMCksCj4gKwlNQVJWRUxMX0xBWU9VVCgyMDQ4LCAgIDUxMiwg
IDE2LCA0LCAgNCwgNTEyLCAgIDAsIDMwLCAgMCwgMzIsIDMwKSwKPiArCU1BUlZFTExfTEFZT1VU
KDQwOTYsICAgNTEyLCAgNCwgIDIsICAyLCAyMDQ4LCAzMiwgMzAsICAwLCAgMCwgIDApLAo+ICsJ
TUFSVkVMTF9MQVlPVVQoNDA5NiwgICA1MTIsICA4LCAgNCwgIDQsIDEwMjQsICAwLCAzMCwgIDAs
IDY0LCAzMCksCj4gKwlNQVJWRUxMX0xBWU9VVCg0MDk2LCAgIDUxMiwgIDE2LCA4LCAgOCwgNTEy
LCAgIDAsIDMwLCAgMCwgMzIsIDMwKSwKPiArCU1BUlZFTExfTEFZT1VUKDgxOTIsICAgNTEyLCAg
NCwgIDQsICA0LCAyMDQ4LCAgMCwgMzAsICAwLCAgMCwgIDApLAo+ICsJTUFSVkVMTF9MQVlPVVQo
ODE5MiwgICA1MTIsICA4LCAgOCwgIDgsIDEwMjQsICAwLCAzMCwgIDAsIDE2MCwgMzApLAo+ICsJ
TUFSVkVMTF9MQVlPVVQoODE5MiwgICA1MTIsICAxNiwgMTYsIDE2LCA1MTIsICAwLCAzMCwgIDAs
ICAzMiwgMzApLAo+ICB9Owo+ICAKPiAgLyoqCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
