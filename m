Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CC1C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jun 2022 06:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpIgOZZyylLjJuX0frQZcBcM2x73Xgr42dsdzQQ3y6I=; b=tEmL2Zi7KRxJYp
	DwJXd52aGWVirzustwoLKlM1FEzzOgCGBTNHhmp3+cXM+3OUACel3yMLDvRiEg64Y53+8NPQ15pSh
	eZvk205JEY6KXqz7UTe9mQWscnaA7Bfyllme7oOSxUmrEO7BNyDRQev9a7sXF1dJB66O5gzbFE0k7
	Sjbd6YyBvbw/pelsCXcLU1BYoqsnTL+2dcDgEik5n5y8v8wm3UbnOTZPErj/IZVnAuqUfpb88TKFG
	PcngYNDrf2aygkxjuopEvDHYP4VC58HRzmLOeRZcKISB2MYXj8ojHaa0dhs7N5zpCLc4I4PfRFqVY
	2Wd8SoE0MyXdTlnR/k1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10NY-007NDi-Ku; Tue, 14 Jun 2022 06:50:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10MX-007MSe-Rr
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2022 06:49:19 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1o10MR-00064H-N2; Tue, 14 Jun 2022 08:49:11 +0200
Message-ID: <22ce9497-563f-0855-bec2-c56d4ddcfffa@pengutronix.de>
Date: Tue, 14 Jun 2022 08:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V3 1/2] mtd: allow getting MTD device associated with a
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
References: <20220611204651.19947-1-zajec5@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220611204651.19947-1-zajec5@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_234917_913800_0C0566E8 
X-CRM114-Status: GOOD (  27.31  )
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

SGVsbG8gUmFmYcWCLAoKT24gMTEuMDYuMjIgMjI6NDYsIFJhZmHFgiBNacWCZWNraSB3cm90ZToK
PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gTVREIHN1YnN5
c3RlbSBBUEkgYWxsb3dzIGludGVyYWN0aW5nIHdpdGggTVREIGRldmljZXMgKGUuZy4gcmVhZGlu
ZywKPiB3cml0aW5nLCBoYW5kbGluZyBiYWQgYmxvY2tzKS4gU28gZmFyIGEgcmFuZG9tIGRyaXZl
ciBjb3VsZCBnZXQgTVRECj4gZGV2aWNlIG9ubHkgYnkgaXRzIG5hbWUgKGdldF9tdGRfZGV2aWNl
X25tKCkpLiBUaGlzIGNoYW5nZSBhbGxvd3MKPiBnZXR0aW5nIHRoZW0gYWxzbyBieSBhIERUIG5v
ZGUuCj4gCj4gVGhpcyBBUEkgaXMgcmVxdWlyZWQgZm9yIGRyaXZlcnMgaGFuZGxpbmcgRFQgZGVm
aW5lZCBNVEQgcGFydGl0aW9ucyBpbiBhCj4gc3BlY2lmaWMgd2F5IChlLmcuIFUtQm9vdCAoc3Vi
KXBhcnRpdGlvbiB3aXRoIGVudmlyb25tZW50IHZhcmlhYmxlcykuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IFYzOiBGaXJzdCBp
bnRyb2R1Y3Rpb24gb2Ygb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSgpCj4gCj4gbXRkIG1haW50
YWluZXJzOiBwbGVhc2UgbGV0IGtub3cgaG93IHdvdWxkIHlvdSBsaWtlIHRoaXMgcGF0Y2gKPiBw
cm9jZXNzZWQuIFdvdWxkIHRoYXQgYmUgT0sgZm9yIHlvdSB0byBSZXZpZXcvQWNrIGl0IGFuZCBs
ZXQgaXQgZ28KPiB0aHJvdWdoIE5WTUVNIHRyZWU/Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL210ZGNv
cmUuYyAgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4
L210ZC9tdGQuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNv
cmUuYwo+IGluZGV4IDllYjA2ODBkYjMxMi4uN2RjMjE0MjcxYzg1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IEBAIC0x
MTU0LDYgKzExNTQsMzQgQEAgaW50IF9fZ2V0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICpt
dGQpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoX19nZXRfbXRkX2RldmljZSk7Cj4gIAo+ICsv
KioKPiArICogb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSAtIG9idGFpbiBhbiBNVEQgZGV2aWNl
IGFzc29jaWF0ZWQgd2l0aCBhIGdpdmVuIG5vZGUKPiArICoKPiArICogQG5wOiBkZXZpY2UgdHJl
ZSBub2RlCj4gKyAqLwo+ICtzdHJ1Y3QgbXRkX2luZm8gKm9mX2dldF9tdGRfZGV2aWNlX2J5X25v
ZGUoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiArewo+ICsJc3RydWN0IG10ZF9pbmZvICptdGQg
PSBOVUxMOwo+ICsJc3RydWN0IG10ZF9pbmZvICp0bXA7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCW11
dGV4X2xvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4gKwo+ICsJZXJyID0gLUVOT0RFVjsKClNob3Vs
ZG4ndCB0aGlzIGJlIC1FUFJPQkVfREVGRVI/IFRoYXQgd2F5IGRyaXZlcnMgbWFraW5nCnVzZSBv
ZiB0aGlzIGZ1bmN0aW9uIGNhbiBkZWZlciBwcm9iZSB1bnRpbCB0aGUgZGV2aWNlCmlzIHByb2Jl
ZC4KCj4gKwltdGRfZm9yX2VhY2hfZGV2aWNlKHRtcCkgewo+ICsJCWlmIChtdGRfZ2V0X29mX25v
ZGUodG1wKSA9PSBucCkgewo+ICsJCQltdGQgPSB0bXA7Cj4gKwkJCWVyciA9IF9fZ2V0X210ZF9k
ZXZpY2UobXRkKTsKPiArCQkJYnJlYWs7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCW11dGV4X3VubG9j
aygmbXRkX3RhYmxlX211dGV4KTsKPiArCj4gKwlyZXR1cm4gZXJyID8gRVJSX1BUUihlcnIpIDog
bXRkOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKG9mX2dldF9tdGRfZGV2aWNlX2J5X25vZGUp
Owo+ICsKPiAgLyoqCj4gICAqCWdldF9tdGRfZGV2aWNlX25tIC0gb2J0YWluIGEgdmFsaWRhdGVk
IGhhbmRsZSBmb3IgYW4gTVREIGRldmljZSBieQo+ICAgKglkZXZpY2UgbmFtZQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaCBiL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCj4g
aW5kZXggOTU1YWVlMTRiMGY3Li42ZmM4NDFjZWVmMzEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9tdGQvbXRkLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+IEBAIC02Nzcs
NiArNjc3LDcgQEAgZXh0ZXJuIGludCBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoc3RydWN0IG10ZF9p
bmZvICptYXN0ZXIpOwo+ICBleHRlcm4gc3RydWN0IG10ZF9pbmZvICpnZXRfbXRkX2RldmljZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IG51bSk7Cj4gIGV4dGVybiBpbnQgX19nZXRfbXRkX2Rl
dmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7Cj4gIGV4dGVybiB2b2lkIF9fcHV0X210ZF9kZXZp
Y2Uoc3RydWN0IG10ZF9pbmZvICptdGQpOwo+ICtleHRlcm4gc3RydWN0IG10ZF9pbmZvICpvZl9n
ZXRfbXRkX2RldmljZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwo+ICBleHRlcm4g
c3RydWN0IG10ZF9pbmZvICpnZXRfbXRkX2RldmljZV9ubShjb25zdCBjaGFyICpuYW1lKTsKPiAg
ZXh0ZXJuIHZvaWQgcHV0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpOwo+ICAKCgot
LSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAg
ICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwg
R2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwK
QW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01
MTIxLTIwNjkxNy01NTU1IHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
