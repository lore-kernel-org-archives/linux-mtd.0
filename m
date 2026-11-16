Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E85606A31C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MARn/Y1A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3+tJCa/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3L0DyJDEvppRrB9G7OdJsWKeISMn8mGpQkzmDKDeCjU=; b=MARn/Y1ADI8yz5cn6TsRra7jHH
	Jskx0pPW2jFgtTC/pnqJfVhWpRkZdYSKJkoovGliK6Enqr/i/tARdvQ9gbWKniaWNmCHJaglTKjow
	Zb9O8FXTZUQRYCq/3Z5+sGli6vtE8sXuPn7TJ9v/loZ1Ik6CoOHgfUtVjvyEfBvAlLW6tf7vnFx9G
	2ph1zVw3DTq/hMGxjgVKk8XDfbdeOEF0GWWAmafZt4VeLu6eTUuxsSgECJxZbsBFO5t6Lz+5IMtw5
	Bc/XMU7UdjEIK34ZnOt90mOcrL3xr1ppEqcYL9Ttia0Il9F4h3hPLwZO60RKBMDoU1nIUCM7r5Ktb
	jeZa3nNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr20-00000001OWr-2qtz;
	Mon, 16 Nov 2026 07:21:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr1w-00000001OWY-3W8H
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 07:21:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D06A44D7A;
	Mon, 16 Nov 2026 07:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A611F1F000C4;
	Mon, 16 Nov 2026 07:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794813692;
	bh=/hvViL+L0TIWYki/bBMI/mmeJ30HVQwalmcaBmEMhD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N3+tJCa/VpyrLyvbKCFuTJQA3fgf5YpsrkAnD4XLbPMU6qjMAX8LMLwqvYiXr1OJi
	 7URSoOW1F+d+wH65FqjbSKjEzpLcrQQmvTrMresBoutS6Ag+4YG8ggrNwJzL8jg4IP
	 06TavpG0zHVD/I0GHc5Jo9fWt/7g8lg7VsiGAu2uFYd29Ben7aU+iHQpqsZRfbXvme
	 a9zCN4kO3dvgNrJ10pqwvan5L2EcMYQfyrSUXyFbO0M4F+4mzW1ulTwK8WSsMGTrhH
	 37955muIT819cljNQPtImZdYv6gW3P9l9+tEt/RGV56QStcowxu4x3IoyDZ7gO+d+0
	 nLq2JvgqEV/0w==
Message-ID: <sashiko-outbox-216405@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/58] mtd: separate class devices from retained
 backing objects
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Tze Yee Ng" <tze.yee.ng@altera.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-3-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-3-cbc49c5c5e74@gmail.com>
Date: Mon, 16 Nov 2026 07:21:31 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBtdGRwYXJ0OiBn
ZXRfbXRkX2RldmljZSgpIGluIGFkZF9tdGRfcGFydGl0aW9ucygpIGJyZWFrcwogIGJ1c3kgZ2x1
ZWJpCi0tCgpjb21taXQgZWNmNWZmNzVmODU3MGU4ZmZkMGYxZjNiMzUzZmYzOThmY2E2N2JlNwpB
dXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKbXRkOiBz
ZXBhcmF0ZSBjbGFzcyBkZXZpY2VzIGZyb20gcmV0YWluZWQgYmFja2luZyBvYmplY3RzCgpUaGlz
IGNvbW1pdCBzZXBhcmF0ZXMgdGhlIE1URCBjbGFzcyBkZXZpY2UgYWxsb2NhdGlvbiBmcm9tIHN0
cnVjdAptdGRfaW5mbyBhbmQgYWRkcyByZWZlcmVuY2UgY291bnRpbmcgZm9yIGJhY2tpbmcgb2Jq
ZWN0cyBhbmQgcGFydGl0aW9uCmxpZmV0aW1lcyBhY3Jvc3MgdW5yZWdpc3RyYXRpb24uCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMK
PiBpbmRleCBjMzE2Y2ZlOTJjN2U0Li44YmU2MDRmN2MxNDBlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL210ZHBhcnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwpbIC4uLiBdCj4g
QEAgLTQxOSwzNSArNDIwLDUyIEBAIGludCBhZGRfbXRkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9p
bmZvICpwYXJlbnQsCj4gIAkgICAgICAgbmJwYXJ0cywgcGFyZW50LT5uYW1lKTsKPiAgCj4gIAlm
b3IgKGkgPSAwOyBpIDwgbmJwYXJ0czsgaSsrKSB7Cj4gKwkJbXV0ZXhfbG9jaygmbWFzdGVyLT5t
YXN0ZXIucGFydGl0aW9uc19sb2NrKTsKPiArCQlpZiAobWFzdGVyLT5tYXN0ZXIudW5yZWdpc3Rl
cmluZyB8fAo+ICsJCSAgICAobXRkX2lzX3BhcnRpdGlvbihwYXJlbnQpICYmICFwYXJlbnQtPnJl
Z2lzdGVyZWQpKSB7Cj4gKwkJCW11dGV4X3VubG9jaygmbWFzdGVyLT5tYXN0ZXIucGFydGl0aW9u
c19sb2NrKTsKPiArCQkJcmV0dXJuIC1FTk9ERVY7Cj4gKwkJfQo+ICsKPiAgCQljaGlsZCA9IGFs
bG9jYXRlX3BhcnRpdGlvbihwYXJlbnQsIHBhcnRzICsgaSwgaSwgY3VyX29mZnNldCk7Cj4gIAkJ
aWYgKElTX0VSUihjaGlsZCkpIHsKPiAgCQkJcmV0ID0gUFRSX0VSUihjaGlsZCk7Cj4gLQkJCWdv
dG8gZXJyX2RlbF9wYXJ0aXRpb25zOwo+ICsJCQlnb3RvIGVycl91bmxvY2s7Cj4gIAkJfQo+ICAK
PiAgCQlpZiAoSVNfUkVBQ0hBQkxFKENPTkZJR19NVERfVklSVF9DT05DQVQpKSB7Cj4gLQkJCWlm
IChtdGRfdmlydF9jb25jYXRfYWRkKGNoaWxkKSkKPiArCQkJaWYgKG10ZF92aXJ0X2NvbmNhdF9h
ZGQoY2hpbGQpKSB7Cj4gKwkJCQltdXRleF91bmxvY2soJm1hc3Rlci0+bWFzdGVyLnBhcnRpdGlv
bnNfbG9jayk7Cj4gIAkJCQljb250aW51ZTsKPiArCQkJfQo+ICAJCX0KPiAgCj4gLQkJbXV0ZXhf
bG9jaygmbWFzdGVyLT5tYXN0ZXIucGFydGl0aW9uc19sb2NrKTsKPiAgCQlsaXN0X2FkZF90YWls
KCZjaGlsZC0+cGFydC5ub2RlLCAmcGFyZW50LT5wYXJ0aXRpb25zKTsKPiAtCQltdXRleF91bmxv
Y2soJm1hc3Rlci0+bWFzdGVyLnBhcnRpdGlvbnNfbG9jayk7Cj4gIAo+ICAJCXJldCA9IGFkZF9t
dGRfZGV2aWNlKGNoaWxkKTsKPiAgCQlpZiAocmV0KSB7Cj4gLQkJCW11dGV4X2xvY2soJm1hc3Rl
ci0+bWFzdGVyLnBhcnRpdGlvbnNfbG9jayk7Cj4gIAkJCWxpc3RfZGVsKCZjaGlsZC0+cGFydC5u
b2RlKTsKPiAtCQkJbXV0ZXhfdW5sb2NrKCZtYXN0ZXItPm1hc3Rlci5wYXJ0aXRpb25zX2xvY2sp
Owo+IC0KPiAgCQkJZnJlZV9wYXJ0aXRpb24oY2hpbGQpOwo+IC0JCQlnb3RvIGVycl9kZWxfcGFy
dGl0aW9uczsKPiArCQkJZ290byBlcnJfdW5sb2NrOwo+ICAJCX0KPiAgCj4gIAkJbXRkX2FkZF9w
YXJ0aXRpb25fYXR0cnMoY2hpbGQpOwo+ICsJCWN1cl9vZmZzZXQgPSBjaGlsZC0+cGFydC5vZmZz
ZXQgKyBjaGlsZC0+cGFydC5zaXplOwo+ICsKPiArCQkvKiBQYXJzaW5nIGRyb3BzIHRoZSBwYXJ0
aXRpb24gbG9jayBhbmQgbWF5IHJhY2Ugd2l0aCBkZWxldGlvbi4gKi8KPiArCQlyZXQgPSBQVFJf
RVJSX09SX1pFUk8oZ2V0X210ZF9kZXZpY2UoY2hpbGQsIC0xKSk7Cj4gKwkJaWYgKHJldCkKPiAr
CQkJZ290byBlcnJfdW5sb2NrOwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgY2FsbGluZyBnZXRf
bXRkX2RldmljZShjaGlsZCwgLTEpIGR1cmluZyBwYXJ0aXRpb24gcmVnaXN0cmF0aW9uIGJyZWFr
CnBhcnRpdGlvbmVkIGdsdWViaSBkZXZpY2VzIHdoZW4gdGhlIHVuZGVybHlpbmcgVUJJIHZvbHVt
ZSBpcyBhbHJlYWR5IG9wZW4KZm9yIHdyaXRpbmc/CgpnZXRfbXRkX2RldmljZSgpIGNhbGxzIF9f
Z2V0X210ZF9kZXZpY2UoKSwgd2hpY2ggbm93IGludm9rZXMKbWFzdGVyLT5fZ2V0X2RldmljZSht
YXN0ZXIpLiAgRm9yIGEgd3JpdGFibGUgZ2x1ZWJpIGRldmljZSwKZ2x1ZWJpX2dldF9kZXZpY2Uo
KSBvcGVucyB0aGUgdm9sdW1lIHdpdGggVUJJX1JFQURXUklURToKCmRyaXZlcnMvbXRkL3ViaS9n
bHVlYmkuYzpnbHVlYmlfZ2V0X2RldmljZSgpIHsKICAgIC4uLgoJaWYgKG10ZC0+ZmxhZ3MgJiBN
VERfV1JJVEVBQkxFKQoJCXViaV9tb2RlID0gVUJJX1JFQURXUklURTsKICAgIC4uLgoJZ2x1ZWJp
LT5kZXNjID0gdWJpX29wZW5fdm9sdW1lKGdsdWViaS0+dWJpX251bSwgZ2x1ZWJpLT52b2xfaWQs
CgkJCQkgICAgICAgdWJpX21vZGUpOwoJaWYgKElTX0VSUihnbHVlYmktPmRlc2MpKSB7CgkJbXV0
ZXhfdW5sb2NrKCZkZXZpY2VzX211dGV4KTsKCQlyZXR1cm4gUFRSX0VSUihnbHVlYmktPmRlc2Mp
OwoJfQp9CgpQcmV2aW91c2x5LCBnbHVlYmlfZ2V0X2RldmljZSgpIG9ubHkgcmFuIHdoZW4gdGhl
IE1URCBkZXZpY2Ugd2FzIGFjdHVhbGx5Cm9wZW5lZC4gIFdoZW4gZ2x1ZWJpIGlzIGxvYWRlZCB3
aGlsZSBhIFVCSSB2b2x1bWUgYWxyZWFkeSBoYXMgYW4gYWN0aXZlCndyaXRlciBvciBleGNsdXNp
dmUgb3BlbmVyIChzdWNoIGFzIGEgbW91bnRlZCByZWFkLXdyaXRlIFVCSUZTCmZpbGVzeXN0ZW0p
LCB1Ymlfb3Blbl92b2x1bWUoKSByZXR1cm5zIC1FQlVTWSBmcm9tIGluc2lkZSB0aGUgVUJJIHZv
bHVtZQpub3RpZmllciwgY2F1c2luZyBhZGRfbXRkX3BhcnRpdGlvbnMoKSB0byByb2xsIGJhY2sg
YWxsIHBhcnRpdGlvbnMgYW5kCmZhaWwgZ2x1ZWJpX2NyZWF0ZSgpLgoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTExNS1zdWJtaXQt
cmF3bmFuZC1yZXRhaW5lZC1oYW5kbGUtbGlmZXRpbWUtdjEtdjUtMC1jYmM0OWM1YzVlNzRAZ21h
aWwuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
