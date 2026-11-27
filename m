Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD4606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MxnXDm/P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+OMhKeh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cz3ufMlOQuT3A6zO0OlFlAWEdkPxPhODljGemTRnUUo=; b=MxnXDm/PRwVqgVd0AeianpbBKy
	zTPslRg48SvOxTL0Nhn1i2vSNJxEg3pdoJhR2mm4qnT/Lqtp8rLfkTbEx+86KQQ3L8eWqkzUuKPlh
	sbx6XXSB8Ugx8d0IMISdEktu7P+x2Xi13IKR0/QL2eg1hl4KLBKVCnZm8AB6/72c/mbfoC6iJww3x
	/UwNgS3fLJGr+q/RX/NWjny7AEI20KDCQswxBP/cpClAHzud5jF/oVedBnF25AqW8CjzwpPoZEqaL
	GLBgcUTWqPgfQAH5Dp2A0XQA0fGxkI0C4a/NJc/h2qUNkzcsMLRWUgTB52Wls+QeLEd82enekLvjj
	dQG3WM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5oO-00000000DCW-12BI;
	Fri, 27 Nov 2026 23:57:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5oM-00000000DCQ-0sBc
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 23:57:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AE2E60A8D;
	Fri, 27 Nov 2026 23:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9712F1F00893;
	Fri, 27 Nov 2026 23:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795823820;
	bh=P/o1jwc0gfhQijsabkB4lsZg+xvwFFm4phj/glYZYDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+OMhKehtZr4VLFXm7yALJ5TPRAgB64atqahD+VKcsIntaDZgbLzwVV/Cbw7VNI6o
	 agWYViblx9w9ZB0FMk+Dj3I86Y0cewRlJ82/Wrvvyblj3FmJECmZe0WYGZMXZxrpIz
	 /Yad/QbpGb3TXd+AGjNTR/faimvFsZpE3lfIV/s+YB7oRXQYoE+XUQakSKmSeYPvpL
	 igPqBk8BexEzCRYuxoJIA16HoQNXB8d1WJsN3TmbC+Dl6sYUm8Sa1qxwjS4i7AjzfC
	 6eWEM8pf+jE79gESUo01tFFW/WxQs98GUhugUedkEuIcPSnktgb+xzr+O4IPBA/tsn
	 +B4Pzw51cWpGQ==
Message-ID: <sashiko-outbox-238356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spinand: micron: add support for MT29F1G01AAADD
To: =?utf-8?b?VsOtdCBLYXrDrWs=?= <vitkazik@vitkazik.cz>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: tudor.ambarus@linaro.org, m.felsch@pengutronix.de, linux-mtd@lists.infradead.org
In-Reply-To: <20261127234301.262679-1-vitkazik@vitkazik.cz>
References: <20261127234301.262679-1-vitkazik@vitkazik.cz>
Date: Fri, 27 Nov 2026 23:57:00 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGluYW5kOiBt
aWNyb246IGRpdmlkZS1ieS16ZXJvIGluCiAgbWljcm9uXzRfb29ibGF5b3V0X2VjYygpIGFuZCBf
ZnJlZSgpCi0tCgpjb21taXQgNDRjYTRkYjI0YjVhN2EzMjQ5ODFjMWMwMTcwMGNlYmU4YTEyMTBi
MApBdXRob3I6IFbDrXQgS2F6w61rIDx2aXRrYXppa0B2aXRrYXppay5jej4KCm10ZDogc3BpbmFu
ZDogbWljcm9uOiBhZGQgc3VwcG9ydCBmb3IgTVQyOUYxRzAxQUFBREQKClRoaXMgY29tbWl0IGFk
ZHMgc3VwcG9ydCBhbmQgYW4gT09CIGxheW91dCBmb3IgdGhlIE1pY3JvbiBNVDI5RjFHMDFBQUFE
RAooTTY4QSkgMUdiIDMuM1YgU1BJIE5BTkQgZmxhc2ggY2hpcC4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9u
LmMKPiBpbmRleCAzNmY2Y2JiZDc0NjJjLi4zNGE4ZWE3N2MzZmU5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkv
bWljcm9uLmMKPiBAQCAtMTM0LDYgKzEzNCwyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9v
b2JsYXlvdXRfb3BzIG1pY3Jvbl80X29vYmxheW91dCA9IHsKPiAgCS5mcmVlID0gbWljcm9uXzRf
b29ibGF5b3V0X2ZyZWUsCj4gIH07Cj4gIAo+ICtzdGF0aWMgaW50IG1pY3Jvbl9tNjhhX29vYmxh
eW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiArCQkJCSAgICAg
IHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+ICt7Cj4gKwlpZiAoc2VjdGlvbiA+PSA0
KQo+ICsJCXJldHVybiAtRVJBTkdFOwo+ICsKPiArCS8qIDIgYnl0ZXMgZm9yIHRoZSBCQk0gKyAy
IGJ5dGVzIG9mIG5vbi1FQ0MgcHJvdGVjdGVkIG1lbW9yeSAqLwo+ICsJcmVnaW9uLT5vZmZzZXQg
PSAoc2VjdGlvbiAqIDE2KSArIDQ7Cj4gKwlyZWdpb24tPmxlbmd0aCA9IDQ7Cj4gKwo+ICsJcmV0
dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMg
bWljcm9uX202OGFfb29ibGF5b3V0ID0gewo+ICsJLmVjYyA9IG1pY3Jvbl80X29vYmxheW91dF9l
Y2MsCj4gKwkuZnJlZSA9IG1pY3Jvbl9tNjhhX29vYmxheW91dF9mcmVlLAo+ICt9OwoKW1NldmVy
aXR5OiBNZWRpdW1dCkNhbiBtaWNyb25fNF9vb2JsYXlvdXRfZWNjKCkgZGl2aWRlIGJ5IHplcm8g
d2hlbiBNVDI5RjFHMDFBQUFERCBpcyBwcm9iZWQKd2l0aG91dCBhbiBFQ0MgZW5naW5lIChlLmcu
IG5hbmQtbm8tZWNjLWVuZ2luZSBpbiBEZXZpY2UgVHJlZSk/CgptaWNyb25fNF9vb2JsYXlvdXRf
ZWNjKCkgYm91bmRzIHNlY3Rpb24gYnkgZGl2aWRpbmcgYnkgbXRkLT5lY2Nfc3RlcF9zaXplOgoK
ZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmM6bWljcm9uXzRfb29ibGF5b3V0X2VjYygpIHsK
ICAgIC4uLgoJaWYgKHNlY3Rpb24gPj0gc3BpbmFuZC0+YmFzZS5tZW1vcmcucGFnZXNpemUgLwoJ
CQltdGQtPmVjY19zdGVwX3NpemUpCgkJcmV0dXJuIC1FUkFOR0U7CiAgICAuLi4KfQoKSW4gc3Bp
bmFuZF9pbml0KCksIHdoZW4gbmFuZC0+ZWNjLmVuZ2luZSBpcyBOVUxMLCBzcGluYW5kLT5lY2Np
bmZvLm9vYmxheW91dAppcyBzdGlsbCBpbnN0YWxsZWQgb24gbXRkIHdoaWxlIG5hbmRkZXZfZ2V0
X2VjY19jb25mKG5hbmQpLT5zdGVwX3NpemUgaXMgMCwKbGVhdmluZyBtdGQtPmVjY19zdGVwX3Np
emUgYXMgMC4gIER1cmluZyBkZXZpY2UgcmVnaXN0cmF0aW9uIGluCnNwaW5hbmRfcHJvYmUoKSwg
bXRkX2RldmljZV9yZWdpc3RlcigpIC0+IGFkZF9tdGRfZGV2aWNlKCkgLT4KbXRkX2RlYnVnZnNf
cG9wdWxhdGUoKSBjYWxscyBtdGRfb29ibGF5b3V0X2VjYyhtdGQsIDAsICZyZWdpb24pLCBoaXR0
aW5nCmEgZGl2aWRlLWJ5LXplcm8gaW4gbWljcm9uXzRfb29ibGF5b3V0X2VjYygpLgoKKE5vdGUg
dGhhdCBtaWNyb25fNF9vb2JsYXlvdXRfZnJlZSgpIGhhcyB0aGUgc2FtZSBkaXZpc2lvbiBieQpt
dGQtPmVjY19zdGVwX3NpemUsIHdoaWNoIGFscmVhZHkgZGl2aWRlcyBieSB6ZXJvIGR1cmluZyBz
cGluYW5kX2luaXQoKQpiZWNhdXNlIG10ZF9vb2JsYXlvdXRfY291bnRfZnJlZWJ5dGVzKCkgcnVu
cyBiZWZvcmUgbXRkLT5lY2Nfc3RlcF9zaXplIGlzCnBvcHVsYXRlZC4pCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI3MjM0MzAx
LjI2MjY3OS0xLXZpdGthemlrQHZpdGthemlrLmN6P3BhcnQ9MQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
