Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51F0C88E77
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcrBU2T6+OAEG5D59U2/JH6TZ7Fw9iU4oe1CHITFMYQ=; b=YwdtAMCVtqqzGs
	xTlqSOb6cqnV51B0jtpGBL5blPCAig7k1isk3eRPGMYUwOHOjKbw+SdONe0NdDQ5eMql3Sfkr8sOI
	0cl6zWHNjb2Ie1s6d7XnWUf8sbCdELxCigO/AAKbzsbonol8YdcvmpCZdZTzdI9S32bnnCXxJgZ9Q
	YfJN4r1+q3uM+S2pIm4odF9IwWa5AncGbYpGA15s732asP4HOINHVCO+A5toV4J/Al/5QU45rLkIK
	KNrt25GjHZ3JjlBptzaxxzEDNsDk1cPXMkQihvpev2/JuH42MSxqf4iH9G14NB7fuHOejRwDZB2Gb
	BLqnHuBpwEP7CG89cehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67VU-00000003xSw-14n1;
	Mon, 14 Sep 2026 14:18:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67VT-00000003xSq-27fd
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 14:18:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF9CA601FF;
	Mon, 14 Sep 2026 14:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E44D1F000FF;
	Mon, 14 Sep 2026 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395482;
	bh=yjxwIJVTV73FYMBOQAx7yyt+IObU99d1wGVsm7maRqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZS/QKaSVT6eQDgMBxSxxKY0WvUpo1BYhZ7Dr6bdyo/W/B4UFaanpXA1I1BNyCfiJ
	 lClOouf4aqoqQ5Zo4FdDhnrEIV5mOq6qo99rZIlVQPMJXRSenkVdfZ/o9N2P929I9j
	 EFlaGLxGfjI7zX7i3GDs+coAkCxsnt/SaZTctekEZiREFk+TNylJLdLIpG0cQ3oBKK
	 nzjVUP9Nz6zhTRzqkVBZWxPhuSQ4v2kEKyEQe3FCigUV4suziUVL4iiJSJBnmPNsXt
	 1HJV9fPMgLgj+t6uJBq53IQJit0xHoWGAaVAtfdfZdtD8EifkBCedQzG+2bhe56g25
	 wYlv7+/iRxDRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael
 Walle" <mwalle@kernel.org>, "Richard Weinberger" <richard@nod.at>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
Date: Mon, 14 Sep 2026 14:18:01 +0000
Message-Id: <20260914141802.0E44D1F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIExvY2tpbmcgb3BlcmF0
aW9ucyAoc3BpX25vcl9zcl9sb2NrL3VubG9jaykgdW5jb25kaXRpb25hbGx5IGZhaWwgd2l0aCAt
RUlOVkFMIGJlY2F1c2UgcmVhZF9zcjIgaXMgc2V0IHRvIDAuCi0gW0hpZ2hdIE1pc3NpbmcgRmxh
ZyBTdGF0dXMgUmVnaXN0ZXIgKEZTUikgaGFuZGxpbmcgbGVhdmVzIHRoZSBXRUwgYml0IHNldCwg
Y2F1c2luZyBsb2NrIG9wZXJhdGlvbnMgdG8gZmFpbCB3aXRoIHNwdXJpb3VzIC1FSU8gZXJyb3Jz
LgotLQoKY29tbWl0IGU3ZjU1MjY0ZTczMDA4YWQ5YWI0OTEyYjJhMzIyOGIyZDFiN2I3YmQKQXV0
aG9yOiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgoKbXRkOiBzcGktbm9yOiBpc3NpOiBB
ZGQgc3VwcG9ydCBmb3IgaXMyNXd4MDFnCgpBZGQgc3VwcG9ydCBmb3IgdGhlIElTU0kgSVMyNVdY
MDFHLCBhIDEgR2JpdCAoMTI4IE1pQikgb2N0YWwgTk9SIGZsYXNoLgpUaGUgcGFydCBpcyBmdWxs
eSBkZXNjcmliZWQgYnkgU0ZEUCwgc28gb25seSB0aGUgZmxhc2ggSUQgYW5kIGEgc21hbGwKcG9z
dF9iZnB0IGZpeHVwIGFyZSBuZWVkZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2lzc2kuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4gaW5kZXggMmYwNTdkNzMx
ZGYyYS4uYTBiNDZjMjk4ZDUzYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2lz
c2kuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4gQEAgLTI5LDYgKzI5LDI0
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgaXMyNWxwMjU2X2ZpeHVwcyA9
IHsKPiAgCS5wb3N0X2JmcHQgPSBpczI1bHAyNTZfcG9zdF9iZnB0X2ZpeHVwcywKPiAgfTsKPiAg
Cj4gK3N0YXRpYyBpbnQgaXMyNXd4MDFnX3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9ub3Ig
Km5vciwKPiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBzZmRwX3BhcmFtZXRlcl9oZWFkZXIgKmJm
cHRfaGVhZGVyLAo+ICsJCQkJICAgICAgY29uc3Qgc3RydWN0IHNmZHBfYmZwdCAqYmZwdCkKPiAr
ewo+ICsJLyoKPiArCSAqIFRoZXJlIGlzIG5vIFN0YXR1cyBSZWdpc3RlciAyIGFuZCBubyAzNWgg
Y29tbWFuZC4gQW5kIFdSSVRFIFNUQVRVUwo+ICsJICogUkVHSVNURVIgdGFrZXMgYSBzaW5nbGUg
ZGF0YSBieXRlLgo+ICsJICovCj4gKwlub3ItPnBhcmFtcy0+b3Bjb2Rlcy53cml0ZV9zcjFfYW5k
X3NyMiA9IDA7Cj4gKwlub3ItPnBhcmFtcy0+b3Bjb2Rlcy5yZWFkX3NyMiA9IDA7CgpbU2V2ZXJp
dHk6IEhpZ2hdCkRvZXMgZXhwbGljaXRseSB6ZXJvaW5nIHJlYWRfc3IyIGJyZWFrIHRoZSBnZW5l
cmljIGxvY2tpbmcgc3VwcG9ydD8KCldoZW4gbG9ja2luZyBvciB1bmxvY2tpbmcgdGhlIGZsYXNo
LCB0aGUgY29yZSBjYWxscwpzcGlfbm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVjaygpLCB3
aGljaCBkZWxlZ2F0ZXMgdG8Kc3BpX25vcl9yZWFkX3NyMV9hbmRfc3IyKCkgdG8gdmVyaWZ5IHRo
ZSBsb2NrIGJpdHMuIFRoaXMgaGVscGVyCnVuY29uZGl0aW9uYWxseSBjYWxscyBzcGlfbm9yX3Jl
YWRfc3IyKCkuCgpJZiByZWFkX3NyMiBpcyAwLCBzcGlfbm9yX3JlYWRfc3IyKCkgaW1tZWRpYXRl
bHkgcmV0dXJucyAtRUlOVkFMLCBjYXVzaW5nCmFueSBhdHRlbXB0IHRvIGxvY2sgb3IgdW5sb2Nr
IHRoZSBmbGFzaCB0byB1bmNvbmRpdGlvbmFsbHkgZmFpbC4KCj4gKwo+ICsJcmV0dXJuIDA7Cj4g
K30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgaXMyNXd4MDFnX2Zp
eHVwcyA9IHsKPiArCS5wb3N0X2JmcHQgPSBpczI1d3gwMWdfcG9zdF9iZnB0X2ZpeHVwcywKPiAr
fTsKPiArClsgLi4uIF0KPiBAQCAtMTIwLDYgKzEzOCwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZsYXNoX2luZm8gaXNzaV9ub3JfcGFydHNbXSA9IHsKPiAgCQkuaWQgPSBTTk9SX0lEKDB4OWQs
IDB4NzAsIDB4MTkpLAo+ICAJCS5uYW1lID0gImlzMjV3cDI1NiIsCj4gIAkJLmZsYWdzID0gU1BJ
X05PUl9RVUFEX1BQLAo+ICsJfSwgewo+ICsJCS8qIGlzMjV3eDAxZyAqLwo+ICsJCS5pZCA9IFNO
T1JfSUQoMHg5ZCwgMHg1YiwgMHgxYiksCj4gKwkJLnNlY3Rvcl9zaXplID0gU1pfMTI4SywKPiAr
CQkuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIgfAo+ICsJCQkgU1BJ
X05PUl80QklUX0JQIHwgU1BJX05PUl9CUDNfU1JfQklUNiwKCltTZXZlcml0eTogSGlnaF0KRG9l
cyBlbmFibGluZyBsb2NraW5nIHN1cHBvcnQgd2l0aG91dCBhIEZsYWcgU3RhdHVzIFJlZ2lzdGVy
IChGU1IpIGNsZWFyaW5nCm1lY2hhbmlzbSBjYXVzZSBzcHVyaW91cyAtRUlPIGVycm9ycz8KCkJl
Y2F1c2UgdGhlIGRyaXZlciBlbmFibGVzIFNQSV9OT1JfSEFTX0xPQ0sgd2l0aG91dCBhZGRpbmcg
YSBjdXN0b20gbGF0ZV9pbml0Cm9yIHJlYWR5IGhvb2sgdG8gY2xlYXIgdGhlIEZTUiAodW5saWtl
IHRoZSBNaWNyb24gaW1wbGVtZW50YXRpb25zKSwgdGhlIFdyaXRlCkVuYWJsZSBMYXRjaCAoV0VM
KSBiaXQgY2FuIHJlbWFpbiBzdHVjayBhdCAxIGluIHRoZSBoYXJkd2FyZSByZWdpc3Rlci4KCldo
ZW4gc3BpX25vcl93cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKSByZWFkcyBiYWNrIHRoZSBz
dGF0dXMgcmVnaXN0ZXIgdG8KdmVyaWZ5IHRoZSBsb2NrIGJpdHMsIGl0IHJlYWRzIFdFTD0xIHdo
aWxlIHRoZSBpbnRlbmRlZCBidWZmZXIgaGFzIFdFTD0wLiBUaGlzCnN0cmljdCB2ZXJpZmljYXRp
b24gZmFpbHMgYW5kIHJldHVybnMgLUVJTywgbWFza2luZyBhY3R1YWwgaGFyZHdhcmUgc3RhdHVz
CmVycm9ycy4KCkZvciByZWZlcmVuY2UsIHRoZSBzdHJpY3QgY2hlY2sgaW4gc3BpX25vcl93cml0
ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKQpsb29rcyBsaWtlIHRoaXM6CgogICAgaWYgKHNyWzBd
ICE9IHRtcFswXSB8fCBzclsxXSAhPSB0bXBbMV0pCiAgICAgICAgcmV0dXJuIC1FSU87CgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
OTE0LW10ZC1zcGktbm9yLW5ldy1pc3NpLWNoaXAtdjItMC0zY2Q0ZDdlNDM0YjJAYW5hbG9nLmNv
bT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
