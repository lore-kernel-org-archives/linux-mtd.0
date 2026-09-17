Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A146FC982C1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 01:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9aCIT0BJ2SfmtFCqUldcyuz88VuaKOTyDyeSS9d0r4=; b=2Pihjj5V2Ezdl8
	TN+Ip8BmjcPkWEXoD6AZM6GpGJ1kpK8On9SaKsmnYEqCzXhhxnajR5xhXXS/eZ8g2/2y+tx/bqFIA
	Yp98p9qjBl/ZSbVhR2Nn24DhFuIbWTr1ii0Mxe6djjCKAlqcJLkncnJn/baUr3Yq11uSGg/TQFHVD
	dyuS7VSNZ6fvDT4Wq7GqfTLJziqIFVow2AK9uTybSJZKmfeZFmtofhUlisk2+UiPQ89sToyggYKmu
	JBh11mML3uPPynzK7TH/f2hqzhi48RYbgYiduuSOqkj81GGMwAgBU4Lzd351HwMdgJmjdT7/NOgDJ
	q+Q91NYqrWg0dPmnEb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70i1-0000000AOrC-0l0g;
	Thu, 17 Sep 2026 01:14:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70i0-0000000AOr3-1ncY
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 01:14:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEE2A414F3;
	Thu, 17 Sep 2026 01:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FED1F000FF;
	Thu, 17 Sep 2026 01:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789607679;
	bh=/UhTFAQa5kfXsW+93XMYWR3y025pJRjKCUvQfV6Cn14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jaTThvms1eZMy21+1qCSV+1qGim6nUpZ4RAxQRFmH9n5S8Ni53VS1OZGJgZchBLYI
	 T/vAfrcXXm09AwYHxrjfxka/uLSNRWO7AuoMKLUQL+fAowIzysKH13DFpUlGWJENUQ
	 fBlPj0OY969XJb65HTBDSOgdBgVrVWfWXc1A13LD/URH3kBtkYl2tNKo/sS0Wi5Vgu
	 Uc947cf1/HyCfOESAz4UiOh73R8mE4qKL8YrxSLmVXmeBgodXqfrnyCj7v4o3wY9zv
	 fVMLoJCsvxxgBpPuv6R4JnNUJFR4W1droVU97TR5nwjE0nOGeAeEMF/MW0rCTGtwv1
	 PeBHRAQbThBcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: maps: add INT0800 firmware-flash map driver
To: linux-mtd@lists.infradead.org, "Stephen Bancroft" <stevereaver@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com
In-Reply-To: <20260917010431.29714-1-stevereaver@gmail.com>
References: <20260917010431.29714-1-stevereaver@gmail.com>
Date: Thu, 17 Sep 2026 01:14:38 +0000
Message-Id: <20260917011439.76FED1F000FF@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBtZW1vcnkg
YW5kIG1hcHBpbmcgbGVhayBvbiBtdGRfZGV2aWNlX3JlZ2lzdGVyKCkgZmFpbHVyZQotIFtNZWRp
dW1dIG10ZDogc2hhcmVkIHN0YXRlIGNvcnJ1cHRpb24gdmlhIGdsb2JhbCB2YXJpYWJsZXMgaW4g
cHJvYmUKLSBbTG93XSBtdGQ6IGZvcm1hdCBzdHJpbmcgbWlzbWF0Y2ggZm9yIHJlc291cmNlX3Np
emVfdCBpbiBkZXZfaW5mbwotLQoKY29tbWl0IGEyMTdhMTVmOWUyOTMwMGExNTVlNmY2YzgxMzgz
MjVkNGYxNzhmN2IKQXV0aG9yOiBTdGVwaGVuIEJhbmNyb2Z0IDxzdGV2ZXJlYXZlckBnbWFpbC5j
b20+CgptdGQ6IG1hcHM6IGFkZCBJTlQwODAwIGZpcm13YXJlLWZsYXNoIG1hcCBkcml2ZXIKClRo
aXMgY29tbWl0IGFkZHMgYSByZWFkLW9ubHkgTVREIG1hcHBpbmcgZHJpdmVyIGZvciB0aGUgQUNQ
SSBJTlQwODAwCmZpcm13YXJlIGh1YiBkZXZpY2Ugb24geDg2LiBJdCBleHBvc2VzIHRoZSBzeXN0
ZW0gZmlybXdhcmUgZmxhc2ggYXMgYW4KTVREIFJPTSBkZXZpY2UgdG8gYWxsb3cgdXNlcnNwYWNl
IHRvIHJlYWQgdGhlIGZpcm13YXJlIGZsYXNoIGNvbnRlbnRzIHNhZmVseS4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL21hcHMvaW50MDgwMC5jIGIvZHJpdmVycy9tdGQvbWFwcy9pbnQwODAw
LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjI0MzhkOTcw
YjlmYTQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9tdGQvbWFwcy9pbnQwODAwLmMK
WyAuLi4gXQo+ICtzdGF0aWMgc3RydWN0IG1hcF9pbmZvIGludDA4MDBfbWFwID0gewo+ICsJLm5h
bWUJCT0gImludDA4MDAiLAo+ICsJLmJhbmt3aWR0aAk9IDEsCj4gK307Cj4gKwo+ICtzdGF0aWMg
c3RydWN0IG10ZF9pbmZvICppbnQwODAwX210ZDsKPiArCj4gK3N0YXRpYyBpbnQgaW50MDgwMF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7ClsgLi4uIF0KPiArCWludDA4
MDBfbWFwLnZpcnQgPSBpb3JlbWFwKGludDA4MDBfbWFwLnBoeXMsIGludDA4MDBfbWFwLnNpemUp
OwoKW1NldmVyaXR5OiBNZWRpdW1dClNpbmNlIGludDA4MDBfbWFwIGFuZCBpbnQwODAwX210ZCBh
cmUgZ2xvYmFsIHZhcmlhYmxlcywgd2hhdCBoYXBwZW5zIGlmCm11bHRpcGxlIElOVDA4MDAgZGV2
aWNlcyBhcmUgZW51bWVyYXRlZD8KCkl0IGxvb2tzIGxpa2UgdGhpcyB1bmNvbmRpdGlvbmFsbHkg
b3ZlcndyaXRlcyB0aGUgZ2xvYmFsIHN0YXRlIGR1cmluZwppbnQwODAwX3Byb2JlKCkuIExhdGVy
LCBpbnQwODAwX3JlbW92ZSgpIHdpbGwgZnJlZSB0aGVzZSBnbG9iYWxseSBzdG9yZWQKcG9pbnRl
cnMsIHdoaWNoIGNvdWxkIGRlc3Ryb3kgdGhlIHN0YXRlIGZvciBhbGwgYWN0aXZlIGluc3RhbmNl
cyBvciBjYXVzZSBhCmRvdWJsZS1mcmVlLgoKWyAuLi4gXQo+ICsJZGV2X2luZm8oJnBkZXYtPmRl
diwgIm1hcHBlZCBmaXJtd2FyZSB3aW5kb3cgMHglbHgtMHglbHhcbiIsCj4gKwkJIGludDA4MDBf
bWFwLnBoeXMsCj4gKwkJIGludDA4MDBfbWFwLnBoeXMgKyBpbnQwODAwX21hcC5zaXplIC0gMSk7
CgpbU2V2ZXJpdHk6IExvd10KRG9lcyB0aGlzIGZvcm1hdCBzdHJpbmcgY2F1c2UgaXNzdWVzIG9u
IDMyLWJpdCBhcmNoaXRlY3R1cmVzIHdoZXJlCnJlc291cmNlX3NpemVfdCBpcyBhIDY0LWJpdCBp
bnRlZ2VyPwoKVXNpbmcgJWx4IGZvciByZXNvdXJjZV9zaXplX3QgY2FuIGNvbnN1bWUgb25seSBo
YWxmIHRoZSB2YWx1ZSBhbmQgbWlzYWxpZ24Kc3Vic2VxdWVudCBhcmd1bWVudHMgb24gdGhlIHN0
YWNrLiBTaG91bGQgdGhpcyB1c2UgJXBhIG9yIGFuIGV4cGxpY2l0IGNhc3QKdG8gdTY0IHdpdGgg
JWxseCBpbnN0ZWFkPwoKPiArCj4gKwlyZXR1cm4gbXRkX2RldmljZV9yZWdpc3RlcihpbnQwODAw
X210ZCwgTlVMTCwgMCk7Cj4gK30KCltTZXZlcml0eTogTWVkaXVtXQpJZiBtdGRfZGV2aWNlX3Jl
Z2lzdGVyKCkgZmFpbHMgaGVyZSwgZG8gd2UgbGVhayB0aGUgbWVtb3J5IG1hcHBpbmcgYW5kIHRo
ZQpNVEQgaW5zdGFuY2U/CgpOb3JtYWxseSwgd2Ugd291bGQgZXhwZWN0IHRvIHNlZSBtYXBfZGVz
dHJveSgpIGFuZCBpb3VubWFwKCkgb24gdGhpcyBmYWlsdXJlCnBhdGgsIHNpbWlsYXIgdG8gd2hh
dCBpcyBkb25lIGluIGludDA4MDBfcmVtb3ZlKCksIGJ1dCBoZXJlIHRoZSBlcnJvciBpcwpyZXR1
cm5lZCBkaXJlY3RseS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTcwMTA0MzEuMjk3MTQtMS1zdGV2ZXJlYXZlckBnbWFpbC5j
b20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
