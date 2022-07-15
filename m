Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E781FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 23:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlGPHUMr5jSd/e5WMphLPlUBUtxBicyq8uQFB/OTT9o=; b=IEYq5wVbF2qYbI
	1RHMxh0ujbkf3qm6xrBWBFe0kFX9+YiZ/KqDSsgysP2UiqQwF7VLF/1HG3enjtj1KxLcN182inu3G
	+Y03xOtjGaUGANQ3vGy1vvTRV1A0tdepOJhTQJ9/nI91XDPmEfxF1RpJ4ezLyGvM8QgYK5ywyMK6s
	tdh0An1tOItGo+ceZmsS1NWkoavbRyXc1y48600NevErf5B2xBEA7+QOfwKEJ2DUozw4keJv79dte
	ax+zwL6mLhirNZaAc63awc7AR+YrVR/oKFIJEaJjuQYN3q0z567U5o1AdG3fLNpuF2jlHtd/+Kytw
	hat6DcPTZWFD7ZuRmDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUkd-00BALB-0l; Fri, 15 Jul 2022 23:29:39 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUXI-00B3En-RN
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 23:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657926952; x=1689462952;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WXUsaMRz28YkxL2UeAKB2Sj+cOJis/PzsUxzi3i8ndg=;
  b=wB1yA28YxK06p0nL7yJiABaiKHliv1tVSx5el1rIbgZefnCVljxRLP5r
   p3NMXXsZKiBI9DTpNnvNnvueTym8C3DxefDeK/CGHOEyGNzppAHphdeAg
   hI7lmWZiImpp6Y2yJouU0UKiNYR+N2u2/cCRGrqIUgF87MdLeW8tMHKsq
   0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jul 2022 16:15:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 16:15:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 16:15:51 -0700
Received: from [10.110.97.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 16:15:50 -0700
Message-ID: <2e0f02f3-0e0e-8690-a58e-bb74a21ab63e@quicinc.com>
Date: Fri, 15 Jul 2022 16:15:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: <clg@kaod.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
	<quic_ggregory@quicinc.com>, <quic_jiles@quicinc.com>,
	<tudor.ambarus@microchip.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
 <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
 <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
 <c628e868-5c73-ca4b-1f99-60cc149806bf@quicinc.com>
 <b00410c825486ec406ed1ae773b11792@walle.cc>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <b00410c825486ec406ed1ae773b11792@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_161552_948379_A26430C7 
X-CRM114-Status: GOOD (  31.82  )
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

SGksCgpPbiA3LzE1LzIwMjIgNDowMyBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAK
PiBBbSAyMDIyLTA3LTE2IDAwOjM1LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPj4gT24gNy8xNS8y
MDIyIDE6MTUgUE0sIEphZSBIeXVuIFlvbyB3cm90ZToKPj4+IE9uIDcvMTQvMjAyMiA3OjMwIEFN
LCBKYWUgSHl1biBZb28gd3JvdGU6Cj4+Pj4gT24gNy8xNC8yMDIyIDc6MjEgQU0sIE1pY2hhZWwg
V2FsbGUgd3JvdGU6Cj4+Pj4+IEFtIDIwMjItMDctMTQgMTY6MTYsIHNjaHJpZWIgTWljaGFlbCBX
YWxsZToKPj4+Pj4+IEFtIDIwMjItMDctMTQgMTU6NDcsIHNjaHJpZWIgSmFlIEh5dW4gWW9vOgo+
Pj4+Pj4+IE9uIDcvMTQvMjAyMiAxMjo0MSBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+Pj4+
Pj4gV2hhdCBkb2VzICJkb2Vzbid0IGJvb3QgYXQgYWxsIiBtZWFuPyBBcmUgdGhlcmUgYW55IGtl
cm5lbCBzdGFydHVwCj4+Pj4+Pj4+IG1lc3NhZ2VzPwo+Pj4+Pj4+Cj4+Pj4+Pj4gSSdtIHNoYXJp
bmcgdGhlIGVycm9yIG1lc3NhZ2VzIGJlbG93Lgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcy4KPj4+Pj4+
Cj4+Pj4+Pj4gW8KgwqDCoCAwLjc0ODU5NF0gc3BpLW5vciBzcGkwLjA6IHcyNXE1MTJud3EgKDY1
NTM2IEtieXRlcykKPj4+Pj4+PiBbwqDCoMKgIDAuODY1MjE2XSBzcGktYXNwZWVkLXNtYyAxZTYy
MDAwMC5zcGk6IENFMCByZWFkIGJ1c3dpZHRoOjQgCj4+Pj4+Pj4gWzB4NDA2YzA3NDFdCj4+Pj4+
Pj4gW8KgwqDCoCAwLjg3MjgzM10gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
Cj4+Pj4+Pj4gW8KgwqDCoCAwLjg3Nzk4NF0gV0FSTklORzogQ1BVOiAxIFBJRDogMSBhdCBkcml2
ZXJzL210ZC9tdGRjb3JlLmM6NTgzCj4+Pj4+Pj4gYWRkX210ZF9kZXZpY2UrMHgyOGMvMHg1M2MK
Pj4+Pj4+PiBbwqDCoMKgIDAuODg3MjM3XSBDUFU6IDEgUElEOiAxIENvbW06IHN3YXBwZXIvMCBO
b3QgdGFpbnRlZAo+Pj4+Pj4+IDUuMTUuNDMtQVVUT0lOQy1kaXJ0eS0yMzgwMWE2ICMxCj4+Pj4+
Pgo+Pj4+Pj4gQ291bGQgeW91IHBsZWFzZSB0cnkgaXQgb24gdGhlIGxhdGVzdCAodmFuaWxsYSkg
bGludXgtbmV4dD8KPj4+Pj4KPj4+Pj4gb3Igc3BpLW5vci9uZXh0IFsxXSBhcyB0aGVyZSBhcmUg
cXVpdGUgYSBsb3Qgb2YgY2hhbmdlcy4gVGhlCj4+Pj4+IHBhdGNoZXMgc2hhbGwgYmUgYmFzZWQg
b24gdGhhdC4KPj4+Pgo+Pj4+IE9rYXkuIExldCBtZSB0cnkgdGhhdC4gSSB0ZXN0ZWQgaXQgdXNp
bmcgNS4xNS40MyB3aXRoIGJhY2stcG9ydGVkCj4+Pj4gc3BpLW5vciBwYXRjaGVzIGZyb20gdGhl
IGxhdGVzdC4gSSdsbCBiYWNrLXBvcnQgbW9yZSBjaGFuZ2VzIGZyb20KPj4+PiB0aGUgc3BpLW5v
ci9uZXh0IGFuZCB3aWxsIHRlc3QgdGhlIElORk8oMHhlZjYwMjAsIDAsIDAsIDApIHNldHRpbmcK
Pj4+PiBhZ2Fpbi4KPj4+Cj4+PiBJIHRlc3RlZCB0aGUgc2V0dGluZyBhZ2FpbiBhZnRlciBjaGVy
cnkgcGlja2luZyBhbGwgU1BJIHJlbGF0aW5nIGNoYW5nZXMKPj4+IGZyb20gdGhlICdmb3ItbmV4
dCcgYnJhbmNoIG9mCj4+PiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvYnJvb25pZS9zcGkgcmVwb3NpdG9yeS4KPj4+Cj4+PiBObyBsdWNrISBJdCdzIHN0aWxs
IG1ha2luZyB0aGUgc2FtZSB3YXJuaW5nIGR1bXAgYXQgJ2FkZF9tdGRfZGV2aWNlJwo+Pj4gc2lu
Y2UgJ210ZC0+ZXJhc2VzaXplJyBpcyBjaGVja2VkIGFzIDAuCj4+Pgo+Pj4gSSB0cmFjZWQgaXQg
ZnVydGhlciB0byBjaGVjayBpZiB0aGUgZXJhc2VzaXplIGlzIHByb3Blcmx5IHBhcnNlZCBmcm9t
Cj4+PiB0aGUgc2ZkcCBhbmQgY2hlY2tlZCB0aGF0IGVyYXNlIG1hcCBzZWVtcyBwYXJzZWQgYW5k
IGluaXRpYWxpemVkCj4+PiBjb3JyZWN0bHkgaW4gJ3NwaV9ub3JfcGFyc2VfYmZwdCcgYnV0IHBy
b2JsZW0gaXMsIGEgdGFyZ2V0Cj4+PiBtdGQtPmVyYXNlc2l6ZSBpcyBub3QgcHJvcGVybHkgc2Vs
ZWN0ZWQgaW4gJ3NwaV9ub3Jfc2VsZWN0X2VyYXNlJyBzaW5jZQo+Pj4gdGhlICd3YW50ZWRfc2l6
ZScgdmFyaWFibGUgaXMgaW5pdGlhbGl6ZWQgYXMgc2VjdG9yIHNpemUgb2YgaW5mbyB0YWJsZQo+
Pj4gc28gYSBzZWxlY3RlZCB0YXJnZXQgbXRkLT5lcmFzZXNpemUgaXMgYWxzbyAwIHNvIGxvb2tz
IGxpa2UgaXQncyB0aGUKPj4+IHJlYXNvbiB3aHkgaXQgY2FuJ3QgaW5pdGlhbGl6ZSBtdGQgZGV2
aWNlIGlmIHdlIHVzZQo+Pj4gSU5GTygweGVmNjAyMCwgMCwgMCwgMCkuCj4+Pgo+Pj4gQWxzbywg
Y2hlY2tlZCB0aGF0IHRoZSBtdGQtPmVyYXNlc2l6ZSBpcyBzZXQgdG8gNDA5NiBpZiBJIGVuYWJs
ZQo+Pj4gQ09ORklHX01URF9TUElfTk9SX1VTRV80S19TRUNUT1JTIHNvIHRoZSBTUEkgZmxhc2gg
Y2FuIGJlIGluaXRpYWxpemVkIAo+Pj4gd2l0aCB0aGUgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkg
c2V0dGluZyBidXQsIGl0IHNob3VsZCBjb3ZlciBldmVuIHdoZW4KPj4+IHRoZSBjb25maWd1cmF0
aW9uIGlzIG5vdCBlbmFibGVkLiBJIHRoaW5rLCB0aGlzIHBhdGNoIHNob3VsZCBnbyBhcyBpdAo+
Pj4gaXMuIFRoZSBlcmFzZXNpemUgc2VsZWN0aW5nIGlzc3VlIGNvdWxkIGJlIGZpeGVkIHVzaW5n
IGEgc2VwYXJhdGUKPj4+IHBhdGNoLgo+Pj4KPj4+IEFyZSB5b3Ugc3RpbGwgc3VyZSB0aGF0IHRo
ZSBJTkZPKDB4ZWY2MDIwLCAwLCAwLCAwKSB3b3JrcyBpbiB0aGUKPj4+IGxhdGVzdCBzcGktbmV4
dD8KPj4KPj4gSSBhbHNvIHRyaWVkIHRvIGZpeCB0aGUgaXNzdWUgYW5kIG1hZGUgYSBmaXggbGlr
ZSBiZWxvdy4KPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gaW5kZXggNTAyOTY3Yzc2YzVmLi5mOGEwMjBm
ODBhNTYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+ICsrKyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+IEBAIC0yMTE3LDcgKzIxMTcsNyBAQCBzcGlf
bm9yX3NlbGVjdF91bmlmb3JtX2VyYXNlKHN0cnVjdAo+PiBzcGlfbm9yX2VyYXNlX21hcCAqbWFw
LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIElmIHRoZSBjdXJyZW50IGVy
YXNlIHNpemUgaXMgdGhlIG9uZSwgc3RvcCBoZXJlOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIHdlIGhhdmUgZm91bmQgdGhlIHJpZ2h0IHVuaWZvcm0gU2VjdG9yIEVyYXNl
IGNvbW1hbmQuCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0ZXN0ZWRfZXJhc2UtPnNpemUgPT0gd2FudGVk
X3NpemUpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHdhbnRlZF9zaXpl
ICYmIHRlc3RlZF9lcmFzZS0+c2l6ZSA9PSB3YW50ZWRfc2l6ZSkgewo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyYXNlID0gdGVzdGVkX2VyYXNlOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pgo+PiBUZXN0ZWQgdGhhdCBpdCBt
YWtlcyB0aGUgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkgc2V0dGluZyB3b3JrIGFuZCBhCj4+IHNl
bGVjdGVkIG10ZC0+ZXJhc2VzaXplIGlzIDY1NTM2IHdoaWNoIGlzIHdoYXQgSSBleHBlY3RlZCBm
b3IgdGhpcwo+PiBkZXZpY2UuCj4+Cj4+IE5vdCBzdXJlIGlmIGl0J3MgYSByaWdodCBmaXggb3Ig
bm90LiBQbGVhc2UgcmV2aWV3IGFuZCBsZXQgbWUga25vdyBpZgo+PiBpdCdzIGdvb2QgdG8gc3Vi
bWl0IG9yIG5vdC4KPiAKPiBBaGgsIEkgdGhpbmsgSSBrbm93IHdoYXRzIGdvaW5nIHdyb25nIGhl
cmUuIFRoYW5rcyEKPiAKPiA0YmFpdCB3aWxsIHNldCB0aGUgZXJhc2Ugc2l6ZSB0byAwIGlmIHRo
ZXJlIGlzIG5vIGNvcnJlc3BvbmRpbmcKPiBvcGNvZGUgZm9yIHRoZSA0Ynl0ZSBlcmFzZS4gU28g
eW91J2xsIGVuZCB1cCB3aXRoCj4gZXRbMF06IDQwOTYgLSAyMWgKPiBldFsxXTogMCAtIEZGaAo+
IGV0WzJdOiA2NTUzNiAtIERDaAo+IGV0WzNdOiAtLQo+IAo+IEFuZCBzcGlfbm9yX3NlbGVjdF91
bmlmb3JtX2VyYXNlKCkgd2lsbCBzZWxlY3QgZXRbMV0uCj4gCj4gQ291bGQgeW91IHRyeSB0aGUg
Zm9sbG93aW5nOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5kZXggY2U1ZDY5MzE3ZDQ2Li5hMmM4ZGUy
NTBlMDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC0yMTEzLDYgKzIxMTMsMTAgQEAgc3BpX25v
cl9zZWxlY3RfdW5pZm9ybV9lcmFzZShzdHJ1Y3QgCj4gc3BpX25vcl9lcmFzZV9tYXAgKm1hcCwK
PiAKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlc3RlZF9lcmFzZSA9ICZtYXAt
PmVyYXNlX3R5cGVbaV07Cj4gCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogU2tp
cCBtYXNrZWQgZXJhc2UgdHlwZXMuICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKCF0ZXN0ZWRfZXJhc2UtPnNpemUpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwoKWWVzLCBpdCBhbHNvIHdvcmtzLiBEbyB5b3Ugd2Fu
dCBtZSB0byB1cGRhdGUgdGhpcyBwYXRjaCB3aXRoIGFkZGluZyB0aGlzCmZpeD8gT3IgaXMgaXQg
Z29vZCB0byBnbyBhcyBpcyBzbyB0aGF0IHRoZSBJTkZPIHRhYmxlIGNhbiBiZSByZXBsYWNlZAp3
aXRoIFNOT1JfSUQzIGxhdGVyIGFmdGVyIHRoZSBmaXggaXMgbWVyZ2VkPwoKVGhhbmtzLApKYWUK
Cj4gKwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBJZiB0aGUgY3VycmVudCBlcmFzZSBzaXplIGlzIHRoZSBv
bmUsIHN0b3AgaGVyZToKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB3ZSBo
YXZlIGZvdW5kIHRoZSByaWdodCB1bmlmb3JtIFNlY3RvciBFcmFzZSBjb21tYW5kLgo+IAo+IAo+
IC1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
