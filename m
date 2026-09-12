Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C38C79FB6
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2026 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rzA6D2iNhcJ3Ykdw/Gmq5Y4hA1Aw4aROmSKx1KwU1lc=; b=SK24WJUCZ1KGqG/2Rs6QJZZi9o
	upgrkbay4+bschzrBn/pVmK87oiLZFeNCCf+xbb3lxYkWTRbaO7Jym66kUYf8HX/X76XApt9EQrYq
	JKLMAVd5b0SnUq2a2ONifM/nhwtrzDD7bdcTj6gVjAKlEMP/pylLCEbuzZ2Ic89voiGH4lkfYJsie
	eIkllLZee7Oc2qWGY830KOPzWv7QhrGfxiOW+lwrwZZqtWAt8N1+3h9DT/kReXoM8pXelCRiv8x/8
	6QhhN2CZ37TvQ0cxRYwnyFfjkXs6EYR7xxOGthVWKtGlGToXGXjBb/XTGLG6mGdxOBL7BokdnyEan
	YrBRKk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hgm-00000000d7D-41s2;
	Sat, 12 Sep 2026 06:58:16 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hgi-00000000d6o-0Bo6
	for linux-mtd@lists.infradead.org;
	Sat, 12 Sep 2026 06:58:14 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789196248; bh=leruooDUceeBS55cyQM9N7+
	EUJjnPs5o4axCcQft5jo=; b=4TdRhezkcMKKa9mJdgGnTeZldT4/P82jTGqvyKCdgrx2pWLOOa
	5t1fnrvmuy5dcj3OEP8o+6Vi0ZqyK0fV6IDQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789196248; bh=leruooDUceeBS55cyQM9N7+
	EUJjnPs5o4axCcQft5jo=; b=4yLgpQZlO5FxeJVmkgxlqD2JZ4pfaVIDXIEcdawVeO+trgM55W
	ION6tFPWe2QoFApgzGIYhReQD6lTdUmlupg1qZN3oJZWI1OLVkbJNGlXQUuFhAxGFglHwd+ZsO4
	5PRn1hTuqZNr8GvBadNPbcyTMHGfpDyqhWP/oRDTUg4b05GCv3DjEgf+A0rQi9l6IsYdSi81+/j
	+9cxMGN+IK041PWxxh17hKz/1lypmzNmVjsgckGg93MoXXpPOhvQ+BPvWatDKhkSazyHvJ6zuvH
	AIcUajHmiF+uZZkRD7jKaseYmgW+XYDSwCL5hM4BpicDV5mVbqxAb1lBUzL1Fgc1HSw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Deepanshu Kartikey" <kartikey406@gmail.com>, <dwmw2@infradead.org>
Cc: <kees@kernel.org>, <viro@zeniv.linux.org.uk>, 
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com>
Subject: AW: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
Message-ID: <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
In-Reply-To: <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
References: <20260823152648.23136-1-kartikey406@gmail.com>
	<CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
Date: Sat, 12 Sep 2026 06:57:28 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_235812_677805_BB3E4A82 
X-CRM114-Status: GOOD (  21.78  )
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

QW0gU2F0LCBTZXAgMTIsIDIwMjYsIDAzOjA4IHNjaHJpZWIgRGVlcGFuc2h1IEthcnRpa2V5IDxr
YXJ0aWtleTQwNkBnbWFpbC5jb20+OgoKPiBPbiBTdW4sIEF1ZyAyMywgMjAyNiBhdCA4OjU34oCv
UE0gRGVlcGFuc2h1IEthcnRpa2V5Cj4gPGthcnRpa2V5NDA2QGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gamZmczJfYWxsb2NfaW5vZGUoKSBkb2VzIG5vdCBpbml0aWFsaXplIGYtPnRhcmdldCBi
ZWZvcmUgcmV0dXJuaW5nCj4gPiB0aGUgbmV3IGlub2RlLiBJdCBpcyBub3JtYWxseSBjbGVhcmVk
IGxhdGVyIGJ5Cj4gPiBqZmZzMl9pbml0X2lub2RlX2luZm8oKSwgY2FsbGVkIGZyb20gamZmczJf
aWdldCgpLCBidXQgdGhhdCBydW5zCj4gPiBvbmx5IGFmdGVyIGFsbG9jX2lub2RlKCkgaGFzIGFs
cmVhZHkgcmV0dXJuZWQgc3VjY2Vzc2Z1bGx5Lgo+ID4KPiA+IElmIGlub2RlX2luaXRfYWx3YXlz
KCkgZmFpbHMgaW4gYmV0d2VlbiwgYWxsb2NfaW5vZGUoKSBjYWxscwo+ID4gLT5mcmVlX2lub2Rl
KCkgZGlyZWN0bHkgb24gdGhlIGhhbGYtaW5pdGlhbGl6ZWQgaW5vZGUuCj4gPiBqZmZzMl9mcmVl
X2lub2RlKCkgdGhlbiBkb2VzIGtmcmVlKGYtPnRhcmdldCkgb24gd2hhdGV2ZXIgc3RhbGUKPiA+
IHZhbHVlIHdhcyBsZWZ0IGluIHRoZSByZXVzZWQgc2xhYiBvYmplY3QsIHdoaWNoIGNhbiBiZSBh
IHBvaW50ZXIKPiA+IHRoYXQgd2FzIGFscmVhZHkgZnJlZWQsIGNhdXNpbmcgYSBkb3VibGUtZnJl
ZS4KPiA+Cj4gPiBJbml0aWFsaXplIGYtPnRhcmdldCB0byBOVUxMIGluIGpmZnMyX2FsbG9jX2lu
b2RlKCkgdG8gY2xvc2UgdGhpcwo+ID4gd2luZG93LCBhbmQgY2xlYXIgaXQgaW4gamZmczJfZnJl
ZV9pbm9kZSgpIGFmdGVyIGZyZWVpbmcgaXQgc28gYQo+ID4gcmV1c2VkIG9yIHJlLWZyZWVkIG9i
amVjdCBjYW4gbmV2ZXIgY2FycnkgYSBkYW5nbGluZyBwb2ludGVyLgo+ID4KPiA+IEZpeGVzOiA0
ZmRjZmFiNWI1NTMgKCJqZmZzMjogZml4IHVzZS1hZnRlci1mcmVlIG9uIHN5bWxpbmsgdHJhdmVy
c2FsIikKPiA+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNjc1ZTg0ZmRmM2RkZTY3YjQ5NDZAc3l6a2Fs
bGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4gQ2xvc2VzOiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS9idWc/ZXh0aWQ9Njc1ZTg0ZmRmM2RkZTY3YjQ5NDYKPiA+IFNpZ25lZC1vZmYtYnk6IERl
ZXBhbnNodSBLYXJ0aWtleSA8a2FydGlrZXk0MDZAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZnMv
amZmczIvc3VwZXIuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL3N1cGVyLmMgYi9mcy9qZmZzMi9zdXBlci5j
Cj4gPiBpbmRleCA4MTM5NmEwOTJiYTguLjMwZDc1M2Q0YzI2MyAxMDA2NDQKPiA+IC0tLSBhL2Zz
L2pmZnMyL3N1cGVyLmMKPiA+ICsrKyBiL2ZzL2pmZnMyL3N1cGVyLmMKPiA+IEBAIC00Miw2ICs0
Miw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW5vZGUgKmpmZnMyX2FsbG9jX2lub2RlKHN0cnVjdCBzdXBl
cl9ibG9jayAqc2IpCj4gPiAgICAgICAgIGYgPSBhbGxvY19pbm9kZV9zYihzYiwgamZmczJfaW5v
ZGVfY2FjaGVwLCBHRlBfS0VSTkVMKTsKPiA+ICAgICAgICAgaWYgKCFmKQo+ID4gICAgICAgICAg
ICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgICBmLT50YXJnZXQgPSBOVUxMOwo+ID4gICAg
ICAgICByZXR1cm4gJmYtPnZmc19pbm9kZTsKPiA+ICB9Cj4gPgo+ID4gQEAgLTUwLDYgKzUxLDcg
QEAgc3RhdGljIHZvaWQgamZmczJfZnJlZV9pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4g
ICAgICAgICBzdHJ1Y3QgamZmczJfaW5vZGVfaW5mbyAqZiA9IEpGRlMyX0lOT0RFX0lORk8oaW5v
ZGUpOwo+ID4KPiA+ICAgICAgICAga2ZyZWUoZi0+dGFyZ2V0KTsKPiA+ICsgICAgICAgZi0+dGFy
Z2V0ID0gTlVMTDsKPiA+ICAgICAgICAga21lbV9jYWNoZV9mcmVlKGpmZnMyX2lub2RlX2NhY2hl
cCwgZik7Cj4gPiAgfQo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gCj4gR2VudGxlIFJlbWlu
ZGVyLiBQbGVhc2UgbGV0IG1lIGtub3cgdGhlIHN0YXR1cyBvZiB0aGlzIHBhdGNoLgoKV2UgZ290
IGxvdCdzIG9mIGlkZW50aWNhbCBmaXhlcyB0aGlzIGlzc3VlLgpJIGhhZCBubyB0aW1lIHlldCB0
byBzb3J0IG91dCB3aG8gd2FzIHRoZSBmaXJzdC4KVGhpcyBpcyBtYXliZSB0aGUgZmlyc3QgcmVw
b3J0IHdpdGggZml4IHN1Z2dlc3Rpb25zLCBidXQgdGhlIHJlcG9ydGVyCnZhbmlzaGVkOgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvQ0FGTHhHdnlaT19FRG8tWU1fRXliWkczdTdh
TlVvTmlUaGh2YmhRQ3JPUEQ3bVBWNkdBQG1haWwuZ21haWwuY29tLwoKVGhhbmtzLAovL3JpY2hh
cmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
