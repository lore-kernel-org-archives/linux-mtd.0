Return-Path: <SRS0=mMzh=XN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B49C4CEC4
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 05:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF7A220856
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 05:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b2mwcVsh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bp3JlzlG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF7A220856
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOMiKfpZI2J/siwOpCYDrGwMgZ1eDD3xxuB2CiLKru0=; b=b2mwcVsh6QMrCT
	5SMkkNMc7jOcYZr7Fo0R4vSbirYtMwkwJuO6Or1VjJ9KY0sjEvliiG4obF1o8dvn/yAAa+hwNDBlU
	KK8Vb3pB9cxMk19kI4yMaopQnM1GAAAZRNOUuJ3Z2QHGqLVoSBfxg7X1cOV1s2oJshhnn9alPLUlc
	arqlG8KEUH0A7tnnEUJ1BIO3o+JEq5ALV8Mnn+zI1zIWViLvMGji2IX5MsJ3eNjBNuixVS/Bz8pVK
	OSPP3lz32RU78Yynv5N0lsfMtsVr8e1erp/rSSj+Ud/XlDFkQEQotkMCr+eBgYzFufdDvV3lvl3We
	PjXFRhGb3vAvEjIJTVSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iASWq-0002SC-C5; Wed, 18 Sep 2019 05:29:24 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iASWl-0002Rh-ML
 for linux-mtd@lists.infradead.org; Wed, 18 Sep 2019 05:29:21 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8I5T1e8072171;
 Wed, 18 Sep 2019 00:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568784541;
 bh=LXroDC7/W6e+6Qj0yAjamkKlIPPiyz/UP6ma+CqZkgQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Bp3JlzlGJBiR85huQP8mVspp6weiw6obeMU6Ga2y453jDAuf9gpXG0mwEIwJuqL9i
 9FTC1UjkDEUqyRc/31SXRAgNNFAdDDMMi1kAlFcyBlji6inHvWVxN0843TtvJYeKIn
 daEE+j9ZW6X+XmngEjZY+hgxgbOt5BMDTROYRCtA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8I5T1gR049918
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Sep 2019 00:29:01 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 00:29:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 00:28:57 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8I5Sws2068084;
 Wed, 18 Sep 2019 00:28:59 -0500
Subject: Re: [PATCH v8 1/9] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
To: Tokunori Ikegami <ikegami_to@yahoo.co.jp>, Tokunori Ikegami
 <ikegami.t@gmail.com>, Sasha Levin <sashal@kernel.org>
References: <20190805190326.28772-2-ikegami.t@gmail.com>
 <20190806004303.EBEF82147A@mail.kernel.org>
 <9fd8b17b-abb4-114e-d6fb-252430d98432@gmail.com>
 <a74e201d-4f1c-1bd6-babf-8dac0d515d6d@yahoo.co.jp>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6d1d5eff-af08-5f86-367f-ada671a1d9bf@ti.com>
Date: Wed, 18 Sep 2019 10:59:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a74e201d-4f1c-1bd6-babf-8dac0d515d6d@yahoo.co.jp>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_222919_837288_EDBF5826 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxNy8wOS8xOSAxMTozNCBQTSwgVG9rdW5vcmkgSWtlZ2FtaSB3cm90ZToKPiBIaSwK
PiAKPiBUaGUgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkIGludG8KPiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCBmb3IKPiB2
NS40LXJjMS4KPiBTbyBJIGhhdmUganVzdCBzZW50IHBhdGNoZXMgZm9yIHY1LjIueSwgdjQuMTku
eSwgdjQuMTQueSwgdjQuOS55IGFuZAo+IHYuNC40Lnkgc2VwYXJhdGVseS4KPiAKCk5vcm1hbCBm
bG93IGlzIHRvIHdhaXQgdW50aWwgcGF0Y2ggZ29lcyBpbnRvIExpbnVzJ3MgdHJlZS4gU28gcGxl
YXNlCndhaXQgdW50aWwgdGhlbi4KClJlZ2FyZHMKVmlnbmVzaAoKPiBSZWdhcmRzLAo+IElrZWdh
bWkKPiAKPiBPbiAyMDE5LzA4LzA2IDIzOjMwLCBUb2t1bm9yaSBJa2VnYW1pIHdyb3RlOgo+PiBI
aSwKPj4KPj4gVGhhbmtzIGZvciB0aGUgbWFpbC4KPj4KPj4gT24gMjAxOS8wOC8wNiA5OjQzLCBT
YXNoYSBMZXZpbiB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IFtUaGlzIGlzIGFuIGF1dG9tYXRlZCBl
bWFpbF0KPj4+Cj4+PiBUaGlzIGNvbW1pdCBoYXMgYmVlbiBwcm9jZXNzZWQgYmVjYXVzZSBpdCBj
b250YWlucyBhIC1zdGFibGUgdGFnLgo+Pj4gVGhlIHN0YWJsZSB0YWcgaW5kaWNhdGVzIHRoYXQg
aXQncyByZWxldmFudCBmb3IgdGhlIGZvbGxvd2luZyB0cmVlczogYWxsCj4+Pgo+Pj4gVGhlIGJv
dCBoYXMgdGVzdGVkIHRoZSBmb2xsb3dpbmcgdHJlZXM6IHY1LjIuNiwgdjQuMTkuNjQsIHY0LjE0
LjEzNiwKPj4+IHY0LjkuMTg3LCB2NC40LjE4Ny4KPj4+Cj4+PiB2NS4yLjY6IEZhaWxlZCB0byBh
cHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgo+Pj4gwqDCoMKgwqAgNDg0NGVmODAzMDVkICgi
bXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBzdXBwb3J0IGZvciBwb2xsaW5nCj4+PiBzdGF0dXMg
cmVnaXN0ZXIiKQo+Pj4KPj4+IHY0LjE5LjY0OiBGYWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRl
cGVuZGVuY2llczoKPj4+IMKgwqDCoMKgIDQ4NDRlZjgwMzA1ZCAoIm10ZDogY2ZpX2NtZHNldF8w
MDAyOiBBZGQgc3VwcG9ydCBmb3IgcG9sbGluZwo+Pj4gc3RhdHVzIHJlZ2lzdGVyIikKPj4+IMKg
wqDCoMKgIGQ5YjhhNjdiM2I5NSAoIm10ZDogY2ZpOiBmaXggZGVhZGxvb3AgaW4gY2ZpX2NtZHNl
dF8wMDAyLmMKPj4+IGRvX3dyaXRlX2J1ZmZlciIpCj4+Pgo+Pj4gdjQuMTQuMTM2OiBGYWlsZWQg
dG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoKPj4+IMKgwqDCoMKgIDQ4NDRlZjgwMzA1
ZCAoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBBZGQgc3VwcG9ydCBmb3IgcG9sbGluZwo+Pj4gc3Rh
dHVzIHJlZ2lzdGVyIikKPj4+IMKgwqDCoMKgIGM2NGQ0NDE5YTE3YyAoIm10ZDogY2ZpX2NtZHNl
dF8wMDAyOiBDaGFuZ2UgZXJhc2Ugb25lIGJsb2NrIHRvCj4+PiBlbmFibGUgWElQIG9uY2UiKQo+
Pj4gwqDCoMKgwqAgZDliOGE2N2IzYjk1ICgibXRkOiBjZmk6IGZpeCBkZWFkbG9vcCBpbiBjZmlf
Y21kc2V0XzAwMDIuYwo+Pj4gZG9fd3JpdGVfYnVmZmVyIikKPj4+IMKgwqDCoMKgIGVhMDkyZmIz
Y2U2NiAoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBGaXggY29kaW5nIHN0eWxlIGlzc3VlcyIpCj4+
Pgo+Pj4gdjQuOS4xODc6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgo+
Pj4gwqDCoMKgwqAgNDg0NGVmODAzMDVkICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBzdXBw
b3J0IGZvciBwb2xsaW5nCj4+PiBzdGF0dXMgcmVnaXN0ZXIiKQo+Pj4gwqDCoMKgwqAgYzY0ZDQ0
MTlhMTdjICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5nZSBlcmFzZSBvbmUgYmxvY2sgdG8K
Pj4+IGVuYWJsZSBYSVAgb25jZSIpCj4+PiDCoMKgwqDCoCBkOWI4YTY3YjNiOTUgKCJtdGQ6IGNm
aTogZml4IGRlYWRsb29wIGluIGNmaV9jbWRzZXRfMDAwMi5jCj4+PiBkb193cml0ZV9idWZmZXIi
KQo+Pj4gwqDCoMKgwqAgZWEwOTJmYjNjZTY2ICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEZpeCBj
b2Rpbmcgc3R5bGUgaXNzdWVzIikKPj4+Cj4+PiB2NC40LjE4NzogRmFpbGVkIHRvIGFwcGx5ISBQ
b3NzaWJsZSBkZXBlbmRlbmNpZXM6Cj4+PiDCoMKgwqDCoCA0ODQ0ZWY4MDMwNWQgKCJtdGQ6IGNm
aV9jbWRzZXRfMDAwMjogQWRkIHN1cHBvcnQgZm9yIHBvbGxpbmcKPj4+IHN0YXR1cyByZWdpc3Rl
ciIpCj4+PiDCoMKgwqDCoCBjNjRkNDQxOWExN2MgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hh
bmdlIGVyYXNlIG9uZSBibG9jayB0bwo+Pj4gZW5hYmxlIFhJUCBvbmNlIikKPj4+IMKgwqDCoMKg
IGQ5YjhhNjdiM2I5NSAoIm10ZDogY2ZpOiBmaXggZGVhZGxvb3AgaW4gY2ZpX2NtZHNldF8wMDAy
LmMKPj4+IGRvX3dyaXRlX2J1ZmZlciIpCj4+PiDCoMKgwqDCoCBlYTA5MmZiM2NlNjYgKCJtdGQ6
IGNmaV9jbWRzZXRfMDAwMjogRml4IGNvZGluZyBzdHlsZSBpc3N1ZXMiKQo+Pj4KPj4+Cj4+PiBO
T1RFOiBUaGUgcGF0Y2ggd2lsbCBub3QgYmUgcXVldWVkIHRvIHN0YWJsZSB0cmVlcyB1bnRpbCBp
dCBpcyB1cHN0cmVhbS4KPj4+Cj4+PiBIb3cgc2hvdWxkIHdlIHByb2NlZWQgd2l0aCB0aGlzIHBh
dGNoPwo+Pgo+PiBZZXMgSSB3aWxsIGRvIGZpeCB0aGUgcGF0Y2ggZm9yIHRoZSB0cmVlcyBmYWls
ZWQgdG8gYXBwbHkgaWYgaXQgd2FzCj4+IHVwc3RyZWFtLgo+Pgo+PiBSZWdhcmRzLAo+PiBJa2Vn
YW1pCj4+Cj4+Pgo+Pj4gLS3CoAo+Pj4gVGhhbmtzLAo+Pj4gU2FzaGEKPj4KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPj4KCi0tIApSZWdhcmRzClZpZ25lc2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
