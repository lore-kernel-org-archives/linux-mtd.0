Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7899FC001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HG9qJiwKesPbsMt6a8SzziU4/hYqTAlFK+2NMccALdw=; b=dfnNLx8zmPFvep
	AvDqf/AjN6IXpb0OFtqLObD4rOdIAbyEy4Pt3eg231HJ+0AVVJGN32YEe691sa/m0RR8z32BRfE7O
	F4d4NZuCPTuvy7yYorVV9eRsqEvWh98c2jHywrv3RrjnC7aEFK0i5lG/siU26OlM9ukSQZkpIOBWC
	sFJgAElECNwkbrt779GuIa9wvuC6RpxqSimeSSZ+v41J/u8c2UDlGUUtEsd5nX9JDwgMH1DQQsNw2
	s4gQVdBhHFgWXlhwrOG4+5M41J9I3vFxfqj3n+zzYeFgOf465IGWrUkh4g86ccpCUzUkLibRvnPCB
	K+BhUpHRgg4jEi7cqsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwku-00GaQS-0B;
	Mon, 07 Aug 2023 09:42:28 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwkp-00GaOj-2x
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 09:42:26 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RKBBf0YkLzVk5Y;
	Mon,  7 Aug 2023 17:40:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 17:42:17 +0800
Message-ID: <0d328161-0d4a-a239-2cdd-d78f0f339b4d@huawei.com>
Date: Mon, 7 Aug 2023 17:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2] mtd: rawnand: Propagate error values for
 brcmstb_nand_wait_for_completion()
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
	<linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
References: <20230805050146.1858880-1-ruanjinjie@huawei.com>
 <647680c7-4d47-943d-0455-0039302ac1aa@broadcom.com>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <647680c7-4d47-943d-0455-0039302ac1aa@broadcom.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_024224_334203_31CC03CA 
X-CRM114-Status: GOOD (  15.03  )
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

CgpPbiAyMDIzLzgvNiAxNDowOSwgV2lsbGlhbSBaaGFuZyB3cm90ZToKPiBIaSBKaW5qaWUsCj4g
Cj4gT24gMDgvMDQvMjAyMyAxMDowMSBQTSwgJ1J1YW4gSmluamllJyB2aWEgQkNNLUtFUk5FTC1G
RUVEQkFDSy1MSVNULFBETAo+IHdyb3RlOgo+PiBBcyBiY21uYW5kX2N0cmxfcG9sbF9zdGF0dXMo
KSByZXR1cm4gbmVnYXRpdmUgZXJybm8sIGFuZCB0aGUgPCAwCj4+IGNhc2UgZG9lcyBub3QgZXhp
c3QgZm9yIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpLCBzbyByZXR1cm4KPj4gLUVUSU1F
RE9VVCBpZiBzdHMgPSAwIGFuZCB6ZXJvIG90aGVyd2lzZS4gSXQgaXMgbm90IHNlbnNpYmxlIGZv
cgo+PiBicmNtc3RiX25hbmRfd2FpdF9mb3JfY29tcGxldGlvbigpIHRvIHJldHVybiBib29sIHZh
bHVlLCBjaGFuZ2UgaXQKPj4gdG8gaW50IHRvIHByb3BhZ2F0ZSB0aGUgZXJyb3IuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJ1YW4gSmluamllIDxydWFuamluamllQGh1YXdlaS5jb20+Cj4+IC0tLQo+
PiB2MjoKPj4gLSBVcGRhdGUgdGhlIGNvbW1pdCB0aXRsZSBhbmQgbWVzc2FnZS4KPj4gLSBQcm9w
YWdhdGUgdGhlIGVycm9yIGluc3RlYWQgb2YgdXBvbiBlcnJvci4KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA5ICsrKysrLS0tLQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+PiBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPj4gaW5kZXggMDM3NjRiNTg5
ZWM1Li4yNWU1YjE1ZmJkNmEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYwo+PiBAQCAtMTY1MywxMiArMTY1MywxMiBAQCBzdGF0aWMgdm9pZCBicmNtbmFu
ZF9jbWRfY3RybChzdHJ1Y3QgbmFuZF9jaGlwCj4+ICpjaGlwLCBpbnQgZGF0LAo+PiDCoMKgwqDC
oMKgIC8qIGludGVudGlvbmFsbHkgbGVmdCBibGFuayAqLwo+PiDCoCB9Cj4+IMKgIC1zdGF0aWMg
Ym9vbCBicmNtc3RiX25hbmRfd2FpdF9mb3JfY29tcGxldGlvbihzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwKQo+PiArc3RhdGljIGludCBicmNtc3RiX25hbmRfd2FpdF9mb3JfY29tcGxldGlvbihzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGJyY21uYW5k
X2hvc3QgKmhvc3QgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4+IMKgwqDCoMKg
wqAgc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwgPSBob3N0LT5jdHJsOwo+PiDCoMKg
wqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7Cj4+IC3CoMKg
wqAgYm9vbCBlcnIgPSBmYWxzZTsKPj4gK8KgwqDCoCBpbnQgZXJyID0gMDsKPj4gwqDCoMKgwqDC
oCBpbnQgc3RzOwo+PiDCoCDCoMKgwqDCoMKgIGlmIChtdGQtPm9vcHNfcGFuaWNfd3JpdGUgfHwg
Y3RybC0+aXJxIDwgMCkgewo+PiBAQCAtMTY2NiwxMyArMTY2NiwxNCBAQCBzdGF0aWMgYm9vbAo+
PiBicmNtc3RiX25hbmRfd2FpdF9mb3JfY29tcGxldGlvbihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGlzYWJsZV9jdHJsX2lycXMoY3RybCk7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHMgPSBiY21uYW5kX2N0cmxfcG9sbF9zdGF0dXMoY3RybCwgTkFORF9D
VFJMX1JEWSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgTkFORF9DVFJMX1JEWSwgMCk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBlcnIgPSAo
c3RzIDwgMCkgPyB0cnVlIDogZmFsc2U7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIgPSBzdHM7Cj4+
IMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcg
dGltZW8gPSBtc2Vjc190b19qaWZmaWVzKAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOQU5EX1BPTExfU1RBVFVTX1RJTUVPVVRfTVMpOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogd2FpdCBmb3IgY29tcGxldGlvbiBpbnRlcnJ1cHQgKi8KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cyA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmY3Ry
bC0+ZG9uZSwgdGltZW8pOwo+PiAtwqDCoMKgwqDCoMKgwqAgZXJyID0gKHN0cyA8PSAwKSA/IHRy
dWUgOiBmYWxzZTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghc3RzKQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlcnIgPSAtRVRJTUVET1VUOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKg
wqDCoCByZXR1cm4gZXJyOwo+Pgo+IFNvcnJ5IHRoYXQgSSBtaXNzZWQgeW91ciBmaXJzdCBwYXRj
aCBidXQgdGhlIG9yaWdpbmFsIGdvYWwgb2YgdGhpcwo+IGZ1bmN0aW9uIGlzIHRvIHJldHVybiBp
ZiB0aW1lIG91dCBoYXBwZW5zLiBTbyB5b3UgY2FuIHNpbXBsaWZ5IHRoZQo+IHRlcm5hcnkgb3Bl
cmF0b3IgYnV0IHByb3BhZ2F0ZSAtRVRJTUVET1VUIGZyb20gaXRzIGNhbGxlcgo+IGJyY21uYW5k
X3dhaXRmdW5jIGluc3RlYWQuCgpTbyBub3QgY2hhbmdlIHRoZSByZXR1cm4gZnJvbSBib29sIHRv
IGludD8gSnVzdCBzaW1wbGlmeSB0ZXJuYXJ5Cm9wZXJhdG9yLiBIb3cgdG8gcHJvcGFnYXRlIC1F
VElNRURPVVQgdG8gYnJjbXN0Yl9uYW5kX3dhaXRfZm9yX2NvbXBsZXRpb24/CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
