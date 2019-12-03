Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FED9C432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 15:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17BC62070A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 15:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Al8S2bdU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17BC62070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Kj/B86ruPsH7Ue4rVH9VsLu0FvT/MdnjsiGzPRzT5Y=; b=Al8S2bdUw3zY3LkQgar5uFZ8I
	gdiGjZ1KkB4qAWZ9JQGJNkFeEfyFrJNzDGYsAxZSXlPJIrQtozPIr10Kby6UkACuAW4qojmNUjr/t
	C+Oi1K9fS459EUqpoyULv3Gw6VgrTPGHNrJ75jFdiL3AVDvbZwLQdfFzusyzLKvXCj0wJ49AuyuMH
	bpMGceXEL6TuKcApOHKyefJZhNNVUSRVmVlJTNAjhtJdacOAsJjVtkrT+QUVcAelCLCP1Iw0jrFdR
	Ncoa2jasJMaApoU9UKcSvgkZ+Rv7bt4rtF6lzrqWlqs6MrfVuXkWXf60yvnKB6xzSf82FjPqeww/t
	hBRmebaqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icA73-00084m-Kg; Tue, 03 Dec 2019 15:29:17 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icA70-0007xX-07
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 15:29:15 +0000
Received: from LHREML713-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id B7ABE334217C75E4D044;
 Tue,  3 Dec 2019 15:29:10 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML713-CAH.china.huawei.com (10.201.108.36) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Dec 2019 15:29:09 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 15:29:09 +0000
From: John Garry <john.garry@huawei.com>
Subject: Re: flash_lock issue for n25q 128mb spi nor part
To: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
 <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
 <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
 <b73c8a25-a58d-a1f1-f68c-0ba35a5c7c51@huawei.com>
 <9d41bfca-f4e3-beb2-ff7f-78be49e8d80e@microchip.com>
Message-ID: <32a6af31-341b-67cf-a98d-d77a495c7ecc@huawei.com>
Date: Tue, 3 Dec 2019 15:29:08 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <9d41bfca-f4e3-beb2-ff7f-78be49e8d80e@microchip.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_072914_202513_0A75E486 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: broonie@kernel.org, fengsheng5@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pj4KPj4gSGVyZSdzIGFuIGV4YW1wbGUgZmxvdyAod2l0aCBteSBoYWNrIHRvIHN0b3AgdXNpbmcg
MTZiIFNSIG1ldGhvZCk6Cj4+Cj4+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIGZsYXNoX2xvY2sg
LWwgL2Rldi9tdGQwCj4+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyBlcmFzZSAv
ZGV2L210ZDAgMHhlMDAwMDAgNDA5Ngo+PiBbwqDCoCA2OS42NTA2NDJdIHNwaS1ub3Igc3BpLVBS
UDAwMDE6MDA6IGF0IDB4ZTAwMDAwLCBsZW4gNDA5Ngo+PiBFcmFzZWQgNDA5NiBieXRlcyBmcm9t
IGFkZHJlc3MgMHgwMGUwMDAwMCBpbiBmbGFzaAo+PiByb290QHVidW50dTovaG9tZS9qb2huIyBt
dGRfZGVidWcgd3JpdGUgL2Rldi9tdGQwIDB4ZTAwMDAwIDQwOTYgZHVtcDQwOTYKPj4gW8KgwqAg
NzcuMDkzNzU1XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiB0byAweDAwZTAwMDAwLCBsZW4gNDA5
Ngo+PiBDb3BpZWQgNDA5NiBieXRlcyBmcm9tIGR1bXA0MDk2IHRvIGFkZHJlc3MgMHgwMGUwMDAw
MCBpbiBmbGFzaAo+PiByb290QHVidW50dTovaG9tZS9qb2huIyBtdGRfZGVidWcgcmVhZCAvZGV2
L210ZDAgMHhlMDAwMDAgNDA5NiB0ZW1wCj4+IFvCoMKgIDgyLjE2MjQ0NV0gc3BpLW5vciBzcGkt
UFJQMDAwMTowMDogZnJvbSAweDAwZTAwMDAwLCBsZW4gNDA5Ngo+PiBDb3BpZWQgNDA5NiBieXRl
cyBmcm9tIGFkZHJlc3MgMHgwMGUwMDAwMCBpbiBmbGFzaCB0byB0ZW1wCj4+IHJvb3RAdWJ1bnR1
Oi9ob21lL2pvaG4jIGZsYXNoX2xvY2sgLXUgL2Rldi9tdGQwCj4+IFvCoMKgIDg3LjU1ODQzNV0g
c3BpLW5vciBzcGktUFJQMDAwMTowMDogU1IxOiByZWFkIGJhY2sgdGVzdCBmYWlsZWQKPj4gZmxh
c2hfbG9jazogZXJyb3IhOiBjb3VsZCBub3QgdW5sb2NrIGRldmljZTogL2Rldi9tdGQwCj4+Cj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycm9yIDUgKElucHV0L291dHB1dCBlcnJvcikKPj4g
cm9vdEB1YnVudHU6L2hvbWUvam9obiMKPj4KPj4gVW5sb2NrIHJlcG9ydHMgYW4gZXJyb3IgYXMg
dGhlIHRoZSByZWFkIGJhY2sgdGVzdCBpbgo+PiBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfY2hlY2so
KSBmYWlscyBhcyB0aGUgU1IuV0VMIGhhcyBuZXZlciBiZWVuIGNsZWFyZWQuCj4+Cj4gCj4gSW50
ZXJlc3RpbmcuCgpJIG5vdGUgdGhhdCBzcGlfbm9yX2VyYXNlKCkgZXhpdHMgd2l0aCBhIGNhbGwg
dG8gCnNwaV9ub3Jfd3JpdGVfZGlzYWJsZSgpLCB5ZXQgc3BpX25vcl93cml0ZSgpIGRvZXNuJ3Qg
LSBtYXliZSB3ZSBzaG91bGQgCmFkZCBhIHNpbWlsYXIgY2FsbCB0aGVyZS4KCj4gCj4gCj4gRG9l
cyB0aGUgZm9sbG93aW5nIGRvIHRoZSB0cmljaz8KPiAKPiAtICAgICAgIHsgIm4yNXExMjhhMTEi
LCAgSU5GTygweDIwYmIxOCwgMCwgNjQgKiAxMDI0LCAgMjU2LCBTRUNUXzRLIHwKPiBTUElfTk9S
X1FVQURfUkVBRCkgfSwKPiArICAgICAgIHsgIm4yNXExMjhhMTEiLCAgSU5GTygweDIwYmIxOCwg
MCwgNjQgKiAxMDI0LCAgMjU2LCBTRUNUXzRLIHwgVVNFX0ZTUiB8Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgU1BJX05PUl9RVUFEX1JFQUQpIH0sCj4gCgpJJ2xsIGdpdmUgaXQgYSBz
cGluIC0gYWxvbmcgd2l0aCB5b3VyIFNSIGxvY2sgZml4IC0gd2hlbiBJIGdldCBiYWNrIG9uIAp0
aGUgSFcgYWdhaW4uCgo+IFRoaXMgY2FuIG9mIGNvdXJzZSBiZSBleHRlbmRlZCB0byBhbGwgbWlj
cm9uIGZsYXNoZXMsIGlmIGFsbCBzdXBwb3J0IEZTUiwgYnV0Cj4gc29tZSBkb2N1bWVudGF0aW9u
IHdvcmsgaGFzIHRvIGJlIG1hZGUuCj4gCj4+IEknbSBqdXN0IHNheWluZyB0aGlzIHdoaWxlIGl0
J3MgZnJlc2ggaW4gbXkgaGVhZCAtIEkgZG9uJ3Qgd2FudCB0byBzZWVtCj4+IHB1c2h5IDopCj4g
Cj4gTm8gd29ycmllcywgdGhpcyBpcyBhIGdvb2QgaW5pdGlhdGl2ZSwgdGhhbmtzLgo+IAoKTXVj
aCBhcHByZWNpYXRlZCwKSm9obgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
