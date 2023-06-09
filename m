Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABF8C7EE37
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Roiw3k6+t7U/eupeoOZ/V6p1Xo6qrgz8aX1VEOpWkRk=; b=GmCQskPHJ9FwHz
	TAUko5Cb2hKjWMxMPoOb8JoKfmmf56vMhD/SLcTOU11qM5I5LsZCuGzfIFZ+Ad0aqA9FqKcNjjaT+
	Yr2b8llkm32Vzvw1iohqLQhgvAhU8o9OKnH7kezlge8T65r+8jkQhcVnPyoQjddlhAjdL14nmUHWa
	ayOXPFKViwuMOwfMV1YX/P0UO5hebcMg9K54DR7Dv/dD6jU5PkIKL70bInXlF55aqr1+AvndXpsjT
	TO9iJqmr4IDc/HW/qf59sBJA3xtgXYTlhKwdc6NDICiynAt7yLp0PeNK8uDX/mgW4RFNCrOntuxBL
	q3j1Ip7OB2TRJcmkeT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Zr2-00CiE9-2H;
	Fri, 09 Jun 2023 11:00:28 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Zqw-00CiCY-2V;
	Fri, 09 Jun 2023 11:00:25 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 3DC2B5FD90;
	Fri,  9 Jun 2023 14:00:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686308413;
	bh=BzSyFtFdXcnd2HT0HS0gqYm2mT8eWVT9T37dAgibYaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=iIwhIrEHgiJBZcjqFXIOdLAKV4Fj4v1NVFIKCN9cj2pwpMSn+26WrFFPwYkiNcR6H
	 zWm6tEssID3X1tSyGiwh6DKtbpUEbkiIHpkWlbo5tzHzK/iiUVttnzwGfXOjKMkw8/
	 SpXOaomSu3Sc+9LEem+gZF+f/vMTQadvBD4GdCstryi4uEzMKK2Fecq6XkxlWz8rWB
	 fA3PRDqgwfRoZNvIbDQmGWHrvJiKK5ANsKsMfSe+rki4os1dt+kd9c0DKWlmbZQOSB
	 7heG8M1R4MOWdv64rIMYS7cana4gnX+b+NBbofUEbI953MLWC63x4ZCNOk9dsQGOAa
	 GwE/BQd/5Re1g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  9 Jun 2023 14:00:11 +0300 (MSK)
Message-ID: <03b86107-e03f-b41e-09e8-c8509c307005@sberdevices.ru>
Date: Fri, 9 Jun 2023 13:55:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
 <9adef6da-5930-dcaa-f148-e4a398d39f2d@sberdevices.ru>
 <3a9470ed-d7ad-6cae-0d58-732399590272@sberdevices.ru>
 <7903580d-685c-14e6-5572-81a4cb31cced@amlogic.com>
 <20230608085458.449a24c0@xps-13>
 <4e6cd8a8-f618-4bc3-5fa9-eab2b501dd89@amlogic.com>
 <a6a20b50-02b0-53c0-1e65-75035bc59c87@amlogic.com>
 <20230608152114.3a1d82ac@xps-13>
 <3cc9765c-f32a-fe8a-f7af-fb884ee63b48@amlogic.com>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <3cc9765c-f32a-fe8a-f7af-fb884ee63b48@amlogic.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/09 07:08:00 #21465535
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_040023_538448_458EDB0B 
X-CRM114-Status: GOOD (  27.30  )
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

CgpPbiAwOS4wNi4yMDIzIDEwOjU5LCBMaWFuZyBZYW5nIHdyb3RlOgo+IEhpIE1pcXVlbCwKPiAK
PiBPbiAyMDIzLzYvOCAyMToyMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4+Cj4+IEhpIExpYW5nLAo+Pgo+PiBsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3Rl
IG9uIFRodSwgOCBKdW4gMjAyMyAyMDozNzoxNCArMDgwMDoKPj4KPj4+IEhpIEFyc2VuaXkgYW5k
IE1pcXVlbCwKPj4+Cj4+PiBPbiAyMDIzLzYvOCAxNToxMiwgTGlhbmcgWWFuZyB3cm90ZToKPj4+
PiBIaSBNaXF1ZWwsCj4+Pj4KPj4+PiBPbiAyMDIzLzYvOCAxNDo1NCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4+Cj4+Pj4+IEhpIExpYW5nLAo+Pj4+
Pgo+Pj4+PiBsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIFRodSwgOCBKdW4gMjAyMyAx
NDo0Mjo1MyArMDgwMDoKPj4+Pj4KPj4+Pj4+IEhpIEFyc2VuaXksCj4+Pj4+Pgo+Pj4+Pj4gT24g
MjAyMy82LzggNToxNywgQXJzZW5peSBLcmFzbm92IHdyb3RlOgo+Pj4+Pj4+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Pj4+Pj4+Cj4+Pj4+Pj4gSGkgYWdhaW4gTWlxdWVsLCBMaWFuZyEKPj4+Pj4+Pgo+
Pj4+Pj4+IFdoYXQgZG8gWW91IHRoaW5rIGFib3V0IHRoaXMgcGF0Y2g/Cj4+Pj4+Pj4KPj4+Pj4+
PiBUaGFua3MsIEFyc2VuaXkKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIDA2LjA2LjIwMjMgMTk6MjksIEFy
c2VuaXkgS3Jhc25vdiB3cm90ZToKPj4+Pj4+Pj4gU29ycnksIGhlcmUgaXMgY2hhbmdlbG9nOgo+
Pj4+Pj4+PiB2MSAtPiB2MjoKPj4+Pj4+Pj4gKiBNb3ZlIGNoZWNrcyBmcm9tICdzd2l0Y2gvY2Fz
ZScgd2hpY2ggZXhlY3V0ZXMgY29tbWFuZHMgaW4gPj4+Pj4gJ21lc29uX25mY19leGVjX29wKCkn
IHRvIGEgc3BlY2lhbAo+Pj4+Pj4+PiDCoMKgwqDCoCBzZXBhcmF0ZWQgZnVuY3Rpb24gJ21lc29u
X25mY19jaGVja19vcCgpJyB3aGljaCBpcyBjYWxsZWQgPj4+Pj4gYmVmb3JlIGNvbW1hbmRzIHBy
b2Nlc3NpbmcuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDA2LjA2LjIwMjMgMTM6MTYsIEFyc2VuaXkg
S3Jhc25vdiB3cm90ZToKPj4+Pj4+Pj4+IE1lc29uIE5BTkQgY29udHJvbGxlciBoYXMgbGltaXRl
ZCBidWZmZXIgbGVuZ3RoLCBzbyBjaGVjayBpdCBiZWZvcmUKPj4+Pj4+Pj4+IGNvbW1hbmQgZXhl
Y3V0aW9uIHRvIGF2b2lkIGxlbmd0aCB0cmltLiBBbHNvIGNoZWNrIE1URCB3cml0ZSBzaXplIG9u
Cj4+Pj4+Pj4+PiBjaGlwIGF0dGFjaC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPj4+Pj4+Pj4+IC0t
LQo+Pj4+Pj4+Pj4gwqDCoMKgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDQ3
ID4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4+Pj4+Pj4+PiDCoMKgwqAg
MSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
YyA+Pj4+Pj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+Pj4+IGlu
ZGV4IDIzYTczMjY4NDIxYi4uZGI2YjE4NzUzMDcxIDEwMDY0NAo+Pj4+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+Pj4+IEBAIC0xMTEsNiArMTExLDggQEAKPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgwqAgI2RlZmluZSBQRVJfSU5GT19CWVRFwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA4Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gKyNkZWZpbmUgTkZDX0NNRF9S
QVdfTEVOwqDCoMKgwqAgR0VOTUFTSygxMywgMCkKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+IMKgwqDC
oCBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCB7Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbmFu
ZF9jaGlwIG5hbmQ7Cj4+Pj4+Pj4+PiBAQCAtMjg0LDcgKzI4Niw3IEBAIHN0YXRpYyB2b2lkIG1l
c29uX25mY19jbWRfYWNjZXNzKHN0cnVjdCA+Pj4+Pj4gbmFuZF9jaGlwICpuYW5kLCBpbnQgcmF3
LCBib29sIGRpciwKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAocmF3KSB7
Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuID0gbXRkLT53cml0
ZXNpemUgKyBtdGQtPm9vYnNpemU7Cj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
bWQgPSAobGVuICYgR0VOTUFTSygxMywgMCkpIHwgc2NyYW1ibGVyIHwgRE1BX0RJUihkaXIpOwo+
Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY21kID0gbGVuIHwgc2NyYW1ibGVyIHwg
RE1BX0RJUihkaXIpOwo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdy
aXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+Pj4+Pgo+Pj4+Pj4gSSB0
aGluayB3ZSBjb3VsZCBrZWVwICImIEdFTk1BU0soMTMsIDApIi4gaXQgaXMgYmV0dGVyIGhlcmUg
dG8gPj4+IGluZGljYXRlIGhvdyBtYW55IGJpdHMgb2YgbGVuZ3RoIGluIHRoaXMgY29tbWFuZCBh
bmQgZG9uJ3QgZGVzdG9yeSA+Pj4gdGhlIGNvbW1hbmQgb25jZSB3ZSBkb24ndCBjaGVjayB0aGUg
ImxlbiIgb3V0c2lkZSBvZiB0aGlzIGZ1bmN0aW9uLiA+Pj4gb3IgdGhlIGNvZGUgImlmIChsZW4g
PsKgIE5GQ19DTURfUkFXX0xFTikiIGlzIGJldHRlciB0byBwdXQgaW5zaWRlID4+PiB0aGlzIGZ1
bmN0aW9uIG5lYXJseS4gVGhhbmtzLgo+Pj4+Pgo+Pj4+PiBJdCBkZXBlbmRzIHdobyBjYWxscyB0
aGlzIGhlbHBlci4gSWYgb25seSB1c2VkIGluc2lkZSA+PiBleGVjX29wLHdyaXRlX3BhZ2VfcmF3
KCkgYW5kIHJlYWRfcGFnZV9yYXcoKSBhbHNvIGNhbGwgPj4gbWVzb25fbmZjX2NtZF9hY2Nlc3Mo
KSwgPiBidXQgaSBkb24ndCBmaW5kIHdoZXJlIGNvbnN0cmFpbiB0aGUgImxlbiIuCj4+Pgo+Pj4g
SXMgdGhlIGhlbHBlciAibWVzb25fbmZjX2NoZWNrX29wKCkiIG5lZWRlZCBieSBleGVjX29wKCkg
YWZ0ZXIgdGhlIGNvbnN0cmFpbnQgaW4gYXR0YWNoX2NoaXAoKT8gdGhlIGxlbmd0aCBwYXNzZWQg
aW4gZXhlY19vcCgpIHNlZW1zIHNtYWxsZXIgdGhhbiAibXRkLT53cml0ZXNpemUgKyBtdGQtPm9v
YnNpemUiIG5vdy4KPj4KPj4gZXhlY19vcCgpIGlzIHByaW1hcmlseSBkZWRpY2F0ZWQgdG8gcGVy
Zm9ybWluZyBzaWRlIGNvbW1hbmRzIHRoYW4gcGFnZQo+PiBhY2Nlc3NlcywgdHlwaWNhbGx5IHRo
ZSBwYXJhbWV0ZXIgcGFnZSBpcyBYIGJ5dGVzLCB5b3UgbWlnaHQgd2FudCB0bwo+PiByZWFkIGl0
IDMgdGltZXMsIGRlcGVuZGluZyBvbiB0aGUgY2FwYWJpbGl0aWVzIG9mIHRoZSBjb250cm9sbGVy
LCB5b3UKPj4gbWlnaHQgbmVlZCB0byBzcGxpdCB0aGUgb3BlcmF0aW9uIG9yIG5vdCwgc28gdGhl
IGNvcmUgY2hlY2tzIHdoYXQgYXJlCj4+IHRoZSBjb250cm9sbGVyIGNhcGFiaWxpdGllcyBiZWZv
cmUgZG9pbmcgdGhlIG9wZXJhdGlvbi4gU28geWVzLCB0aGUKPj4gY2hlY2tfb3AoKSB0aGluZyBp
cyBuZWNlc3NhcnkuCj4gCj4gb2ssIGkgZ2V0IGl0LiB0aGFua3MKPiAKPiBAQXJzZW5peSBJIGhh
dmUgbm8gb3RoZXIgcXVlc3Rpb25zIGFib3V0IHRoaXMgcGF0Y2guCgpHb3QgaXQhCgpUaGFua3Ms
IEFyc2VuaXkKCj4+Cj4+Pgo+Pj4gQEFyc2VuaXkgaWYgaXQgZG9lcyBuZWVkLCBJIHRoaW5rIHRo
ZSBzYW1lIGNvbnN0cmFpbnQgaXMgbmVlZGVkIGJ5Cj4+PiAibWVzb25fbmZjX2NtZF9hY2Nlc3Mo
KSIKPj4+Cj4+Pj4KPj4+Pj4gaXQncyBub3QgdXNlZnVsLiBJZiB1c2VkIG91dHNpZGUsIHRoZW4g
aWYgeW91IHdhbnQgdG8gY2xhcmlmeQo+Pj4+PiB0aGluZ3MgeW91IG1heSB3YW50IHRvIHVzZToK
Pj4+Pj4KPj4+Pj4gI2RlZmluZSBORkNfQ01EX09QX0xFTihjbWQpIEZJRUxEX1BSRVAoR0VOTUFT
SygxMywgMCksIChjbWQpKQo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIGJ5IGZhciBteSBmYXZvcml0ZSBj
b25zdHJ1Y3Rpb24uIENvdWxkIGFwcGx5IHRvIG1hbnkgb3RoZXIKPj4+Pj4gZmllbGRzLCBsaWtl
IERNQV9ESVIsIHNjcmFtYmxlciwgZXRjLgo+Pj4KPj4+IEBNaXF1ZWwsIEZJRUxEX1BSRVAoKSBp
cyBiZXR0ZXIsIGJ1dCBpIGhhdmUgbm8gaWRlYSB3aGV0aGVyIHdlIHNob3VsZCBhZGQgRklFTERf
UFJFUCgpIGluIHRoaXMgcGF0Y2gsIG9yIGtlZXAgdGhlIHByZXZpb3VzIGNvZGUuCj4+Pgo+Pj4+
Pgo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4+IEBAIC01NzMsNyArNTc1LDcgQEAgc3RhdGlj
IGludCBtZXNvbl9uZmNfcmVhZF9idWYoc3RydWN0IG5hbmRfY2hpcCA+Pj4+Pj4gKm5hbmQsIHU4
ICpidWYsIGludCBsZW4pCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+IC3CoMKgwqAgY21kID0gTkZDX0NNRF9OMk0gfCAobGVuICYgR0VOTUFTSygxMywgMCkp
Owo+Pj4+Pj4+Pj4gK8KgwqDCoCBjbWQgPSBORkNfQ01EX04yTSB8IGxlbjsKPj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgIHdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgbWVzb25fbmZjX2RyYWluX2NtZChuZmMp
Owo+Pj4+Pj4+Pj4gQEAgLTU5Nyw3ICs1OTksNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY193cml0
ZV9idWYoc3RydWN0ID4+Pj4+PiBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGludCBsZW4pCj4+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gLcKgwqDCoCBj
bWQgPSBORkNfQ01EX00yTiB8IChsZW4gJiBHRU5NQVNLKDEzLCAwKSk7Cj4+Pj4+Pj4+PiArwqDC
oMKgIGNtZCA9IE5GQ19DTURfTTJOIHwgbGVuOwo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgd3Jp
dGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoCBtZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4+Pj4+Pj4+PiBAQCAt
MTAwNyw2ICsxMDA5LDMxIEBAIG1lc29uX25hbmRfb3BfcHV0X2RtYV9zYWZlX291dHB1dF9idWYo
Y29uc3QgPj4+Pj4+IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciwKPj4+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShidWYpOwo+Pj4+Pj4+Pj4gwqDCoMKgIH0K
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiArc3RhdGljIGludCBtZXNvbl9uZmNfY2hlY2tfb3Aoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gKm9wKQo+
Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+ICvCoMKgwqAgaW50IG9wX2lkOwo+Pj4+Pj4+Pj4gKwo+Pj4+
Pj4+Pj4gK8KgwqDCoCBmb3IgKG9wX2lkID0gMDsgb3BfaWQgPCBvcC0+bmluc3Ryczsgb3BfaWQr
Kykgewo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IG5hbmRf
b3BfaW5zdHIgKmluc3RyOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaW5zdHIgPSAmb3AtPmluc3Ryc1tvcF9pZF07Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGluc3RyLT50eXBlKSB7Cj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE5BTkRfT1BfREFUQV9JTl9JTlNUUjoKPj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgTkFORF9PUF9EQVRBX09VVF9JTlNUUjoK
Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaW5z
dHItPmN0eC5kYXRhLmxlbiA+IE5GQ19DTURfUkFXX0xFTikKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9U
U1VQUDsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1
bHQ6Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJl
YWs7Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+PiArwqDCoMKg
IH0KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+Pj4+PiArfQo+
Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gwqDCoMKgIHN0YXRpYyBpbnQgbWVzb25fbmZjX2V4ZWNfb3Ao
c3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJh
dGlvbiAqb3AsIGJvb2wgPj4+Pj4+IGNoZWNrX29ubHkpCj4+Pj4+Pj4+PiDCoMKgwqAgewo+Pj4+
Pj4+Pj4gQEAgLTEwMTUsMTAgKzEwNDIsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfZXhlY19v
cChzdHJ1Y3QgPj4+Pj4+IG5hbmRfY2hpcCAqbmFuZCwKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
IGNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciA9IE5VTEw7Cj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB2b2lkICpidWY7Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB1MzIgb3BfaWQs
IGRlbGF5X2lkbGUsIGNtZDsKPj4+Pj4+Pj4+ICvCoMKgwqAgaW50IGVycjsKPj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgIGludCBpOwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IC3CoMKgwqAgaWYgKGNoZWNr
X29ubHkpCj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+Pj4+
Pj4+ICvCoMKgwqAgZXJyID0gbWVzb25fbmZjX2NoZWNrX29wKG5hbmQsIG9wKTsKPj4+Pj4+Pj4+
ICvCoMKgwqAgaWYgKGVyciB8fCBjaGVja19vbmx5KQo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBt
ZXNvbl9uZmNfc2VsZWN0X2NoaXAobmFuZCwgb3AtPmNzKTsKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDC
oMKgIGZvciAob3BfaWQgPSAwOyBvcF9pZCA8IG9wLT5uaW5zdHJzOyBvcF9pZCsrKSB7Cj4+Pj4+
Pj4+PiBAQCAtMTI5Myw2ICsxMzIyLDcgQEAgc3RhdGljIGludCBtZXNvbl9uYW5kX2F0dGFjaF9j
aGlwKHN0cnVjdCA+Pj4+Pj4gbmFuZF9jaGlwICpuYW5kKQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqAgc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKm1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5k
KG5hbmQpOwo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBu
YW5kX3RvX210ZChuYW5kKTsKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGludCBuc2VjdG9ycyA9
IG10ZC0+d3JpdGVzaXplIC8gMTAyNDsKPj4+Pj4+Pj4+ICvCoMKgwqAgaW50IHJhd193cml0ZXNp
emU7Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgIGlmICghbXRkLT5uYW1lKSB7Cj4+Pj4+Pj4+PiBAQCAtMTMwNCw2ICsx
MzM0LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgPj4+Pj4+
IG5hbmRfY2hpcCAqbmFuZCkKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oCB9Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gK8KgwqDCoCByYXdfd3JpdGVzaXplID0gbXRkLT53cml0
ZXNpemUgKyBtdGQtPm9vYnNpemU7Cj4+Pj4+Pj4+PiArwqDCoMKgIGlmIChyYXdfd3JpdGVzaXpl
ID4gTkZDX0NNRF9SQVdfTEVOKSB7Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
ZXZfZXJyKG5mYy0+ZGV2LCAidG9vIGJpZyB3cml0ZSBzaXplIGluIHJhdyBtb2RlOiAlZCA+Pj4+
Pj4gPiAlbGRcbiIsCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmF3X3dyaXRlc2l6ZSwgTkZDX0NNRF9SQVdfTEVOKTsKPj4+Pj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+
Pj4+PiArCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAobmFuZC0+YmJ0X29wdGlvbnMgJiBO
QU5EX0JCVF9VU0VfRkxBU0gpCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbmFuZC0+YmJ0X29wdGlvbnMgfD0gTkFORF9CQlRfTk9fT09COwo+Pj4+Pj4+Pj4KPj4+Pj4K
Pj4+Pj4KPj4+Pj4gVGhhbmtzLAo+Pj4+PiBNaXF1w6hsCj4+Cj4+Cj4+IFRoYW5rcywKPj4gTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
