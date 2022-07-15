Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBDBC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcWh4uLVP+6pJKP2Hz3VG4uIwxVHUhaimhodD8fGBY0=; b=aisqXq/uMb2Lo3
	xQfT2bNNtVHpfHB52s/5nfgMSraSD5ZoiLvOOcZUx+NonVeAiqpyrb5Vb3/eB7N97Lvvqi8imrs7Z
	VcBfppYQ4DWo4er/1BtOmHzwVH3ckfvdSPIKMvzKJNeS3r20COO3o/EEwBZgOb22DtJWjXzSpdQLu
	bG2Pq4rfMs1l/pMqx4zBsORIGyUjIJu5acpw6bB23MeBhPIzv2rEl49jYgQkhHFgJTMTy/Elof0fZ
	hI6fsgkNL6DFfVmBOnrqhkYc864QXiX9rnhVXfjXYn1GmHJRT2Xc1VnKCfhv5HC7uiIBhtLGmU3ZI
	7VDGj5a1TBRDPh6FE9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUZO-00B47S-70; Fri, 15 Jul 2022 23:18:02 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCTuA-00AoHz-8Y
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 22:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657924526; x=1689460526;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=Z0oFswyC/YbNkGH8IOxwbYw/Sv54sKTTQJpfl46exPo=;
  b=oPuq9ppUhuoqs3C6vR/prqkd22hO82odOxe3qBIm2LBNJ/o/dJ1SRFkU
   SUarsp49DxafVQogM9MsmpI48EeLxIIPEyNpDQT0ZUPQU4B960JYG8ezM
   LSdTAW+12eI6JCgGv3v6kwnBP/EvPr+smIc8s63Jduf84izOL3z8lESUf
   Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jul 2022 15:35:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 15:35:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 15:35:22 -0700
Received: from [10.110.97.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 15:35:20 -0700
Message-ID: <c628e868-5c73-ca4b-1f99-60cc149806bf@quicinc.com>
Date: Fri, 15 Jul 2022 15:35:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
In-Reply-To: <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_153526_373004_869F883F 
X-CRM114-Status: GOOD (  28.07  )
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

SGkgTWljaGFlbCwKCk9uIDcvMTUvMjAyMiAxOjE1IFBNLCBKYWUgSHl1biBZb28gd3JvdGU6Cj4g
SGkgTWljaGFlbCwKPiAKPiBPbiA3LzE0LzIwMjIgNzozMCBBTSwgSmFlIEh5dW4gWW9vIHdyb3Rl
Ogo+PiBPbiA3LzE0LzIwMjIgNzoyMSBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIw
MjItMDctMTQgMTY6MTYsIHNjaHJpZWIgTWljaGFlbCBXYWxsZToKPj4+PiBBbSAyMDIyLTA3LTE0
IDE1OjQ3LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPj4+Pj4gT24gNy8xNC8yMDIyIDEyOjQxIEFN
LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4+Pj4gV2hhdCBkb2VzICJkb2Vzbid0IGJvb3QgYXQg
YWxsIiBtZWFuPyBBcmUgdGhlcmUgYW55IGtlcm5lbCBzdGFydHVwCj4+Pj4+PiBtZXNzYWdlcz8K
Pj4+Pj4KPj4+Pj4gSSdtIHNoYXJpbmcgdGhlIGVycm9yIG1lc3NhZ2VzIGJlbG93Lgo+Pj4+Cj4+
Pj4gVGhhbmtzLgo+Pj4+Cj4+Pj4+IFvCoMKgwqAgMC43NDg1OTRdIHNwaS1ub3Igc3BpMC4wOiB3
MjVxNTEybndxICg2NTUzNiBLYnl0ZXMpCj4+Pj4+IFvCoMKgwqAgMC44NjUyMTZdIHNwaS1hc3Bl
ZWQtc21jIDFlNjIwMDAwLnNwaTogQ0UwIHJlYWQgYnVzd2lkdGg6NCAKPj4+Pj4gWzB4NDA2YzA3
NDFdCj4+Pj4+IFvCoMKgwqAgMC44NzI4MzNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQo+Pj4+PiBbwqDCoMKgIDAuODc3OTg0XSBXQVJOSU5HOiBDUFU6IDEgUElEOiAxIGF0
IGRyaXZlcnMvbXRkL210ZGNvcmUuYzo1ODMKPj4+Pj4gYWRkX210ZF9kZXZpY2UrMHgyOGMvMHg1
M2MKPj4+Pj4gW8KgwqDCoCAwLjg4NzIzN10gQ1BVOiAxIFBJRDogMSBDb21tOiBzd2FwcGVyLzAg
Tm90IHRhaW50ZWQKPj4+Pj4gNS4xNS40My1BVVRPSU5DLWRpcnR5LTIzODAxYTYgIzEKPj4+Pgo+
Pj4+IENvdWxkIHlvdSBwbGVhc2UgdHJ5IGl0IG9uIHRoZSBsYXRlc3QgKHZhbmlsbGEpIGxpbnV4
LW5leHQ/Cj4+Pgo+Pj4gb3Igc3BpLW5vci9uZXh0IFsxXSBhcyB0aGVyZSBhcmUgcXVpdGUgYSBs
b3Qgb2YgY2hhbmdlcy4gVGhlCj4+PiBwYXRjaGVzIHNoYWxsIGJlIGJhc2VkIG9uIHRoYXQuCj4+
Cj4+IE9rYXkuIExldCBtZSB0cnkgdGhhdC4gSSB0ZXN0ZWQgaXQgdXNpbmcgNS4xNS40MyB3aXRo
IGJhY2stcG9ydGVkCj4+IHNwaS1ub3IgcGF0Y2hlcyBmcm9tIHRoZSBsYXRlc3QuIEknbGwgYmFj
ay1wb3J0IG1vcmUgY2hhbmdlcyBmcm9tCj4+IHRoZSBzcGktbm9yL25leHQgYW5kIHdpbGwgdGVz
dCB0aGUgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkgc2V0dGluZwo+PiBhZ2Fpbi4KPiAKPiBJIHRl
c3RlZCB0aGUgc2V0dGluZyBhZ2FpbiBhZnRlciBjaGVycnkgcGlja2luZyBhbGwgU1BJIHJlbGF0
aW5nIGNoYW5nZXMKPiBmcm9tIHRoZSAnZm9yLW5leHQnIGJyYW5jaCBvZgo+IGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaSByZXBvc2l0b3J5
Lgo+IAo+IE5vIGx1Y2shIEl0J3Mgc3RpbGwgbWFraW5nIHRoZSBzYW1lIHdhcm5pbmcgZHVtcCBh
dCAnYWRkX210ZF9kZXZpY2UnCj4gc2luY2UgJ210ZC0+ZXJhc2VzaXplJyBpcyBjaGVja2VkIGFz
IDAuCj4gCj4gSSB0cmFjZWQgaXQgZnVydGhlciB0byBjaGVjayBpZiB0aGUgZXJhc2VzaXplIGlz
IHByb3Blcmx5IHBhcnNlZCBmcm9tCj4gdGhlIHNmZHAgYW5kIGNoZWNrZWQgdGhhdCBlcmFzZSBt
YXAgc2VlbXMgcGFyc2VkIGFuZCBpbml0aWFsaXplZAo+IGNvcnJlY3RseSBpbiAnc3BpX25vcl9w
YXJzZV9iZnB0JyBidXQgcHJvYmxlbSBpcywgYSB0YXJnZXQKPiBtdGQtPmVyYXNlc2l6ZSBpcyBu
b3QgcHJvcGVybHkgc2VsZWN0ZWQgaW4gJ3NwaV9ub3Jfc2VsZWN0X2VyYXNlJyBzaW5jZQo+IHRo
ZSAnd2FudGVkX3NpemUnIHZhcmlhYmxlIGlzIGluaXRpYWxpemVkIGFzIHNlY3RvciBzaXplIG9m
IGluZm8gdGFibGUKPiBzbyBhIHNlbGVjdGVkIHRhcmdldCBtdGQtPmVyYXNlc2l6ZSBpcyBhbHNv
IDAgc28gbG9va3MgbGlrZSBpdCdzIHRoZQo+IHJlYXNvbiB3aHkgaXQgY2FuJ3QgaW5pdGlhbGl6
ZSBtdGQgZGV2aWNlIGlmIHdlIHVzZQo+IElORk8oMHhlZjYwMjAsIDAsIDAsIDApLgo+IAo+IEFs
c28sIGNoZWNrZWQgdGhhdCB0aGUgbXRkLT5lcmFzZXNpemUgaXMgc2V0IHRvIDQwOTYgaWYgSSBl
bmFibGUKPiBDT05GSUdfTVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RPUlMgc28gdGhlIFNQSSBmbGFz
aCBjYW4gYmUgaW5pdGlhbGl6ZWQgCj4gd2l0aCB0aGUgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkg
c2V0dGluZyBidXQsIGl0IHNob3VsZCBjb3ZlciBldmVuIHdoZW4KPiB0aGUgY29uZmlndXJhdGlv
biBpcyBub3QgZW5hYmxlZC4gSSB0aGluaywgdGhpcyBwYXRjaCBzaG91bGQgZ28gYXMgaXQKPiBp
cy4gVGhlIGVyYXNlc2l6ZSBzZWxlY3RpbmcgaXNzdWUgY291bGQgYmUgZml4ZWQgdXNpbmcgYSBz
ZXBhcmF0ZQo+IHBhdGNoLgo+IAo+IEFyZSB5b3Ugc3RpbGwgc3VyZSB0aGF0IHRoZSBJTkZPKDB4
ZWY2MDIwLCAwLCAwLCAwKSB3b3JrcyBpbiB0aGUKPiBsYXRlc3Qgc3BpLW5leHQ/CgpJIGFsc28g
dHJpZWQgdG8gZml4IHRoZSBpc3N1ZSBhbmQgbWFkZSBhIGZpeCBsaWtlIGJlbG93LgoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMKaW5kZXggNTAyOTY3Yzc2YzVmLi5mOGEwMjBmODBhNTYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCkBA
IC0yMTE3LDcgKzIxMTcsNyBAQCBzcGlfbm9yX3NlbGVjdF91bmlmb3JtX2VyYXNlKHN0cnVjdCAK
c3BpX25vcl9lcmFzZV9tYXAgKm1hcCwKICAgICAgICAgICAgICAgICAgKiBJZiB0aGUgY3VycmVu
dCBlcmFzZSBzaXplIGlzIHRoZSBvbmUsIHN0b3AgaGVyZToKICAgICAgICAgICAgICAgICAgKiB3
ZSBoYXZlIGZvdW5kIHRoZSByaWdodCB1bmlmb3JtIFNlY3RvciBFcmFzZSBjb21tYW5kLgogICAg
ICAgICAgICAgICAgICAqLwotICAgICAgICAgICAgICAgaWYgKHRlc3RlZF9lcmFzZS0+c2l6ZSA9
PSB3YW50ZWRfc2l6ZSkgeworICAgICAgICAgICAgICAgaWYgKHdhbnRlZF9zaXplICYmIHRlc3Rl
ZF9lcmFzZS0+c2l6ZSA9PSB3YW50ZWRfc2l6ZSkgewogICAgICAgICAgICAgICAgICAgICAgICAg
ZXJhc2UgPSB0ZXN0ZWRfZXJhc2U7CiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKICAg
ICAgICAgICAgICAgICB9CgpUZXN0ZWQgdGhhdCBpdCBtYWtlcyB0aGUgSU5GTygweGVmNjAyMCwg
MCwgMCwgMCkgc2V0dGluZyB3b3JrIGFuZCBhCnNlbGVjdGVkIG10ZC0+ZXJhc2VzaXplIGlzIDY1
NTM2IHdoaWNoIGlzIHdoYXQgSSBleHBlY3RlZCBmb3IgdGhpcwpkZXZpY2UuCgpOb3Qgc3VyZSBp
ZiBpdCdzIGEgcmlnaHQgZml4IG9yIG5vdC4gUGxlYXNlIHJldmlldyBhbmQgbGV0IG1lIGtub3cg
aWYKaXQncyBnb29kIHRvIHN1Ym1pdCBvciBub3QuCgpUaGFua3MsCgpKYWUKCj4gVGhhbmtzLAo+
IAo+IEphZQo+IAo+PiAtSmFlCj4+Cj4+PiAtbWljaGFlbAo+Pj4KPj4+IFsxXSAKPj4+IGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0I3Nw
aS1ub3IvbmV4dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
