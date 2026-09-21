Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF54C982EA
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 02:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aP+aFdwJB+STH5O0gGod32hTYxLpkmm1gnf5EBH+/UQ=; b=b5JEO321azEYGl
	RCgGuRKpxqUmfFboMfu5p23kJS2Zft9ZZcQswp8JZavO4AfO4uDMSFtAssVtDm/0TDBKmtJcOgcVG
	2bz2ZAdK2hiAUPGkjNLnWIUyHGMYhutN8NyF8bYNZU8glsxdlgZ3EAfPjmbYK/i7dpfg+vptNEQcr
	ocHXotkb31sixiGWEw9a7OPtKBdilLj/lfI0MYug3kU4rEzHoMOPdUAC+ikLTvXwdH0K1Pi85i2tg
	jikK5caqjNuwo/ki7j/QItEZCHlDkYiPLcHCaVuJg+BDnn9dGCZtvMFIEhXWa4CcIN0dcKAu/Vem8
	NZv6IqdhKOsvmCHXGQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8TnK-00000000jBx-34I7;
	Mon, 21 Sep 2026 02:30:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8TnJ-00000000jBg-28kU
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 02:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C25B9404AB;
	Mon, 21 Sep 2026 02:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556771F000FF;
	Mon, 21 Sep 2026 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789957812;
	bh=/XL5rnfKQLyBQCvuigtRdilLwJDi3LJgcPBEohWzXVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXcg4Rre3q2j468v7bd6oqbpWb0KCs4xUiB+6vb8/mHPa7LEOFSCmYwpLII+ciGAK
	 9fua8wyMqPBHan4Q/CfZ7rXrA6bjTow7d1rM96x9ouWeXe6e3SnhyNitrxzb3m5oHR
	 z6oQMIXOFeluzF1mVQemeSKkRZPDyPs5J8aV83lzz7zLIxEYq/RH7Fk7VOuIW5aAK9
	 KhKrjWAJAebIRw3bMR0t9A6opLq4WFgCA7HeF0Vb43FfOr1/hGy3cbkE8FaB65AmPQ
	 ZrLiEiq/l2bYztDm23vgkW1ju5PJtkxy1I5P46BlLP71yonRgxJIS1XOqeBhnvpggB
	 JjvH1Dmdaa9WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: maps: add INT0800 firmware-flash map driver
To: "Stephen Bancroft" <stevereaver@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, linux-kernel@vger.kernel.org
In-Reply-To: <20260921021459.283023-1-stevereaver@gmail.com>
References: <V2-MESSAGE-ID> <20260921021459.283023-1-stevereaver@gmail.com>
Date: Mon, 21 Sep 2026 02:30:11 +0000
Message-Id: <20260921023012.556771F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogbWFwczogVXNl
LUFmdGVyLUZyZWUgaW4gaW50MDgwMCB2aWEgc3lzZnMgZHJpdmVyIHVuYmluZAotLQoKY29tbWl0
IDJkOTA0YzRhMGFlNTAwOTI0NWRkMTU4N2M4MDRmMGFjNmU5NDAyYjgKQXV0aG9yOiBTdGVwaGVu
IEJhbmNyb2Z0IDxzdGV2ZXJlYXZlckBnbWFpbC5jb20+CgptdGQ6IG1hcHM6IGFkZCBJTlQwODAw
IGZpcm13YXJlLWZsYXNoIG1hcCBkcml2ZXIKCkFkZHMgYSByZWFkLW9ubHkgTVREIG1hcHBpbmcg
ZHJpdmVyIHRoYXQgYmluZHMgdGhlIEFDUEkgSU5UMDgwMCBkZXZpY2UgYW5kCmV4cG9zZXMgdGhl
IHN5c3RlbSBmaXJtd2FyZSBmbGFzaCBhcyBhbiBNVEQgUk9NIGRldmljZS4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL21hcHMvaW50MDgwMC5jIGIvZHJpdmVycy9tdGQvbWFwcy9pbnQwODAw
LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjAxODhkNThi
MTY4ZDkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9tdGQvbWFwcy9pbnQwODAwLmMK
ClsgLi4uIF0KCj4gK3N0YXRpYyB2b2lkIGludDA4MDBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gK3sKPiArCXN0cnVjdCBpbnQwODAwICpmdyA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOwo+ICsKPiArCW10ZF9kZXZpY2VfdW5yZWdpc3Rlcihmdy0+bXRkKTsKPiAr
CW1hcF9kZXN0cm95KGZ3LT5tdGQpOwo+ICt9CgpbU2V2ZXJpdHk6IEhpZ2hdCkNhbiB0aGlzIGxl
YWQgdG8gYSB1c2UtYWZ0ZXItZnJlZSBhbmQgdW5tYXBwZWQgbWVtb3J5IGRlcmVmZXJlbmNlIGlm
IGEKdXNlciBmb3JjZXMgYSBkcml2ZXIgdW5iaW5kIHZpYSBzeXNmcyB3aGlsZSB0aGUgY2hhcmFj
dGVyIGRldmljZSBpcyBzdGlsbApvcGVuPwoKSWYgYSBwcml2aWxlZ2VkIHVzZXIgb3BlbnMgL2Rl
di9tdGRYIGFuZCB0aGVuIHdyaXRlcyB0bwovc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2ludDA4
MDAvdW5iaW5kLCBpbnQwODAwX3JlbW92ZSgpIGlzIGludm9rZWQuClRoaXMgdW5jb25kaXRpb25h
bGx5IGNhbGxzIG1hcF9kZXN0cm95KGZ3LT5tdGQpLCBmcmVlaW5nIHRoZSBtdGRfaW5mbwpzdHJ1
Y3R1cmUgYW5kIGFsbG93aW5nIGRldnJlcyB0byB1bm1hcCBmdy0+bWFwLnZpcnQuCgpTaW5jZSBt
dGRjaGFyX29wZW4oKSBpbmNyZW1lbnRpbmcgdGhlIG1vZHVsZSB1c2UtY291bnQgZG9lcyBub3Qg
cHJldmVudApmb3JjZWQgc3lzZnMgdW5iaW5kcywgYSBzdWJzZXF1ZW50IHJlYWQoKSBvbiB0aGUg
c3RpbGwtb3BlbiBmaWxlCmRlc2NyaXB0b3Igd291bGQgZGVyZWZlcmVuY2UgdGhlIGZyZWVkIG10
ZF9pbmZvIGFuZCByZWFkIGZyb20gdGhlCnVubWFwcGVkIG1lbW9yeS4KClNob3VsZCB0aGlzIGRy
aXZlciBzZXQgLnN1cHByZXNzX2JpbmRfYXR0cnMgPSB0cnVlIGluIHRoZSBwbGF0Zm9ybV9kcml2
ZXIKdG8gcHJldmVudCBmb3JjZWQgc3lzZnMgdW5iaW5kcz8KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjEwMjE0NTkuMjgzMDIz
LTEtc3RldmVyZWF2ZXJAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
