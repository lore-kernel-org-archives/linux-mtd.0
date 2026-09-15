Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513EAC88E53
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=185QRDF7nOnjzTTB57dZ61+OEBViBDhznabywX7xJRc=; b=Yss+qdxzPOlPXp
	XGqLU+TRE643SWhAblWCmuv7P9Uuk2TZrXXH5aJ78kDxTHEdfZ29o5pT30OSBsEGzqqXckuzso2Cu
	xAUyFpQAuKcYSOKfcKlM4IavU58Bk32cXXlKFDT4MRd6ddV8OXCXayDwkRD6TjeATWK4ma9y0HzvJ
	LYgrIlqOXuXEpOqrRGb+fUSA5uqGVObC0KU7L0240cNoypJoU0DUc4YXPQHkpC1qzw6yU5/AN1IUH
	5MLDRbqf8JnMzOdA4m5fBj+WJUZMKaOHN02ZnW+3CM0OLv6yTp7m28zU2gc+v63O1cnsbB+wRlsLD
	1cSO0LMvcZvaxxwDeZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rhq-00000006JLE-0mke;
	Tue, 15 Sep 2026 11:52:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rho-00000006JKk-26lj
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 11:52:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A668A602BA;
	Tue, 15 Sep 2026 11:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEE41F000FF;
	Tue, 15 Sep 2026 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473127;
	bh=minwQhNSeXpWaT0uHf4QAacB8I8tdz+K6aY9uTKMnis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IKs/ruNIjPp8RAB0L1pOI7H22Y8Yiif1iOXio4sxHFjBOsd7iJXA9OfVe0qNrPBeJ
	 OA9RerOC7J4qNa4U0ZjuDpsiiEbI7qrnvYykxb4tg75ZUbUe+TLGug9LYhaMwholnH
	 BLQfuJNmYhzUe1fQVl2ccCWjYc8zeFMI8JOv6suA5P1TsqNz2iC5BAu0wTtTnhuogs
	 Q3o4P47RD0fDdyTAF/zlu5SjTWO+EpgqXFlHy2b9T9gjft9BU5690299V/3BfQq54o
	 sUzX29eE0BwM1xcuuiEyg6b7RwIAtpHlyPysNIvchn6N60lI8qbXAXfxcqf2/LKfZU
	 GcjOC3AG+V4zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: take the flash lock around
 spi_nor_restore()
To: "Itai Handler" <itai.handler@gmail.com>, mwalle@kernel.org, pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org, vigneshr@ti.com, linux-mtd@lists.infradead.org, takahiro.kuwano@infineon.com, richard@nod.at, stable@vger.kernel.org, miquel.raynal@bootlin.com
In-Reply-To: <20260915113811.2429311-1-itai.handler@gmail.com>
References: <20260915113811.2429311-1-itai.handler@gmail.com>
Date: Tue, 15 Sep 2026 11:52:06 +0000
Message-Id: <20260915115206.CCEE41F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
c2tpcHBlZCBmbGFzaCByZXN0b3JlIG9uIGZhdGFsIHNpZ25hbCBicmVha3MgYm9vdAotIFtIaWdo
XSBtdGQ6IHNwaS1ub3I6IHNodXRkb3duIGhhbmcgZHVlIHRvIG9uZ29pbmcgZXJhc2Ugb3BlcmF0
aW9uCi0tCgpjb21taXQgYzA1NzhmYWM3NTgxYjYzYzM5YmZkOTlhYzNhNmY5MzQyNTY2ODVkMwpB
dXRob3I6IEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVyQGdtYWlsLmNvbT4KCm10ZDogc3BpLW5v
cjogdGFrZSB0aGUgZmxhc2ggbG9jayBhcm91bmQgc3BpX25vcl9yZXN0b3JlKCkKClRoaXMgY29t
bWl0IGNoYW5nZXMgc3BpX25vcl9zaHV0ZG93bigpIGFuZCBzcGlfbm9yX3JlbW92ZSgpIHRvIGFj
cXVpcmUKbm9yLT5sb2NrIGFyb3VuZCBzcGlfbm9yX3Jlc3RvcmUoKS4gSXQgYWltcyB0byBwcmV2
ZW50IG9wZXJhdGlvbnMgbGlrZQpyZWFkcyBmcm9tIG92ZXJsYXBwaW5nIHdpdGggdGhlIHJlc3Rv
cmUsIHdoaWNoIGNvdWxkIGxlYXZlIHRoZSBjaGlwIGluCjMtYnl0ZSBhZGRyZXNzaW5nIG1vZGUu
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4gaW5kZXggY2NmNDM5NmNkY2QwNC4uYzg5MTE5N2ZmYTViMyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4gQEAgLTM4NDksMTEgKzM4NDksMjYgQEAgc3RhdGljIGludCBzcGlf
bm9yX3Byb2JlKHN0cnVjdCBzcGlfbWVtICpzcGltZW0pCj4gIAkJCQkgICBkYXRhID8gZGF0YS0+
bnJfcGFydHMgOiAwKTsKPiAgfQo+ICAKPiArLyoKPiArICogUmVzdG9yZSBiZXR3ZWVuIG9wZXJh
dGlvbnMsIG5vdCBkdXJpbmcgb25lLiBSZW1vdmFsIGFuZCBzaHV0ZG93biBib3RoIHJ1bgo+ICsg
KiB3aXRoIE1URCB1c2VycyBzdGlsbCBhdHRhY2hlZDogYSBidXN5IGZsYXNoIHNpbGVudGx5IGln
bm9yZXMgdGhlIGNvbW1hbmRzCj4gKyAqIHNwaV9ub3JfcmVzdG9yZSgpIHNlbmRzLCBhbmQgYSBy
ZXN0b3JlIGxhbmRpbmcgaW5zaWRlIGEgcmVhZCBjaGFuZ2VzIHRoZQo+ICsgKiBjaGlwJ3MgYWRk
cmVzcyB3aWR0aCB1bmRlciB0aGUgdHJhbnNmZXIuCj4gKyAqLwo+ICtzdGF0aWMgdm9pZCBzcGlf
bm9yX3Jlc3RvcmVfbG9ja2VkKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gK3sKPiArCWlmIChzcGlf
bm9yX3ByZXBfYW5kX2xvY2sobm9yKSkKPiArCQlyZXR1cm47CgpbU2V2ZXJpdHk6IEhpZ2hdCkRv
ZXMgdGhpcyBjb2RlIHNpbGVudGx5IHNraXAgdGhlIGZsYXNoIHJlc3RvcmUgaWYgYSBmYXRhbCBz
aWduYWwgYnJlYWtzIHRoZQpsb2NrIGFjcXVpc2l0aW9uPyAKCkZvciBleGFtcGxlLCBpZiBhIHBy
aXZpbGVnZWQgdXNlciBydW5zIHJtbW9kIHdoaWxlIGFuIGVyYXNlIG9yIHJlYWQgb3BlcmF0aW9u
CmlzIGFjdGl2ZWx5IGhvbGRpbmcgdGhlIFJXVyBsb2NrLCBhbmQgdGhlIHJtbW9kIHByb2Nlc3Mg
cmVjZWl2ZXMgU0lHS0lMTCwKc3BpX25vcl9wcmVwX2FuZF9sb2NrKCkgKHZpYSB3YWl0X2V2ZW50
X2tpbGxhYmxlKCkpIHdpbGwgcmV0dXJuIC1FUkVTVEFSVFNZUzoKCmRyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5jOnNwaV9ub3JfcHJlcF9hbmRfbG9jaygpIHsKICAgIC4uLgogICAgaWYgKCFzcGlf
bm9yX3VzZV9wYXJhbGxlbF9sb2NraW5nKG5vcikpCiAgICAgICAgbXV0ZXhfbG9jaygmbm9yLT5s
b2NrKTsKICAgIGVsc2UKICAgICAgICByZXQgPSB3YWl0X2V2ZW50X2tpbGxhYmxlKG5vci0+cnd3
LndhaXQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGlfbm9yX3J3d19zdGFy
dF9leGNsdXNpdmUobm9yKSk7CgogICAgcmV0dXJuIHJldDsKfQoKQnlwYXNzaW5nIHRoZSBoYXJk
d2FyZSB0ZWFyZG93biBwYXRoIGhlcmUgbGVhdmVzIHRoZSBmbGFzaCBpbiA0LWJ5dGUgYWRkcmVz
c2luZwptb2RlLiBUaGlzIG1pZ2h0IGNhdXNlIHRoZSBib290bG9hZGVyIHRvIGZhaWwgdG8gcmVh
ZCB0aGUga2VybmVsIG9uIHRoZSBuZXh0CnJlYm9vdCwgc29mdC1icmlja2luZyB0aGUgZGV2aWNl
IHVudGlsIGEgcG93ZXIgY3ljbGUuCgo+ICsKPiArCXNwaV9ub3JfcmVzdG9yZShub3IpOwo+ICsJ
c3BpX25vcl91bmxvY2tfYW5kX3VucHJlcChub3IpOwo+ICt9Cj4gKwoKWyAuLi4gXQoKPiBAQCAt
Mzg2Myw3ICszODc4LDcgQEAgc3RhdGljIHZvaWQgc3BpX25vcl9zaHV0ZG93bihzdHJ1Y3Qgc3Bp
X21lbSAqc3BpbWVtKQo+ICB7Cj4gIAlzdHJ1Y3Qgc3BpX25vciAqbm9yID0gc3BpX21lbV9nZXRf
ZHJ2ZGF0YShzcGltZW0pOwo+ICAKPiAtCXNwaV9ub3JfcmVzdG9yZShub3IpOwo+ICsJc3BpX25v
cl9yZXN0b3JlX2xvY2tlZChub3IpOwoKW1NldmVyaXR5OiBIaWdoXQpDb3VsZCB0aGlzIGhhbmcg
dGhlIHN5c3RlbSBpbmRlZmluaXRlbHkgZHVyaW5nIHNodXRkb3duIGlmIGFuIGVyYXNlIG9wZXJh
dGlvbgppcyBvbmdvaW5nPwoKRXJhc2Ugb3BlcmF0aW9ucyAobGlrZSBzcGlfbm9yX2VyYXNlX211
bHRpX3NlY3RvcnMpIGhvbGQgbm9yLT5sb2NrCmNvbnRpbnVvdXNseSBmb3IgdGhlaXIgZW50aXJl
IGR1cmF0aW9uLCBsb29waW5nIG92ZXIgc3BpX25vcl93YWl0X3RpbGxfcmVhZHkoKQp3aXRoIGNv
bmRfcmVzY2hlZCgpLiBBIGxhcmdlIGNoaXAgZXJhc2UgY2FuIHRha2Ugc2V2ZXJhbCBtaW51dGVz
LgoKQmVjYXVzZSBkZXZpY2Vfc2h1dGRvd24oKSBpdGVyYXRlcyBkZXZpY2VzIHN5bmNocm9ub3Vz
bHkgd2l0aG91dCBhIHRpbWVvdXQsCnRoaXMgc3luY2hyb25vdXMgd2FpdCBmb3Igbm9yLT5sb2Nr
IGNvdWxkIGhhbmcgdGhlIHJlYm9vdCBwcm9jZXNzIHVudGlsIHRoZQplcmFzZSBmaW5pc2hlcywg
Zm9yY2luZyB0aGUgdXNlciB0byBoYXJkLXJlc2V0IHRoZSBtYWNoaW5lLgoKPiAgfQo+ICAKPiAg
LyoKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA5MTUxMTM4MTEuMjQyOTMxMS0xLWl0YWkuaGFuZGxlckBnbWFpbC5jb20/cGFydD0x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
