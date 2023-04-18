Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C996C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAH52N7qpa64excSSqZC4XWnh/2hsYqqHQDEVJoLkCo=; b=14Quo+sUX1UK8o
	5azIOASecsMsdZXTq4Bvj+UjPp4T6YI3DmydBTb4uuOldOItvlhaBd7xQyN59h1MavtmjgSDdie/j
	KVM3Sv4VIQGq8iU3kpKPG0mlholyYusdOHQuyQpcTOCmgP3JpbDVlgEXEroRSC2GJPcQkUqUGRSkb
	81ba+mDkGSN0DSy9Jf6zgxLlYWrTiu70smyaqeVbf7d+zsJ/FcLw0nWbURFefacKeEkd1KbYqG9uK
	F8fXDACFSy8VwEqSSET3Sg5ulnladqe4VgT+kBVtBdnFzVF8n06sZoOZnNypUienUT87kXyG++Ci8
	ldQNjRLH+GQXxg1kEXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomza-002XXa-0a;
	Tue, 18 Apr 2023 15:11:38 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomzU-002XVm-1x;
	Tue, 18 Apr 2023 15:11:34 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BB6CA5FD79;
	Tue, 18 Apr 2023 18:11:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681830689;
	bh=VpHk4eakOFOcF/j/l4C7WEoAgkJV/bj1+2ictoLQoMY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	b=SsO2jF+PQ9rY/OlejuNn8h4Kn+Eygt1JOgOwlDTn3INwuQUgy6gatyvMfroqxyI1v
	 L2q8nybDThWzzHTniHoUmkYne8cUyqaL0AVKOqx5ZupMtMXPwxd1FH2eeYRlvhmHua
	 rPc4YeoUeCQiRjbetZGFg0vA333ulvGNOIoqlhpLU+JeSNEZSncBf8OkR4LVJ+4vxd
	 +7LYDdjxQS+fqdHgnE7K+QIaY+JcN4c0rHbknZlht8WrBGDZahSb7Cw/+1hgU5i6uM
	 b7pfoRx9RPg484WfjdImlaJFYIiRv+ROTUdKrMLEi2ZbjlcsFn+f/QYr2O91+riF2K
	 vdq1m58AHF4dw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 18 Apr 2023 18:11:29 +0300 (MSK)
Message-ID: <855bbbd6-14f9-8e93-e489-e91e6a8915ff@sberdevices.ru>
Date: Tue, 18 Apr 2023 18:07:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Liang Yang
	<liang.yang@amlogic.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	yonghui.yu <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412163214.0c764bb3@xps-13>
 <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
 <fbb8cb2b-0996-3029-b368-f67087d73487@amlogic.com>
 <7520e512-8a19-ff04-364c-b5be0a579ef0@sberdevices.ru>
 <20230413102200.309fbe9c@xps-13>
 <b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
 <20230413122252.0a8efcd8@xps-13>
 <569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
 <60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
 <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
 <20230418152505.72fc16da@xps-13>
 <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
In-Reply-To: <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/18 12:37:00 #21124037
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_081132_994315_4FBAD262 
X-CRM114-Status: GOOD (  28.68  )
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

CgpPbiAxOC4wNC4yMDIzIDE3OjU3LCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6Cj4gCj4gCj4gT24g
MTguMDQuMjAyMyAxNjoyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGkgQXJzZW5peSwKPj4K
Pj4+Pj4gSGVsbG8gYWdhaW4gQExpYW5nIEBNaXF1ZWwhCj4+Pj4+Cj4+Pj4+IE9uZSBtb3JlIHF1
ZXN0aW9uIGFib3V0IE9PQiBhY2Nlc3MsIGFzIEkgY2FuIHNlZSBjdXJyZW50IGRyaXZlciB1c2Vz
IHRoZSBmb2xsb3dpbmcKPj4+Pj4gY2FsbGJhY2tzOgo+Pj4+Pgo+Pj4+PiDCoMKgwqDCoG5hbmQt
PmVjYy53cml0ZV9vb2JfcmF3ID0gbmFuZF93cml0ZV9vb2Jfc3RkOwo+Pj4+PiDCoMKgwqDCoG5h
bmQtPmVjYy53cml0ZV9vb2IgPSBuYW5kX3dyaXRlX29vYl9zdGQ7Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+
IEZ1bmN0aW9uICduYW5kX3dyaXRlX29vYl9zdGQoKScgd3JpdGVzIGRhdGEgdG8gdGhlIGVuZCBv
ZiB0aGUgcGFnZS4gQnV0IGFzIEkKPj4+Pj4gY2FuIHNlZSBieSBkdW1waW5nICdkYXRhX2J1Zicg
ZHVyaW5nIHJlYWQsIHBoeXNpY2FsIGxheW91dCBvZiBlYWNoIHBhZ2UgaXMgdGhlCj4+Pj4+IGZv
bGxvd2luZyAoMUtCIEVDQyk6Cj4+Pj4+Cj4+Pj4+IDB4MDAwOiBbwqDCoMKgwqDCoMKgwqDCoCAx
IEtCIG9mIGRhdGHCoMKgwqDCoMKgwqDCoCBdCj4+Pj4+IDB4NDAwOiBbIDJCIHVzZXIgZGF0YV0g
WyAxNEIgRUNDIGNvZGVdCj4+Pj4+IDB4NDEwOiBbwqDCoMKgwqDCoMKgwqDCoCAxIEtCIG9mIGRh
dGHCoMKgwqDCoMKgwqDCoCBdwqDCoMKgIChBKQo+Pj4+PiAweDgxMDogWyAyQiB1c2VyIGRhdGFd
IFsgMTRCIEVDQyBjb2RlXQo+Pj4+PiAweDgyMDogW8KgwqDCoMKgwqDCoMKgIDMyQiB1bnVzZWTC
oMKgwqDCoMKgwqDCoMKgwqDCoCBdCj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFNvLCBhZnRlciAn
bmFuZF93cml0ZV9vb2Jfc3RkKCknIChsZXQgZGF0YSBiZSBzZXF1ZW5jZSBmcm9tIFsweDAgLi4u
IDB4M2ZdKSwKPj4+Pj4gcGFnZSB3aWxsIGxvb2sgbGlrZSB0aGlzOgo+Pj4+Pgo+Pj4+PiAweDAw
MDogW8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweEZGwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBd
Cj4+Pj4+IDB4NDAwOiBbwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uLi4uLi7CoMKgwqDCoMKgwqDC
oMKgwqAgXQo+Pj4+PiAweDdmMDogW8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweEZGwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBdCj4+Pj4+IDB4ODAwOiBbIDAwIC4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uwqAgXQo+Pj4+PiAweDgzMDogWyAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gM2YgXQo+Pj4+
Pgo+Pj4+PiBIZXJlIHdlIGhhdmUgdHdvIHByb2JsZW1zOgo+Pj4+PiAxKSBBdHRlbXB0IHRvIGRp
c3BsYXkgcmF3IGRhdGEgYnkgJ25hbmRkdW1wJyB1dGlsaXR5IHByb2R1Y2VzIGEgbGl0dGxlIGJp
dAo+Pj4+PiDCoMKgwqAgaW52YWxpZCBvdXRwdXQsIGFzIGRyaXZlciByZWxpZXMgb24gbGF5b3V0
IChBKSBmcm9tIGFib3ZlLiBFLmcuIE9PQiBkYXRhCj4+Pj4+IMKgwqDCoCBpcyBhdCAweDQwMCBh
bmQgMHg4MTAuIEhlcmUgaXMgYW4gZXhhbXBsZSAoYXR0ZW1wdCB0byB3cml0ZSAweDExIDB4MjIg
MHgzMyAweDQ0KToKPj4+Pj4KPj4+Pj4gMHgwMDAwMDdmMDogMTEgMjIgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8LiIuLi4uLi4uLi4uLi4uLnwKPj4+Pj4gwqDC
oCBPT0IgRGF0YTogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmbCoCB8Li4uLi4uLi4uLi4uLi4uLnwKPj4+Pj4gwqDCoCBPT0IgRGF0YTogMzMgNDQgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8M0QuLi4uLi4uLi4uLi4uLnwK
Pj4+Pj4gwqDCoCBPT0IgRGF0YTogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4uLi4uLnwKPj4+Pj4gwqDCoCBPT0IgRGF0YTogZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4u
Li4uLi4uLnwKPj4+Pj4gIAo+Pj4+IEhpIEFyc2VuaXksCj4+Pj4KPj4+PiBJIHJlYWxpemVkIHRo
ZSB3cml0ZV9vb2JfcmF3KCkgYW5kIHdyaXRlX29vYigpIGFyZSB3cm9uZyBpbiBtZXNvbl9uYW5k
LmMuIEkgc3VnZ2VzdCBib3RoIG9mIHRoZW0gc2hvdWxkIGJlIHJld29ya2VkIGFuZCBmb2xsb3cg
dGhlIGZvcm1hdCBvZiBtZXNvbiBuYW5kIGNvbnRyb2xsZXIuIGkuZS4gZmlyc3RseSBmb3JtYXQg
dGhlIGRhdGEgaW4gTGF5b3V0IChBKSBhbmQgdGhlbiB3cml0ZS4gcmVhZGluZyBpcyBmaXJzdGx5
IHJlYWRpbmcgdGhlIGRhdGEgb2YgbGF5b3V0IChBKSBhbmQgdGhlbiBjb21wb3N0IHRoZSBsYXlv
dXQgKEIpLiAgCj4+Pgo+Pj4gSUlVQyBhZnRlciBzdWNoIHdyaXRpbmcgb25seSBPT0IgKGUuZy4g
dXNlciBieXRlcykgYWNjb3JkaW5nIGxheW91dCAoQSksIGh3IHdpbGwgYWxzbyB3cml0ZSBFQ0Mg
Y29kZXMsIHNvCj4+PiBpdCB3aWxsIGJlIGltcG9zc2libGUgdG8gd3JpdGUgZGF0YSB0byB0aGlz
IHBhZ2UgbGF0ZXIsIGJlY2F1c2Ugd2UgY2Fubm90IHVwZGF0ZSBFQ0MgY29kZXMgcHJvcGVybHkg
Zm9yIHRoZSBuZXdseQo+Pj4gd3JpdHRlbiBkYXRhICh3ZSBjYW4ndCB1cGRhdGUgYml0cyBmcm9t
IDAgdG8gMSkuCj4+Pgo+Pj4+Cj4+Pj4gICAKPj4+Pj4KPj4+Pj4gMikgQXR0ZW1wdCB0byByZWFk
IGRhdGEgaW4gRUNDIG1vZGUgd2lsbCBmYWlsLCBiZWNhdXNlIElJVUMgcGFnZSBpcyBpbiBkaXJ0
eQo+Pj4+PiDCoMKgwqAgc3RhdGUgKEkgbWVhbiB3YXMgd3JpdHRlbiBhdCBsZWFzdCBvbmNlKSBh
bmQgTkFORCBjb250cm9sbGVyIHRyaWVzIHRvIHVzZQo+Pj4+PiDCoMKgwqAgRUNDIGNvZGVzIGF0
IDB4NDAwIGFuZCAweDgxMCwgd2hpY2ggYXJlIG9idmlvdXNseSBicm9rZW4gaW4gdGhpcyBjYXNl
LiBUaHVzICAKPj4+Pgo+Pj4+IEFzIGkgc2FpZCBhYm92ZSwgd3JpdGVfb29iX3JhdygpIGFuZCB3
cml0ZV9vb2IoKSBzaG91bGQgYmUgcmV3b3JrZWQuCj4+Pj4gaSBkb24ndCBrbm93IHdoYXQgZG8g
eW91IG1lYW4gcGFnZSB3YXMgd3JpdHRlbiBhdCBsZWFzdCBvbmNlLiBhbnl3YXkgdGhlIHBhZ2Ug
c2hvdWxkIGJlIHdyaXR0ZW4gb25jZSwgZXZlbiBqdXN0IHdyaXRlX29vYl9yYXcoKS4gIAo+Pj4K
Pj4+IFNvcnJ5LCBZb3UgbWVhbiB0aGF0IGFmdGVyIE9PQiB3cml0ZSwgd2UgY2Fubm90IHdyaXRl
IHRvIHRoZSBkYXRhIGFyZWEgKGUuZy4gMHgwIC4uIDB4ODEwKSB1bnRpbCBwYWdlIHdpbGwgYmUg
ZXJhc2VkPyBGb3IgZXhhbXBsZQo+Pj4gSkZGUzIgd3JpdGVzIHRvIE9PQiBvd24gbWFya2Vycywg
dGhlbiBpdCB0cmllcyB0byB3cml0ZSB0byB0aGUgZGF0YSBhcmVhIG9mIHN1Y2ggcGFnZS4KPiAK
PiBATGlhbmcsIEknbGwgZGVzY3JpYmUgY3VycmVudCB0ZXN0IGNhc2UgaW4gZGV0YWlsczoKPiAx
KSBJIGhhdmUgZXJhc2VkIHBhZ2UsIEkgY2FuIHJlYWQgaXQgaW4gIGJvdGggcmF3IGFuZCBlY2Mg
bW9kZXMgLSBubyBwcm9ibGVtIChpdCBpcyBmdWxsIG9mIDB4RkYpLgo+IDIpIEkgKEpGRlMyIGZv
ciBleGFtcGxlKSB3YW50IHRvIHdyaXRlIG9ubHkgT09CIC0gbGV0IGl0IGJlIGNsZWFuIG1hcmtl
cnMuCj4gMykgSSB1c2UgcmF3IHdyaXRlIHRvIHRoZSBuZWVkZWQgcGFnZSAocGxlYXNlIGNvcnJl
Y3QgbWUgaWYgaSdtIHdyb25nKS4gRm91ciBieXRlcwo+ICAgIGF0IDB4NDAwIGFuZCAweDgxMCBh
cmUgdXBkYXRlZC4gQWxsIG90aGVyIGJ5dGVzIHN0aWxsIDB4ZmYuCj4gNCkgTm93LCB3aGVuIGkn
bSB0cnlpbmcgdG8gcmVhZCB0aGlzIHBhZ2UgaW4gRUNDIG1vZGUsIEkgZ2V0IEVDQyBlcnJvcnM6
IElJVUMgdGhpcwo+ICAgIGhhcHBlbnMgYmVjYXVzZSBmcm9tIGNvbnRyb2xsZXIgcG9pbnQgb2Yg
dmlldyBFQ0MgY29kZXMgYXJlIGludmFsaWQgZm9yIGN1cnJlbnQKPiAgICBkYXRhIChhbGwgRUND
cyBhcmUgMHhmZikuIElzIHRoaXMgYmVoYXZpb3VyIGlzIG9rPwo+IDUpIE9rLCBkb24ndCBjYXJl
IG9uIHRoZXNlIEVDQyBlcnJvcnMsIGxldCdzIGdvIGZ1cnRoZXIuCj4gNikgSSdtIGdvaW5nIHRv
IHdyaXRlIHNhbWUgcGFnZSBpbiBFQ0MgbW9kZSAtIGhvdyB0byBkbyBpdCBjb3JyZWN0bHk/IFRo
ZXJlIGlzIGFscmVhZHkKPiAgICA0IE9PQiBieXRlcywgY29uc2lkZXJlZCB0byBiZSBjb3ZlcmVk
IGJ5IEVDQyAoYnV0IGluIGZhY3Qgbm93IC0gRUNDIGFyZWEgaXMgRkZlZCkuCj4gCj4gVGhhdCdz
IHdoeSBJIGFza2VkIFlvdXIgb3BpbmlvbiBhYm91dCBtb3ZpbmcgT09CIGRhdGEgdG8gbm9ucHJv
dGVjdGVkIGJ5IEVDQyBhcmVhIChhbmQKPiBsZWF2ZSB1c2VyJ3MgYnl0ZXMgdW50b3VjaGVkKS4g
SW4gdGhpcyBjYXNlIE9PQiBhY2Nlc3MgaXMgZnJlZSBhbmQgbm90IGxpbmtlZCB3aXRoIEVDQwo+
IGNvZGVzIHdoaWNoIGFsc28gY292ZXJzIGRhdGEuCj4gCj4gVGhhbmtzLCBBcnNlbml5CgpGb3Ig
ZXhhbXBsZSBzdGVwcyAxLTQgaGFwcGVucyBkdXJpbmcgd29yayB3aXRoIEpGRlMyLCBpdCB0cmll
cyB0byB3cml0ZSBPT0IsIHRoZW4sIHNvbWV0aW1lcwpsYXRlciByZWFkIHRoaXMgcGFnZSBpbiBF
Q0MgbW9kZSAtIGFuZCBnZXQgRUNDIGVycm9ycy4KClRoYW5rcywgQXJzZW5peQoKPiAgICAKPiAK
Pj4KPj4gQSBwYWdlIGlzIHdyaXR0ZW4gYWZ0ZXIgdHdvIHN0ZXBzOgo+PiAtIGxvYWRpbmcgdGhl
IGRhdGEgaW50byB0aGUgTkFORCBjaGlwIGNhY2hlICh0aGF0J3Mgd2hlbiB5b3UgdXNlIHRoZQo+
PiAgIGJ1cykKPj4gLSBwcm9ncmFtbWluZyB0aGUgTkFORCBhcnJheSB3aXRoIHRoZSBkYXRhIGxv
YWRlZCBpbiBjYWNoZSAodGhhdCdzIHdoZW4KPj4gICB5b3Ugd2FpdCkKPj4KPj4gSW4gdGhlb3J5
IGl0IGRvZXMgbm90IG1hdHRlciB3aGVyZSB5b3Ugd3JpdGUgaW4gdGhlIGNhY2hlLCBpdCdzIHJl
Z3VsYXIKPj4gRFJBTSwgeW91IGNhbiBtYWtlIHJhbmRvbSB3cml0ZXMgdGhlcmUgd2l0aCB0aGUg
YXBwcm9wcmlhdGUgTkFORAo+PiBjb21tYW5kcy4gT2YgY291cnNlIHdoZW4gdXNpbmcgZW1iZWRk
ZWQgaGFyZHdhcmUgRUNDIGVuZ2luZXMsIHRoZQo+PiBjb250cm9sbGVycyB1c3VhbGx5IGV4cGVj
dCB0byBiZSBmZWQgaW4gYSBjZXJ0YWluIHdheSBpbiBvcmRlciB0bwo+PiBwcm9kdWNlIHRoZSBF
Q0MgYnl0ZXMgYW5kIHB1dCB0aGVtIGF0IHRoZSByaWdodCBsb2NhdGlvbiBpbiBjYWNoZS4KPj4K
Pj4gQW5kIHRoZW4sIHdoZW4geW91IGFjdHVhbGx5IHNlbmQgdGhlICJwcm9ncmFtIiBjb21tYW5k
LCB0aGUgTkFORCBjZWxscwo+PiBhY3R1YWxseSBnZXQgcHJvZ3JhbW1lZCBiYXNlZCBvbiB3aGF0
IGhhcyBiZWVuIGxvYWRlZCBpbiBjYWNoZS4KPiAKPiBUaGFua3MgZm9yIHRoaXMgZGV0YWlscyEg
VmVyeSBpbnRlcmVzdGluZyEKPiAKPiAKPj4KPj4gVGhhbmtzLAo+PiBNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
