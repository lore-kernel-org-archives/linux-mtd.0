Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01669C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urCKsMmQhu3cgg1FaZJ5KWfODLk/4VxqwMKFDreTo1w=; b=G1iXH3R6yL8eTM
	R29LrIA6LTvMegqaRzQef6rLlHRZUvv+NanpqKCAncOWulD9J5A0gUeOzkY1PAdD3Me5uc07WNpYO
	sLna34xKdsN4ej3x4HasCMd0eJaQHfISAMKw2NTWLQjNFr44/OpJJ+Nl3+gAu/W94yFtStKQLqsBg
	ASk96TMc5xOgtgfLZKvAuZ6xQQ8FryCs0kZ/6EX17faUJ9i3y8QzWteYMMhbnATzgRdSLLtYqZeon
	p+76qms60pSIunuA78/yBZb8t2WQGXLpmXmpns9aatF5g0V8VAKFCaUXcw6N1jLBIx0wDqPvubFA1
	HbOMgJOygL0ZNl4rhnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKgPB-00AVu5-1p; Thu, 17 Feb 2022 13:01:05 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKgP4-00AVpo-Oz
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 13:01:01 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21H8Zf8e030645;
 Thu, 17 Feb 2022 14:00:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bhcz2SL/OhIaWwGW8NTZlL5jRPSdDOHNIjAM7cbOK4A=;
 b=QHcfZeBExAc57IHbvuBQmZsCFHSwq6cPvWhrxOsUWlam1/M2J/qu+EiznLHO36g0RXvm
 UErgjsApgGVetf8qOmnGyONej+o7Uvf44iVrZ5hdSPkWtl5rXaHCJOIy944wrrBJkZh6
 x/EYmuPLMLtyAUdlE2R8gIZauXKnx405TQyb1hQA6XSkj9AtoruX3UQHDyJ+R6KprjIm
 Gai9rok/OCQ8KW907x4n0vuG8sOoMfwayO7p53Dcfyw2o9Er97DxXabUhHpAhEunoTk3
 B8IHyqUGp4Dcu7/DliTMYhcDDz9gTZT9FbkagCmBtBd1qfRrC+7q+npq68caAwtidmz/ xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e9k069hkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 14:00:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4228100034;
 Thu, 17 Feb 2022 14:00:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92D1821ED57;
 Thu, 17 Feb 2022 14:00:31 +0100 (CET)
Received: from [10.48.0.175] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 17 Feb
 2022 14:00:31 +0100
Message-ID: <f601db90-4239-8b14-e8a5-e1f7c10c1e9f@foss.st.com>
Date: Thu, 17 Feb 2022 14:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/4] nvmem: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>
References: <20220131095755.8981-1-christophe.kerello@foss.st.com>
 <20220131095755.8981-4-christophe.kerello@foss.st.com>
 <1bd281d8-a576-26dc-79c3-b1a72a4a9691@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <1bd281d8-a576-26dc-79c3-b1a72a4a9691@linaro.org>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_04,2022-02-17_01,2021-12-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_050059_367093_5BBBF8A5 
X-CRM114-Status: GOOD (  26.25  )
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

SGkgU3Jpbml2YXMsCgpPbiAyLzE3LzIyIDEyOjAxLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3Rl
Ogo+IAo+IAo+IE9uIDMxLzAxLzIwMjIgMDk6NTcsIENocmlzdG9waGUgS2VyZWxsbyB3cm90ZToK
Pj4gV3AtZ3Bpb3MgcHJvcGVydHkgY2FuIGJlIHVzZWQgb24gTlZNRU0gbm9kZXMgYW5kIHRoZSBz
YW1lIHByb3BlcnR5IGNhbgo+PiBiZSBhbHNvIHVzZWQgb24gTVREIE5BTkQgbm9kZXMuIEluIGNh
c2Ugb2YgdGhlIHdwLWdwaW9zIHByb3BlcnR5IGlzCj4+IGRlZmluZWQgYXQgTkFORCBsZXZlbCBu
b2RlLCB0aGUgR1BJTyBtYW5hZ2VtZW50IGlzIGRvbmUgYXQgTkFORCBkcml2ZXIKPj4gbGV2ZWwu
IFdyaXRlIHByb3RlY3QgaXMgZGlzYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHByb2JlZCBvciBy
ZXN1bWVkCj4+IGFuZCBpcyBlbmFibGVkIHdoZW4gdGhlIGRyaXZlciBpcyByZWxlYXNlZCBvciBz
dXNwZW5kZWQuCj4+Cj4+IFdoZW4gbm8gcGFydGl0aW9ucyBhcmUgZGVmaW5lZCBpbiB0aGUgTkFO
RCBEVCBub2RlLCB0aGVuIHRoZSBOQU5EIERUIG5vZGUKPj4gd2lsbCBiZSBwYXNzZWQgdG8gTlZN
RU0gZnJhbWV3b3JrLiBJZiB3cC1ncGlvcyBwcm9wZXJ0eSBpcyBkZWZpbmVkIGluCj4+IHRoaXMg
bm9kZSwgdGhlIEdQSU8gcmVzb3VyY2UgaXMgdGFrZW4gdHdpY2UgYW5kIHRoZSBOQU5EIGNvbnRy
b2xsZXIKPj4gZHJpdmVyIGZhaWxzIHRvIHByb2JlLgo+Pgo+PiBJdCB3b3VsZCBiZSBwb3NzaWJs
ZSB0byBzZXQgY29uZmlnLT53cF9ncGlvIGF0IE1URCBsZXZlbCBiZWZvcmUgY2FsbGluZwo+PiBu
dm1lbV9yZWdpc3RlciBmdW5jdGlvbiBidXQgTlZNRU0gZnJhbWV3b3JrIHdpbGwgdG9nZ2xlIHRo
aXMgR1BJTyBvbgo+PiBlYWNoIHdyaXRlIHdoZW4gdGhpcyBHUElPIHNob3VsZCBvbmx5IGJlIGNv
bnRyb2xsZWQgYXQgTkFORCBsZXZlbCBkcml2ZXIKPj4gdG8gZW5zdXJlIHRoYXQgdGhlIFdyaXRl
IFByb3RlY3QgaGFzIG5vdCBiZWVuIGVuYWJsZWQuCj4+Cj4+IEEgd2F5IHRvIGZpeCB0aGlzIGNv
bmZsaWN0IGlzIHRvIGFkZCBhIG5ldyBib29sZWFuIGZsYWcgaW4gbnZtZW1fY29uZmlnCj4+IG5h
bWVkIHNraXBfd3BfZ3Bpby4gSW4gY2FzZSBza2lwX3dwX2dwaW8gaXMgc2V0LCB0aGUgR1BJTyBy
ZXNvdXJjZSB3aWxsCj4+IGJlIG1hbmFnZWQgYnkgdGhlIHByb3ZpZGVyLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNv
bT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6Cj4+IMKgIC0gcmV3b3JrIHRoZSBwcm9wb3NhbCBk
b25lIHRvIGZpeCBhIGNvbmZsaWN0IGJldHdlZW4gTVREIGFuZCBOVk1FTSBvbgo+PiDCoMKgwqAg
d3AtZ3Bpb3MgcHJvcGVydHkuCj4+Cj4+IMKgIGRyaXZlcnMvbnZtZW0vY29yZS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIGluY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCB8
IDQgKysrLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9u
dm1lbS9jb3JlLmMKPj4gaW5kZXggMjNhMzhkY2YwZmM0Li5jYjQwZGNhNmE1MWQgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbnZtZW0vY29yZS5j
Cj4+IEBAIC03NzEsNyArNzcxLDcgQEAgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW1fcmVnaXN0
ZXIoY29uc3Qgc3RydWN0IAo+PiBudm1lbV9jb25maWcgKmNvbmZpZykKPj4gwqDCoMKgwqDCoCBp
ZiAoY29uZmlnLT53cF9ncGlvKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbnZtZW0tPndwX2dwaW8g
PSBjb25maWctPndwX2dwaW87Cj4+IC3CoMKgwqAgZWxzZQo+PiArwqDCoMKgIGVsc2UgaWYgKCFj
b25maWctPnNraXBfd3BfZ3BpbykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIG52bWVtLT53cF9ncGlv
ID0gZ3Bpb2RfZ2V0X29wdGlvbmFsKGNvbmZpZy0+ZGV2LCAid3AiLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdQSU9EX09VVF9I
SUdIKTsKPj4gwqDCoMKgwqDCoCBpZiAoSVNfRVJSKG52bWVtLT53cF9ncGlvKSkgewo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIAo+PiBiL2luY2x1ZGUvbGlu
dXgvbnZtZW0tcHJvdmlkZXIuaAo+PiBpbmRleCA5OGVmYjdiNTY2MGQuLjRiNDgwMDIzYzI2NSAx
MDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAo+PiBAQCAtNzAsNyArNzAsOCBAQCBzdHJ1Y3Qg
bnZtZW1fa2VlcG91dCB7Cj4+IMKgwqAgKiBAd29yZF9zaXplOsKgwqDCoCBNaW5pbXVtIHJlYWQv
d3JpdGUgYWNjZXNzIGdyYW51bGFyaXR5Lgo+PiDCoMKgICogQHN0cmlkZTrCoMKgwqAgTWluaW11
bSByZWFkL3dyaXRlIGFjY2VzcyBzdHJpZGUuCj4+IMKgwqAgKiBAcHJpdjrCoMKgwqAgVXNlciBj
b250ZXh0IHBhc3NlZCB0byByZWFkL3dyaXRlIGNhbGxiYWNrcy4KPj4gLSAqIEB3cC1ncGlvOsKg
wqAgV3JpdGUgcHJvdGVjdCBwaW4KPj4gKyAqIEB3cC1ncGlvOsKgwqDCoCBXcml0ZSBwcm90ZWN0
IHBpbgo+PiArICogQHNraXBfd3BfZ3BpbzogV3JpdGUgUHJvdGVjdCBwaW4gaXMgbWFuYWdlZCBi
eSB0aGUgcHJvdmlkZXIuCj4gCj4gQ2FuIHdlIHJlbmFtZSB0aGlzIHRvIGluZ29yZV93cCBhcyBz
dWdnZXN0ZWQgYnkgTWlxdWVsLgo+IAoKT0ssIEl0IHdpbGwgYmUgcGFydCBvZiB2My4KClJlZ2Fy
ZHMsCkNocmlzdG9waGUgS2VyZWxsby4KCj4gLS1zcmluaQo+IAo+PiDCoMKgICoKPj4gwqDCoCAq
IE5vdGU6IEEgZGVmYXVsdCAibnZtZW08aWQ+IiBuYW1lIHdpbGwgYmUgYXNzaWduZWQgdG8gdGhl
IGRldmljZSBpZgo+PiDCoMKgICogbm8gbmFtZSBpcyBzcGVjaWZpZWQgaW4gaXRzIGNvbmZpZ3Vy
YXRpb24uIEluIHN1Y2ggY2FzZSAiPGlkPiIgaXMKPj4gQEAgLTkyLDYgKzkzLDcgQEAgc3RydWN0
IG52bWVtX2NvbmZpZyB7Cj4+IMKgwqDCoMKgwqAgZW51bSBudm1lbV90eXBlwqDCoMKgwqDCoMKg
wqAgdHlwZTsKPj4gwqDCoMKgwqDCoCBib29swqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWFkX29u
bHk7Cj4+IMKgwqDCoMKgwqAgYm9vbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcm9vdF9vbmx5Owo+
PiArwqDCoMKgIGJvb2zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNraXBfd3BfZ3BpbzsKPj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGXCoMKgwqAgKm9mX25vZGU7Cj4+IMKgwqDCoMKgwqAg
Ym9vbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9fb2Zfbm9kZTsKPj4gwqDCoMKgwqDCoCBudm1l
bV9yZWdfcmVhZF90wqDCoMKgIHJlZ19yZWFkOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
