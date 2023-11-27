Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B612FC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhEVWz/RTUy19GS6SRBSIRoZz4+jBdxYzQhcUMZGlq4=; b=eS9WYJ71jK7otJ
	soDaY03XIC1yhQyV2DTQkFsvjFM48ptSXMO2L6DDOmN19JKAgJV1MDPoxU8RqrQbFcVCeQ8LF/wJS
	wLjryAl+N59zcw5FkyOaguMGJyY3FymGR44MTjHvq3PoskhYLKNxTLGus4Ba4gwsN7WnyNiOb9Zlg
	AAW2yhu2LSPwk7WkobAzEw4E15hyzHV6G1VPRx+1h8wnVbI58PL7bcVoYRs5N2x/od/meTBP3VOWG
	zQ23k2T3QipzGpQ6prHHOE4guNgzhp+dnJ2spZolVXK90IRhak1j7J+O+N6qUtM7kImz167ZbyLX/
	piMI07gGSlXEPQJJWtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7fCe-0036qm-2z;
	Mon, 27 Nov 2023 17:15:24 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7fCb-0036p6-2l
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 17:15:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E127E40007;
	Mon, 27 Nov 2023 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701105317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pm9QkYO7sIE1cvNwftqV0IeYYA7ljroCFyKvUGzvpns=;
	b=AHNUEPyk2CsVQoBiKX7RRJj9d5Y60GGD6k/QJLD1GWRmA3Emi4jmkhigJ2S/5PrzOjFanF
	Lu7ynAgrGG8UWc5dMlubATvYbTwDmt5pYNa/bkW4WusB2saJbkyRrrPG2CTVrkTCQvD1yO
	jgDJf965nI5Khti8qFXl8FIeMZRZA+LwyIX/pn8rqGBT3gyYue+RxrUDpYV4rqQvggQtuc
	VqyFnRtw4pgI84xTeV6/Du7TzDnN1ykodtwS/N03SjqvH7T3dqhGBDubf/q6/3I2PdF1GF
	hIbzYocs5pbWATDTfWbqhsoJ2ebOBprvxKOqAcuLA/vw6I1W7MkACBIEbTRP0w==
Date: Mon, 27 Nov 2023 18:15:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, jaimeliao.tw@gmail.com, jaimeliao@mxic.com.tw,
 pratyush@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
Message-ID: <20231127181514.19b99d2e@xps-13>
In-Reply-To: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_091522_062189_1F5B2937 
X-CRM114-Status: GOOD (  18.86  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBOb3Yg
MjAyMyAxNjo1OTowOCArMDAwMDoKCj4gVGhlIG10ZCBkYXRhIGNhbiBiZSBvYnRhaW4gd2l0aCB0
aGUgbXRkIGlvY3RscyBhbmQgdGhlIFNQSSBOT1IKPiBmbGFzaCBuYW1lIGNhbiBiZSBkZXRlcm1p
bmVkIGludGVycm9nYXRpbmcgdGhlIHN5c2ZzIGVudHJpZXMuCj4gU3RvcCBwb2xsdXRpbmcgdGhl
IGtlcm5lbCBsb2cuCgpBY3R1YWxseSBJIGxpa2UgdGhlc2UgcHJpbnRzIHdoZW4gZGV2ZWxvcGlu
Zy9maXhpbmcgc3R1ZmYsIGl0J3MgYSBjbGVhcgppbmRpY2F0aW9uIG9mIHdoYXQncyBiZWVuIGRp
c2NvdmVyZWQgdGhhdCBpcyBhdmFpbGFibGUgZXZlbiBpZiBmb3Igc29tZQpyZWFzb24gbXkgcm9v
dGZzIGlzIG5vdCBhdmFpbGFibGUgKHdoaWNoIGlzIGNvbW1vbiB3aGVuIHRoZSByb290ZnMgaXMK
b24gYSBzcGktbm9yKS4KClNvIEkgd291bGQgbm90IHRyYXNoIGFsbCB0aGVzZSBsaW5lcyBwZXJz
b25hbGx5Li4uIEkgYmVsaWV2ZSB0aGUKZGV2X2luZm8gY2FuIGJlIGxvd2VyZWQgaWYgeW91IHBy
ZWZlciwgYnV0IGRldl9kYmcgaXMgYWxyZWFkeSBtZWFudCBmb3IKZGVidWdnaW5nIHB1cnBvc2Vz
IGFuZCB3aWxsIGFueXdheSBiZSBkaXNjYXJkZWQgYnkgZGVmYXVsdC4KCj4gU2lnbmVkLW9mZi1i
eTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5kZXggMjVhNjRj
NjU3MTdkLi42ZGU3NmZkMDA5ZDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC0zNTE3LDI1ICsz
NTE3LDYgQEAgaW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAqbm9yLCBjb25zdCBjaGFy
ICpuYW1lLAo+ICAJLyogTm8gbXRkX2luZm8gZmllbGRzIHNob3VsZCBiZSB1c2VkIHVwIHRvIHRo
aXMgcG9pbnQuICovCj4gIAlzcGlfbm9yX3NldF9tdGRfaW5mbyhub3IpOwo+ICAKPiAtCWRldl9p
bmZvKGRldiwgIiVzICglbGxkIEtieXRlcylcbiIsIGluZm8tPm5hbWUsCj4gLQkJCShsb25nIGxv
bmcpbXRkLT5zaXplID4+IDEwKTsKPiAtCj4gLQlkZXZfZGJnKGRldiwKPiAtCQkibXRkIC5uYW1l
ID0gJXMsIC5zaXplID0gMHglbGx4ICglbGxkTWlCKSwgIgo+IC0JCSIuZXJhc2VzaXplID0gMHgl
Ljh4ICgldUtpQikgLm51bWVyYXNlcmVnaW9ucyA9ICVkXG4iLAo+IC0JCW10ZC0+bmFtZSwgKGxv
bmcgbG9uZyltdGQtPnNpemUsIChsb25nIGxvbmcpKG10ZC0+c2l6ZSA+PiAyMCksCj4gLQkJbXRk
LT5lcmFzZXNpemUsIG10ZC0+ZXJhc2VzaXplIC8gMTAyNCwgbXRkLT5udW1lcmFzZXJlZ2lvbnMp
Owo+IC0KPiAtCWlmIChtdGQtPm51bWVyYXNlcmVnaW9ucykKPiAtCQlmb3IgKGkgPSAwOyBpIDwg
bXRkLT5udW1lcmFzZXJlZ2lvbnM7IGkrKykKPiAtCQkJZGV2X2RiZyhkZXYsCj4gLQkJCQkibXRk
LmVyYXNlcmVnaW9uc1slZF0gPSB7IC5vZmZzZXQgPSAweCVsbHgsICIKPiAtCQkJCSIuZXJhc2Vz
aXplID0gMHglLjh4ICgldUtpQiksICIKPiAtCQkJCSIubnVtYmxvY2tzID0gJWQgfVxuIiwKPiAt
CQkJCWksIChsb25nIGxvbmcpbXRkLT5lcmFzZXJlZ2lvbnNbaV0ub2Zmc2V0LAo+IC0JCQkJbXRk
LT5lcmFzZXJlZ2lvbnNbaV0uZXJhc2VzaXplLAo+IC0JCQkJbXRkLT5lcmFzZXJlZ2lvbnNbaV0u
ZXJhc2VzaXplIC8gMTAyNCwKPiAtCQkJCW10ZC0+ZXJhc2VyZWdpb25zW2ldLm51bWJsb2Nrcyk7
Cj4gIAlyZXR1cm4gMDsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChzcGlfbm9yX3NjYW4pOwoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
