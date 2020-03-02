Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D662CC3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D85246B9
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/WeOjjv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D85246B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DbjYWJwWwRbaEuNZWncWt1h4byYU96F/MMN38d1OE3Q=; b=P/WeOjjvfmXIaGWusxzD4d4m7
	5cnqyJplisjfltuctI7dfXBqaf1xuLzYzMlnxP271GRHTNTes8umhvEHKyJTmm2gP0o1lBO/FxeIm
	WfBOWs0+4SqfMqq4yk68bK8uRPqZvK84JRLof4gMpiAcI28zH+iGOtaaT6HoAWLBk48bwhxWux/PX
	hg4Lj7E2Ne6Ha3O2V5WYdKSehyqbUqu6JIR6FZeB0IMO1GVgD497P9k5oJ5NGuCEKpieNkc9nKyMP
	cxmLwCsMV/yAJcsZK+2XiehzwYM8jSyLYPSQAkbYHLLTJm2U8GAUfeu89cCP8k+L/C0WqOxAZpqtZ
	jXFwwss5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hP1-0007Jv-5V; Mon, 02 Mar 2020 09:30:19 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hOx-0007Bv-LH
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 09:30:17 +0000
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id D8351E6D818B170870C1;
 Mon,  2 Mar 2020 09:30:09 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 2 Mar 2020 09:30:09 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Mar 2020
 09:30:09 +0000
Subject: Re: [PATCH RFC 1/3] spi: Allow SPI controller override device buswidth
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, <broonie@kernel.org>
References: <1582903131-160033-1-git-send-email-john.garry@huawei.com>
 <1582903131-160033-2-git-send-email-john.garry@huawei.com>
 <52ecb988-d842-c04b-a0e8-93e8850009c4@cogentembedded.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <07bb2213-5543-0ef0-9585-be83026c1199@huawei.com>
Date: Mon, 2 Mar 2020 09:30:08 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <52ecb988-d842-c04b-a0e8-93e8850009c4@cogentembedded.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_013015_855489_2484542E 
X-CRM114-Status: GOOD (  16.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-spi@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDEvMDMvMjAyMCAxMDowNCwgU2VyZ2VpIFNodHlseW92IHdyb3RlOgo+IEhlbGxvIQo+IAoK
SGkgU2VyZ2VpLAoKPiBPbiAyOC4wMi4yMDIwIDE4OjE4LCBKb2huIEdhcnJ5IHdyb3RlOgo+IAo+
PiBDdXJyZW50bHkgQUNQSSBmaXJtd2FyZSBkZXNjcmlwdGlvbiBmb3IgYSBTUEkgZGV2aWNlIGRv
ZXMgbm90IGhhdmUgYW55Cj4+IG1ldGhvZCB0byBkZXNjcmliZSB0aGUgZGF0YSBidXN3aWR0aCBv
biB0aGUgYm9hcmQuCj4+Cj4+IFNvIGV2ZW4gdGhyb3VnaCB0aGUgY29udHJvbGxlciBhbmQgZGV2
aWNlIG1heSBzdXBwb3J0IGhpZ2hlciBtb2RlcyB0aGFuCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBe
Xl5eXl5eCj4gIMKgwqAgVGhvdWdoPwo+IAoKcmlnaHQKCj4+IHN0YW5kYXJkIFNQSSwgaXQgY2Fu
bm90IGJlIGFzc3VtZWQgdGhhdCB0aGUgYm9hcmQgZG9lcyAtIGFzIHN1Y2gsIHRoYXQKPj4gZGV2
aWNlIGlzIGxpbWl0ZWQgdG8gc3RhbmRhcmQgU1BJIGluIHN1Y2ggYSBjaXJjdW1zdGFuY2UuCj4+
Cj4+IEFzIGEgd29ya2Fyb3VuZCwgYWxsb3cgdGhlIGNvbnRyb2xsZXIgZHJpdmVyIHN1cHBseSBi
dXN3aWR0aCBvdmVycmlkZSAKPj4gYml0cywKPj4gd2hpY2ggYXJlIHVzZWQgaW5mb3JtIHRoZSBj
b3JlIGNvZGUgdGhhdCB0aGUgY29udHJvbGxlciBkcml2ZXIga25vd3MgdGhlCj4+IGJ1c3dpZHRo
IHN1cHBvcnRlZCBvbiB0aGF0IGJvYXJkIGZvciB0aGF0IGRldmljZS4KPj4KPj4gQSBob3N0IGNv
bnRyb2xsZXIgZHJpdmVyIG1pZ2h0IGtub3cgdGhpcyBpbmZvIGZyb20gRE1JIHRhYmxlcywgZm9y
IAo+PiBleGFtcGxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEdhcnJ5IDxqb2huLmdhcnJ5
QGh1YXdlaS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3NwaS9zcGkuY8KgwqDCoMKgwqDCoCB8
IDQgKysrLQo+PiDCoCBpbmNsdWRlL2xpbnV4L3NwaS9zcGkuaCB8IDMgKysrCj4+IMKgIDIgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NwaS9zcGkuYyBiL2RyaXZlcnMvc3BpL3NwaS5jCj4+IGluZGV4IDM4YjRj
NzhkZjUwNi4uMjkyZjI2ODA3YjQxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGkuYwo+
PiArKysgYi9kcml2ZXJzL3NwaS9zcGkuYwo+PiBAQCAtNTEwLDYgKzUxMCw3IEBAIHN0cnVjdCBz
cGlfZGV2aWNlICpzcGlfYWxsb2NfZGV2aWNlKHN0cnVjdCAKPj4gc3BpX2NvbnRyb2xsZXIgKmN0
bHIpCj4+IMKgwqDCoMKgwqAgc3BpLT5kZXYuYnVzID0gJnNwaV9idXNfdHlwZTsKPj4gwqDCoMKg
wqDCoCBzcGktPmRldi5yZWxlYXNlID0gc3BpZGV2X3JlbGVhc2U7Cj4+IMKgwqDCoMKgwqAgc3Bp
LT5jc19ncGlvID0gLUVOT0VOVDsKPj4gK8KgwqDCoCBzcGktPm1vZGUgPSBjdGxyLT5idXN3aWR0
aF9vdmVycmlkZV9iaXRzOwo+PiDCoMKgwqDCoMKgIHNwaW5fbG9ja19pbml0KCZzcGktPnN0YXRp
c3RpY3MubG9jayk7Cj4+IEBAIC0yMTgxLDkgKzIxODIsMTAgQEAgc3RhdGljIGFjcGlfc3RhdHVz
IAo+PiBhY3BpX3JlZ2lzdGVyX3NwaV9kZXZpY2Uoc3RydWN0IHNwaV9jb250cm9sbGVyICpjdGxy
LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEFFX05PX01FTU9SWTsKPj4gwqDCoMKgwqDC
oCB9Cj4+ICsKPiAKPiAgwqDCoCBXaGF0IGZvcj8KCnNsaXBwZWQgdGhyb3VnaCB0aGUgbmV0Cgo+
IAo+PiDCoMKgwqDCoMKgIEFDUElfQ09NUEFOSU9OX1NFVCgmc3BpLT5kZXYsIGFkZXYpOwo+PiDC
oMKgwqDCoMKgIHNwaS0+bWF4X3NwZWVkX2h6wqDCoMKgID0gbG9va3VwLm1heF9zcGVlZF9oejsK
Pj4gLcKgwqDCoCBzcGktPm1vZGXCoMKgwqDCoMKgwqDCoCA9IGxvb2t1cC5tb2RlOwo+PiArwqDC
oMKgIHNwaS0+bW9kZcKgwqDCoMKgwqDCoMKgIHw9IGxvb2t1cC5tb2RlOwo+PiDCoMKgwqDCoMKg
IHNwaS0+aXJxwqDCoMKgwqDCoMKgwqAgPSBsb29rdXAuaXJxOwo+PiDCoMKgwqDCoMKgIHNwaS0+
Yml0c19wZXJfd29yZMKgwqDCoCA9IGxvb2t1cC5iaXRzX3Blcl93b3JkOwo+PiDCoMKgwqDCoMKg
IHNwaS0+Y2hpcF9zZWxlY3TCoMKgwqAgPSBsb29rdXAuY2hpcF9zZWxlY3Q7Cj4gWy4uLl0KClRC
SCwgSSBkaWQgbm90IHRoaW5rIHRoYXQgdGhpcyBzZXJpZXMgd291bGQgYmUgYXBwbGllZCBzaW5j
ZSBJIHRhZ2dlZCBpdCAKYXMgUkZDLCBoZW5jZSB0aGUgdHlwb3Mgd2hpY2ggd291bGQgaGF2ZSBi
ZWVuIGNhdWdodC4gSW5kZWVkLCB0aGlzIGFsc28gCmV4cG9zZXMgYW4gaXNzdWUgd2l0aCBlbmFi
bGluZyBxdWFkIFNQSSBmb3IgYSBzcGFuc2lvbiBTUEkgTk9SIHBhcnQsIAp3aGljaCBJIG5lZWQg
dG8gZGVidWcgbm93IGluIHRoZSBTUEkgTk9SIGRyaXZlci4KCkhpIE1hcmssCgpEbyB5b3Ugd2Fu
dCBtZSB0byBkbyBhbnl0aGluZyBhYm91dCB0aGUgYWJvdmUgc3VwZXJmbHVvdXMgbmV3bGluZT8K
ClRoYW5rcywKSm9obgoKPiAKPiBNQlIsIFNlcmdlaQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo+IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
