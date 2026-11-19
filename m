Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84E0606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a+Zmk5lx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDG3CY9i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qMdZHO2yCO9/jYNWlM4hrngay0glGD63Y9GRJ2V2IbI=; b=a+Zmk5lxvVKzUl2wPrZzDCarlu
	081l+gY6gTRUarbFEJeB9dBGm0FyS2fcWxP0XfAU367pC2jVQujvMY1JCT1UxtP+F2V8RtcQuyD+u
	X/BLot/+0MvYhQoC3Ut3ACsOy7VFzV9cYIGukmIyiopfiJ06595bPRwbthZk3sclDZM1abWJZ3zuK
	IZO1KH1Sz2uwd0Vd2BNGy3xthDYkaY7SGJS69e0Oi2GhZSIlxmCQZK7YSXTFo6iwhmjMHz/AG2hkY
	9AUsn24uBmg0iuEeo+ea4G2RU0GwD8izS0HYZgn2eXD67gS29w4Qt53xvBwdtpKma5GVLAGlRmTJs
	SKVHXcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAkz-0000000DaBO-45XA;
	Thu, 19 Nov 2026 22:37:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAky-0000000DaBH-2hUa
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:37:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25168602CA;
	Thu, 19 Nov 2026 22:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2071F000C0;
	Thu, 19 Nov 2026 22:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127846;
	bh=q947b9MJ4wqQ3oOwjlqmiOxkPUfy9BHmayjDzhcMnd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDG3CY9i5W4gqgD7pKrb4IcgAV+fXbha5QkLv5YGbjYigcKAk3bpFnsTZPQBCdhog
	 1s4ppeb0UFRoj6BgpKsOfAMROrNgLQu/vvR4e95RUPVlEOGZ8McuXuRt7lxKuSZ6/w
	 iXb/RnB/3Wve4En6V0azcD2aaYeU/bUkRgQGS+tyVc0I3ebD/I+caRTLjJCK8DuB5s
	 ff+Lsvi55YRI0cBdHi/378hSpue8Jo/ilsvVxW3Ottd3dUNizPcLGyE5s2Z9fFX4NR
	 9Bu+j/8XDrCqN2igbpOm1UkC0jM2wg23CGcQWevpMn6wGzWIbNjlrbVldBxF2T0Ik8
	 TcJCcLU/sy6vA==
Message-ID: <sashiko-outbox-224135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mtd: rawnand: cadence: Switch to
 dmaengine_get_dma_device()
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Niravkumar L Rabara" <niravkumarlaxmidas.rabara@altera.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261119-perso-upstreaming-rawnand-fixes-v1-2-0c95641b550c@bootlin.com>
References: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
 <20261119-perso-upstreaming-rawnand-fixes-v1-2-0c95641b550c@bootlin.com>
Date: Thu, 19 Nov 2026 22:37:26 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5kOiBj
YWRlbmNlOiBETUEgZGV2aWNlIG1pc21hdGNoIGluCiAgY2FkZW5jZV9uYW5kX3NsYXZlX2RtYV90
cmFuc2ZlcigpCkl0IGFsc28gbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4aXN0aW5nIGlzc3VlIHRo
aXMgcGF0Y2ggZG9lcyBub3QKaW50cm9kdWNlOgotIFtIaWdoXSBtdGQ6IHJhd25hbmQ6IGNhZGVu
Y2U6IGhlYXAgYnVmZmVyIG92ZXJmbG93IGluCiAgY2FkZW5jZV9uYW5kX2F0dGFjaF9jaGlwKCkg
WzFdCi0tCgpjb21taXQgYzllZmRhYTM5MGM4YzY0YjljNTI2NGU2NDJiZTk3MGFmZTlhNTA0NApB
dXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgptdGQ6IHJh
d25hbmQ6IGNhZGVuY2U6IFN3aXRjaCB0byBkbWFlbmdpbmVfZ2V0X2RtYV9kZXZpY2UoKQoKVGhp
cyBjb21taXQgcmVwbGFjZXMgZGlyZWN0IGFjY2Vzc2VzIHRvIGNkbnNfY3RybC0+ZG1hYy0+ZGV2
aWNlLT5kZXYgaW4KY2FkZW5jZV9uYW5kX2luaXQoKSB3aXRoIGRtYWVuZ2luZV9nZXRfZG1hX2Rl
dmljZSgpLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5k
LWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9s
bGVyLmMKPiBpbmRleCA0MmNjNjJiMzY0NTdhLi4yYWI1OWVjNmU3MzJlIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTMxMjYs
NyArMzEyNiw2IEBAIGNhZGVuY2VfbmFuZF9pcnFfY2xlYW51cChpbnQgaXJxbnVtLCBzdHJ1Y3Qg
Y2Ruc19uYW5kX2N0cmwgKmNkbnNfY3RybCkKPiAgc3RhdGljIGludCBjYWRlbmNlX25hbmRfaW5p
dChzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwgKmNkbnNfY3RybCkKPiAgewo+ICAJZG1hX2NhcF9tYXNr
X3QgbWFzazsKPiAtCXN0cnVjdCBkbWFfZGV2aWNlICpkbWFfZGV2Owo+ICAJaW50IHJldDsKPiAg
Cj4gIAljZG5zX2N0cmwtPmNkbWFfZGVzYyA9IGRtYV9hbGxvY19jb2hlcmVudChjZG5zX2N0cmwt
PmRldiwKCltTZXZlcml0eTogSGlnaF0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5
IHRoaXMgcGF0Y2gsIGJ1dCBjYW4gWzFdIG92ZXJmbG93CmNkbnNfY3RybC0+YnVmIGR1cmluZyBj
YWRlbmNlX25hbmRfY2hpcHNfaW5pdCgpPwoKY2FkZW5jZV9uYW5kX2luaXQoKSBpbml0aWFsbHkg
YWxsb2NhdGVzIGNkbnNfY3RybC0+YnVmIGF0IDE2IEtpQiBhbmQgb25seQpyZWFsbG9jYXRlcyBp
dCB0byBjZG5zX2N0cmwtPmJ1Zl9zaXplIGFmdGVyIGNhZGVuY2VfbmFuZF9jaGlwc19pbml0KCkK
cmV0dXJucy4gIFdoZW4gYSBOQU5EIGNoaXAncyB3cml0ZXNpemUgKyBvb2JzaXplIGV4Y2VlZHMg
MTYgS2lCLApjYWRlbmNlX25hbmRfYXR0YWNoX2NoaXAoKSB1cGRhdGVzIGNkbnNfY3RybC0+YnVm
X3NpemUgd2l0aG91dCByZXNpemluZwpjZG5zX2N0cmwtPmJ1ZiwgYW5kIG5hbmRfc2Nhbl90YWls
KCkgLT4gbmFuZF9jcmVhdGVfYmJ0KCkgdGhlbiBwZXJmb3JtcwpwYWdlIGFuZCBPT0IgdHJhbnNm
ZXJzIHVwIHRvIHdyaXRlc2l6ZSArIG9vYnNpemUgYWdhaW5zdCB0aGUgMTYgS2lCIGhlYXAKYnVm
ZmVyIGJlZm9yZSBjYWRlbmNlX25hbmRfY2hpcHNfaW5pdCgpIGZpbmlzaGVzLgoKPiBAQCAtMzE2
Miw2ICszMTYxLDggQEAgc3RhdGljIGludCBjYWRlbmNlX25hbmRfaW5pdChzdHJ1Y3QgY2Ruc19u
YW5kX2N0cmwgKmNkbnNfY3RybCkKPiAgCWRtYV9jYXBfc2V0KERNQV9NRU1DUFksIG1hc2spOwo+
ICAKPiAgCWlmIChjZG5zX2N0cmwtPmNhcHMxLT5oYXNfZG1hKSB7Cj4gKwkJc3RydWN0IGRldmlj
ZSAqZG1hX2RldjsKPiArCj4gIAkJY2Ruc19jdHJsLT5kbWFjID0gZG1hX3JlcXVlc3RfY2hhbl9i
eV9tYXNrKCZtYXNrKTsKPiAgCQlpZiAoSVNfRVJSKGNkbnNfY3RybC0+ZG1hYykpIHsKPiAgCQkJ
cmV0ID0gZGV2X2Vycl9wcm9iZShjZG5zX2N0cmwtPmRldiwgUFRSX0VSUihjZG5zX2N0cmwtPmRt
YWMpLAo+IEBAIC0zMTY5LDEyICszMTcwLDEyIEBAIHN0YXRpYyBpbnQgY2FkZW5jZV9uYW5kX2lu
aXQoc3RydWN0IGNkbnNfbmFuZF9jdHJsICpjZG5zX2N0cmwpCj4gIAkJCWdvdG8gZGlzYWJsZV9p
cnE7Cj4gIAkJfQo+ICAKPiAtCQlkbWFfZGV2ID0gY2Ruc19jdHJsLT5kbWFjLT5kZXZpY2U7Cj4g
LQkJY2Ruc19jdHJsLT5pby5pb3ZhX2RtYSA9IGRtYV9tYXBfcmVzb3VyY2UoZG1hX2Rldi0+ZGV2
LCBjZG5zX2N0cmwtPmlvLmRtYSwKPiArCQlkbWFfZGV2ID0gZG1hZW5naW5lX2dldF9kbWFfZGV2
aWNlKGNkbnNfY3RybC0+ZG1hYyk7Cj4gKwkJY2Ruc19jdHJsLT5pby5pb3ZhX2RtYSA9IGRtYV9t
YXBfcmVzb3VyY2UoZG1hX2RldiwgY2Ruc19jdHJsLT5pby5kbWEsCj4gIAkJCQkJCQkgIGNkbnNf
Y3RybC0+aW8uc2l6ZSwKPiAgCQkJCQkJCSAgRE1BX0JJRElSRUNUSU9OQUwsIDApOwo+ICAKPiAt
CQlyZXQgPSBkbWFfbWFwcGluZ19lcnJvcihkbWFfZGV2LT5kZXYsIGNkbnNfY3RybC0+aW8uaW92
YV9kbWEpOwo+ICsJCXJldCA9IGRtYV9tYXBwaW5nX2Vycm9yKGRtYV9kZXYsIGNkbnNfY3RybC0+
aW8uaW92YV9kbWEpOwo+ICAJCWlmIChyZXQpIHsKPiAgCQkJZGV2X2VycihjZG5zX2N0cmwtPmRl
diwgIkZhaWxlZCB0byBtYXAgSS9PIHJlc291cmNlIHRvIERNQVxuIik7Cj4gIAkJCWdvdG8gZG1h
X3JlbGVhc2VfY2hubDsKCltTZXZlcml0eTogTWVkaXVtXQpTaG91bGQgY2FkZW5jZV9uYW5kX3Ns
YXZlX2RtYV90cmFuc2ZlcigpIGFsc28gdXNlCmRtYWVuZ2luZV9nZXRfZG1hX2RldmljZSgpIGlu
c3RlYWQgb2YgY2hhbi0+ZGV2aWNlLT5kZXYgd2hlbiBtYXBwaW5nIGFuZAp1bm1hcHBpbmcgYnVm
X2RtYT8KCmRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmM6Y2Fk
ZW5jZV9uYW5kX3NsYXZlX2RtYV90cmFuc2ZlcigpIHsKCS4uLgoJY2hhbiA9IGNkbnNfY3RybC0+
ZG1hYzsKCWRtYV9kZXYgPSBjaGFuLT5kZXZpY2U7CgoJYnVmX2RtYSA9IGRtYV9tYXBfc2luZ2xl
KGRtYV9kZXYtPmRldiwgYnVmLCBsZW4sIGRpcik7CgkuLi4KfQoKY2FkZW5jZV9uYW5kX3NsYXZl
X2RtYV90cmFuc2ZlcigpIHBhc3NlcyBib3RoIGNkbnNfY3RybC0+aW8uaW92YV9kbWEgYW5kCmJ1
Zl9kbWEgdG8gZG1hZW5naW5lX3ByZXBfZG1hX21lbWNweSgpIG9uIHRoZSBzYW1lIGNoYW5uZWwu
ICBPbiBETUEKZW5naW5lcyB3aXRoIHBlci1jaGFubmVsIERNQSBkZXZpY2VzIChjaGFuX2RtYV9k
ZXYpLApkbWFlbmdpbmVfZ2V0X2RtYV9kZXZpY2UoKSByZXR1cm5zICZjaGFuLT5jaGFuX2Rldi0+
ZGV2aWNlIHJhdGhlciB0aGFuCmNoYW4tPmRldmljZS0+ZGV2LCBzbyB0aGUgdHdvIGVuZHBvaW50
cyBvZiB0aGUgdHJhbnNmZXIgd291bGQgYmUgbWFwcGVkCmFnYWluc3QgZGlmZmVyZW50IHN0cnVj
dCBkZXZpY2VzLgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgtZWU0ODEwY2Mt
MWJmNi00MGFjLWJkZjAtZTdjYjEwYWNlNDEwCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTE5LXBlcnNvLXVwc3RyZWFtaW5nLXJh
d25hbmQtZml4ZXMtdjEtMC0wYzk1NjQxYjU1MGNAYm9vdGxpbi5jb20/cGFydD0yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
