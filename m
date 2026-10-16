Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59478CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 04:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouZwwp+2gkfSc6ITZUepq6HZ9r8ZExtHv9WjglTcf10=; b=T+BJCHpI6ENjDD
	1zH2dn9Dhpa/CSuTYUXeMk+bY8n41680HNmJy1wZToqfpMRGYgJ52ieTLVT+9GCnK3oGM+/3Y4Tqp
	/zAWiYfXWmDvOsrf+o6VXt0QCSpzGcp4t2XolwzSyRaCqLgscUNzuEYlPAFIl8dtlmtLRxiNS+S5C
	A95IwFzQDKv3eCr0y2X1t988tSP40eRSHQhBOR+ktFk4WNM1atePNBLJ0L8c+5AXG7kD/YBScFgbt
	/WtvCgI1pD2P2/AlrVKU0Meb6GpTPfha2Y1OdELDnlW9cW9q987v2c1/FZkWSQiqrd5ADeqAAP6sE
	2vtNR63daHu7wmZDAoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZ9Q-00000001vqY-0B8y;
	Fri, 16 Oct 2026 04:02:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZ9O-00000001vqQ-2mwc
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 04:02:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA8D2600D4;
	Fri, 16 Oct 2026 04:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888A51F000C4;
	Fri, 16 Oct 2026 04:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792123353;
	bh=NYhYtY6NNxHVhaTXOhMMsowXI57SxMv7/T8lMzWMVN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OedRXRlapUce4ZGThtU3JvUeqJMCsQv8lMObcrwmI61z2UHc0QWOmhzVm6DNtGp5L
	 chuK0oubaBpriDQSOUC8YCT3+0bYTaYmJesqyIFDUFXPiVs2uJkBZRe/L+XkEwKFjT
	 nzznNLTeqj1Oxh0o6qE/hhhJwD08qBFwFLHuiT13uZHKBqpPwX+ILWkoG3wpp6EWn+
	 T1lCbXIkIiNszSfWuOrKJea2GE81s8ziROlv/8rt2hhCw+VWcUe66InWcMy5H7foSX
	 B7kl+vxTppAGGpUpuiux4aQVIazKdM4oSgS83hJkmkr2AWLYmx9BA4VC1nAmp/FQwZ
	 9zYP3GWUDPrkA==
Message-ID: <sashiko-outbox-173724@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/17] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Maxime Ripard" <mripard@kernel.org>, "Richard
 Genoud" <richard.genoud@bootlin.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Masahiro
 Yamada" <yamada.masahiro@socionext.com>, "Brian Norris" <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-17-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
 <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-17-8ba4881fbee8@gmail.com>
Date: Fri, 16 Oct 2026 04:02:32 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogcmF3bmFuZDog
c3VueGk6IE1pc3NpbmcgYm91bmRzIGNoZWNrIG9uIGVjYy0+c3RlcHMgYWdhaW5zdCBtYXhfZWNj
X3N0ZXBzCi0tCgpjb21taXQgYTJhZTFjZjk1YmI1MmExODUwZTZkYzIzOWM4NzNiNzRkMTc1ODA1
ZQpBdXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKICAg
IG10ZDogcmF3bmFuZDogc3VueGk6IHN1cHBvcnQgdGhlIEFsbHdpbm5lciByYW5kb21pemVkIE9P
QiBmb3JtYXQKICAgIAogICAgTm9ybWFsIGhhcmR3YXJlLUVDQyByZWFkcyBhbHNvIGRlY29kZSBw
cm90ZWN0ZWQgT09CLCBpbmNsdWRpbmcgdGhlCiAgICBiYWQtYmxvY2sgbWFya2VyIGFuZCBtZXRh
ZGF0YSB1c2VkIGluIGJhZC1ibG9jay10YWJsZSBzY2Fucy4gQWxsd2lubmVyCiAgICBmaXJtd2Fy
ZSBsZWF2ZXMgdGhlIG1hcmtlciBpbiB0aGUgcmFuZG9taXplciBzdHJlYW0sIGJ1dCB0aGUgZXhp
c3RpbmcKICAgIGRyaXZlciBjb21wZW5zYXRlcyBpdCB0byBrZWVwIGEgcGxhaW4gcGh5c2ljYWwg
bWFya2VyLiBPbiBINi9INjE2LAogICAgZmlybXdhcmUgYWxzbyBwYWNrcyBwcm90ZWN0ZWQgdXNl
ciBkYXRhIGJlZm9yZSB0aGUgZmlyc3QgcGFyaXR5IHJlZ2lvbgogICAgcmF0aGVyIHRoYW4gbWF4
aW1pemluZyBpdHMgYWxsb2NhdGlvbiBhY3Jvc3MgdGhlIHBhZ2UuIFRob3NlIG1pc21hdGNoZXMK
ICAgIHByZXZlbnQgbm9ybWFsIEVDQyByZWFkcyBmcm9tIGludGVycHJldGluZyBmaXJtd2FyZS1m
b3JtYXR0ZWQgcGFnZXMgYW5kCiAgICB0aGVpciBtYXJrZXJzLgoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3Vu
eGlfbmFuZC5jCj4gaW5kZXggNTY1OTRiYjQxMTkzMy4uMGUyZmYxYzU5MTIwZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKClsgLi4uIF0KCj4gQEAgLTIzNDIsNiArMjM1MywyOTkg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfb29iX29wcyBzdW54aV9uZmNfc2NyYW1i
bGVkX3BsYWluX2JibV9vb2Jfb3BzID0gewo+ICAJLmZpbmlzaF9yZWFkID0gc3VueGlfbmZjX29v
Yl9maW5pc2hfcmVhZCwKPiAgfTsKPiAgCj4gKy8qIEFsbHdpbm5lciByYW5kb21pemVkLU9PQiBm
b3JtYXQsIHNlbGVjdGVkIG9ubHkgYnkgYWxsd2lubmVyLHJhbmRvbWl6ZWQtb29iLiAqLwo+ICsj
ZGVmaW5lIFNVTlhJX05GQ19INl9BTExXSU5ORVJfT09CX01BWF9VU0VSX0RBVEFfU1ogMTYKPiAr
Cj4gK3N0YXRpYyB2b2lkIHN1bnhpX25mY19yYW5kb21pemVfYnVmKHUxNiBzdGF0ZSwgdTggKmJ1
ZiwgdW5zaWduZWQgaW50IGxlbikKPiArewo+ICsJd2hpbGUgKGxlbi0tKSB7Cj4gKwkJKmJ1Zisr
IF49IHN0YXRlOwo+ICsJCXN0YXRlID0gc3VueGlfbmZjX3JhbmRvbWl6ZXJfc3RlcChzdGF0ZSwg
OCk7Cj4gKwl9Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkCj4gK3N1bnhpX25mY19hbGx3aW5uZXJf
b29iX3JlY29yZF9zdGF0dXMoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiArCQkJCSAgICAgIHN0
cnVjdCBzdW54aV9uZmNfYWxsd2lubmVyX29vYl9zdGF0dXMgKnJlc3VsdCwKPiArCQkJCSAgICAg
IGludCBsb2dpY2FsX3N0ZXAsIGludCBod19zdGVwLAo+ICsJCQkJICAgICAgc3RydWN0IHN1bnhp
X25mY19lY2Nfc25hcHNob3QgKnNuYXBzaG90KQo+ICt7Cj4gKwl1MzIgY291bnQ7Cj4gKwo+ICsJ
aWYgKChzbmFwc2hvdC0+cGF0dGVybl9mb3VuZCAmIEJJVChod19zdGVwKSkgJiYKPiArCSAgICAh
KHNuYXBzaG90LT5wYXR0ZXJuX2lkICYgQklUKGh3X3N0ZXApKSkKPiArCQlyZXN1bHQtPnplcm9f
c3RlcHMgfD0gQklUKGxvZ2ljYWxfc3RlcCk7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBj
b2RlIGludm9rZSB1bmRlZmluZWQgYmVoYXZpb3IgaWYgbG9naWNhbF9zdGVwIGV4Y2VlZHMgdGhl
IGJpdC13aWR0aD8KClRoZSBudW1iZXIgb2YgRUNDIHN0ZXBzIGlzIGRlcml2ZWQgZGlyZWN0bHkg
ZnJvbSB0aGUgTkFORCBwYWdlIHNpemUgaW4Kc3VueGlfbmFuZF9od19lY2NfY3RybF9pbml0KCk6
CgoJbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIGVjYy0+c2l6ZTsKCXJldCA9IHN1bnhpX25h
bmQtPm9vYl9vcHMtPmluaXRfdXNlcl9kYXRhKG5hbmQsIG5zZWN0b3JzKTsKCkl0IGRvZXNuJ3Qg
YXBwZWFyIHRoYXQgbnNlY3RvcnMgaXMgdmFsaWRhdGVkIGFnYWluc3QgdGhlIGNvbnRyb2xsZXIn
cwptYXhfZWNjX3N0ZXBzIGxpbWl0LiBJZiBhIE5BTkQgZmxhc2ggd2l0aCBhIGxhcmdlIHBhZ2Ug
c2l6ZSBpcyB1c2VkLAplY2MtPnN0ZXBzIChhbmQgdGh1cyBsb2dpY2FsX3N0ZXApIGNhbiBleGNl
ZWQgdGhlIGhhcmR3YXJlIGxpbWl0IChlLmcuLAoxNiBvciAzMikuIE9uIDMyLWJpdCBwbGF0Zm9y
bXMsIHRoaXMgY291bGQgY2F1c2UgdGhlIEJJVChsb2dpY2FsX3N0ZXApCnNoaWZ0IHRvIG92ZXJm
bG93LgoKQWRkaXRpb25hbGx5LCB0aGlzIGNvdWxkIGxlYWQgdG8gb3V0LW9mLWJvdW5kcyBNTUlP
IHJlYWRzIGluCnN1bnhpX25mY19od19lY2NfZ2V0X3Byb3Rfb29iX2J5dGVzKCkgd2hlbiBpdGVy
YXRpbmcgb3ZlciBlY2MtPnN0ZXBzLAphcyByZWdfaW5kZXggbWlnaHQgZXhjZWVkIHRoZSBzdXBw
b3J0ZWQgaGFyZHdhcmUgcmVnaXN0ZXJzIGZvciB1c2VyIGRhdGEuCgpbIC4uLiBdCgo+ICtzdGF0
aWMgaW50IHN1bnhpX25mY19hbGx3aW5uZXJfb29iX2ZpbmlzaF9yZWFkKHN0cnVjdCBuYW5kX2No
aXAgKm5hbmQsCj4gKwkJCQkJICAgICAgIHN0cnVjdCBzdW54aV9uZmNfZWNjX3JlYWQgKnJlYWQs
Cj4gKwkJCQkJICAgICAgIGludCAqY3VyX29mZikKPiArewo+ICsJc3RydWN0IHN1bnhpX25mY19h
bGx3aW5uZXJfb29iX3N0YXR1cyAqcmVzdWx0ID0gJnJlYWQtPmFsbHdpbm5lcl9vb2I7Cj4gKwl1
OCAqYnVmID0gcmVhZC0+YnVmOwo+ICsJYm9vbCBvb2JfcmVxdWlyZWQgPSByZWFkLT5vb2JfcmVx
dWlyZWQ7Cj4gKwlib29sIGRtYSA9IHJlYWQtPmRtYTsKPiArCWludCBwYWdlID0gcmVhZC0+cGFn
ZTsKPiArCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQobmFuZCk7Cj4gKwlzdHJ1
Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJm5hbmQtPmVjYzsKPiArCWludCByZXQ7Cj4gKwo+ICsJ
LyoKPiArCSAqIEFsbHdpbm5lciBmaXJtd2FyZSB0cmVhdHMgYW4gYWxsLXplcm8gcGh5c2ljYWwg
cGFnZSBhcyBiYWQsIGV2ZW4gd2l0aG91dAo+ICsJICogRUNDIGVycm9ycy4gVGhpcyB0YWtlcyBw
cmVjZWRlbmNlIG92ZXIgdGhlIHNwYXJlLWJ5dGUgaGV1cmlzdGljLgo+ICsJICovCj4gKwlpZiAo
cmVzdWx0LT56ZXJvX3N0ZXBzID09IEdFTk1BU0soZWNjLT5zdGVwcyAtIDEsIDApKSB7CgpbU2V2
ZXJpdHk6IEhpZ2hdCkNhbiBHRU5NQVNLKCkgaW52b2tlIHVuZGVmaW5lZCBiZWhhdmlvciBoZXJl
IGlmIGVjYy0+c3RlcHMgZXhjZWVkcyB0aGUKYXJjaGl0ZWN0dXJlJ3MgYml0LXdpZHRoPwoKU2lt
aWxhciB0byB0aGUgQklUKCkgc2hpZnQgYWJvdmUsIHNpbmNlIGVjYy0+c3RlcHMgaXNuJ3QgYm91
bmRlZCBieQptYXhfZWNjX3N0ZXBzLCBhIGxhcmdlIHBhZ2Ugc2l6ZSBjb3VsZCBjYXVzZSB0aGlz
IHJhbmdlIHRvIGV4Y2VlZCAzMiBiaXRzLApsZWFkaW5nIHRvIGFuIG92ZXJmbG93LgoKPiArCQlt
ZW1zZXQoYnVmLCAwLCBtdGQtPndyaXRlc2l6ZSk7Cj4gKwkJbWVtc2V0KG5hbmQtPm9vYl9wb2ks
IDAsIG10ZC0+b29ic2l6ZSk7Cj4gKwkJbXRkLT5lY2Nfc3RhdHMuZmFpbGVkICs9IGVjYy0+c3Rl
cHM7Cj4gKwkJcmV0dXJuIDA7Cj4gKwl9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDE1LXN1Ym1pdC1zdW54aS1uYW5kLXZlbmRv
ci1vb2ItbGF5b3V0LXYxLXY4LTAtOGJhNDg4MWZiZWU4QGdtYWlsLmNvbT9wYXJ0PTE3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
