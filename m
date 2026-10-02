Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1B9CA5FDD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBNepVDElrOcQ2we2tuDymEAehkqkayvEZhWZb7hM+o=; b=psxeqaOPeBEays
	k8nvdy4Hr9nXBK6K/1NfC/MqVOxvM+jlxoIsY8jfZJWXVy0gdP8RC1u9/R9JlJk3Jhzi5iCZwB4Bh
	xqx60VpxLxTFh7X5UhX8ka7G2XXW5bHXK+PUPWxVmbN9k7FwL79wbJ+m0+jWIW97i4yyMzz/70b2b
	CyzrMWsrReas39jQq0fUTCxAqj/iEK6TORmcuhfpzpS6Qk7nZSfhOWumi4HMwP6V1Pkj0JeQVPxBr
	J/FMBQrjbLc3DqY4u/usOi2BEoeSF3m/YxolPcQXs52eclebUpBRrhO53A6dRibYmv37vHarXKj0v
	5vEgsui4TgRyWyOr+HTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcOE-0000000BZqR-08QR;
	Fri, 02 Oct 2026 12:29:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcOC-0000000BZqJ-1xRH
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:29:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23E5B4036C;
	Fri,  2 Oct 2026 12:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7735C1F000FF;
	Fri,  2 Oct 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944164;
	bh=brwoog3BfsxnFj5jfLmGicwdCrEeJjaJKW1IPoCrBMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvF3DKOrinV6x/duYGjajWGIMVpKWo2zS4B7aQUTg4xHHvNdZ44pu5OkIPMphrJlA
	 xQqJcEabf/psPRZ6umqNupARzgY4w+y07P6iWxOif+efIbrEyY/iw7+FhrskR8vEHK
	 Xr+a5ykPbTjahiN848KYcYcpUlpgVDPCLqlHgQqajPiwTXvkHHupNX4W0AxB47BVCt
	 gZiPP8w1t87pppUJFc1uD5VoGiQb8WqpV9XqaI1HMI5S+f0WtZaZR/7v9gsm0mNNYd
	 f3s4klF9x/bsymPN7kDVSYR+mfz7lgVblu/dgTpWmaAiq542YQSQ9GuMrFH1lszbTg
	 UAbNf7QTaEy9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/15] mtd: spi-nor: Fix SWP for octal DTR chips
To: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael
 Walle" <mwalle@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-8-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-8-a22a2f95c26e@bootlin.com>
Date: Fri, 02 Oct 2026 12:29:23 +0000
Message-Id: <20261002122923.7735C1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
dW5pbml0aWFsaXplZCBzdGFjayBtZW1vcnkgcmVhZCBjYXVzZXMgc3B1cmlvdXMgLUVJTyBpbiBT
UjIgY2hlY2sKLS0KCmNvbW1pdCA3ZjQwMjgwYmE5ZmYzMDZmMTYwY2RhMjE4YTI5M2Y4ZTM3MGJl
MzMxCkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCm10
ZDogc3BpLW5vcjogRml4IFNXUCBmb3Igb2N0YWwgRFRSIGNoaXBzCgpEdXJpbmcgdGhlIHJlY2Vu
dCByZXdvcmsgb2Ygc3RhdHVzIHJlZ2lzdGVycyBoYW5kbGluZywgd2UgbW9zdGx5IGZvY3VzZWQK
b24gcXVhZCBjYXBhYmxlIGRldmljZXMsIHBhcnRpYWxseSBza2lwcGluZyBPRFRSIGRldmljZXMg
aW4gb3VyIG1lbnRhbAptb2RlbC4gSXQgc2VlbXMgdGhhdCBtYW55IChpZiBub3QgYWxsPykgT0RU
UiBkZXZpY2VzIGhhdmUgbm8gU1IyIHJlYWQKb3Bjb2RlIGFuZCBoYXZlIG90aGVyIGNvbnRyb2wg
bWVjaGFuaXNtcy4gQmVjYXVzZSBvZiB0aGF0LCB0aGUgY3VycmVudApzdXBwb3J0IGluIHN3cC5j
IGlzIGJyb2tlbiwgYmVjYXVzZSByZWFkaW5nIGJhY2sgdGhlIHdyaXR0ZW4gdmFsdWUgbWF5Cm9y
IG1heSBub3QgbGVhZCB0byB0aGUgZXhwZWN0ZWQgcmVzdWx0LgoKTGV0J3MgZXh0ZW5kIHRoZSBf
Y2FyZWZ1bCgpIHN1ZmZpeCB0byB0aGUgaGVscGVyIHJlYWRpbmcgYmFjayB0aGUgdmFsdWVzCmFu
ZCBjb21wYXJpbmcgdGhlbS4gTWF5YmUgdGhpcyAiY2FyZnVsbmVzcyIgd2lsbCBoYXZlIHRvIGJl
IG1vdmVkIGJhY2sKdG8gdGhlIGNvcmUsIGl0IGlzIGEgYml0IGVhcmx5IHRvIHN0YXRlIGl0LiBG
b3Igbm93LCBsZXQncyBqdXN0IG1ha2UKc3VyZSB0aGF0IHdlIHJlYWQgYmFjayAwcyB3aXRob3V0
IGVycm9ycyB3aGVuIHZpcnR1YWxseSBhY2Nlc3NpbmcgU1IyIG9uCnRob3NlIGNoaXBzLgoKWyAu
Li4gXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zd3AuYyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivc3dwLmMKPiBpbmRleCA3ZTY2N2U0Y2E4NGQ1Li5lOWNmMmNhMjMyMzQxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3dwLmMKPiArKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL3N3cC5jCj4gQEAgLTI0MCw2ICsyNDAsMjUgQEAgc3RhdGljIGludCBzcGlfbm9y
X3JlYWRfc3IxX2FuZF9zcjJfY2FyZWZ1bChzdHJ1Y3Qgc3BpX25vciAqbm9yLCB1OCAqc3IpCj4g
IAlyZXR1cm4gc3BpX25vcl9yZWFkX3NyMl9jYXJlZnVsKG5vciwgJnNyWzFdKTsKPiAgfQo+ICAK
PiArc3RhdGljIGludCBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVja19jYXJlZnVs
KHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0IHU4ICpzcikKPiArewo+ICsJdTggdG1wWzJdOwoK
W1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgYWxsb2NhdGUgdW5pbml0aWFsaXplZCBtZW1vcnkg
b24gdGhlIHN0YWNrPwoKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gc3BpX25vcl93cml0ZV9z
cjFfYW5kX3NyMihub3IsIHNyKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4g
KwlyZXQgPSBzcGlfbm9yX3JlYWRfc3IxX2FuZF9zcjJfY2FyZWZ1bChub3IsIHRtcCk7Cj4gKwlp
ZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJaWYgKHNyWzBdICE9IHRtcFswXSB8fCBz
clsxXSAhPSB0bXBbMV0pCgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyB1bmNvbmRpdGlvbmFs
bHkgY29tcGFyZSB0bXBbMV0gYWdhaW5zdCBzclsxXSBldmVuIHdoZW4gaXQgY29udGFpbnMKdW5p
bml0aWFsaXplZCBzdGFjayBkYXRhPwoKSW4gdGhlIGNhbGwgY2hhaW4gc3BpX25vcl9yZWFkX3Ny
MV9hbmRfc3IyX2NhcmVmdWwoKSAtPgpzcGlfbm9yX3JlYWRfc3IyX2NhcmVmdWwoKSwgaWYgdGhl
IGRldmljZSBsYWNrcyBhIHJlYWRfc3IyIG9wY29kZSBhbmQgaXMgbm90CnF1YWQtZW5hYmxlZCwg
dGhlIGZ1bmN0aW9uIGZhbGxzIGJhY2sgdG8gcmV0dXJuaW5nIDAgd2l0aG91dCBwb3B1bGF0aW5n
IHRoZQpzcjIgdmFsdWUuCgpJZiB0bXBbMV0gcmVtYWlucyB1bmluaXRpYWxpemVkLCB0aGlzIGNo
ZWNrIG1pZ2h0IGZhaWwgYW5kIHJldHVybiAtRUlPCnNwb3JhZGljYWxseSBmb3IgZGV2aWNlcyBs
YWNraW5nIGEgcmVhZF9zcjIgb3Bjb2RlLCBzdWNoIGFzIHRoZSBPRFRSIGRldmljZXMKdGFyZ2V0
ZWQgYnkgdGhpcyBwYXRjaC4gQ291bGQgdGhpcyBsZWFkIHRvIHVucHJlZGljdGFibGUgZmFpbHVy
ZXMgZHVyaW5nCmxvY2sgYW5kIHVubG9jayBvcGVyYXRpb25zPwoKV291bGQgemVyby1pbml0aWFs
aXppbmcgdG1wIGF2b2lkIHRoaXMgaXNzdWU/Cgo+ICsJCXJldHVybiAtRUlPOwo+ICsKPiArCXJl
dHVybiAwOwo+ICt9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYxMDAyLXdpbmJvbmQtbWFzdGVyLXNwaS1ub3ItdzM1dC12MS0wLWEy
MmEyZjk1YzI2ZUBib290bGluLmNvbT9wYXJ0PTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
