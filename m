Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1483CC4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:26:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3EBD207E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FLkB8DiS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w7W0mzic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3EBD207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4yzCnW+vkr2/JntzcS9lalKlrWevdLHbLmTJvfqRF4=; b=FLkB8DiSd4zg71
	8/X4fsK7+w9P60YaXABDOK2nfSh4vdq5AHKpgl0SfSykaX/PUcfEuDL0cq3KWMUJuMPYFeVe+Qgn3
	L2tOKgRFJ5+KYMBF2S+spvS6ZRt6JtHplLfqpEfK9hkVNWud6IZPiMOLlH8eGurdil8e2fDHIpVrl
	xOO0TrOHzjmo54F5NnJEPLSNQM/mJ8SfjY7mHrqUZRDiBfIewyZS5LfktjtQd9dA2kPTn8YE8xfnI
	54tMNQll92i1chHCS7DuIqq1MZPF6RRh7y1mMf/k/iv17WmztX6l17xAFaRHXTGHMLrt1DQzap2OJ
	Sr7vQn/BkGxix/4PKZLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBEkm-0005ob-KK; Tue, 02 Apr 2019 08:26:44 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEki-0005o6-Ua
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 08:26:42 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x328QW7e025238;
 Tue, 2 Apr 2019 03:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554193592;
 bh=265nj061QYxfuwl3ogsPEqThClICSXR9gPvdnUAQnZw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=w7W0mzicSx6LZw3OD3cHicA71Ii2pd3mJr48BarZqvbPQuURxqbrgZBSvUg+vDhvK
 +GCRkSGOCOqObUcSGW1StaXnIeVyKyLkaohAIJdMXFTgc6niJWKPg6NEzwZ9d61Wh4
 pGteGSB+LHvFuWC/dRxNJX4lhWjr1RMMM4KFO1gg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x328QWiF020202
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Apr 2019 03:26:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Apr
 2019 03:26:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Apr 2019 03:26:32 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x328QR4M009998;
 Tue, 2 Apr 2019 03:26:28 -0500
Subject: Re: [PATCH v1] mtd: core: add sysfs nodes for querying the flash name
 and id
To: Boris Brezillon <boris.brezillon@collabora.com>, Zhuohao Lee
 <zhuohao@chromium.org>
References: <20190328045910.98250-1-zhuohao@chromium.org>
 <20190401112748.4a3d5539@collabora.com>
 <CABD5ybm_1BjKSsMFGy=LuM0bsCcBnnY7Eid_Ni3OQ5e+aFZ7pg@mail.gmail.com>
 <20190402095628.5d376263@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <7077290a-8acc-465b-6ed0-fddd35ab8fd6@ti.com>
Date: Tue, 2 Apr 2019 13:57:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190402095628.5d376263@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_012641_066858_A858ADC9 
X-CRM114-Status: GOOD (  29.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, bbrezillon@kernel.org,
 richard@nod.at, Brian Norris <briannorris@chromium.org>,
 =?UTF-8?Q?Marek_Va=c5=a1ut?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwMi8wNC8xOSAxOjI2IFBNLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gVHVlLCAy
IEFwciAyMDE5IDE1OjM5OjU0ICswODAwCj4gWmh1b2hhbyBMZWUgPHpodW9oYW9AY2hyb21pdW0u
b3JnPiB3cm90ZToKPiAKPj4gVGhhbmtzIEJvcmlzIGZvciB0aGUgY29tbWVudC4gUGxlYXNlIHRh
a2UgYSBsb29rIHRoZSByZXBseSBhdCBiZWxvdy4KPj4KPj4gT24gTW9uLCBBcHIgMSwgMjAxOSBh
dCA1OjI3IFBNIEJvcmlzIEJyZXppbGxvbgo+PiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+IHdyb3RlOgo+Pj4KPj4+IE9uIFRodSwgMjggTWFyIDIwMTkgMTI6NTk6MTAgKzA4MDAKPj4+
IFpodW9oYW8gTGVlIDx6aHVvaGFvQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4+PiAgCj4+Pj4gQ3Vy
cmVudGx5LCB3ZSBkb24ndCBoYXZlIHN5c2ZzIG5vZGVzIGZvciBxdWVyeWluZyB0aGUgdW5kZXJs
eWluZyBmbGFzaAo+Pj4+IG5hbWUgYW5kIGZsYXNoIGlkLiBUaGlzIGluZm9ybWF0aW9uIGlzIGlt
cG9ydGFudCBlc3BlY2lhbGx5IHdoZW4gd2UKPj4+PiB3YW50IHRvIGtub3cgdGhlIGZsYXNoIGRl
dGFpbCBvZiB0aGUgZGVmZWN0aXZlIHN5c3RlbS4gSW4gb3JkZXIgdG8KPj4+PiBzdXBwb3J0IHRo
ZSBxdWVyeSwgd2UgYWRkIHR3byBwb2ludGVycyAoKmZsYXNobmFtZSwgKmlkKSBpbnRvIHRoZQo+
Pj4+IG10ZF9pbmZvIHN0cnVjdHVyZSBhbmQgY3JlYXRlIHR3byBzeXNmcyBub2RlcyAoZmxhc2hu
YW1lLCBpZCkuIFRoaXMKPj4+PiBwYXRjaCBpcyBtb2RpZmllZCBiYXNlZCBvbiB0aGUgU1BJLU5P
UiBmbGFzaCBzeXN0ZW0gYXMgd2Ugb25seSBoYXZlCj4+Pj4gdGhhdCBzeXN0ZW0gbm93LiBCdXQg
dGhlIGlkZWEgc2hvdWxkIGJlIGFwcGxpZWQgdG8gdGhlIG90aGVyIGZsYXNoCj4+Pj4gZHJpdmVy
IGxpa2UgTkFORCBmbGFzaC4KPj4+Pgo+Pj4+IFRoZSBvdXRwdXQgb2YgbmV3IHN5c2ZzIG5vZGVz
IG9uIG15IGRldmljZSBhcmU6Cj4+Pj4gY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTEw
MTAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvbXRkL210ZDAvZmxhc2huYW1lCj4+Pj4g
dzI1cTY0ZHcKPj4+PiBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMTAxMDAwMC5zcGkv
c3BpX21hc3Rlci9zcGkxL3NwaTEuMC9tdGQvbXRkMC9pZAo+Pj4+IGVmNjAxNyAgCj4+Pgo+Pj4g
SSdtIG5vdCBzdXJlIEkgbGlrZSB0aGUgaWRlYSBvZiBleHBvc2luZyB0aGlzIGtpbmQgb2YgaW5m
byB0aHJvdWdoCj4+PiBzeXNmcyBhcyBpdCB0aGVuIG1ha2VzIHBhcnQgb2YgdGhlIEFCSS4gRGlk
IHlvdSBjb25zaWRlciBleHBvc2luZyB0aGF0Cj4+PiB0aHJvdWdoIGRlYnVnZnM/ICAKPj4KPj4g
WWVzLCBpIGRpZCBjb25zaWRlciB0aGUgZGVidWdmcy4gSSB0aGluayB0aGUgZGVidWdmcyBpcyBk
ZXBlbmRlZCBvbgo+PiBDT05GSUdfREVCVUdfRlMuCj4+IElmIHJlbW92aW5nIHRoYXQgY29uZmln
LCB0aGUgcGFydG5hbWUgYW5kIHBhcnRpZCB3aWxsIGJlIGxvc3QuIFNvLCBpCj4+IHByb3Bvc2Vk
IHRvIHVzZQo+PiBzeXNmcy4KPiAKPiBUaGVuIGp1c3QgZW5hYmxlIGRlYnVnZnMgaWYgeW91IG5l
ZWQgdGhpcyBpbmZvcm1hdGlvbiA6UC4KPiAKCkRvIHdlIHJlYWxseSBuZWVkIHRoaXMgaW5mbyBl
dmVuIGluIGRlYnVnIEZTPwpzcGktbm9yLmMgcHJpbnRzIGZvbGxvd2luZyB0byBrZXJuZWwgbG9n
IHdoaWNoIGNhbiBiZSBvYnRhaW5lZCBieSBkbWVzZzoKCiAgICAgICAgZGV2X2luZm8oZGV2LCAi
JXMgKCVsbGQgS2J5dGVzKVxuIiwgaW5mby0+bmFtZSwKICAgICAgICAgICAgICAgICAgICAgICAg
KGxvbmcgbG9uZyltdGQtPnNpemUgPj4gMTApOwoKWW91IGNvdWxkIHByb2JhYmx5IGV4cGFuZCB0
aGF0IHRvIHByaW50IGZsYXNoIElEcyBhcyB3ZWxsLgoKUmVnYXJkcwpWaWduZXNoCgo+Pgo+Pj4g
IAo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWmh1b2hhbyBMZWUgPHpodW9oYW9AY2hyb21pdW0u
b3JnPgo+Pj4+IC0tLQo+Pj4+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAgICAgICB8IDI0ICsr
KysrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3Iu
YyB8ICAzICsrKwo+Pj4+ICBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCAgICAgICB8ICAzICsrKwo+
Pj4+ICAzIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPj4+PiBp
bmRleCAzZWYwMWJhZWY5YjYuLmRjYmU2NzE5YWQ2NyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9tdGRjb3JlLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPj4+PiBAQCAt
MjQxLDYgKzI0MSwyOCBAQCBzdGF0aWMgc3NpemVfdCBtdGRfbmFtZV9zaG93KHN0cnVjdCBkZXZp
Y2UgKmRldiwKPj4+PiAgfQo+Pj4+ICBzdGF0aWMgREVWSUNFX0FUVFIobmFtZSwgU19JUlVHTywg
bXRkX25hbWVfc2hvdywgTlVMTCk7Cj4+Pj4KPj4+PiArc3RhdGljIHNzaXplX3QgbXRkX2ZsYXNo
bmFtZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPj4+PiArICAgICAgICAgICAgIHN0cnVjdCBk
ZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4+Pj4gK3sKPj4+PiArICAgICBzdHJ1
Y3QgbXRkX2luZm8gKm10ZCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+Pj4+ICsKPj4+PiArICAg
ICBpZiAoIW10ZC0+Zmxhc2huYW1lKQo+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+Pj4g
KyAgICAgcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJXNcbiIsIG10ZC0+Zmxhc2hu
YW1lKTsKPj4+PiArfQo+Pj4+ICtzdGF0aWMgREVWSUNFX0FUVFIoZmxhc2huYW1lLCBTX0lSVUdP
LCBtdGRfZmxhc2huYW1lX3Nob3csIE5VTEwpOyAgCj4+Pgo+Pj4gTVREIGFsc28gZGVhbHMgd2l0
aCB0aGluZ3MgdGhhdCBhcmUgbm90IGZsYXNoZXMgKFNSQU1zLCBST00sIC4uLikuIEhvdwo+Pj4g
YWJvdXQgcGFydG5hbWU/ICAKPj4KPj4gVGhhbmtzLCBpIHdpbGwgY2hhbmdlIHRoZSBuYW1lIHRv
IHBhcnRuYW1lLgo+Pgo+Pj4gIAo+Pj4+ICsKPj4+PiArc3RhdGljIHNzaXplX3QgbXRkX2lkX3No
b3coc3RydWN0IGRldmljZSAqZGV2LAo+Pj4+ICsgICAgICAgICAgICAgc3RydWN0IGRldmljZV9h
dHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKPj4+PiArewo+Pj4+ICsgICAgIHN0cnVjdCBtdGRf
aW5mbyAqbXRkID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+Pj4gKwo+Pj4+ICsgICAgIGlmICgh
bXRkLT5pZCkKPj4+PiArICAgICAgICAgICAgIHJldHVybiAwOwo+Pj4+ICsgICAgIHJldHVybiBz
bnByaW50ZihidWYsIFBBR0VfU0laRSwgIiUqcGhOXG4iLCBtdGQtPmlkX3NpemUsIG10ZC0+aWQp
OyAgCj4+Pgo+Pj4gSSdkIHJlY29tbWVuZCBtYWtpbmcgbXRkLT5pZCBhIHN0cmluZyBzbyB0aGF0
IGVhY2ggZmxhc2ggdHlwZSBjYW4KPj4+IGRlY2lkZSBvZiB0aGUgZm9ybWF0dGluZywgYW5kIG1h
eWJlIGhhdmUgYSBwcmVmaXggdGhhdCB0ZWxscyB3aGljaCBraW5kICAKPj4KPj4gb2ssIGkgd2ls
bCBjcmVhdGUgYW4gYXJyYXkgdG8gc3RvcmUgdGhlIGZvcm1hdHRlZCBwYXJ0aWQuCj4+Cj4+PiBv
ZiBJRCB0aGlzIGlzOiAic3BpLW5vcjp4eHh4eCIsICJuYW5kOnh4eHgiLCAic3BpLW5hbmQ6eHh4
eCIuICAKPj4KPj4gV2UgaGFkIGEgc3lzZnMgbm9kZSwgY2FsbGVkICd0eXBlJywgd2hpY2ggaW5k
aWNhdGVkIHRoZSB0eXBlIG9mIHRoZQo+PiB1bmRlcmx5aW5nIGRldmljZS4gV2UgY2FuIHF1ZXJ5
IHRoZSAndHlwZScgdG8gZ2V0IHRoZSBkZXZpY2UgdHlwZS4KPj4gSSB0aGluayBpdCBpcyBub3Qg
bmVjZXNzYXJ5IHRvIGFkZCBwcmVmaXguIFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IE5vLCB0aGUg
dHlwZSBpcyBub3QgcHJlY2lzZSBlbm91Z2gsIGEgTk9SIGNhbiBiZSBhIFNQSSBOT1Igb3IgYSBD
RkkgTk9SCj4gYW5kIHRoZXkgcHJvYmFibHkgZG9uJ3QgdXNlIHRoZSBzYW1lIElELXNjaGVtZS4g
U2FtZSBmb3IgTkFORHMgKHBhcmFsbGVsCj4gTkFORHMgdnMgU1BJIE5BTkRzKS4KPiAKPj4KPj4+
ICAKPj4+PiArfQo+Pj4+ICtzdGF0aWMgREVWSUNFX0FUVFIoaWQsIFNfSVJVR08sIG10ZF9pZF9z
aG93LCBOVUxMKTsgIAo+Pj4KPj4+IGlkIGlzIGJpdCB2YWd1ZSwgaG93IGFib3V0IHBhcnRpZC4g
IAo+Pgo+PiBBZ3JlZSwgaSB3aWxsIGNoYW5nZSB0aGlzLgo+IAo+IEkgdGhpbmsgeW91IHNob3Vs
ZCB3YWl0IGZvciBvdGhlciByZXZpZXdzIGJlZm9yZSB5b3Ugc2VuZGluZyBhIG5ldwo+IHZlcnNp
b24uIEknbSBzdGlsbCBub3QgY29udmluY2VkIGV4cG9zaW5nIHRoYXQgdGhyb3VnaCBzeXNmcyBp
cyBhIGdvb2QKPiBpZGVhLCBhbmQgSSdkIGxpa2Ugb3RoZXIgTVREIG1haW50YWluZXJzIHRvIGdp
dmUgdGhlaXIgb3BpbmlvbiBvbiB0aGlzCj4gYXNwZWN0Lgo+IAo+Pgo+Pj4gIAo+Pj4+ICsKPj4+
PiAgc3RhdGljIHNzaXplX3QgbXRkX2VjY19zdHJlbmd0aF9zaG93KHN0cnVjdCBkZXZpY2UgKmRl
diwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vf
YXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4+Pj4gIHsKPj4+PiBAQCAtMzQwLDYgKzM2Miw4
IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICptdGRfYXR0cnNbXSA9IHsKPj4+PiAgICAgICAm
ZGV2X2F0dHJfb29iYXZhaWwuYXR0ciwKPj4+PiAgICAgICAmZGV2X2F0dHJfbnVtZXJhc2VyZWdp
b25zLmF0dHIsCj4+Pj4gICAgICAgJmRldl9hdHRyX25hbWUuYXR0ciwKPj4+PiArICAgICAmZGV2
X2F0dHJfZmxhc2huYW1lLmF0dHIsCj4+Pj4gKyAgICAgJmRldl9hdHRyX2lkLmF0dHIsCj4+Pj4g
ICAgICAgJmRldl9hdHRyX2VjY19zdHJlbmd0aC5hdHRyLAo+Pj4+ICAgICAgICZkZXZfYXR0cl9l
Y2Nfc3RlcF9zaXplLmF0dHIsCj4+Pj4gICAgICAgJmRldl9hdHRyX2NvcnJlY3RlZF9iaXRzLmF0
dHIsCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPj4+PiBpbmRleCA2ZTEzYmJkMWFhYTUuLjBlMTA4
NThlNTMyYyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+
Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCj4+Pj4gQEAgLTQwMjcsNiAr
NDAyNyw5IEBAIGludCBzcGlfbm9yX3NjYW4oc3RydWN0IHNwaV9ub3IgKm5vciwgY29uc3QgY2hh
ciAqbmFtZSwKPj4+Pgo+Pj4+ICAgICAgIGlmICghbXRkLT5uYW1lKQo+Pj4+ICAgICAgICAgICAg
ICAgbXRkLT5uYW1lID0gZGV2X25hbWUoZGV2KTsKPj4+PiArICAgICBtdGQtPmZsYXNobmFtZSA9
IGluZm8tPm5hbWU7Cj4+Pj4gKyAgICAgbXRkLT5pZCA9IGluZm8tPmlkOwo+Pj4+ICsgICAgIG10
ZC0+aWRfc2l6ZSA9IGluZm8tPmlkX2xlbjsKPj4+PiAgICAgICBtdGQtPnByaXYgPSBub3I7Cj4+
Pj4gICAgICAgbXRkLT50eXBlID0gTVREX05PUkZMQVNIOwo+Pj4+ICAgICAgIG10ZC0+d3JpdGVz
aXplID0gMTsKPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvbXRkLmggYi9pbmNs
dWRlL2xpbnV4L210ZC9tdGQuaAo+Pj4+IGluZGV4IDY3Nzc2OGIyMWExZC4uMGE4MTU2OWZhNGY2
IDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCj4+Pj4gKysrIGIvaW5j
bHVkZS9saW51eC9tdGQvbXRkLmgKPj4+PiBAQCAtMjEwLDYgKzIxMCw5IEBAIHN0cnVjdCBtdGRf
aW5mbyB7Cj4+Pj4gICAgICAgdWludDMyX3QgZmxhZ3M7Cj4+Pj4gICAgICAgdWludDMyX3Qgb3Jp
Z19mbGFnczsgLyogRmxhZ3MgYXMgYmVmb3JlIHJ1bm5pbmcgbXRkIGNoZWNrcyAqLwo+Pj4+ICAg
ICAgIHVpbnQ2NF90IHNpemU7ICAgLy8gVG90YWwgc2l6ZSBvZiB0aGUgTVRECj4+Pj4gKyAgICAg
Y29uc3QgY2hhciAqZmxhc2huYW1lOyAvKiBUaGUgdW5kZXJseWluZyBmbGFzaCBuYW1lICovCj4+
Pj4gKyAgICAgY29uc3QgY2hhciAqaWQ7IC8qIFRoZSBJRCBvZiB0aGUgZmxhc2ggKi8KPj4+PiAr
ICAgICBpbnQgaWRfc2l6ZTsgLyogTnVtYmVyIG9mIGJ5dGVzIG9mIGlkIGFycmF5ICovCj4+Pj4K
Pj4+PiAgICAgICAvKiAiTWFqb3IiIGVyYXNlIHNpemUgZm9yIHRoZSBkZXZpY2UuIE5hw692ZSB1
c2VycyBtYXkgdGFrZSB0aGlzCj4+Pj4gICAgICAgICogdG8gYmUgdGhlIG9ubHkgZXJhc2Ugc2l6
ZSBhdmFpbGFibGUsIG9yIG1heSB1c2UgdGhlIG1vcmUgZGV0YWlsZWQgIAo+Pj4gIAo+IAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+IAoKLS0gClJlZ2FyZHMKVmlnbmVz
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
