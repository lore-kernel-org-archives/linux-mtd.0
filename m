Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7D2C47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4AD60FEE
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4AD60FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YMgt1YXo1Dx/7l4Las2b+N69xQHgrw0T+cSmCnJxFzs=; b=mwrrUZtGt5E3eiWQQ08b/tm5BM
	ngGH3V3XqTQbxL1xnWe3ebzvBoXvS0VigcC8iKP6WEujtPdCSeCAgVUHyKTYHPUeL0E8sdyWvKLrh
	FMvPHmEmUluVFcIuDk2GJZ669NeQq1n/3yvUP5N2+KzP3tEUJyZuPBzfKQEmnflWmbgC67FKHKwqj
	3keD28zVMg6Knh/WUE84zMXbTBY3GEbAu7RG6RgRMDTRqi+3r4iE+ivCXlut2bmFCrjTQn9K4Q62G
	V38C5RTrH/PEO5wAIAYHiz/8rITg7u4zKu8LPgoWBR5VdamRS6pluFqJEgC3LWRwKglsziccUcTNR
	sSl2Y2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmGGz-006N7m-D8; Thu, 27 May 2021 13:42:05 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmG91-006JGv-7g; Thu, 27 May 2021 13:33:53 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14RDMF7M031752; Thu, 27 May 2021 15:33:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VtvsLA+3cxgxLCtN2j8bvO+pXsJVt/NZPq5/BP8dplE=;
 b=D0q7wfaFVbcaTKmNUOYX+ud1s0Brk7EWwvVtRkGyt1dnOKLueVxxxH3X94FBMw5hNheS
 Q9fbi1iEIJBLVm1AAz0arK6mDghXxIlDJ954/iSyRYwCr+RkvBCglT3uAVcxyfDuNdkQ
 VkYxvg4E8h2K+bP+aRmZf8YWhDdTLXwh7SV0B2CfT4WOzFyHDpm1YfDnTggBF0c+Lql1
 naACADqL49VvIMiFjXu0YX5+A4Un3t0uipUS/Qy8fWRQ1Le3LoybpzohcE+75EHo4KEQ
 XJbMCT4yULs0oExKDMLshPuofiYy1R3QKGZqX339AnGY25dBFj6hEzX/2d3pDG56ktrT EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0fr45qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 15:33:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3FF910025D;
 Thu, 27 May 2021 15:11:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4AF322561A;
 Thu, 27 May 2021 15:11:29 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 15:11:28 +0200
Subject: Re: [PATCH v2] mtd: spinand: add SPI-NAND MTD resume handler
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210527084959.1548-1-patrice.chotard@foss.st.com>
 <20210527105346.315cf125@xps13>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <4ec0aea5-0a37-8575-e76d-02388b62efd9@foss.st.com>
Date: Thu, 27 May 2021 15:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210527105346.315cf125@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_06:2021-05-26,
 2021-05-27 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_063351_757226_35AE7E54 
X-CRM114-Status: GOOD (  28.76  )
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

SGkgTWlxdWVsCgpPbiA1LzI3LzIxIDEwOjUzIEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhp
IFBhdHJpY2UsCj4gCj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGUgb24gVGh1
LCAyNyBNYXkgMjAyMSAxMDo0OTo1OSArMDIwMDoKPiAKPj4gRnJvbTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Cj4+IEFmdGVyIHBvd2VyIHVwLCBhbGwg
U1BJIE5BTkQncyBibG9ja3MgYXJlIGxvY2tlZC4gT25seSByZWFkIG9wZXJhdGlvbnMKPj4gYXJl
IGFsbG93ZWQsIHdyaXRlIGFuZCBlcmFzZSBvcGVyYXRpb25zIGFyZSBmb3JiaWRkZW4uCj4+IFRo
ZSBTUEkgTkFORCBmcmFtZXdvcmsgdW5sb2NrcyBhbGwgdGhlIGJsb2NrcyBkdXJpbmcgaXRzIGlu
aXRpYWxpemF0aW9uLgo+Pgo+PiBEdXJpbmcgYSBzdGFuZGJ5IGxvdyBwb3dlciwgdGhlIG1lbW9y
eSBpcyBwb3dlcmVkIGRvd24sIGxvc2luZyBpdHMKPj4gY29uZmlndXJhdGlvbi4KPj4gRHVyaW5n
IHRoZSByZXN1bWUsIHRoZSBRU1BJIGRyaXZlciBzdGF0ZSBpcyByZXN0b3JlZCBidXQgdGhlIFNQ
SSBOQU5ECj4+IGZyYW1ld29yayBkb2VzIG5vdCByZWNvbmZpZ3VyZWQgdGhlIG1lbW9yeS4KPj4K
Pj4gVGhpcyBwYXRjaCBhZGRzIFNQSS1OQU5EIE1URCBQTSBoYW5kbGVycyBmb3IgcmVzdW1lIG9w
cy4KPj4gU1BJIE5BTkQgcmVzdW1lIG9wIHJlLWluaXRpYWxpemVzIFNQSSBOQU5EIGZsYXNoIHRv
IGl0cyBwcm9iZWQgc3RhdGUuCj4+Cj4+IEl0IGFsc28gYWRkcyBhIG5ldyBoZWxwZXIgc3BpbmFu
ZF9ibG9ja191bmxvY2soKSB3aGljaCBpcwo+PiBjYWxsZWQgaW4gc3BpbmFuZF9pbml0KCkgYW5k
IGluIHNwaW5hbmRfbXRkX3Jlc3VtZSgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+
PiBDaGFuZ2VzIGluIHYyOgo+PiAgIC0gQWRkIGhlbHBlciBzcGluYW5kX2Jsb2NrX3VubG9jaygp
Lgo+PiAgIC0gQWRkIHNwaW5hbmRfZWNjX2VuYWJsZSgpIGNhbGwuCj4+ICAgLSBSZW1vdmUgc29t
ZSBkZXZfZXJyKCkuCj4+ICAgLSBGaXggY29tbWl0J3MgdGl0bGUgYW5kIG1lc3NhZ2UuCj4+Cj4+
ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCA2MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUu
YyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBpbmRleCAxN2Y2M2Y5NWY0YTIuLmY3
N2FlZmYxMWY0MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBAQCAtMTA3NCw2ICsxMDc0LDU1
IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kKQo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgaW50IHNwaW5hbmRfYmxv
Y2tfdW5sb2NrKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPj4gK3sKPj4gKwlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmc3BpbmFuZC0+c3BpbWVtLT5zcGktPmRldjsKPj4gKwlzdHJ1Y3Qg
bmFuZF9kZXZpY2UgKm5hbmQgPSBzcGluYW5kX3RvX25hbmQoc3BpbmFuZCk7Cj4+ICsJaW50IHJl
dCA9IDAsIGk7Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgbmFuZC0+bWVtb3JnLm50YXJnZXRz
OyBpKyspIHsKPj4gKwkJcmV0ID0gc3BpbmFuZF9zZWxlY3RfdGFyZ2V0KHNwaW5hbmQsIGkpOwo+
PiArCQlpZiAocmV0KQo+PiArCQkJcmV0dXJuIHJldDsKPj4gKwo+PiArCQlyZXQgPSBzcGluYW5k
X2xvY2tfYmxvY2soc3BpbmFuZCwgQkxfQUxMX1VOTE9DS0VEKTsKPj4gKwkJaWYgKHJldCkKPj4g
KwkJCXJldHVybiByZXQ7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPiAKPiBQ
bGVhc2UgaW5zZXJ0IHRoaXMgaGVscGVyIChhbmQgdXNlIGl0IGluIHRoZSBwcm9iZSkgaW4gYSBz
ZXBhcmF0ZQo+IHBhdGNoLCBzbyB0aGF0IHBhdGNoIDIvMiBvbmx5IGltcGxlbWVudHMgdGhlIF9y
ZXN1bWUgaG9vay4KCm9rCgo+IAo+PiArCj4+ICtzdGF0aWMgdm9pZCBzcGluYW5kX210ZF9yZXN1
bWUoc3RydWN0IG10ZF9pbmZvICptdGQpCj4+ICt7Cj4+ICsJc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kID0gbXRkX3RvX3NwaW5hbmQobXRkKTsKPj4gKwlzdHJ1Y3QgbmFuZF9kZXZpY2Ug
Km5hbmQgPSBtdGRfdG9fbmFuZGRldihtdGQpOwo+PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZz
cGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+PiArCWludCByZXQ7Cj4+ICsKPj4gKwlyZXQgPSBz
cGluYW5kX3Jlc2V0X29wKHNwaW5hbmQpOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybjsKPj4g
Kwo+PiArCXJldCA9IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZShzcGluYW5kKTsKPj4gKwlpZiAo
cmV0KQo+PiArCQlyZXR1cm47Cj4+ICsKPj4gKwlyZXQgPSBzcGluYW5kX3VwZF9jZmcoc3BpbmFu
ZCwgQ0ZHX09UUF9FTkFCTEUsIDApOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybjsKPj4gKwo+
PiArCXJldCA9IHNwaW5hbmRfbWFudWZhY3R1cmVyX2luaXQoc3BpbmFuZCk7Cj4+ICsJaWYgKHJl
dCkKPj4gKwkJcmV0dXJuOwo+PiArCj4+ICsJcmV0ID0gc3BpbmFuZF9ibG9ja191bmxvY2soc3Bp
bmFuZCk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJcmV0dXJuOwo+PiArCj4+ICsJc3BpbmFuZF9lY2Nf
ZW5hYmxlKHNwaW5hbmQsIGZhbHNlKTsKPj4gK30KPj4gKwo+PiAgc3RhdGljIGludCBzcGluYW5k
X2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+PiAgewo+PiAgCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+PiBAQCAtMTEzNywxNSAr
MTE4Niw5IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAq
c3BpbmFuZCkKPj4gIAl9Cj4+ICAKPj4gIAkvKiBBZnRlciBwb3dlciB1cCwgYWxsIGJsb2NrcyBh
cmUgbG9ja2VkLCBzbyB1bmxvY2sgdGhlbSBoZXJlLiAqLwo+PiAtCWZvciAoaSA9IDA7IGkgPCBu
YW5kLT5tZW1vcmcubnRhcmdldHM7IGkrKykgewo+PiAtCQlyZXQgPSBzcGluYW5kX3NlbGVjdF90
YXJnZXQoc3BpbmFuZCwgaSk7Cj4+IC0JCWlmIChyZXQpCj4+IC0JCQlnb3RvIGVycl9tYW51Zl9j
bGVhbnVwOwo+PiAtCj4+IC0JCXJldCA9IHNwaW5hbmRfbG9ja19ibG9jayhzcGluYW5kLCBCTF9B
TExfVU5MT0NLRUQpOwo+PiAtCQlpZiAocmV0KQo+PiAtCQkJZ290byBlcnJfbWFudWZfY2xlYW51
cDsKPj4gLQl9Cj4+ICsJcmV0ID0gc3BpbmFuZF9ibG9ja191bmxvY2soc3BpbmFuZCk7Cj4+ICsJ
aWYgcmV0KQo+IAo+IEkgZG91YnQgdGhpcyBhcyBldmVuIGJlIGJ1aWxkLXRlc3RlZCA6KQoKSSBq
dXN0IG5vdGljZWQgdGhhdCB0aGUgTVREX1NQSV9OQU5EIGtlcm5lbCBmbGFnIHdhcyBkaXNhYmxl
IDotKCAKdGhhdCdzIGV4cGxhaW4gd2h5IGkgZGlkbid0IHNlZSB0aGlzIGNvbXBpbGF0aW9uIGlz
c3VlIC4uLi4gc29ycnkKClRoYW5rcwoKPiAKPj4gKwkJZ290byBlcnJfbWFudWZfY2xlYW51cDsK
Pj4gIAo+PiAgCXJldCA9IG5hbmRkZXZfaW5pdChuYW5kLCAmc3BpbmFuZF9vcHMsIFRISVNfTU9E
VUxFKTsKPj4gIAlpZiAocmV0KQo+PiBAQCAtMTE2Nyw2ICsxMjEwLDcgQEAgc3RhdGljIGludCBz
cGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+PiAgCW10ZC0+X2Js
b2NrX2lzcmVzZXJ2ZWQgPSBzcGluYW5kX210ZF9ibG9ja19pc3Jlc2VydmVkOwo+PiAgCW10ZC0+
X2VyYXNlID0gc3BpbmFuZF9tdGRfZXJhc2U7Cj4+ICAJbXRkLT5fbWF4X2JhZF9ibG9ja3MgPSBu
YW5kZGV2X210ZF9tYXhfYmFkX2Jsb2NrczsKPj4gKwltdGQtPl9yZXN1bWUgPSBzcGluYW5kX210
ZF9yZXN1bWU7Cj4+ICAKPj4gIAlpZiAobmFuZC0+ZWNjLmVuZ2luZSkgewo+PiAgCQlyZXQgPSBt
dGRfb29ibGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOwo+IAo+IFRoYW5rcywKPiBNaXF1w6hs
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
