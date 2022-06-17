Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36DEC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 07:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Op5+J+KnanrjKrwVR0zc/v/DGf99jYt+tKbI918TsqY=; b=HNnS/iizHDDz8Y
	LGhkn32tHa1diGwSsKslCNE3hm1jwgDzlNR9D1t+NTl6TNBM+LdbXZZoABlaKKlsK80Gv6e3zk52M
	1CCPWzAr27VZ/QzGVNGdpOv9mPgwUsbZJq8Q9U+3DOb3ooHy8+in8EAWY+hFmH6UwgzlfgFCDnG+I
	T8Zt8Vmqi8voprIDR4PLUb5PRcSLFnnlqZbiCZcntmpoMmCELo+iQUyM3H/OVpBmTpu/c49km2cX6
	MYtqmhLy6FK+ErFvI9ciqP+/3W1JxilMbJqDalNqm+JWcFFqQb8rJorAjwNS4UOaGcxluswsy64zt
	CNCZeNoY0A9WK81yk5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25yo-005ov0-94; Fri, 17 Jun 2022 07:01:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25yf-005osD-Co
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 07:01:10 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1o25yW-00017n-Lh; Fri, 17 Jun 2022 09:01:00 +0200
Message-ID: <45432169-5f9d-0913-6cf9-06dc821d1c65@pengutronix.de>
Date: Fri, 17 Jun 2022 09:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V4 1/2] mtd: allow getting MTD device associated with a
 specific DT node
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-arm-kernel@lists.infradead.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220615194300.13358-1-zajec5@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220615194300.13358-1-zajec5@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_000109_485905_246234B9 
X-CRM114-Status: GOOD (  25.01  )
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

T24gMTUuMDYuMjIgMjE6NDIsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiBGcm9tOiBSYWZhxYIg
TWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gTVREIHN1YnN5c3RlbSBBUEkgYWxsb3dz
IGludGVyYWN0aW5nIHdpdGggTVREIGRldmljZXMgKGUuZy4gcmVhZGluZywKPiB3cml0aW5nLCBo
YW5kbGluZyBiYWQgYmxvY2tzKS4gU28gZmFyIGEgcmFuZG9tIGRyaXZlciBjb3VsZCBnZXQgTVRE
Cj4gZGV2aWNlIG9ubHkgYnkgaXRzIG5hbWUgKGdldF9tdGRfZGV2aWNlX25tKCkpLiBUaGlzIGNo
YW5nZSBhbGxvd3MKPiBnZXR0aW5nIHRoZW0gYWxzbyBieSBhIERUIG5vZGUuCj4gCj4gVGhpcyBB
UEkgaXMgcmVxdWlyZWQgZm9yIGRyaXZlcnMgaGFuZGxpbmcgRFQgZGVmaW5lZCBNVEQgcGFydGl0
aW9ucyBpbiBhCj4gc3BlY2lmaWMgd2F5IChlLmcuIFUtQm9vdCAoc3ViKXBhcnRpdGlvbiB3aXRo
IGVudmlyb25tZW50IHZhcmlhYmxlcykuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IEFobWFkIEZhdG91bSA8YS5mYXRvdW1A
cGVuZ3V0cm9uaXguZGU+Cgo+IC0tLQo+IFYzOiBGaXJzdCBpbnRyb2R1Y3Rpb24gb2Ygb2ZfZ2V0
X210ZF9kZXZpY2VfYnlfbm9kZSgpCj4gVjQ6IFVzZSBFUFJPQkVfREVGRVIKPiAKPiBTcmluaXZh
czogaW4gVjMgTWlxdWVsIHNhaWQgaXQncyBPSyB0byBwdXNoIHRoaXMgcGF0Y2ggdGhyb3VnaCBO
Vk1FTSAKPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkY29yZS5jICAgfCAyOCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbXRkL210ZC5oIHwgIDEgKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5kZXggOWViMDY4MGRiMzEy
Li4zNjEzY2MxNDJmMjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysr
IGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTExNTQsNiArMTE1NCwzNCBAQCBpbnQgX19n
ZXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgfQo+ICBFWFBPUlRfU1lNQk9M
X0dQTChfX2dldF9tdGRfZGV2aWNlKTsKPiAgCj4gKy8qKgo+ICsgKiBvZl9nZXRfbXRkX2Rldmlj
ZV9ieV9ub2RlIC0gb2J0YWluIGFuIE1URCBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIGEgZ2l2ZW4g
bm9kZQo+ICsgKgo+ICsgKiBAbnA6IGRldmljZSB0cmVlIG5vZGUKPiArICovCj4gK3N0cnVjdCBt
dGRfaW5mbyAqb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
KQo+ICt7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IE5VTEw7Cj4gKwlzdHJ1Y3QgbXRkX2lu
Zm8gKnRtcDsKPiArCWludCBlcnI7Cj4gKwo+ICsJbXV0ZXhfbG9jaygmbXRkX3RhYmxlX211dGV4
KTsKPiArCj4gKwllcnIgPSAtRVBST0JFX0RFRkVSOwo+ICsJbXRkX2Zvcl9lYWNoX2RldmljZSh0
bXApIHsKPiArCQlpZiAobXRkX2dldF9vZl9ub2RlKHRtcCkgPT0gbnApIHsKPiArCQkJbXRkID0g
dG1wOwo+ICsJCQllcnIgPSBfX2dldF9tdGRfZGV2aWNlKG10ZCk7Cj4gKwkJCWJyZWFrOwo+ICsJ
CX0KPiArCX0KPiArCj4gKwltdXRleF91bmxvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4gKwo+ICsJ
cmV0dXJuIGVyciA/IEVSUl9QVFIoZXJyKSA6IG10ZDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQ
TChvZl9nZXRfbXRkX2RldmljZV9ieV9ub2RlKTsKPiArCj4gIC8qKgo+ICAgKglnZXRfbXRkX2Rl
dmljZV9ubSAtIG9idGFpbiBhIHZhbGlkYXRlZCBoYW5kbGUgZm9yIGFuIE1URCBkZXZpY2UgYnkK
PiAgICoJZGV2aWNlIG5hbWUKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgg
Yi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+IGluZGV4IDk1NWFlZTE0YjBmNy4uNmZjODQxY2Vl
ZjMxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9tdGQvbXRkLmgKPiBAQCAtNjc3LDYgKzY3Nyw3IEBAIGV4dGVybiBpbnQgbXRkX2Rl
dmljZV91bnJlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyKTsKPiAgZXh0ZXJuIHN0cnVj
dCBtdGRfaW5mbyAqZ2V0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBudW0p
Owo+ICBleHRlcm4gaW50IF9fZ2V0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpOwo+
ICBleHRlcm4gdm9pZCBfX3B1dF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKTsKPiAr
ZXh0ZXJuIHN0cnVjdCBtdGRfaW5mbyAqb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZShzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wKTsKPiAgZXh0ZXJuIHN0cnVjdCBtdGRfaW5mbyAqZ2V0X210ZF9kZXZp
Y2Vfbm0oY29uc3QgY2hhciAqbmFtZSk7Cj4gIGV4dGVybiB2b2lkIHB1dF9tdGRfZGV2aWNlKHN0
cnVjdCBtdGRfaW5mbyAqbXRkKTsKPiAgCgoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ClN0ZXVlcndh
bGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9u
aXguZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBo
b25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAy
Njg2ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
