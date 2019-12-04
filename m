Return-Path: <SRS0=Ia6G=Z2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC70FC43603
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 11:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2BA206DB
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 11:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOIRF/mc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B2BA206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QPUBnp1AE8crDAgzAGDD5YM9AlXaETnUFlPGkJNEUHw=; b=tOIRF/mcYtzOwdqMXqJ3Sgtm4
	3ddIo3HzYQxJnUp/XSgi443FuMqgnO9PeMuIDB9ZrlWysMVe3bl8fgNQ2eTlJfepot6h8xcqL5FiS
	tqnxxuPxo5BIIhePgnABgeS0BwmFi27TFC0JjSVMeHFJ1731g1Ge8wCD+0Q4GVwVUCZTEVo3Hbb/j
	g+MH9YfUOIo8fP8JYO9HaE6mixyxNpcua0z+NzIa57EG8koLHttH29dy5prwGuNTl8wLq8j9kAiou
	lNcQUN+eC+ruEm32P+u5ccxlq2lt/+2qTfYZTuEyBl0yrokt0GRfa3iBaPQBksp5LWbeQ02Hbu9CY
	d0gWTPs7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icSY4-00056g-Jx; Wed, 04 Dec 2019 11:10:24 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icSY1-00056D-13
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2019 11:10:22 +0000
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id B05D786DD8D9CA9C2CAA;
 Wed,  4 Dec 2019 11:10:16 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml706-cah.china.huawei.com (10.201.108.47) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 4 Dec 2019 11:10:16 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Wed, 4 Dec 2019
 11:10:16 +0000
Subject: Re: flash_lock issue for n25q 128mb spi nor part
From: John Garry <john.garry@huawei.com>
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
 <32a6af31-341b-67cf-a98d-d77a495c7ecc@huawei.com>
Message-ID: <ee532299-eaa7-28b5-d34c-46816640a1f0@huawei.com>
Date: Wed, 4 Dec 2019 11:10:15 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <32a6af31-341b-67cf-a98d-d77a495c7ecc@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_031021_220695_AD152B8B 
X-CRM114-Status: GOOD (  15.50  )
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

T24gMDMvMTIvMjAxOSAxNToyOSwgSm9obiBHYXJyeSB3cm90ZToKPj4+Cj4+PiBIZXJlJ3MgYW4g
ZXhhbXBsZSBmbG93ICh3aXRoIG15IGhhY2sgdG8gc3RvcCB1c2luZyAxNmIgU1IgbWV0aG9kKToK
Pj4+Cj4+PiByb290QHVidW50dTovaG9tZS9qb2huIyBmbGFzaF9sb2NrIC1sIC9kZXYvbXRkMAo+
Pj4gcm9vdEB1YnVudHU6L2hvbWUvam9obiMgbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkMCAweGUw
MDAwMCA0MDk2Cj4+PiBbwqDCoCA2OS42NTA2NDJdIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGF0
IDB4ZTAwMDAwLCBsZW4gNDA5Ngo+Pj4gRXJhc2VkIDQwOTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4
MDBlMDAwMDAgaW4gZmxhc2gKPj4+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyB3
cml0ZSAvZGV2L210ZDAgMHhlMDAwMDAgNDA5NiBkdW1wNDA5Ngo+Pj4gW8KgwqAgNzcuMDkzNzU1
XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiB0byAweDAwZTAwMDAwLCBsZW4gNDA5Ngo+Pj4gQ29w
aWVkIDQwOTYgYnl0ZXMgZnJvbSBkdW1wNDA5NiB0byBhZGRyZXNzIDB4MDBlMDAwMDAgaW4gZmxh
c2gKPj4+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyByZWFkIC9kZXYvbXRkMCAw
eGUwMDAwMCA0MDk2IHRlbXAKPj4+IFvCoMKgIDgyLjE2MjQ0NV0gc3BpLW5vciBzcGktUFJQMDAw
MTowMDogZnJvbSAweDAwZTAwMDAwLCBsZW4gNDA5Ngo+Pj4gQ29waWVkIDQwOTYgYnl0ZXMgZnJv
bSBhZGRyZXNzIDB4MDBlMDAwMDAgaW4gZmxhc2ggdG8gdGVtcAo+Pj4gcm9vdEB1YnVudHU6L2hv
bWUvam9obiMgZmxhc2hfbG9jayAtdSAvZGV2L210ZDAKPj4+IFvCoMKgIDg3LjU1ODQzNV0gc3Bp
LW5vciBzcGktUFJQMDAwMTowMDogU1IxOiByZWFkIGJhY2sgdGVzdCBmYWlsZWQKPj4+IGZsYXNo
X2xvY2s6IGVycm9yITogY291bGQgbm90IHVubG9jayBkZXZpY2U6IC9kZXYvbXRkMAo+Pj4KPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnJvciA1IChJbnB1dC9vdXRwdXQgZXJyb3IpCj4+
PiByb290QHVidW50dTovaG9tZS9qb2huIwo+Pj4KPj4+IFVubG9jayByZXBvcnRzIGFuIGVycm9y
IGFzIHRoZSB0aGUgcmVhZCBiYWNrIHRlc3QgaW4KPj4+IHNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9j
aGVjaygpIGZhaWxzIGFzIHRoZSBTUi5XRUwgaGFzIG5ldmVyIGJlZW4gCj4+PiBjbGVhcmVkLgo+
Pj4KPj4KPj4gSW50ZXJlc3RpbmcuCj4gCj4gSSBub3RlIHRoYXQgc3BpX25vcl9lcmFzZSgpIGV4
aXRzIHdpdGggYSBjYWxsIHRvIAo+IHNwaV9ub3Jfd3JpdGVfZGlzYWJsZSgpLCB5ZXQgc3BpX25v
cl93cml0ZSgpIGRvZXNuJ3QgLSBtYXliZSB3ZSBzaG91bGQgCj4gYWRkIGEgc2ltaWxhciBjYWxs
IHRoZXJlLgoKU28gdGhpcyByZW1lZGllcyB0aGF0IGlzc3VlIGZvciBtZToKCmNvbW1pdCBjOTBk
ZTU4M2Q4MWY3YzVjNmNiMWM4YzAyMTEwOGEwZTdlMjQ0YjkxIChIRUFEKQpBdXRob3I6IEpvaG4g
R2FycnkgPGpvaG4uZ2FycnlAaHVhd2VpLmNvbT4KRGF0ZTogICBXZWQgRGVjIDQgMTA6MjY6NDkg
MjAxOSArMDAwMAoKICAgICBFbnN1cmUgd2UgY2xlYXIgU1IuV0VMIGZvciBhbnkgd3JpdGUgZmFp
bHVyZSBkdWUgdG8gbG9ja2luZwoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3Bp
LW5vci5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKaW5kZXggYWViM2FkMmRiZmI4
Li4zZjEyMzM1ZWIyMGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5j
CisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCkBAIC0yODc1LDYgKzI4NzUsOCBA
QCBzdGF0aWMgaW50IHNwaV9ub3Jfd3JpdGUoc3RydWN0IG10ZF9pbmZvICptdGQsIApsb2ZmX3Qg
dG8sIHNpemVfdCBsZW4sCiAgICAgICAgICAgICAgICAgaSArPSB3cml0dGVuOwogICAgICAgICB9
CgorICAgICAgIHJldCA9IHNwaV9ub3Jfd3JpdGVfZGlzYWJsZShub3IpOworCiAgd3JpdGVfZXJy
OgogICAgICAgICBzcGlfbm9yX3VubG9ja19hbmRfdW5wcmVwKG5vciwgU1BJX05PUl9PUFNfV1JJ
VEUpOwogICAgICAgICByZXR1cm4gcmV0OwoKCj4gCj4+Cj4+Cj4+IERvZXMgdGhlIGZvbGxvd2lu
ZyBkbyB0aGUgdHJpY2s/Cj4+Cj4+IC3CoMKgwqDCoMKgwqAgeyAibjI1cTEyOGExMSIswqAgSU5G
TygweDIwYmIxOCwgMCwgNjQgKiAxMDI0LMKgIDI1NiwgU0VDVF80SyB8Cj4+IFNQSV9OT1JfUVVB
RF9SRUFEKSB9LAo+PiArwqDCoMKgwqDCoMKgIHsgIm4yNXExMjhhMTEiLMKgIElORk8oMHgyMGJi
MTgsIDAsIDY0ICogMTAyNCzCoCAyNTYsIFNFQ1RfNEsgfCAKPj4gVVNFX0ZTUiB8Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElf
Tk9SX1FVQURfUkVBRCkgfSwKPj4KClllcywgdGhhdCB3b3JrcyBhbmQgaXQncyBuaWNlIHRvIG5v
dCBoYXZlIHRoZSBzaWxlbnQgZmFpbHVyZXM6Cgpyb290QHVidW50dTovaG9tZS9qb2huIyBmbGFz
aF9sb2NrIC1pIC9kZXYvbXRkMApEZXZpY2U6IC9kZXYvbXRkMApTdGFydDogMApMZW46IDB4MTAw
MDAwMApMb2NrIHN0YXR1czogbG9ja2VkClJldHVybiBjb2RlOiAxCnJvb3RAdWJ1bnR1Oi9ob21l
L2pvaG4jCnJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAg
MHhlMDAwMDAgNDA5NgpbICAgNDUuMDIzMzUzXSBzcGktbm9yIHNwaTAuMDogRXJhc2Ugb3BlcmF0
aW9uIGZhaWxlZC4KWyAgIDQ1LjAyODI1N10gc3BpLW5vciBzcGkwLjA6IEF0dGVtcHRlZCB0byBt
b2RpZnkgYSBwcm90ZWN0ZWQgc2VjdG9yLgpNRU1FUkFTRTogSW5wdXQvb3V0cHV0IGVycm9yCm10
ZF9kZWJ1ZyB3cml0ZSAvZGV2L210ZDAgMHhlMDAwMDAgNDA5NiBkdW1wNDA5NgpbICAgNTAuMjEy
MDEzXSBzcGktbm9yIHNwaTAuMDogUHJvZ3JhbSBvcGVyYXRpb24gZmFpbGVkLgpbICAgNTAuMjE3
MDg0XSBzcGktbm9yIHNwaTAuMDogQXR0ZW1wdGVkIHRvIG1vZGlmeSBhIHByb3RlY3RlZCBzZWN0
b3IuCmZpbGVfdG9fZmxhc2g6IHdyaXRlLCBzaXplIDB4MTAwMCwgbiAweDEwMDAKd3JpdGUoKTog
SW5wdXQvb3V0cHV0IGVycm9yCnJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyByZWFk
IC9kZXYvbXRkMCAweGUwMDAwMCA0MDk2IHRlbXAKQ29waWVkIDQwOTYgYnl0ZXMgZnJvbSBhZGRy
ZXNzIDB4MDBlMDAwMDAgaW4gZmxhc2ggdG8gdGVtcApyb290QHVidW50dTovaG9tZS9qb2huIyBm
bGFzaF9sb2NrIC11IC9kZXYvbXRkMApmbGFzaF9sb2NrOiBlcnJvciE6IGNvdWxkIG5vdCB1bmxv
Y2sgZGV2aWNlOiAvZGV2L210ZDAKCiAgICAgICAgICAgICBlcnJvciA1IChJbnB1dC9vdXRwdXQg
ZXJyb3IpCnJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIGZsYXNoX2xvY2sgLWkgL2Rldi9tdGQwCkRl
dmljZTogL2Rldi9tdGQwClN0YXJ0OiAwCkxlbjogMHgxMDAwMDAwCkxvY2sgc3RhdHVzOiB1bmxv
Y2tlZApSZXR1cm4gY29kZTogMApyb290QHVidW50dTovaG9tZS9qb2huIyBmbGFzaF9sb2NrIC11
IC9kZXYvbXRkMApyb290QHVidW50dTovaG9tZS9qb2huIwoKQnV0LCBhcyB5b3UgbWF5IHNlZSwg
aXQgc2VlbXMgdGhhdCBteSBjaGFuZ2UgdG8gc3BpX25vcl93cml0ZSgpIGlzIHN0aWxsIApyZXF1
aXJlZCB0byBzdG9wIHRoZSBmaXJzdCB1bmxvY2sgZmFpbHVyZSBtZXNzYWdlLCBidXQgaXQgbmVl
ZHMgdG8gYmUgCnJlbG9jYXRlZCB0byBhZnRlciB3cml0ZV9lcnIgbGFiZWwsIGFzIHdlIG5vdyBq
dW1wIHRoZXJlIGZvciAKc3BpX25vcl93YWl0X3RpbGxfcmVhZHkoKSBmYWlsdXJlLiBJIGd1ZXNz
IHRoZSBlcXVpdmFsZW50IHJlbG9jYXRpb24gaXMgCmFsc28gcmVxdWlyZWQgZm9yIHNwaV9ub3Jf
ZXJhc2UoKS4KCk9yIG1heWJlIHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5KCkgc2hvdWxkIGNsZWFy
IHRoaXMgZmxhZyBhbHdheXMuCgo+IAo+IEknbGwgZ2l2ZSBpdCBhIHNwaW4gLSBhbG9uZyB3aXRo
IHlvdXIgU1IgbG9jayBmaXggLSB3aGVuIEkgZ2V0IGJhY2sgb24gCj4gdGhlIEhXIGFnYWluLgo+
IAo+PiBUaGlzIGNhbiBvZiBjb3Vyc2UgYmUgZXh0ZW5kZWQgdG8gYWxsIG1pY3JvbiBmbGFzaGVz
LCBpZiBhbGwgc3VwcG9ydCAKPj4gRlNSLCBidXQKPj4gc29tZSBkb2N1bWVudGF0aW9uIHdvcmsg
aGFzIHRvIGJlIG1hZGUuCj4+CgpUaGFua3MsCkpvaG4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
