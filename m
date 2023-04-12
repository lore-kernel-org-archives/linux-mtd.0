Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCF6C77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4Exv15jOYzBHqmGF18NQ4O76geRcsUM647ePq5GnCI=; b=hcHmmvSTwsihAt
	62kDQQ4UJ3gbK9lgDom4eCAnmdljGsgO5EwA97SKUsbqEBp1waSs/3SeHcuhHqFOl3qKGnLtSEwqL
	PIVNTpsFEfpWIOy0ApHnZp9oh3SKbMVQKmO4WNQ3K8rq48oqdcUFe503YDdrVt8otOSU3EzWg0STU
	mu8shkK66ilMyWAjklAqCEKM0dWFQFUWcz4xHM1um3ku94HbDWfHDQdfVSFBazSEPLl2GS/FNz84O
	kXD9YiTSt3votaD8N84a7zHYdonyJ31KCer8Rs26PFOM2sKL+GdIYvr3Dh+7FmGWVT5zyngKrkLNv
	rC2d0dcM1KV4X8jH8lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZYS-0035O0-2A;
	Wed, 12 Apr 2023 12:26:28 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZYN-0035KC-10;
	Wed, 12 Apr 2023 12:26:25 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6E1BA5FD61;
	Wed, 12 Apr 2023 15:26:20 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681302380;
	bh=baVoUdcsUqQcacvPIKW5rpkoBB26wb+sRo1ToEofS4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=gw3B8kamxj1vZtPCgZJBSYd8iVChCa3k+nQseoju53SZlkyj8Cj3hL5TtqtA2KcMO
	 X7m3htakzFZHZMTm90rKJ8CXOLNizXYiBujXPoARWRdxbFVnMI53P3NtoqcBCaXgle
	 PMQwEx5txmqOmOIsezmVN9L5VYjo2ta+PEzXkwZ9M498wtYn+E7k/i4fulffmD8lUP
	 ai8miLFzCB/fe/IuxbixIXSRKohd8VzgSYrL/2E99/GvD9WGCC/4qwFfY5WM3VSzvK
	 IB/TplicwUhvKjnmmyX4hZ6l1sPz8/S2CSDSLOmP6SgQkg/R3JyoEpoBImhLNbfaow
	 I6A0XQaRjvRFA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 15:26:19 +0300 (MSK)
Message-ID: <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
Date: Wed, 12 Apr 2023 15:22:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
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
 <20230412141824.755b2bca@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230412141824.755b2bca@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 04:12:00 #21090163
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_052623_691345_5199CBE1 
X-CRM114-Status: GOOD (  23.70  )
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

CgpPbiAxMi4wNC4yMDIzIDE1OjE4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMg
MTM6MTQ6NTIgKzAzMDA6Cj4gCj4+IE9uIDEyLjA0LjIwMjMgMTI6MzYsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+PiBIaSBBcnNlbml5LAo+Pj4KPj4+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDEyOjIwOjU1ICswMzAwOgo+Pj4gICAKPj4+PiBPbiAx
Mi4wNC4yMDIzIDEwOjQ0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4+Pj4+IEhpIEFyc2VuaXks
Cj4+Pj4+Cj4+Pj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFw
ciAyMDIzIDA5OjE2OjU4ICswMzAwOgo+Pj4+PiAgICAgCj4+Pj4+PiBUaGlzIE5BTkQgcmVhZHMg
b25seSBmZXcgdXNlcidzIGJ5dGVzIGluIEVDQyBtb2RlIChub3QgZnVsbCBPT0IpLCBzbyAgICAK
Pj4+Pj4KPj4+Pj4gIlRoaXMgTkFORCByZWFkcyIgZG9lcyBub3QgbG9vayByaWdodCwgZG8geW91
IG1lYW4gIlN1YnBhZ2UgcmVhZHMgZG8KPj4+Pj4gbm90IHJldHJpZXZlIGFsbCB0aGUgT09CIGJ5
dGVzLCI/Cj4+Pj4+ICAgICAKPj4+Pj4+IGZpbGwgT09CIGJ1ZmZlciB3aXRoIHplcm9lcyB0byBu
b3QgcmV0dXJuIGdhcmJhZ2UgZnJvbSBwcmV2aW91cyByZWFkcwo+Pj4+Pj4gdG8gdXNlci4KPj4+
Pj4+IE90aGVyd2lzZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtlIHRo
aXMgZm9yIGp1c3QgZXJhc2VkCj4+Pj4+PiBwYWdlOgo+Pj4+Pj4KPj4+Pj4+IC4uLgo+Pj4+Pj4g
MHgwMDAwMDdmMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYKPj4+Pj4+ICAgT09CIERhdGE6IGZmIGZmIGZmIGZmIDAwIDAwIGZmIGZmIDgwIGNmIDIyIDk5
IGNiIGFkIGQzIGJlCj4+Pj4+PiAgIE9PQiBEYXRhOiA2MyAyNyBhZSAwNiAxNiAwYSAyZiBlYiBi
YiBkZCA0NiA3NCA0MSA4ZSA4OCA2ZQo+Pj4+Pj4gICBPT0IgRGF0YTogMzggYTEgMmQgZTYgNzcg
ZDQgMDUgMDYgZjIgYTUgN2UgMjUgZWIgMzQgN2MgZmYKPj4+Pj4+ICAgT09CIERhdGE6IDM4IGVh
IGRlIDE0IDEwIGRlIDliIDQwIDMzIDE2IDZhIGNjIDlkIGFhIDJmIDVlCj4+Pj4+Pgo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+
Cj4+Pj4+PiAtLS0KPj4+Pj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA1
ICsrKysrCj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+IGluZGV4IGY4NGExMDIzOGU0ZC4u
ZjJmMjQ3MmNiNTExIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMK
Pj4+Pj4+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFn
ZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4+Pj4+ICBzdGF0aWMgaW50IG1lc29uX25m
Y19yZWFkX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsCj4+Pj4+PiAg
CQkJCSAgIGludCBvb2JfcmVxdWlyZWQsIGludCBwYWdlKQo+Pj4+Pj4gIHsKPj4+Pj4+ICsJc3Ry
dWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPj4+Pj4+ICAJdTggKm9vYl9i
dWYgPSBuYW5kLT5vb2JfcG9pOwo+Pj4+Pj4gIAlpbnQgcmV0Owo+Pj4+Pj4gIAo+Pj4+Pj4gKwlt
ZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsgICAgCj4+Pj4+Cj4+Pj4+IEknbSBzdXJw
cmlzZWQgcmF3IHJlYWRzIGRvIG5vdCByZWFkIHRoZSBlbnRpcmUgT09CPyAgICAKPj4+Pgo+Pj4+
IFllcyEgU2VlbXMgaW4gY2FzZSBvZiByYXcgYWNjZXNzICh3aGF0IGkgc2VlIGluIHRoaXMgZHJp
dmVyKSBudW1iZXIgb2YgT09CIGJ5dGVzIHJlYWQKPj4+PiBzdGlsbCBkZXBlbmRzIG9uIEVDQyBw
YXJhbWV0ZXJzOiBmb3IgZWFjaCBwb3J0aW9uIG9mIGRhdGEgY292ZXJlZCB3aXRoIEVDQyBjb2Rl
IHdlIGNhbgo+Pj4+IHJlYWQgaXQncyBFQ0MgY29kZSBhbmQgInVzZXIgYnl0ZXMiIGZyb20gT09C
IC0gaXQgaXMgd2hhdCBpIHNlZSBieSBkdW1waW5nIERNQSBidWZmZXIgYnkKPj4+PiBwcmludGso
KS4gRm9yIGV4YW1wbGUgSSdtIHdvcmtpbmcgd2l0aCAySyBOQU5EIHBhZ2VzLCBlYWNoIHBhZ2Ug
aGFzIDIgeCAxSyBFQ0MgYmxvY2tzLgo+Pj4+IEZvciBlYWNoIEVDQyBibG9jayBJIGhhdmUgMTYg
T09CIGJ5dGVzIHdoaWNoIEkgY2FuIGFjY2VzcyBieSByZWFkL3dyaXRlLiBFYWNoIDE2IGJ5dGVz
Cj4+Pj4gY29udGFpbnMgMiBieXRlcyBvZiB1c2VyJ3MgZGF0YSBhbmQgMTQgYnl0ZXMgRUNDIGNv
ZGVzLiBTbyB3aGVuIEkgcmVhZCBwYWdlIGluIHJhdyBtb2RlCj4+Pj4gY29udHJvbGxlciByZXR1
cm5zIDMyIGJ5dGVzICgyIHggKDIgKyAxNCkpIG9mIE9PQi4gV2hpbGUgT09CIGlzIHJlcG9ydGVk
IGFzIDY0IGJ5dGVzLiAgCj4+Pgo+Pj4gSW4gYWxsIG1vZGVzLCB3aGVuIHlvdSByZWFkIE9PQiwg
eW91IHNob3VsZCBnZXQgdGhlIGZ1bGwgT09CLiBUaGUgZmFjdAo+Pj4gdGhhdCBFQ0MgY29ycmVj
dGlvbiBpcyBlbmFibGVkIG9yIGRpc2FibGVkIGRvZXMgbm90IG1hdHRlci4gSWYgdGhlIE5BTkQK
Pj4+IGZlYXR1cmVzIE9PQiBzZWN0aW9ucyBvZiA2NCBieXRlcywgeW91IHNob3VsZCBnZXQgdGhl
IDY0IGJ5dGVzLgo+Pj4KPj4+IFdoYXQgaGFwcGVucyBzb21ldGltZXMsIGlzIHRoYXQgc29tZSBv
ZiB0aGUgYnl0ZXMgYXJlIG5vdCBwcm90ZWN0ZWQKPj4+IGFnYWluc3QgYml0ZmxpcHMsIGJ1dCB0
aGUgcG9saWN5IGlzIHRvIHJldHVybiB0aGUgZnVsbCBidWZmZXIuICAKPj4KPj4gT2ssIHNvIHRv
IGNsYXJpZnkgY2FzZSBmb3IgdGhpcyBOQU5EIGNvbnRyb2xsZXI6Cj4+IDEpIEluIGJvdGggRUND
IGFuZCByYXcgbW9kZXMgaSBuZWVkIHRvIHJldHVybiB0aGUgc2FtZSByYXcgT09CIGRhdGEgKGUu
Zy4gdXNlciBieXRlcwo+PiAgICArIEVDQyBjb2Rlcyk/Cj4gCj4gV2VsbCwgeW91IG5lZWQgdG8g
Y292ZXIgdGhlIHNhbWUgYW1vdW50IG9mIGRhdGEsIHllcy4gQnV0IGluIHRoZSBFQ0MKPiBjYXNl
IHRoZSBkYXRhIHdvbid0IGJlIHJhdyAoYXQgbGVhc3Qgbm90IGFsbCBvZiBpdCkuCgpTbyAic2Ft
ZSBhbW91bnQgb2YgZGF0YSIsIGluIEVDQyBtb2RlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gcmV0
dXJucyBvbmx5IHVzZXIgT09CIGJ5dGVzIChlLmcuCk9PQiBkYXRhIGV4Y2x1ZGluZyBFQ0MgY29k
ZXMpLCBpbiByYXcgaXQgcmV0dXJucyB1c2VyIGJ5dGVzICsgRUNDIGNvZGVzLiBJSVVDIGNvcnJl
Y3QKYmVoYXZpb3VyIGlzIHRvIGFsd2F5cyByZXR1cm4gdXNlciBieXRlcyArIEVDQyBjb2RlcyBh
cyBPT0IgZGF0YSBldmVuIGluIEVDQyBtb2RlID8KClRoYW5rcywgQXJzZW5peQoKPiAKPj4gMikg
SWYgSSBoYXZlIGFjY2VzcyB0byBvbmx5IDMyIGJ5dGVzIG9mIE9PQiAoaW4gY2FzZSBhYm92ZSks
IEkgbXVzdCByZXBvcnQgdGhhdCBzaXplCj4+ICAgIG9mIE9PQiBpcyBvbmx5IDMyIGJ5dGVzIGR1
cmluZyBpbml0aWFsaXphdGlvbj8KPiAKPiBJIGJlbGlldmUgaXQncyBqdXN0IGFuIGltcGxlbWVu
dGF0aW9uIGVycm9yIGluIHRoZSBjb250cm9sbGVyIGRyaXZlci4KPiBUaGlzIGNvbnRyb2xsZXIg
Y2FuIGJlIHVzZWQgb24gTkFORCBjaGlwcyB3aXRoIG90aGVyIGdlb21ldHJpZXMsIHBsZWFzZQo+
IGRvbid0IHBsYXkgd2l0aCBpdC4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
