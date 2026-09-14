Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B92C88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46UA+ehaMLh6NWtZyP5SlVk2QG+eDUmAU90fqpFHdro=; b=Ih8KbnHdIj/ecB
	DAq3/JGQwOq69W2DnrIk4Dr+Sliy3erCavSmBNUNSoOqa+0A6SaL1zBxx74ZRWEKgsp2eL+9tnnjp
	TAXC1c98irXtVKjj3LeTczJKJ5vVxJLNHvIawWkI/kSJMiff8yiMa6cGUz8UGKc79g1kasksKflkK
	tAYMvPaBJCV3VejWAgh/0MwNwAs1kq3VD44Pn5GN9n8d6uKX25XV/PURUra81ndRLaeaZyjEVB9vG
	CaKS3/aZifygg0bc2UMEFP/UdMND+22lG6Ivt63miTcwLGrLYvxDvJ/v0NPgRw5b5CZz3wYfZ8UcG
	vDA2TX0JfLRnH2ac4Lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61zg-00000002j9n-1i1X;
	Mon, 14 Sep 2026 08:24:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61ze-00000002j6v-2zzs
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:24:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FA4860008;
	Mon, 14 Sep 2026 08:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334741F000FF;
	Mon, 14 Sep 2026 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374289;
	bh=kVq+AJquutVh4If0ZLCViIV5j+KZDo5vwts+woKOrcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bdVkNLEUIn0ypPrEA8AlLeQ4evhL/D1pCana7Sknb4bRcGztVI6+VpNkkZUppCqcl
	 MTs5ECWXr84x4VYWhqeWgh1qi618TTBP+KTMJnKpOUhTTKykvm4+piWbFyGL6G2iXT
	 t3Iv2GaKnDWdtKfmtPTN8XwIx1G76Zc4KV3GOjOY3uFI312W0GOVo5//FD613hZcTp
	 iN+SOIqR/mBxLTmgVpQlw38ZDP+TNzvr+jyq58ZqNI+1SUnkNI8hOVXumk9rjRQAaX
	 myzgAFIUekJRCugd/9CGbIXQ1B8ltPUC/id7vQuze1/59EU75WoFJKkCqqlolnvPDk
	 u5wgq8icwF6vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: take the flash lock in
 spi_nor_shutdown()
To: "Itai Handler" <itai.handler@gmail.com>, mwalle@kernel.org, pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, stable@vger.kernel.org, takahiro.kuwano@infineon.com
In-Reply-To: <20260914081149.1916589-3-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
 <20260914081149.1916589-3-itai.handler@gmail.com>
Date: Mon, 14 Sep 2026 08:24:48 +0000
Message-Id: <20260914082449.334741F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBS
ZXR1cm5pbmcgZWFybHkgZnJvbSBgc3BpX25vcl9zaHV0ZG93bigpYCB3aGVuIGBzcGlfbm9yX3By
ZXBfYW5kX2xvY2soKWAgaXMgaW50ZXJydXB0ZWQgYnkgYSBzaWduYWwgc2tpcHMgY3JpdGljYWwg
aGFyZHdhcmUgcmVzdG9yYXRpb24sIHBvdGVudGlhbGx5IGJyaWNraW5nIHRoZSBkZXZpY2Ugb24g
bmV4dCBib290LgoKUHJlLWV4aXN0aW5nIGlzc3VlczoKLSBbSGlnaF0gTWlzc2luZyBgc3BpX25v
cl91bnByZXAoKWAgb24gdGhlIGVycm9yIHBhdGggb2YgYHNwaV9ub3JfcHJlcF9hbmRfbG9jaygp
YCBhbmQgaXRzIHZhcmlhbnRzIGNhdXNlcyBjb250cm9sbGVyIHJlc291cmNlIGxlYWtzIGFuZCBw
b3RlbnRpYWwgZGVhZGxvY2tzLgotLQoKY29tbWl0IDQ1MzYzZjAwOGE2MzM5MWVhMWU4NWJlNWNi
OWI3N2U1YzJkNTkyNzcKQXV0aG9yOiBJdGFpIEhhbmRsZXIgPGl0YWkuaGFuZGxlckBnbWFpbC5j
b20+CgptdGQ6IHNwaS1ub3I6IHRha2UgdGhlIGZsYXNoIGxvY2sgaW4gc3BpX25vcl9zaHV0ZG93
bigpCgpUaGlzIGNvbW1pdCBhY3F1aXJlcyB0aGUgZmxhc2ggbG9jayBpbiBzcGlfbm9yX3NodXRk
b3duKCkgdG8gc2VyaWFsaXplCmRldmljZSByZXN0b3JhdGlvbiB3aXRoIGNvbmN1cnJlbnQgb3Bl
cmF0aW9ucy4gVGhpcyBwcmV2ZW50cyB0aGUgcmVzdG9yZQpjb21tYW5kIGZyb20gYmVpbmcgaWdu
b3JlZCBieSBhIGJ1c3kgZmxhc2ggY2hpcCBvciBjb3JydXB0aW5nIGFuIG9uZ29pbmcKcmVhZCBv
cGVyYXRpb24gZHVyaW5nIHN5c3RlbSBzaHV0ZG93bi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBpbmRleCA4
YmMxMTdiNDZlMDI4Li42NDdiZjhkY2U3MTkzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBAQCAtMzg2
Miw4ICszODYyLDIxIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9yZW1vdmUoc3RydWN0IHNwaV9tZW0g
KnNwaW1lbSkKPiAgc3RhdGljIHZvaWQgc3BpX25vcl9zaHV0ZG93bihzdHJ1Y3Qgc3BpX21lbSAq
c3BpbWVtKQo+ICB7Cj4gIAlzdHJ1Y3Qgc3BpX25vciAqbm9yID0gc3BpX21lbV9nZXRfZHJ2ZGF0
YShzcGltZW0pOwo+ICsJaW50IHJldDsKPiArCj4gKwkvKgo+ICsJICogV2FpdCBmb3IgYW4gb3Bl
cmF0aW9uIHN0YXJ0ZWQgYnkgYW5vdGhlciB0aHJlYWQgdG8gZmluaXNoLgo+ICsJICogZGV2aWNl
X3NodXRkb3duKCkgcnVucyB3aXRoIE1URCB1c2VycyBzdGlsbCBhY3RpdmU6IGEgYnVzeSBmbGFz
aAo+ICsJICogaWdub3JlcyB0aGUgY29tbWFuZHMgc3BpX25vcl9yZXN0b3JlKCkgaXNzdWVzLCBs
ZWF2aW5nIGl0IGluCj4gKwkgKiA0LWJ5dGUgYWRkcmVzcyBtb2RlLCBhbmQgYSByZXN0b3JlIGxh
bmRpbmcgbWlkLXJlYWQgY2hhbmdlcyB0aGUKPiArCSAqIGNoaXAncyBhZGRyZXNzIHdpZHRoIHVu
ZGVyIHRoZSB0cmFuc2Zlci4KPiArCSAqLwo+ICsJcmV0ID0gc3BpX25vcl9wcmVwX2FuZF9sb2Nr
KG5vcik7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybjsKCltTZXZlcml0eTogSGlnaF0KSWYgd2Fp
dF9ldmVudF9raWxsYWJsZSgpIGluIHNwaV9ub3JfcHJlcF9hbmRfbG9jaygpIGlzIGludGVycnVw
dGVkIGJ5IGEgZmF0YWwKc2lnbmFsLCBpdCByZXR1cm5zIC1FUkVTVEFSVFNZUy4gV2lsbCByZXR1
cm5pbmcgZWFybHkgaGVyZSBza2lwIHRoZSBjcml0aWNhbApoYXJkd2FyZSByZXN0b3JhdGlvbiBp
biBzcGlfbm9yX3Jlc3RvcmUoKT8KCklmIHRoZSBmbGFzaCBjaGlwIGlzIGxlZnQgaW4gNC1ieXRl
IGFkZHJlc3NpbmcgbW9kZSwgY291bGQgdGhlIGJvb3Rsb2FkZXIKcmVhZCBnYXJiYWdlIGRhdGEg
b24gdGhlIG5leHQgYm9vdCwgZWZmZWN0aXZlbHkgc29mdC1icmlja2luZyB0aGUgZGV2aWNlCnVu
dGlsIGEgaGFyZCBwb3dlciBjeWNsZT8KCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1
ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHNwaV9ub3JfcHJlcF9hbmRfbG9j
aygpCmxlYWsgY29udHJvbGxlciByZXNvdXJjZXMgb24gaXRzIGVycm9yIHBhdGg/CgpMb29raW5n
IGF0IHNwaV9ub3JfcHJlcF9hbmRfbG9jaygpIGluIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
OgoKaW50IHNwaV9ub3JfcHJlcF9hbmRfbG9jayhzdHJ1Y3Qgc3BpX25vciAqbm9yKQp7CglpbnQg
cmV0OwoKCXJldCA9IHNwaV9ub3JfcHJlcChub3IpOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0OwoK
CWlmICghc3BpX25vcl91c2VfcGFyYWxsZWxfbG9ja2luZyhub3IpKQoJCW11dGV4X2xvY2soJm5v
ci0+bG9jayk7CgllbHNlCgkJcmV0ID0gd2FpdF9ldmVudF9raWxsYWJsZShub3ItPnJ3dy53YWl0
LAoJCQkJCSAgc3BpX25vcl9yd3dfc3RhcnRfZXhjbHVzaXZlKG5vcikpOwoKCXJldHVybiByZXQ7
Cn0KCklmIHdhaXRfZXZlbnRfa2lsbGFibGUoKSBpcyBpbnRlcnJ1cHRlZCBhbmQgcmV0dXJucyBh
biBlcnJvciwgdGhlIGZ1bmN0aW9uCnJldHVybnMgd2l0aG91dCBjYWxsaW5nIHNwaV9ub3JfdW5w
cmVwKG5vcikuIENvdWxkIHRoaXMgcGVybWFuZW50bHkgbGVhayB0aGUKaGFyZHdhcmUgbG9ja3Mg
YW5kIGNsb2NrcyBlbmFibGVkIGluIHNwaV9ub3JfcHJlcCgpLCBkZWFkbG9ja2luZyB0aGUKY29u
dHJvbGxlciBmb3IgYWxsIHN1YnNlcXVlbnQgU1BJIG9wZXJhdGlvbnM/CgpUaGUgc2FtZSBiZWhh
dmlvciBhcHBlYXJzIHRvIGJlIHByZXNlbnQgaW4gdGhlIHNwaV9ub3JfcHJlcF9hbmRfbG9ja19w
ZSgpIGFuZApzcGlfbm9yX3ByZXBfYW5kX2xvY2tfcmQoKSB2YXJpYW50cy4KCj4gIAo+ICAJc3Bp
X25vcl9yZXN0b3JlKG5vcik7Cj4gKwlzcGlfbm9yX3VubG9ja19hbmRfdW5wcmVwKG5vcik7Cj4g
IH0KPgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDkxNDA4MTE0OS4xOTE2NTg5LTEtaXRhaS5oYW5kbGVyQGdtYWlsLmNvbT9wYXJ0
PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
