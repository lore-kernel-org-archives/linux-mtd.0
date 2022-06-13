Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C2FC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTXDSeW9weDkjKV30UTMImEF+7cdRPlIKfK+u77aFec=; b=rnlXxmZ08vNANI
	cBJFjE24MzFwoIdt6bBKpvAgIK/clfmHTrceaHeUT5g+Dl+uqvhsHr3yejB9wAK8vsU6NuEdVge53
	ikdXk9oNSNUWWzSL/1QFK9N7yWIDkp3tEWlPB3tCcEnZX+JtCTe31Sz2g6PixyUduiFVZJ1LSgxuk
	1A73Vy+C8GX0Vb/aZi8o8+cpyJAciqJ2vKznWmPqMwRRDLr43DrIAxCJP9Ct3mkWhPqQ32+0DNwie
	wMPBpYvLjNwgaxf2RRMHEV4zLn1M94qAqC+NygsC8/nMU/0K3ebkwgJyB4WseBIw74NoElVd+Te7G
	OTHXfM9BvyeL695U47zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0l8X-004DdB-Vd; Mon, 13 Jun 2022 14:33:50 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0l8D-004DXl-9p; Mon, 13 Jun 2022 14:33:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 70B73240012;
	Mon, 13 Jun 2022 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655130805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgOZd2Vfi/HOg/3HSQWoHmC0I40OMrwKOFV6lIb9Er8=;
	b=hmpaT1nlbdsUsiDbvJJ5b8jKhvR0VWiONZKXcYKwV/z4P2/qqrPITPWpwH0Q6BYB7ZrvyQ
	dtKjBYlUL0itD3g5yMn5SgZe6KlVJEhDvQpHyiU1dGsqbSoIpgDwUsdIiw7xiO+2e8s+sh
	8ubboH3yegNVQRlhprAWMI+KeS5osYC9sNH+gG/qfRI9eIJg8zgz5dU8bPW71avfKFkRNv
	vVmrm5Q/u8FZMx/dPC2GqSa7I1PVw8yI2Kcdr4SiFFr/wkhv7HZKxPEnqo5lBSbq/2o4kI
	+kvAK5PRFOet6Y8LLfyf7DtGdfaUKozXAsm9sLiYxXS16mbgYU/wSUXi6H1xWA==
Date: Mon, 13 Jun 2022 16:33:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini
 <trini@konsulko.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/2] mtd: allow getting MTD device associated with a
 specific DT node
Message-ID: <20220613163321.6c3ccb5e@xps-13>
In-Reply-To: <ad084c13-55fc-8506-f768-49a0c6ae4f7f@gmail.com>
References: <20220611204651.19947-1-zajec5@gmail.com>
	<20220613160411.48b07515@xps-13>
	<ad084c13-55fc-8506-f768-49a0c6ae4f7f@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_073329_684444_E1645F69 
X-CRM114-Status: GOOD (  15.98  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDEzIEp1biAyMDIyIDE2
OjE1OjM0ICswMjAwOgoKPiBPbiAxMy4wNi4yMDIyIDE2OjA0LCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4+IEBAIC0xMTU0LDYgKzExNTQsMzQgQEAgaW50IF9fZ2V0X210ZF9kZXZpY2Uoc3RydWN0
IG10ZF9pbmZvICptdGQpCj4gPj4gICB9Cj4gPj4gICBFWFBPUlRfU1lNQk9MX0dQTChfX2dldF9t
dGRfZGV2aWNlKTsgIAo+ID4+ICAgPj4gKy8qKiAgCj4gPj4gKyAqIG9mX2dldF9tdGRfZGV2aWNl
X2J5X25vZGUgLSBvYnRhaW4gYW4gTVREIGRldmljZSBhc3NvY2lhdGVkIHdpdGggYSBnaXZlbiBu
b2RlCj4gPj4gKyAqCj4gPj4gKyAqIEBucDogZGV2aWNlIHRyZWUgbm9kZQo+ID4+ICsgKi8KPiA+
PiArc3RydWN0IG10ZF9pbmZvICpvZl9nZXRfbXRkX2RldmljZV9ieV9ub2RlKHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnApICAKPiA+IAo+ID4gU2hhbGwgd2UgdHJ5IHRvIHVzZSBhIG1vcmUgb2YtYWdu
b3N0aWMgc3ludGF4IG9yIGlzIGl0IHRvbyBjb21wbGV4IGhlcmU/ICAKPiAKPiBJIG5lZWQgc29t
ZSBleHRyYSBoaW50LCBwbGVhc2UuIFRoaXMgaXMgaG93IG1hbnkgc2ltaWxhciBmdW5jdGlvbnMg
bG9vawo+IGxpa2U6CgpJIGtub3cgbW9zdCBpbXBsZW1lbnRhdGlvbiB0b2RheSB1c2Ugb2ZfIGZ1
bmN0aW9ucyBkaXJlY3RseSBidXQgaXQKc2VlbXMgbGlrZSB0aGVyZSBpcyBhIGdsb2JhbCBtb3Zl
IHRvd2FyZHMgZndub2RlcyBub3csIGFuZCBJIHdhcwp3b25kZXJpbmcgaWYgdXNpbmcgdGhvc2Ug
aW5zdGVhZCAod2hpY2ggbWlnaHQgYWxzbyBhcHBseSB0byBvdGhlciB0eXBlcwpvZiAibm9kZXMi
IHRoYW4gRFQgb25lcykgY291bGQgYmUgcG9zc2libGUuCgpCdXQgbG9va2luZyBpbnRvIGV4aXN0
aW5nIGltcGxlbWVudGF0aW9ucywgSSBjYW1lIGFjcm9zcyB0aGUgcHdtIGltcGxlbQp3aGljaCBm
ZWF0dXJlczoKLSBvZl9wd21fZ2V0KCkKLSBhY3BpX3B3bV9nZXQoKQoKQW5kIGZpbmFsbHkgYSBm
d25vZGVfcHdtX2dldCgpIHdoaWNoIGRvZXM6CgoJaWYgKGlzX29mX25vZGUoKSkKCQlvZl9wd21f
Z2V0KCk6CgllbHNlIGlmIChpc19hY3BpX25vZGUoKSkKCQlhY3BpX3B3bV9nZXQoKTsKClNvIGFj
dHVhbGx5IG15IHN1Z2dlc3Rpb24gaXMgbWVhbmluZ2xlc3MuIEknbSBmaW5lIHdpdGggdGhlIGN1
cnJlbnQKYXBwcm9hY2guCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KCgo+IAo+ICQgZ3JlcCAtRSAtciAiKGdldHxmaW5kKS4qX2J5X25vZGUiIC4v
aW5jbHVkZS8qCj4gLi9pbmNsdWRlL2RybS9kcm1fbWlwaV9kc2kuaDpzdHJ1Y3QgbWlwaV9kc2lf
aG9zdCAqb2ZfZmluZF9taXBpX2RzaV9ob3N0X2J5X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpu
b2RlKTsKPiAuL2luY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oOnN0cnVjdCBtaXBpX2RzaV9kZXZp
Y2UgKm9mX2ZpbmRfbWlwaV9kc2lfZGV2aWNlX2J5X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpu
cCk7Cj4gLi9pbmNsdWRlL2xpbnV4L3VzYi9waHkuaDpleHRlcm4gc3RydWN0IHVzYl9waHkgKmRl
dm1fdXNiX2dldF9waHlfYnlfbm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gLi9pbmNsdWRlL2xp
bnV4L3VzYi9waHkuaDpzdGF0aWMgaW5saW5lIHN0cnVjdCB1c2JfcGh5ICpkZXZtX3VzYl9nZXRf
cGh5X2J5X25vZGUoc3RydWN0IGRldmljZSAqZGV2LAo+IC4vaW5jbHVkZS9saW51eC9leHRjb24u
aDpzdHJ1Y3QgZXh0Y29uX2RldiAqZXh0Y29uX2ZpbmRfZWRldl9ieV9ub2RlKHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSk7Cj4gLi9pbmNsdWRlL2xpbnV4L2V4dGNvbi5oOnN0YXRpYyBpbmxpbmUg
c3RydWN0IGV4dGNvbl9kZXYgKmV4dGNvbl9maW5kX2VkZXZfYnlfbm9kZShzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUpCj4gLi9pbmNsdWRlL2xpbnV4L29mX25ldC5oOmV4dGVybiBzdHJ1Y3QgbmV0
X2RldmljZSAqb2ZfZmluZF9uZXRfZGV2aWNlX2J5X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpu
cCk7Cj4gLi9pbmNsdWRlL2xpbnV4L29mX25ldC5oOnN0YXRpYyBpbmxpbmUgc3RydWN0IG5ldF9k
ZXZpY2UgKm9mX2ZpbmRfbmV0X2RldmljZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAp
Cj4gLi9pbmNsdWRlL2xpbnV4L2RldmZyZXEuaDpzdHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJlcV9nZXRf
ZGV2ZnJlcV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSk7Cj4gLi9pbmNsdWRlL2xp
bnV4L2RldmZyZXEuaDpzdGF0aWMgaW5saW5lIHN0cnVjdCBkZXZmcmVxICpkZXZmcmVxX2dldF9k
ZXZmcmVxX2J5X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+IC4vaW5jbHVkZS9saW51
eC9vZl9wbGF0Zm9ybS5oOmV4dGVybiBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvZl9maW5kX2Rl
dmljZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwo+IC4vaW5jbHVkZS9saW51eC9v
Zl9wbGF0Zm9ybS5oOnN0YXRpYyBpbmxpbmUgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZfZmlu
ZF9kZXZpY2VfYnlfbm9kZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+IC4vaW5jbHVkZS9saW51
eC9iYWNrbGlnaHQuaDpzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqb2ZfZmluZF9iYWNrbGlnaHRf
Ynlfbm9kZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpOwo+IC4vaW5jbHVkZS9saW51eC9iYWNr
bGlnaHQuaDpvZl9maW5kX2JhY2tsaWdodF9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSkKPiAuL2luY2x1ZGUvbGludXgvaTJjLmg6c3RydWN0IGkyY19jbGllbnQgKm9mX2ZpbmRfaTJj
X2RldmljZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSk7Cj4gLi9pbmNsdWRlL2xp
bnV4L2kyYy5oOnN0cnVjdCBpMmNfYWRhcHRlciAqb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2Rl
KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSk7Cj4gLi9pbmNsdWRlL2xpbnV4L2kyYy5oOnN0cnVj
dCBpMmNfYWRhcHRlciAqb2ZfZ2V0X2kyY19hZGFwdGVyX2J5X25vZGUoc3RydWN0IGRldmljZV9u
b2RlICpub2RlKTsKPiAuL2luY2x1ZGUvbGludXgvaTJjLmg6c3RhdGljIGlubGluZSBzdHJ1Y3Qg
aTJjX2NsaWVudCAqb2ZfZmluZF9pMmNfZGV2aWNlX2J5X25vZGUoc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlKQo+IC4vaW5jbHVkZS9saW51eC9pMmMuaDpzdGF0aWMgaW5saW5lIHN0cnVjdCBpMmNf
YWRhcHRlciAqb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSkKPiAuL2luY2x1ZGUvbGludXgvaTJjLmg6c3RhdGljIGlubGluZSBzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgKm9mX2dldF9pMmNfYWRhcHRlcl9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSkKPiAKPiAKPiA+PiArewo+ID4+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBOVUxMOwo+ID4+
ICsJc3RydWN0IG10ZF9pbmZvICp0bXA7Cj4gPj4gKwlpbnQgZXJyOwo+ID4+ICsKPiA+PiArCW11
dGV4X2xvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4gPj4gKwo+ID4+ICsJZXJyID0gLUVOT0RFVjsK
PiA+PiArCW10ZF9mb3JfZWFjaF9kZXZpY2UodG1wKSB7Cj4gPj4gKwkJaWYgKG10ZF9nZXRfb2Zf
bm9kZSh0bXApID09IG5wKSB7Cj4gPj4gKwkJCW10ZCA9IHRtcDsKPiA+PiArCQkJZXJyID0gX19n
ZXRfbXRkX2RldmljZShtdGQpOwo+ID4+ICsJCQlicmVhazsKPiA+PiArCQl9Cj4gPj4gKwl9Cj4g
Pj4gKwo+ID4+ICsJbXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwo+ID4+ICsKPiA+PiAr
CXJldHVybiBlcnIgPyBFUlJfUFRSKGVycikgOiBtdGQ7Cj4gPj4gK30KPiA+PiArRVhQT1JUX1NZ
TUJPTF9HUEwob2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSk7Cj4gPj4gKwo+ID4+ICAgLyoqCj4g
Pj4gICAgKglnZXRfbXRkX2RldmljZV9ubSAtIG9idGFpbiBhIHZhbGlkYXRlZCBoYW5kbGUgZm9y
IGFuIE1URCBkZXZpY2UgYnkKPiA+PiAgICAqCWRldmljZSBuYW1lICAKPiAKCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
