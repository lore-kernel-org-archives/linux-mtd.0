Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD6BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  6 May 2022 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHNStYPpsRWfZGJjAlkPC63si679YuFDAX8GKm/Ol94=; b=1gsfz+L6Y67fd7
	vjNA1GGxCpIb0qbaPBXiLk+aZL23zVjTpZStRdWj4uHtecBnftGZz1zFflVYY69coAA140g4bQEFH
	p31dzzu8lTS4Ou/06TBhhcOolSlY4tgbbnoEjNEEFwgklD8lxo9ZTI4k1bF3N3ZDOUJDQA0X/I1iN
	iCY9CS4KSkFtJPqB9pvJDtnYZYzWOg2X7jwesjty2i6qKYQ0faEqaoH1IwLqLbTOd0f0tZ/MfCHuC
	L7netdJOOwZVy/XgC/NWcWISo7BNZBBQcjV+PmFI1dkz6F+MYUI3rq9nQWt/jqtwS27yz/fLY2gOL
	glLOJCwuye5BXgglCENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmwh2-0034Yt-Bs; Fri, 06 May 2022 12:04:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmwgy-0034WR-QE
 for linux-mtd@lists.infradead.org; Fri, 06 May 2022 12:04:19 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nmwgn-0006Fu-Kp; Fri, 06 May 2022 14:04:05 +0200
Message-ID: <3a70f1d8-468f-3292-2ddb-7ae4cdc07e6d@pengutronix.de>
Date: Fri, 6 May 2022 14:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2] nvmem: add driver handling U-Boot environment variables
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220503165658.13932-1-zajec5@gmail.com>
 <79c7891a-9a68-a111-094d-be9804071a9e@pengutronix.de>
 <318c0814-7f0b-9798-6998-5039094b010d@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <318c0814-7f0b-9798-6998-5039094b010d@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_050416_895863_79659C03 
X-CRM114-Status: GOOD (  24.55  )
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

SGVsbG8gUmFmYcWCLAoKT24gMDUuMDUuMjIgMDc6NDYsIFJhZmHFgiBNacWCZWNraSB3cm90ZToK
PiBPbiA0LjA1LjIwMjIgMTE6MjMsIEFobWFkIEZhdG91bSB3cm90ZToKPj4gSGVsbG8gUmFmYcWC
LAo+Pgo+PiBPbiAwMy4wNS4yMiAxODo1NiwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+Pj4gRnJv
bTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pj4KPj4+IFUtQm9vdCBzdG9y
ZXMgaXRzIHNldHVwIGFzIGVudmlyb25tZW50IHZhcmlhYmxlcy4gSXQncyBhIGxpc3Qgb2YKPj4+
IGtleS12YWx1ZSBwYWlycyBzdG9yZWQgb24gZmxhc2ggZGV2aWNlIHdpdGggYSBjdXN0b20gaGVh
ZGVyLgo+Pj4KPj4+IFRoaXMgY29tbWl0IGFkZHMgYW4gTlZNRU0gZHJpdmVyIHRoYXQ6Cj4+PiAx
LiBQcm92aWRlcyBOVk1FTSBhY2Nlc3MgdG8gZW52aXJvbm1lbnQgdmFycyBiaW5hcnkgZGF0YQo+
Pj4gMi4gRXh0cmFjdHMgdmFyaWFibGVzIGFzIE5WTUVNIGNlbGxzCj4+Pgo+Pj4gSXQgY2FuIGJl
IHVzZWQgZm9yOgo+Pj4gMS4gQWNjZXNzaW5nIGVudiB2YXJpYWJsZXMgZnJvbSB1c2VyLXNwYWNl
Cj4+Cj4+IElzIHRoaXMgYWxyZWFkeSBwb3NzaWJsZT8gVGhlIG9ubHkgaW50ZXJmYWNlIEkga25v
dyBvZiBpcyB0aGUgL252bWVtCj4+IGZpbGUgaW4gc3lzZnMsIGJ1dCB0aGF0IG9uZSBpcyBub3Qg
cGVyIGNlbGwsIGJ1dCBwZXIgZGV2aWNlLgo+IAo+IE1heWJlIHRoYXQgd2Fzbid0IHByZWNpc2Ug
ZW5vdWdoLCBJIHNob3VsZCBwcm9iYWJseSB3cml0ZToKPiAxLiBQYXJzaW5nIGJpbmFyeSBkYXRh
IGZyb20gdXNlci1zcGFjZQo+IAo+IEluIGZ1dHVyZSBJJ2QgbGlrZSB0byBleHRlbmQgVS1Cb290
J3MgInByaW50ZW52IiB0b29sIHRvIHN1cHBvcnQgcmVhZGluZwo+IGVudiB2YXJpYWJsZXMgYmxv
YiB1c2luZyBMaW51eCdzIHN5c2ZzIGFzIGRvY3VtZW50ZWQgaW4gdGhlCj4gRG9jdW1lbnRhdGlv
bi9BQkkvc3RhYmxlL3N5c2ZzLWJ1cy1udm1lbQoKU28sIHdvdWxkIHlvdSB1c2UgdGhpcyBpbnRl
cmZhY2UganVzdCB0byBzYXZlIGZ3X3ByaW50ZW52IHRoZSBoYXNzbGUKb2YgZmluZGluZyB0aGUg
ZW52aXJvbm1lbnQgKGJ1dCByZWRvaW5nIHBhcnNpbmcpIG9yIGRvIHlvdSBpbnRlbmQKdG8gcHJl
cHJvY2VzcyB0aGUgZGF0YSB0b28/IChlLmcuIG9ubHkgc2hvdyB0aGUgYWN0aXZlIGVudmlyb25t
ZW50KSAKCkZvciB5b3VyIHVzZSBjYXNlLCBpdCBzb3VuZCBsaWtlIHRlYWNoaW5nIE5WTUVNIGNv
cmUgdG8gZXhwb3J0CmNlbGxzIGFzIGJpbmFyeSBzeXNmcyBmaWxlcyB3b3VsZCBiZSB2ZXJ5IHVz
ZWZ1bC4KCj4+PiArwqDCoMKgIGxhYmVsID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLT5wYXJlbnQsICJs
YWJlbCIsIE5VTEwpOwo+Pj4gK8KgwqDCoCBpZiAoIWxhYmVsKQo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGxhYmVsID0gbnAtPnBhcmVudC0+bmFtZTsKPj4+ICsKPj4+ICvCoMKgwqAgcHJpdi0+bXRkID0g
Z2V0X210ZF9kZXZpY2Vfbm0obGFiZWwpOwo+Pj4gK8KgwqDCoCBpZiAoSVNfRVJSKHByaXYtPm10
ZCkpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBmaW5kIFwi
JXNcIiBNVEQgZGV2aWNlOiAlbGRcbiIsIGxhYmVsLCBQVFJfRVJSKHByaXYtPm10ZCkpOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKHByaXYtPm10ZCk7Cj4+PiArwqDCoMKgIH0K
Pj4KPj4gSSBhbSB0cnlpbmcgdG8gbWFrZSBzZW5zZSBvZiB0aGlzIHVzaW5nIHRoZSBiaW5kaW5n
LCBidXQgSSBjYW4ndC4KPj4gRG8geW91IGhhdmUgYW4gZXhhbXBsZSBkZXZpY2UgdHJlZSBmcmFn
bWVudD8KPiAKPiBUaGlzIGNvbWVzIGZyb20gdW5yZWxlYXNlZCB5ZXQgYm9hcmQgSSdtIHdvcmtp
bmcgb24uCj4gCj4gSXQgc3RvcmVzIFUtQm9vdCBlbnYgdmFyaWFibGVzIGluIHRoZSBtaWRkbGUg
b2YgVS1Cb290IGJpbmFyeS4KCkh1aCwgdGhhdCdzIGFuIG9kZCBsYXlvdXQuIEkgYW0gbm90IHN1
cmUgd2hldGhlciBvZl9nZXRfcHJvcGVydHkgdG8KYXJyaXZlIGF0IHRoZSBwYXJlbnQgaXMgc3Vj
aCBhIGdvb2QgaWRlYSB0aG91Z2guIERvZXNuJ3QgaXQgZW5mb3JjZQphIGxpbWl0YXRpb24gdGhh
dCB0aGVyZSBtdXN0IG5vdCBleGlzdCB0d28gcGFydGl0aW9ucyB3aXRoIHRoZSBzYW1lIGxhYmVs
PwoKU29tZSBzeXN0ZW1zIGNhbiBoYXZlIGEgc2Vjb25kIHJlY292ZXJ5IGJvb3Rsb2FkZXIgZm9y
IGV4YW1wbGUuCkdpdmVuIHRoYXQgdGhlc2UgYXJlIGRldmljZSB0cmVlIG5vZGVzLCB3b3VsZG4n
dCBpdCBiZSBwb3NzaWJsZQp0byBmaW5kIHRoZSBNVEQgYnkgZGV2aWNlIHRyZWUgcGFyZW50IGlu
c3RlYWQgb2YgdmlhIGl0cyBsYWJlbD8KCj4gcGFydGl0aW9ucyB7Cj4gwqDCoMKgwqBjb21wYXRp
YmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+IMKgwqDCoMKgI2FkZHJlc3MtY2VsbHMgPSA8MT47
Cj4gwqDCoMKgwqAjc2l6ZS1jZWxscyA9IDwxPjsKPiAKPiDCoMKgwqDCoHBhcnRpdGlvbkAwIHsK
PiDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJsb2FkZXIiOwo+IMKgwqDCoMKgwqDCoMKgIHJlZyA9
IDwweDAgMHgxMDAwMDA+Owo+IAo+IMKgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbkA0MDAwMCB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInUtYm9vdCxlbnYiOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAidS1ib290LWVudiI7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHg0MDAwMCAweDQwMDA+Owo+IMKgwqDCoMKgwqDCoMKgIH07Cj4gwqDC
oMKgwqB9Owo+IAo+IMKgwqDCoMKgcGFydGl0aW9uQDEwMDAwMCB7Cj4gwqDCoMKgwqDCoMKgwqAg
bGFiZWwgPSAiaW1hZ2UiOwo+IMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDEwMDAwMCAweDFmZTAw
MDAwPjsKPiDCoMKgwqDCoH07Cj4gfTsKCgpUaGFua3MsCkFobWFkCgoKLS0gClBlbmd1dHJvbml4
IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6
Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAg
ICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFtdHNnZXJpY2h0IEhp
bGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1
NSB8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
