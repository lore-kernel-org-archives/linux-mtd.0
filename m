Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857C0ECAAD1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kZftYKXbQ4MkzRxZk536qEBTHfoRGr7ijzx2MTwxGg=; b=Ztk8CXPlGebBpXEmNO+kXeWs9j
	XtrarTr1iFYHwRepLJIQ0PpCK5+VApQHrlRDYE9ikr9FaBO/5MrG/wucTqxp1NLc+OK2mHqICKXJy
	a8cTU4EKKX2HsWFid6pEXIzCOVRx2+Yn1V2b9PqJYqbvj7fzWXLiKels8rLuy5zjlwf4K6FOarHTH
	G9U57jYGQWOFEPIzHrNWMpfkTRu4a/a937+7Dr7gH525uI568OGvxBhXhB4pFjzbawI7KeRw99bLa
	HoiQUjgZo1X8xIzm53j6pdfZ7a9ShK1+CA7lCowXtPlsSx6dspXwT4Dh5crKJHKaP0KAmrZ44GnDX
	BOefMcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2kq-0009cc-5D; Tue, 30 Aug 2022 15:02:16 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2ke-0009Xz-GY; Tue, 30 Aug 2022 15:02:06 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A76331CBC;
	Tue, 30 Aug 2022 17:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661871722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1vcpi0+dohS3zcOPf9MT0OVkwJKzxxkawnTI2q960E=;
	b=NLD+FYiLhcyxBJltX0QvzzIxv4DVz/IYFKMxMWdUbH0IBXO5fwF9/JKkEJXPC5qS+mhHvb
	3tE7b4QYKQRgQu+eV24CG9OjIRq+A3vHI/REGCjk4f1Z21StOuHE6G/Yddu0r8KEUk2CST
	Delj68jyIU/V3ygPhYnVnw9u8lCP+ROjAIc++zx5VywIla2hmj+KQKpOi3oEsdfI3glrWe
	1Zc39XEYnDjkphKki5ep+u1XX18iKc18K0aX7C9XNnVlYinXPefW4gwajD0/r+dg8GlAAC
	69392pt1s9kpAbvWVfJb8MhOwMWMGS6FRy0WJtGx4iUSp2+Oqb9N5bEsc1WlUA==
MIME-Version: 1.0
Date: Tue, 30 Aug 2022 17:02:02 +0200
From: Michael Walle <michael@walle.cc>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li
 Yang <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 06/14] nvmem: core: introduce NVMEM layouts
In-Reply-To: <815f8e22-3a23-ebdb-7476-14682d0b3287@linaro.org>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-7-michael@walle.cc>
 <e2d91011-583e-a88d-94f9-beb194416326@linaro.org>
 <ae27e9d300a9c9eca4e9ec0c702b5e0a@walle.cc>
 <815f8e22-3a23-ebdb-7476-14682d0b3287@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c2e3a05339d54123de539fd124e874bb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_080204_730048_AAAE81BC 
X-CRM114-Status: GOOD (  18.59  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wOC0zMCAxNjo0Mywgc2NocmllYiBTcmluaXZhcyBLYW5kYWdhdGxhOgoKPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9sYXlvdXRzL01ha2VmaWxlIAo+Pj4+IGIvZHJpdmVy
cy9udm1lbS9sYXlvdXRzL01ha2VmaWxlCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLjZmZGIzYzYwYTRmYQo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiAr
KysgYi9kcml2ZXJzL252bWVtL2xheW91dHMvTWFrZWZpbGUKPj4+PiBAQCAtMCwwICsxLDQgQEAK
Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+Pj4+ICsjCj4+Pj4gKyMg
TWFrZWZpbGUgZm9yIG52bWVtIGxheW91dHMuCj4+Pj4gKyMKPj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIAo+Pj4+IGIvaW5jbHVkZS9saW51eC9udm1lbS1w
cm92aWRlci5oCj4+Pj4gaW5kZXggZTcxMDQwNDk1OWU3Li4zMjM2ODU4NDFlOWYgMTAwNjQ0Cj4+
Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4+Pj4gKysrIGIvaW5jbHVk
ZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4+Pj4gQEAgLTEyNyw2ICsxMjcsMjggQEAgc3RydWN0
IG52bWVtX2NlbGxfdGFibGUgewo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGxpc3RfaGVhZMKgwqDC
oCBub2RlOwo+Pj4+IMKgIH07Cj4+Pj4gwqAgKy8qKgo+Pj4+ICsgKiBzdHJ1Y3QgbnZtZW1fbGF5
b3V0IC0gTlZNRU0gbGF5b3V0IGRlZmluaXRpb25zCj4+Pj4gKyAqCj4+Pj4gKyAqIEBuYW1lOsKg
wqDCoMKgwqDCoMKgIExheW91dCBuYW1lLgo+Pj4+ICsgKiBAb2ZfbWF0Y2hfdGFibGU6wqDCoMKg
IE9wZW4gZmlybXdhcmUgbWF0Y2ggdGFibGUuCj4+Pj4gKyAqIEBhZGRfY2VsbHM6wqDCoMKgwqDC
oMKgwqAgV2lsbCBiZSBjYWxsZWQgaWYgYSBudm1lbSBkZXZpY2UgaXMgZm91bmQgCj4+Pj4gd2hp
Y2gKPj4+PiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhhcyB0aGlzIGxheW91dC4gVGhlIGZ1
bmN0aW9uIHdpbGwgYWRkIGxheW91dAo+Pj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bl
Y2lmaWMgY2VsbHMgd2l0aCBudm1lbV9hZGRfb25lX2NlbGwoKS4KPj4+PiArICogQG5vZGU6wqDC
oMKgwqDCoMKgwqAgTGlzdCBub2RlLgo+Pj4+ICsgKgo+Pj4+ICsgKiBBIG52bWVtIGRldmljZSBj
YW4gaG9sZCBhIHdlbGwgZGVmaW5lZCBzdHJ1Y3R1cmUgd2hpY2ggY2FuIGp1c3QgCj4+Pj4gYmUK
Pj4+PiArICogZXZhbHVhdGVkIGR1cmluZyBydW50aW1lLiBGb3IgZXhhbXBsZSBhIFRMViBsaXN0
LCBvciBhIGxpc3Qgb2YgCj4+Pj4gIm5hbWU9dmFsIgo+Pj4+ICsgKiBwYWlycy4gQSBudm1lbSBs
YXlvdXQgY2FuIHBhcnNlIHRoZSBudm1lbSBkZXZpY2UgYW5kIGFkZCAKPj4+PiBhcHByb3ByaWF0
ZQo+Pj4+ICsgKiBjZWxscy4KPj4+PiArICovCj4+Pj4gK3N0cnVjdCBudm1lbV9sYXlvdXQgewo+
Pj4+ICvCoMKgwqAgY29uc3QgY2hhciAqbmFtZTsKPj4+PiArwqDCoMKgIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgKm9mX21hdGNoX3RhYmxlOwo+Pj4gCj4+PiBsb29raW5nIGF0IHRoaXMsIEkg
dGhpbmsgaXRzIGRvYWJsZSB0byBjb252ZXJ0IHRoZSBleGlzdGluZwo+Pj4gY2VsbF9wb3N0X3By
b2Nlc3MgY2FsbGJhY2sgdG8gbGF5b3V0cyBieSBhZGRpbmcgYSBsYXlvdXQgc3BlY2lmaWMKPj4+
IGNhbGxiYWNrIGhlcmUuCj4+IAo+PiBjYW4geW91IGVsYWJvcmF0ZSBvbiB0aGF0Pwo+IAo+IElm
IHdlIHJlbGF4IGFkZF9jZWxscyArIGFkZCBudm1lbV91bnJlZ2lzdGVyX2xheW91dCgpIGFuZCB1
cGRhdGUKPiBzdHJ1Y3QgbnZtZW1fbGF5b3V0IHRvIGluY2x1ZGUgcG9zdF9wcm9jZXNzIGNhbGxi
YWNrIGxpa2UKPiAKPiBzdHJ1Y3QgbnZtZW1fbGF5b3V0IHsKPiAJY29uc3QgY2hhciAqbmFtZTsK
PiAJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfbWF0Y2hfdGFibGU7Cj4gCWludCAoKmFk
ZF9jZWxscykoc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0sIHN0cnVjdCBudm1lbV9sYXlvdXQg
Cj4gKmxheW91dCk7Cj4gCXN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKPiAJLyogZGVmYXVsdCBjYWxs
YmFjayBmb3IgZXZlcnkgY2VsbCAqLwo+IAludm1lbV9jZWxsX3Bvc3RfcHJvY2Vzc190IHBvc3Rf
cHJvY2VzczsKPiB9Owo+IAo+IHRoZW4gd2UgY2FuIG1vdmUgaW14LW9jb3RwIHRvIHRoaXMgbGF5
b3V0IHN0eWxlIHdpdGhvdXQgYWRkX2NlbGwKPiBjYWxsYmFjaywgYW5kIGZpbmFsbHkgZ2V0IHJp
ZCBvZiBjZWxsX3Byb2Nlc3NfY2FsbGJhY2sgZnJvbSBib3RoCj4gbnZtZW1fY29uZmlnIGFuZCBu
dm1lbV9kZXZpY2UuCj4gCj4gSWYgbGF5b3V0IHNwZWNpZmljIHBvc3RfcHJvY2VzcyBjYWxsYmFj
ayBpcyBhdmFpbGFibGUgYW5kIGNlbGwgZG9lcwo+IG5vdCBoYXZlIGEgY2FsbGJhY2sgc2V0IHRo
ZW4gd2UgY2FuIGNhbiBiZSBlaXRoZXIgdXBkYXRlZCBjZWxsCj4gcG9zdF9wcm9jZXNzIGNhbGxi
YWNrIHdpdGggdGhpcyBvbmUgb3IgaW52b2tlIGxheW91dCBzcGVjaWZpYyBjYWxsYmFjawo+IGRp
cmVjdGx5Lgo+IAo+IGRvZXMgdGhhdCBtYWtlIHNlbnNlPwoKWWVzIEkgZ2V0IHdoYXQgeW91IG1l
YW4uIEJVVCBJJ20gbm90IHNvIHN1cmU7IGl0IG1peGVzIGRpZmZlcmVudAp0aGluZ3MgdG9nZXRo
ZXIuIExheW91dHMgd2lsbCBhZGQgY2VsbHMsIGFuYWxvZ3VlIHRvCm52bWVtX2FkZF9jZWxsc19m
cm9tX29mKCkgb3IgbnZtZW1fYWRkX2NlbGxzX2Zyb21fdGFibGUoKS4gV2l0aAp0aGUgaG9vayBh
Ym92ZSwgdGhlIGxheW91dCBtZWNoYW5pc20gaXMgYWJ1c2VkIHRvIGFkZCBwb3N0CnByb2Nlc3Np
bmcgdG8gY2VsbHMgYWRkZWQgYnkgb3RoZXIgbWVhbnMuCgpXaGF0IGlzIHRoZW4gdGhlIGRpZmZl
cmVuY2UgdG8gdGhlIGRyaXZlciBoYXZpbmcgdGhhdCAiZ2xvYmFsIgpwb3N0IHByb2Nlc3MgaG9v
az8KClRoZSBjb3JyZWN0IHBsYWNlIHRvIGFkZCB0aGUgcGVyLWNlbGwgaG9vayBpbiB0aGlzIGNh
c2Ugd291bGQgYmUKbnZtZW1fYWRkX2NlbGxzX2Zyb21fb2YoKS4KCi1taWNoYWVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
