Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D176C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYF3eCJoenh8iRh+uS3pBzPyqrgjtEMez+5fM5725LU=; b=duBTMt1OOC1MLS
	RurzpMAWqll4AXwIqCPMwWdtts0FfnojhNF5I7VdiuUwL+fZSfuXB0OiCAhc36Wl+qI2NC83JEzqH
	Xx7M205WumdSCCU8blIza1k6FdMFnAbuggmh8cE8AdAPuz17wTUrI5BYrzlQmOUyscMni4oyZAbk7
	hLuYGHhHET4EHgwumR8vpgOEM/xv/XTpyGCcPG8WsaaPpjeDdeHmTmDCUuzXR24RVMBfW1MyzMEeq
	Jytz3KG79goZqabH61tkUdWxYvcuBp7q/sb3wH9cyz0dogiNRhNt/+lupV2U1PZykJ0qqFSh1dimr
	SkGhPXN0hMEZhmctpP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ0c-002wj9-3A;
	Wed, 12 Apr 2023 11:51:30 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ0Y-002wgU-0B;
	Wed, 12 Apr 2023 11:51:28 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 752E55FD67;
	Wed, 12 Apr 2023 14:51:23 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681300283;
	bh=Icigs/+dNEkOIVVLZCgcX2mmuvfiMc9wUaxUOYoE5Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=CRvTKduR13lI73ljFO6tctKOrbx+BMK1Pjxcqcx96s6IioL0j2CxCnI1qQiZShF+f
	 PJbp2LksX9x6Y4lAtscWbhth0Mv1hE3oUYos7cDp56UBixGZMFwp6v6x1592YVN8QU
	 a86/N9aENk4o4ikzO5aca0I/51BGZl5i+XY1nMBpFyLCaqaEHSdrKWWCDSlItt5ctM
	 kbpShStoWWpmXf0COOopQ1KeGSEH+iBLg2LOCkkF2TDkD7/bhkvpWwGhzBYLoWefEj
	 tDwD6IAbel8BOy0f6+g5dPmMv4vlghoZnzRvU795hDQcyGGK/8oGSPa2eNoF2EDXlJ
	 tp5aHaIxhEE2A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 14:51:23 +0300 (MSK)
Message-ID: <db1d3904-0da1-bfad-6bb6-da78999dcf01@sberdevices.ru>
Date: Wed, 12 Apr 2023 14:47:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, Liang Yang
	<liang.yang@amlogic.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <4baac18b-c223-d346-503c-f5f9ae49320d@amlogic.com>
 <fe03919a-3468-b79e-5971-1f7671684ee9@amlogic.com>
 <20230412114326.fn3nm5r3rzlnqgg7@CAB-WSD-L081021>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230412114326.fn3nm5r3rzlnqgg7@CAB-WSD-L081021>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 04:12:00 #21090163
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_045126_440413_974422D3 
X-CRM114-Status: GOOD (  27.43  )
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

CgpPbiAxMi4wNC4yMDIzIDE0OjQzLCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiBIZWxsbyBMaWFu
ZywKPiAKPiBPbiBXZWQsIEFwciAxMiwgMjAyMyBhdCAwNzozNjozMFBNICswODAwLCBMaWFuZyBZ
YW5nIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjAyMy80LzEyIDE4OjUxLCBMaWFuZyBZYW5nIHdy
b3RlOgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFu
ZC5jCj4+Pj4+Pj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+
IGluZGV4IGY4NGExMDIzOGU0ZC4uZjJmMjQ3MmNiNTExIDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0
YXRpYyBpbnQKPj4+Pj4+Pj4gbWVzb25fbmZjX3JlYWRfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hp
cCAqbmFuZCwKPj4+Pj4+Pj4gwqAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX3Jhdyhz
dHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBvb2JfcmVxdWlyZWQsIGludCBwYWdlKQo+Pj4+
Pj4+PiDCoCB7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3Rv
X210ZChuYW5kKTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCB1OCAqb29iX2J1ZiA9IG5hbmQtPm9vYl9w
b2k7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4+Pj4+Pj4gK8KgwqDCoCBtZW1zZXQo
b29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsKPj4+Pj4+Pgo+Pj4+Pj4+IEknbSBzdXJwcmlzZWQg
cmF3IHJlYWRzIGRvIG5vdCByZWFkIHRoZSBlbnRpcmUgT09CPwo+Pj4+Pj4KPj4+Pj4+IFllcyEg
U2VlbXMgaW4gY2FzZSBvZiByYXcgYWNjZXNzICh3aGF0IGkgc2VlIGluIHRoaXMgZHJpdmVyKQo+
Pj4+Pj4gbnVtYmVyIG9mIE9PQiBieXRlcyByZWFkCj4+Pj4+PiBzdGlsbCBkZXBlbmRzIG9uIEVD
QyBwYXJhbWV0ZXJzOiBmb3IgZWFjaCBwb3J0aW9uIG9mIGRhdGEKPj4+Pj4+IGNvdmVyZWQgd2l0
aCBFQ0MgY29kZSB3ZSBjYW4KPj4+Pj4+IHJlYWQgaXQncyBFQ0MgY29kZSBhbmQgInVzZXIgYnl0
ZXMiIGZyb20gT09CIC0gaXQgaXMgd2hhdCBpCj4+Pj4+PiBzZWUgYnkgZHVtcGluZyBETUEgYnVm
ZmVyIGJ5Cj4+Pj4+PiBwcmludGsoKS4gRm9yIGV4YW1wbGUgSSdtIHdvcmtpbmcgd2l0aCAySyBO
QU5EIHBhZ2VzLCBlYWNoCj4+Pj4+PiBwYWdlIGhhcyAyIHggMUsgRUNDIGJsb2Nrcy4KPj4+Pj4+
IEZvciBlYWNoIEVDQyBibG9jayBJIGhhdmUgMTYgT09CIGJ5dGVzIHdoaWNoIEkgY2FuIGFjY2Vz
cyBieQo+Pj4+Pj4gcmVhZC93cml0ZS4gRWFjaCAxNiBieXRlcwo+Pj4+Pj4gY29udGFpbnMgMiBi
eXRlcyBvZiB1c2VyJ3MgZGF0YSBhbmQgMTQgYnl0ZXMgRUNDIGNvZGVzLiBTbwo+Pj4+Pj4gd2hl
biBJIHJlYWQgcGFnZSBpbiByYXcgbW9kZQo+Pj4+Pj4gY29udHJvbGxlciByZXR1cm5zIDMyIGJ5
dGVzICgyIHggKDIgKyAxNCkpIG9mIE9PQi4gV2hpbGUgT09CCj4+Pj4+PiBpcyByZXBvcnRlZCBh
cyA2NCBieXRlcy4KPj4+Pj4KPj4+Pj4gSW4gYWxsIG1vZGVzLCB3aGVuIHlvdSByZWFkIE9PQiwg
eW91IHNob3VsZCBnZXQgdGhlIGZ1bGwgT09CLiBUaGUgZmFjdAo+Pj4+PiB0aGF0IEVDQyBjb3Jy
ZWN0aW9uIGlzIGVuYWJsZWQgb3IgZGlzYWJsZWQgZG9lcyBub3QgbWF0dGVyLiBJZiB0aGUgTkFO
RAo+Pj4+PiBmZWF0dXJlcyBPT0Igc2VjdGlvbnMgb2YgNjQgYnl0ZXMsIHlvdSBzaG91bGQgZ2V0
IHRoZSA2NCBieXRlcy4KPj4+Pj4KPj4+Pj4gV2hhdCBoYXBwZW5zIHNvbWV0aW1lcywgaXMgdGhh
dCBzb21lIG9mIHRoZSBieXRlcyBhcmUgbm90IHByb3RlY3RlZAo+Pj4+PiBhZ2FpbnN0IGJpdGZs
aXBzLCBidXQgdGhlIHBvbGljeSBpcyB0byByZXR1cm4gdGhlIGZ1bGwgYnVmZmVyLgo+Pj4+Cj4+
Pj4gT2ssIHNvIHRvIGNsYXJpZnkgY2FzZSBmb3IgdGhpcyBOQU5EIGNvbnRyb2xsZXI6Cj4+Pj4g
MSkgSW4gYm90aCBFQ0MgYW5kIHJhdyBtb2RlcyBpIG5lZWQgdG8gcmV0dXJuIHRoZSBzYW1lIHJh
dyBPT0IgZGF0YQo+Pj4+IChlLmcuIHVzZXIgYnl0ZXMKPj4+PiDCoMKgwqAgKyBFQ0MgY29kZXMp
Pwo+Pj4+IDIpIElmIEkgaGF2ZSBhY2Nlc3MgdG8gb25seSAzMiBieXRlcyBvZiBPT0IgKGluIGNh
c2UgYWJvdmUpLCBJIG11c3QKPj4+PiByZXBvcnQgdGhhdCBzaXplCj4+Pj4gwqDCoMKgIG9mIE9P
QiBpcyBvbmx5IDMyIGJ5dGVzIGR1cmluZyBpbml0aWFsaXphdGlvbj8KPj4+Pgo+Pj4+IFRoYW5r
cywgQXJzZW5peQo+Pj4KPj4+IFllcy4gaXQgc2hvdWxkIHJldHVybiBhbGwgdGhlIE9PQiBkYXRh
LiBpIG1ha2UgYSBtaXN0YWtlIG9uIHJhdyByZWFkIGFuZAo+Pj4gdGhlcmUgaXMgd3JvbmcgY29k
ZSBpbiBtZXNvbl9uZmNfcmVhZF9wYWdlX3JhdygpLgo+Pj4gIMKgwqDCoMKgbWVzb25fbmZjX2dl
dF9kYXRhX29vYihuYW5kLCBidWYsIG9vYl9idWYpOwo+Pj4gY2hhbmdlZCB0bzoKPj4+ICDCoMKg
wqDCoGlmIChvb2JfcmVxdWlyZWQpCj4+PiAgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KG9vYl9idWYs
IGJ1ZiArIG10ZC0+d3JpdGVzaXplLCBtdGQtPm9vYnNpemUpCj4+Cj4+IFNvcnJ5LCBwbGVhc2Ug
aWdub3JlIHRoaXMuIHRoZSBwcmV2aW91cyBjb2RlIGlzIHJpZ2h0Lgo+Pgo+PiB0aGUgY29udHJv
bGxlciBjaGFuZ2VzIHRoZSBsYXlvdXQgb2Ygb25lIHBhZ2U7IHRoZSBwaHlzaWNhbCBsYXlvdXQg
aXMgMjA0OAo+PiBtYWluIGRhdGEgKyA2NCBvb2IgZGF0YS4gYWZ0ZXIgd3JpdGluZyBpbnRvIE5B
TkQgcGFnZSwgaXQgaXMgc3RvcmVkCj4+IGxpa2UgdGhpczogMTAyNCBtYWluIGRhdGEgKyAyIHVz
ZXIgYnl0ZXMgKyAxNCBFQ0MgcGFyaXR5IGJ5dGVzICsgMTAyNCBtYWluCj4+IGRhdGEgKyAyIHVz
ZXIgYnl0ZXMgKyAxNCBFQ0MgcGFyaXR5IGJ5dGVzLiBzbyB0aGF0IGlzIHJpZ2h0IHdlIG9ubHkg
Z2V0IDQKPj4gdXNlciBieXRlcyBhbmQgMjggRUNDIHBhcml0eSBieXRlcywgdG90YWwgMzIgYnl0
ZXMuIHRoYXQgaXMgdGhlIGJlaGF2aW9yIG9mCj4+IHRoZSBjb250cm9sbGVyIHRoYXQgdHJhbnNm
ZXJyaW5nIG9uZSBFQ0MgcGFnZSgxS0IpIGJyaW5ncyBiYWNrIG9ubHkgMiB1c2VyCj4+IGJ5dGVz
LgoKU28gaSBwZXJmb3JtIHRoZSBmb2xsb3dpbmcgdGVzdCwgdXNpbmcgZmlsZSB3aXRoIHRoZSBm
b2xsb3dpbmcgcGF0dGVybjoKWyAxMDI0IHggMHgxMSBdWyAxMDI0IHggMHgyMiBdWyAxNiB4IDB4
MzMgXVsgMTYgeCAweDQ0IF1bIDE2IHggMHg1NSBdWyAxNiB4IDB4NjYgXQoKVG90YWwgMjExMiBi
eXRlcyAoMjA0OCBkYXRhICsgNjQgb29iKQoKSSB3cml0ZSBpdCB1c2luZyAnbmFuZHdyaXRlJyB0
b29sIHdpdGggZmxhZ3MgJy0tb29iJyBhbmQgJy0tbm9lY2MnIC0gZS5nLiByYXcgbW9kZS4KbWVz
b25fbmZjX3NldF9kYXRhX29vYigpIHBsYWNlcyB0byBETUEgYnVmZmVyIG9ubHkgcGFydHMgd2l0
aCAweDExLCAweDIyLCAweDMzLCAweDQ0LgpBZnRlciB3cml0ZSBkYXRhIGJ5dGVzIHdpbGwgYmUg
MHgxMSBhbmQgMHgyMiwgZmlyc3QgMzIgYnl0ZXMgb2YgT09CIHdpbGwgYmUgMHgzMyBhbmQgMHg0
NC4KUGFydHMgd2l0aCAweDU1IGFuZCAweDY2IHdpbGwgYmUgb2J2aW91c2x5IG1pc3NlZC4KClNv
IGl0IGlzIEFtbG9naWMgbGltaXRhdGlvbiBmb3IgMzIgYnl0ZXMgb2YgT09CIChpbiBjYXNlIG9m
IDFLIEVDQyBhcyBZb3UgbWVudGlvbmVkIGFib3ZlKT8KCkFuZCB0aGVyZSBpcyBubyB3YXkgdG8g
YWNjZXNzIHRvIHRoZSB3aG9sZSA2NCBieXRlcyBvZiBPT0IgZXZlbiBpbiByYXcgbW9kZSAoYW5k
IHRoZXJlZm9yZSBpbgpFQ0MgbW9kZSk/CgpUaGFua3MsIEFyc2VuaXkKCj4+Cj4+IGJlY2F1c2Ug
bGF5b3V0IGlzIGNoYW5nZWQgYnkgY29udHJvbGxlciwgc28gZ28gYmFjayB0byB0aGUgZnVuY3Rp
b24uCj4+IG1lc29uX25mY19nZXRfZGF0YV9vb2IobmFuZCwgYnVmLCBvb2JfYnVmKSB0cnkgdG8g
Z2V0IHRoZSByaWdodCB1c2VyIGFuZCBlY2MKPj4gcGFyaXR5IGJ5dGVzIGZyb20gdGhlIHJpZ2h0
IHBvcy4gYWZ0ZXIgdGhhdCwgdGhlIG90aGVyIG9vYiBieXRlcyBpcyBub3QKPj4gcmVhZGluZyBm
cm9tIE5BTkQgZmxhc2guCj4gCj4gSSBoYXZlIGFsd2F5cyBiZWVuIHVuZGVyIHRoZSBpbXByZXNz
aW9uIHRoYXQgTkFORCBPT0IgbGF5b3V0IGZhbGxzIHVuZGVyIHRoZQo+IHJlc3BvbnNpYmlsaXR5
IG9mIHRoZSBmbGFzaCBkcml2ZXIuIElzIHRoaXMgc3BlY2lmaWMgdG8gdGhlIEFtbG9naWMgTkFO
RCwKPiBhbmQgZG9lcyBpdCBtYXAgdGhlIGZsYXNoIGxheW91dCB0byB0aGUgaW50ZXJuYWwgY29u
dHJvbGxlciBsYXlvdXQ/Cj4gRm9yIGV4YW1wbGUsIGRpZmZlcmVudCBPT0IgbGF5b3V0cyBleGlz
dCBiZXR3ZWVuIE1hY3Jvbml4IGFuZCBFU01ULgo+IAo+IEFwb2xvZ2llcyBmb3IgYW55IGNvbmZ1
c2lvbiwgYW5kIHRoYW5rIHlvdSBpbiBhZHZhbmNlIGZvciBhbnkgaGVscCBpbgo+IGNsYXJpZnlp
bmcgdGhpcyBtYXR0ZXIuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
