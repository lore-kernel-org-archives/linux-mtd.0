Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14D2C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKAZVxjZLmBLYfcjsdSTPzisorP25TCDi4loOeQAVA0=; b=GFGWGmuhxtYY/y
	utKi3V2jCjYQcahbZiRdUuTC/vR9TJ8/xny8T+PHN0bileOwMP6N3s/LVGCBANTxIsIekNiHcfv2+
	rzD9tQadQnoZmLXvoQGkJQwFM2b010JBQIIQ+W9OvIjj7DcXKU4Gw5FRiysYwPtFuKoOukVva0cj9
	MaDm7GIa2FNdZWQkVa7bS4AknxNTTLIE9xjIlzgNaUx0x4AB92k2w7li2iO2W+mYwVLujeCRdXqoB
	yH9Eyn0Ex5+ZucnNmDU9zRRVHopKuKZZBPpr4jCycJqNSXqwskaKjNwSZWjbEIgU4YocR7DWCxWo5
	r8QqI2w7XZgg3ApNgO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXYt-002dLL-2r;
	Wed, 12 Apr 2023 10:18:47 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXYo-002dGO-3B;
	Wed, 12 Apr 2023 10:18:44 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 8A4095FD61;
	Wed, 12 Apr 2023 13:18:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681294720;
	bh=PP2Y/Il+dezNqPtLgzxWk2KfTtgfTZFcl/FVi9Ukg8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=JUawYNHO0kedtMwE4ATrHSnma36lVIFO0H414zIv4o1agtnn6VjqYcrXlLhrC31ZF
	 AU0ra4RbFNMyGaW9Va7ofCBLYdHCSFJOF+H4SR3v2uDjqG3XtU8VMWPrGunpQx+ptl
	 JyrD7XWF2uRHagy/0pYmOdVpG8QaPPmrHYZr9+u4VnWquyktm2eCB1JUqDlz13ZdeA
	 n9RUcm9Y43iSbFGsWrEU8JIqiL+XWiKNPWSeiI5kPhfvogXEsBLI9bA/R24C2U/jI5
	 ZAsyKiUxrZLN5ehbY9GrNLMkcSc3iWHA6HOBCk6TtZE0Otylo2eAgfPOU56Mb8qyAp
	 VPsNm0MB+xaRQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 13:18:40 +0300 (MSK)
Message-ID: <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
Date: Wed, 12 Apr 2023 13:14:52 +0300
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
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230412113654.183350d0@xps-13>
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
X-CRM114-CacheID: sfid-20230412_031843_364303_30825DDB 
X-CRM114-Status: GOOD (  18.69  )
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

CgpPbiAxMi4wNC4yMDIzIDEyOjM2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMg
MTI6MjA6NTUgKzAzMDA6Cj4gCj4+IE9uIDEyLjA0LjIwMjMgMTA6NDQsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+PiBIaSBBcnNlbml5LAo+Pj4KPj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDA5OjE2OjU4ICswMzAwOgo+Pj4gICAKPj4+PiBUaGlz
IE5BTkQgcmVhZHMgb25seSBmZXcgdXNlcidzIGJ5dGVzIGluIEVDQyBtb2RlIChub3QgZnVsbCBP
T0IpLCBzbyAgCj4+Pgo+Pj4gIlRoaXMgTkFORCByZWFkcyIgZG9lcyBub3QgbG9vayByaWdodCwg
ZG8geW91IG1lYW4gIlN1YnBhZ2UgcmVhZHMgZG8KPj4+IG5vdCByZXRyaWV2ZSBhbGwgdGhlIE9P
QiBieXRlcywiPwo+Pj4gICAKPj4+PiBmaWxsIE9PQiBidWZmZXIgd2l0aCB6ZXJvZXMgdG8gbm90
IHJldHVybiBnYXJiYWdlIGZyb20gcHJldmlvdXMgcmVhZHMKPj4+PiB0byB1c2VyLgo+Pj4+IE90
aGVyd2lzZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtlIHRoaXMgZm9y
IGp1c3QgZXJhc2VkCj4+Pj4gcGFnZToKPj4+Pgo+Pj4+IC4uLgo+Pj4+IDB4MDAwMDA3ZjA6IGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+Pj4gICBPT0Ig
RGF0YTogZmYgZmYgZmYgZmYgMDAgMDAgZmYgZmYgODAgY2YgMjIgOTkgY2IgYWQgZDMgYmUKPj4+
PiAgIE9PQiBEYXRhOiA2MyAyNyBhZSAwNiAxNiAwYSAyZiBlYiBiYiBkZCA0NiA3NCA0MSA4ZSA4
OCA2ZQo+Pj4+ICAgT09CIERhdGE6IDM4IGExIDJkIGU2IDc3IGQ0IDA1IDA2IGYyIGE1IDdlIDI1
IGViIDM0IDdjIGZmCj4+Pj4gICBPT0IgRGF0YTogMzggZWEgZGUgMTQgMTAgZGUgOWIgNDAgMzMg
MTYgNmEgY2MgOWQgYWEgMmYgNWUKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jh
c25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+Pj4+IC0tLQo+Pj4+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA1ICsrKysrCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+PiBp
bmRleCBmODRhMTAyMzhlNGQuLmYyZjI0NzJjYjUxMSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tZXNvbl9uYW5kLmMKPj4+PiBAQCAtODU4LDkgKzg1OCwxMiBAQCBzdGF0aWMgaW50IG1lc29u
X25mY19yZWFkX3BhZ2Vfc3ViKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+Pj4gIHN0YXRpYyBp
bnQgbWVzb25fbmZjX3JlYWRfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1
ZiwKPj4+PiAgCQkJCSAgIGludCBvb2JfcmVxdWlyZWQsIGludCBwYWdlKQo+Pj4+ICB7Cj4+Pj4g
KwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwo+Pj4+ICAJdTggKm9v
Yl9idWYgPSBuYW5kLT5vb2JfcG9pOwo+Pj4+ICAJaW50IHJldDsKPj4+PiAgCj4+Pj4gKwltZW1z
ZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsgIAo+Pj4KPj4+IEknbSBzdXJwcmlzZWQgcmF3
IHJlYWRzIGRvIG5vdCByZWFkIHRoZSBlbnRpcmUgT09CPyAgCj4+Cj4+IFllcyEgU2VlbXMgaW4g
Y2FzZSBvZiByYXcgYWNjZXNzICh3aGF0IGkgc2VlIGluIHRoaXMgZHJpdmVyKSBudW1iZXIgb2Yg
T09CIGJ5dGVzIHJlYWQKPj4gc3RpbGwgZGVwZW5kcyBvbiBFQ0MgcGFyYW1ldGVyczogZm9yIGVh
Y2ggcG9ydGlvbiBvZiBkYXRhIGNvdmVyZWQgd2l0aCBFQ0MgY29kZSB3ZSBjYW4KPj4gcmVhZCBp
dCdzIEVDQyBjb2RlIGFuZCAidXNlciBieXRlcyIgZnJvbSBPT0IgLSBpdCBpcyB3aGF0IGkgc2Vl
IGJ5IGR1bXBpbmcgRE1BIGJ1ZmZlciBieQo+PiBwcmludGsoKS4gRm9yIGV4YW1wbGUgSSdtIHdv
cmtpbmcgd2l0aCAySyBOQU5EIHBhZ2VzLCBlYWNoIHBhZ2UgaGFzIDIgeCAxSyBFQ0MgYmxvY2tz
Lgo+PiBGb3IgZWFjaCBFQ0MgYmxvY2sgSSBoYXZlIDE2IE9PQiBieXRlcyB3aGljaCBJIGNhbiBh
Y2Nlc3MgYnkgcmVhZC93cml0ZS4gRWFjaCAxNiBieXRlcwo+PiBjb250YWlucyAyIGJ5dGVzIG9m
IHVzZXIncyBkYXRhIGFuZCAxNCBieXRlcyBFQ0MgY29kZXMuIFNvIHdoZW4gSSByZWFkIHBhZ2Ug
aW4gcmF3IG1vZGUKPj4gY29udHJvbGxlciByZXR1cm5zIDMyIGJ5dGVzICgyIHggKDIgKyAxNCkp
IG9mIE9PQi4gV2hpbGUgT09CIGlzIHJlcG9ydGVkIGFzIDY0IGJ5dGVzLgo+IAo+IEluIGFsbCBt
b2Rlcywgd2hlbiB5b3UgcmVhZCBPT0IsIHlvdSBzaG91bGQgZ2V0IHRoZSBmdWxsIE9PQi4gVGhl
IGZhY3QKPiB0aGF0IEVDQyBjb3JyZWN0aW9uIGlzIGVuYWJsZWQgb3IgZGlzYWJsZWQgZG9lcyBu
b3QgbWF0dGVyLiBJZiB0aGUgTkFORAo+IGZlYXR1cmVzIE9PQiBzZWN0aW9ucyBvZiA2NCBieXRl
cywgeW91IHNob3VsZCBnZXQgdGhlIDY0IGJ5dGVzLgo+IAo+IFdoYXQgaGFwcGVucyBzb21ldGlt
ZXMsIGlzIHRoYXQgc29tZSBvZiB0aGUgYnl0ZXMgYXJlIG5vdCBwcm90ZWN0ZWQKPiBhZ2FpbnN0
IGJpdGZsaXBzLCBidXQgdGhlIHBvbGljeSBpcyB0byByZXR1cm4gdGhlIGZ1bGwgYnVmZmVyLgoK
T2ssIHNvIHRvIGNsYXJpZnkgY2FzZSBmb3IgdGhpcyBOQU5EIGNvbnRyb2xsZXI6CjEpIEluIGJv
dGggRUNDIGFuZCByYXcgbW9kZXMgaSBuZWVkIHRvIHJldHVybiB0aGUgc2FtZSByYXcgT09CIGRh
dGEgKGUuZy4gdXNlciBieXRlcwogICArIEVDQyBjb2Rlcyk/CjIpIElmIEkgaGF2ZSBhY2Nlc3Mg
dG8gb25seSAzMiBieXRlcyBvZiBPT0IgKGluIGNhc2UgYWJvdmUpLCBJIG11c3QgcmVwb3J0IHRo
YXQgc2l6ZQogICBvZiBPT0IgaXMgb25seSAzMiBieXRlcyBkdXJpbmcgaW5pdGlhbGl6YXRpb24/
CgpUaGFua3MsIEFyc2VuaXkKCj4gCj4+Cj4+IFRoYW5rcywgQXJzZW5peQo+Pgo+Pj4gICAKPj4+
PiArCj4+Pj4gIAlyZXQgPSBtZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihuYW5kLCBwYWdlLCAxKTsK
Pj4+PiAgCWlmIChyZXQpCj4+Pj4gIAkJcmV0dXJuIHJldDsKPj4+PiBAQCAtODgxLDYgKzg4NCw4
IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFnZV9od2VjYyhzdHJ1Y3QgbmFuZF9jaGlw
ICpuYW5kLCB1OCAqYnVmLAo+Pj4+ICAJdTggKm9vYl9idWYgPSBuYW5kLT5vb2JfcG9pOwo+Pj4+
ICAJaW50IHJldCwgaTsKPj4+PiAgCj4+Pj4gKwltZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2Jz
aXplKTsKPj4+PiArCj4+Pj4gIAlyZXQgPSBtZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihuYW5kLCBw
YWdlLCAwKTsKPj4+PiAgCWlmIChyZXQpCj4+Pj4gIAkJcmV0dXJuIHJldDsgIAo+Pj4KPj4+Cj4+
PiBUaGFua3MsCj4+PiBNaXF1w6hsICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
